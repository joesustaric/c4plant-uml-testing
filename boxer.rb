#!/usr/bin/env ruby

require "json"

class Box

  def initialize json_box
    @id = json_box["id"]
    @name = json_box["name"]
    @type = json_box["type"]
    @boxes = json_box["boxes"] ? json_box["boxes"].collect { |child_json_box| Box.new child_json_box } : []
  end

  def print file
    file.write("Boundary(#{@id}, \"#{@name}\", \"#{@type}\") {\n")
    @boxes.each { |box| box.print file }
    file.write("}\n")
  end

end

class Puml 

  def initialize json_boxes
    @boxes = json_boxes.collect { |json_box| Box.new json_box}
  end

  def print filename

    File.open(filename, 'w') do |file|
      file.write("@startuml Example 2\n")
      file.write("!includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml\n\n")

      @boxes.each { |box| box.print file }

      file.write("@enduml\n")
    end
  end

end

json_from_file = File.read("sample.json")
parsed_json = JSON.parse(json_from_file)

boxes = parsed_json["data"]["boxes"]

puml = Puml.new boxes
puml.print "sample.puml"


