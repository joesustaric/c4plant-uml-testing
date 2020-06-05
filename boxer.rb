#!/usr/local/bin/ruby -w

require "json"


json_from_file = File.read("sample.json")
parsed_json = JSON.parse(json_from_file)

#TODO - Parse into puml format
#TODO - write file`
#TODO - run file through plantuml to export png
