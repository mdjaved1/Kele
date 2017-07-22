module Roadmap
    
   def get_roadmap(road_id)
       response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{road_id}", headers: { "authorization" => @auth_token })
       @roadmap = JSON.parse(response.body)
   end
   
   def check_point(checkpoint_id)
      response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token })
      @checkpoint = JSON.parse(response.body)
   end
   
end