#!/usr/local/bin/ruby -w

require "json"


json_from_file = File.read("sample.json")
parsed_json = JSON.parse(json_from_file)

puts parsed_json
