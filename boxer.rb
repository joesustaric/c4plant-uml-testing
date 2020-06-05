#!/usr/bin/env ruby

require "json"

json_from_file = File.read("sample.json")
parsed_json = JSON.parse(json_from_file)

File.open("sample.puml", 'w') do |file|
  file.write("@startuml Example 2\n")
  file.write("!includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml\n\n")

  # stuff goes here.

  file.write("@enduml\n")
end

#TODO - run file through plantuml to export png
