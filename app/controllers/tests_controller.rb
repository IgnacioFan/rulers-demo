class TestsController < Rulers::Controller
  def hello
    "Hello"
  end

  def hello_world
    render :hello_world, :say => :hey
  end

  def hello_quote
    quote_1 = FileModel.find(1)
    render :hello_quote, :obj => quote_1
  end

  def more_quotes
    quotes = FileModel.all
    render :more_quotes, :quotes => quotes
  end

  def create_quote
    attrs = {
      "submitter" => "Noah",
      "quote" => "Life is what happens when you're busy making other plans.",
      "attribution" => "John Lennon"
    }

    quote = FileModel.create(attrs)
    render :hello_quote, :obj => quote
  end
end
