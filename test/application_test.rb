require_relative "test_helper"

class TestApp < Rulers::Application
end

class TestsController < Rulers::Controller
  def hello
    "Hello"
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  # def test_request
  #   get "/"

  #   assert last_response.ok?
  #   body = last_response.body
  #   assert body["Hello"]
  # end

  def test_get_controller_and_action
    get "/tests/hello"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

end
