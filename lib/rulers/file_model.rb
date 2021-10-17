require "multi_json"
module Rulers
  module Model
    class FileModel

      def initialize(filename)
        @filename = filename
        # File.split will split on slashes on Unix or Mac
        # /home/quotes/37.json => [home, quotes, 37.json]
        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        begin
          FileModel.new("db/quotes/#{id}.json")
        rescue
          return nil
        end
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new(f) }
      end

      def self.create(attrs)
        hash = {}
        hash["submitter"] = attrs["submitter"] || ""
        hash["quote"] = attrs["quote"] || ""
        hash["attribution"] = attrs["attribution"] || ""

        files = Dir["db/quotes/*.json"]
        names = files.map { |f| File.split(f)[-1] }
        max_height = names.map { |n| n.to_i }.max
        id = max_height + 1

        File.open("db/quotes/#{id}.json", "w") do |f|
          f.write %Q(
{
  "submitter": "#{hash["submitter"]}",
  "quote": "#{hash["quote"]}",
  "attribution": "#{hash["attribution"]}"
}
            )
        end

        FileModel.new("db/quotes/#{id}.json")
      end

    end
  end
end
