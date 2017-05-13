class SessionsController < ApplicationController
  def create
    @response =
    Faraday.post("https://github.com/login/oauth/access_token?client_id=1887815fa1bd3d6d4662&client_secret=a855d7a613c1e5dd3b398fedd6f719e6427b2280&code=#{params["code"]}")

    token = @response.body.split(/\W+/)[1]

    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
  end
end
