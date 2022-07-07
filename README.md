# Tablesyntax generator

Generate `tablesyntax` from specific format.

`tablesyntax` is used in [rspec-parameterized](https://github.com/tomykaira/rspec-parameterized)

## Installation

```ruby
rake build
gem install pkg/tablesyntax-x.x.x.gem
```

## Usage

In `irb`

```ruby
require 'tablesyntax'

Tablesyntax::Main.run '-f', '/path/to/yourfile.yml'

ex)
Tablesyntax::Main.run '-f', './spec/FILES/many_types.yml'
where(:title, :metadata) do
             "string single quote" |                          "abcdefg"
             "string double quote" |                          "ABCDEFG"
                          "symbol" |                    :this_is_symbol
                         "integer" |                              12345
                           "array" |                   [1, 2, "a", "b"]
                  "array in array" |                 [1, 2, ["a", "b"]]
                       "deep hash" | {"root"=>{"child"=>{"data"=>123}}}
                   "repeat string" |                            'a' * 5
                       "shows nil" |                                nil
end
```

* supported extension is `yaml` or `yml`
* example files are in [spec/FILES](./spec/FILES/)

## Required

* Ruby >= 3.0.0

## License

[MIT License](https://opensource.org/licenses/MIT).
