require 'httparty'

 class Kele
   include HTTParty
  
   def initialize(email , password)
       self.class.post("https://www.bloc.io/api/v1/session", body: { "email": email, "password": password })
   end  
   def get_me
       response = self.class.get(url, headers: { "authorization" => @auth_token })
       @user_data = JSON.parse(response.body)
   end
 end