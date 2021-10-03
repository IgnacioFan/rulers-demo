require_relative "test_helper"

class TestArray < Minitest::Test

  def test_sum_return_value
    assert ([1,2,3].sum) == 6
  end

  def test_sum_return_zero
    assert ([].sum) == 0
  end

end
