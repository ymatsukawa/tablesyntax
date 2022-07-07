# frozen_string_literal: true

require "pathname"
require_relative "../../lib/tablesyntax/facade/file_reader"
require_relative "../../lib/tablesyntax/fileio/output/standard_output"

RSpec.describe Tablesyntax::Facade::FileReader do
  describe "#run" do
    before do
      allow(Tablesyntax::Facade::FileReader).to receive(:open)
    end
    subject { Tablesyntax::Facade::FileReader.run(path) }

    context "when path is valid" do
      context "when it is yaml file" do
        let(:loaded_yaml) do
          {
            "keys" => %i[title content],
            "table_kvs" => [
              {
                title: "title_example",
                content: "content_example"
              }
            ]
          }
        end
        before do
          allow(File).to receive(:read).with(path).and_return(File.read(path))
          allow(Psych).to receive(:safe_load).and_return(loaded_yaml)
          allow(Tablesyntax::Fileio::Output::StandardOutput).to receive(:out)
        end
        let(:path) { Pathname.new("spec/FILES/basic.yml").realpath.to_s }

        it "should read yaml" do
          subject

          expect(File).to have_received(:read).with(path)
          expect(Psych).to have_received(:safe_load)
          expect(Tablesyntax::Fileio::Output::StandardOutput).to have_received(:out)
        end
      end
    end

    context "when path is invalid" do
      where(:path_) do
        [
          "spec/FILES/99_unspported.dat",
          "/tmp/im.not.exist.file"
        ]
      end
      with_them do
        let(:path) { Pathname.new(path_).realpath.to_s }

        it "should raise error" do
          expect { subject }.to raise_error StandardError
        end
      end
    end
  end
end
