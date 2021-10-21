# frozen_string_literal: true
require "rulers/array"
require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, { "Content-Type" => "text/html" }, []]
      end

      if env["PATH_INFO"] == "/"
        return [200, { "Content-Type" => "text/html" }, [File.read("public/index.html")]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
        [200, { "Content-Type" => "text/html" }, [text]]
      rescue => exception
        [404, { "Content-Type" => "text/html" }, ["Somthing wrong"]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
