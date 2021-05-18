require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "volunteer user relation" do
    assert users(:one).volunteer == volunteers(:one)
  end
end
