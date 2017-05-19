gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("A")
    assert_equal 4, Scrabble.new.score("F")
  end

  def test_it_can_score_a_word
    assert_equal 6, Scrabble.new.score('BUTT')
    assert_equal 32, Scrabble.new.score('QUETZALCOATL')
  end

  def test_it_can_score_regardless_of_case
    assert_equal 6, Scrabble.new.score('ButT')
    assert_equal 32, Scrabble.new.score('QuEtZAlCOAtL')
  end

  def test_score_is_0_for_nil_or_empty_string
    assert_equal 0, Scrabble.new.score('')
    assert_equal 0, Scrabble.new.score(nil)
  end
end
