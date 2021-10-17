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
end
