class TestsController < Rulers::Controller
  def hello
    "Hello"
  end

  def hello_world
    render :hello_world, :say => :hey
  end
end
