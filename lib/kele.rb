require 'httparty'

 class Kele
   include HTTParty
  
   def initialize(email , password)
       response = self.class.post("https://www.bloc.io/api/v1/sessions", body: { email: email, password: password })
       p response
       raise "Invalid email or password" if response.code == 404
       @auth_token = response["auth_token"]
   end  
   def get_me
       response = self.class.get(url, headers: { "authorization" => @auth_token })
       @user_data = JSON.parse(response.body)
   end
 end