class ActorsController < ApplicationController
  
  def update
    d_id = params.fetch("an_id")

    matching_records = Actor.where({:id => d_id})

    the_actor = matching_records.at(0)
    
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.bio = params.fetch("the_bio")
    the_actor.image = params.fetch("the_image")

    the_actor.save

    redirect_to("/actors/#{the_actor.id}")

  end
  
  
  def destroy 

    the_id = params.fetch("an_id")

    matching_records = Director.where({:id => the_id})

    the_actor = matching_records.at(0)

    the_actor.destroy

    redirect_to("/directors")

  end
  
  def create
    
    # Parameters: {"the_name"=>"Fredp", "the_dob"=>"2024-10-10", "the_bio"=>"Test", "the_image"=>"Test"}

    the_actor = Actor.new
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.bio = params.fetch("the_bio")
    the_actor.image = params.fetch("the_image")

    the_actor.save

    redirect_to("/actors")

  end
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
