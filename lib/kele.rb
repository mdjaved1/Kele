require 'httparty'

 class Kele
   include HTTParty
  
   def initialize(email , password)
       self.class.post("https://www.bloc.io/api/v1/session", body: { "email": email, "password": password })
   end  
 end