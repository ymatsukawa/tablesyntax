# frozen_string_literal: true

require "psych"
require_relative "../../lib/tablesyntax/formatter/table_format"
require_relative "../expect/format/yaml_format"

RSpec.describe Tablesyntax::Formatter::TableFormat do

  describe "#as_table" do
    context "when yaml is set" do
      where(:path, :expected_format) do
        [
          ["spec/FILES/basic.yml", Expect::Format::YamlFormat::BASIC_FORMAT],
          ["spec/FILES/many_types.yml", Expect::Format::YamlFormat::MANY_TYPES_FORMAT]
        ]
      end
      with_them do
        let(:yaml) { Psych.safe_load(File.read(Pathname.new(path).realpath.to_s), permitted_classes: [Symbol]) }
        subject { Tablesyntax::Formatter::TableFormat.as_table(yaml) }

        it { is_expected.to eq expected_format }
      end
    end
  end
end
