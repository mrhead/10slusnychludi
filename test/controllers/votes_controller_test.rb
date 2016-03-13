require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get home" do
    get :new

    assert_response :success
  end

  test "create vote with valid data" do
    vote_attributes = {
      name: "John Doe",
      city: "Bratislava",
      email: "jd@example.com",
      public: true
    }

    assert_difference "Vote.count" do
      post :create, vote: vote_attributes
    end
  end

  test "create vote with invalid data" do
    post :create, vote: { name: "jd" }

    assert_select ".form-errors"
  end
end
