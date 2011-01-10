require './study.rb'
require 'test/unit'
class TestStudy < Test::Unit::TestCase

  def test_bestorder
    assert_equal(bestorder("facebook hacker cup for studious students".split(" ")), "cupfacebookforhackerstudentsstudious")
    assert_equal(bestorder("k duz q rc lvraw".split(" ")), "duzklvrawqrc")
    assert_equal(bestorder("mybea zdr yubx xe dyroiy".split(" ")), "dyroiymybeaxeyubxzdr")
    assert_equal(bestorder("jibw ji jp bw jibw".split(" ")), "bwjibwjibwjijp")
    assert_equal(bestorder("uiuy hopji li j dcyi".split(" ")), "dcyihopjijliuiuy")
  end
end

