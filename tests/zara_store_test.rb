# zara_store_test.rb
require 'minitest/autorun'
require './zara_store.rb'

class TestZaraStore < Minitest::Test
  def setup
    @zara = ZaraStore.new
  end

  def test_number_of_items
    assert_equal 3, @zara.number_of_items("shirt")
    assert_nil @zara.number_of_items("horse")
  end
end

