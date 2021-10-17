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
    end
  end
end
