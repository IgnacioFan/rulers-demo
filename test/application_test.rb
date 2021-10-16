require_relative "test_helper"

class TestApp < Rulers::Application
end

class TestsController < Rulers::Controller
  def hello
    "Hello"
  end

  def hello_world
    render :hello_world, :say => :hey
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_root
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["This is root"]
  end

  def test_get_controller_and_action
    get "/tests/hello"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_render
    get "/tests/hello_world"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello world!!"]
  end

end
