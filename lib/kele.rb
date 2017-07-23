require 'httparty'
require './lib/roadmap.rb'

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
   def get_mentor_availability(mentor_id)
      response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
      @mentor_availability = JSON.parse(response.body)
   end
   def get_messages(page)
       if page == nil 
         response = self.class.get("https://www.bloc.io/api/v1/message_threads",  headers: { "authorization" => @auth_token }) 
       else 
         response = self.class.get("https://www.bloc.io/api/v1/message_threads/#{page}",  headers: { "authorization" => @auth_token })   
       end
       @messages = JSON.parse(response.body)
   end
   def create_message(sender, token , recipient_id, subject, stripped_text)
        response = self.class.get("https://www.bloc.io/api/v1/messages",body: { "user_id": id, "recipient_id": recipient_id, "subject": subject, "stripped-text": stripped_text }, headers: { "authorization" => @auth_token })
        p response
   end
   def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
      response = self.class.post("https://www.bloc.io/api/v1/checkpoint_submissions", body: {"checkpoint_id": checkpoint_id, "assignment_branch": assignment_branch, "assignment_commit_link": assignment_commit_link, "comment": comment}, headers: {"authorization" => @auth_token}) 
      puts response
   end
 end