require 'test_helper'

class TweetStreamsControllerTest < ActionController::TestCase

  test "fetches tweets on create" do
    #jeff = Object.new
    #jeff.expects(:followers_count).returns(1)
    #@controller.twitter_client.expects(:user).with('j3').returns(jeff)

    jeff = stub(followers_count: 0)
    @controller.twitter_client.expects(:user).returns(jeff)

    tweets = [stub(text: "hi", user: stub(screen_name: "pizza man"))]
    @controller.twitter_client.stubs(:user_timeline).returns(tweets)

    post :create, :twitter_handle => "j3"
    assert_response :success
    assert_not_nil assigns(:tweets)
    assert_select "li.tweet"
  end

end
