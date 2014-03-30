require_relative './spec_helper'

describe "IndexController (this is a skeleton controller test!)" do

  describe 'get all bands' do
    it 'should get index page' do
      get "/asdfa"
      expect(last_response).to be_ok
    end
  end

  describe 'create a new band' do
    tweet_id = '111222333444555'
    new_params = {
        tweet_id: tweet_id
      }
    new_session = {
      'rack.session' => {
        # Could preload stuff into the session here...
      }
    }
    it 'should add a new band' do
      expect{
        post('/getmore')
      }.to change(Band, :count).by(1)
      last_response.should be_redirect
    end
  end
end
