require 'minitest/autorun'
require_relative '/workspaces/ZARA-STORE/zara_store.rb/'

class TestZaraStore < Minitest::Test
  def setup
    @zara = ZaraStore.new
  end

  def test_welcome_message
    assert_output("\nWelcome to Zara!\nHow may we assist you today?\n") { @zara.welcome_message }
  end

  def test_check_availability
    assert_output("\nGreat choice! We have 10 shirts available.\nEach shirt costs $29.99.\n") do
      @zara.stub :gets, 'shirt' do
        @zara.check_availability
      end
    end
  end

  # Add more tests as needed

end
