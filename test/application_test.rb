require_relative "test_helper"

class App < Rulers::Application
end

class ApplicationTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App.new
  end

  def test_root
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["This is root"]
  end

  def test_hello
    get "/tests/hello"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_hello_world
    get "/tests/hello_world"

    assert last_response.ok?
    body = last_response.body
    assert body["Hey Hello world!!"]
  end

  def test_hello_quote
    get "/tests/hello_quote"

    assert last_response.ok?
    body = last_response.body
    assert body["A penny saved is a penny earned."]
  end

  def test_more_quotes
    get "/tests/more_quotes"

    assert last_response.ok?
    body = last_response.body
    assert body["A penny saved is a penny earned."]
    assert body["The greatest glory in living lies not in never falling, but in rising every time we fall."]
    assert body["Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking."]
  end

end
