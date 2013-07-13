require 'rho/rhocontroller'
require 'helpers/browser_helper'

class NeighborhoodController < Rho::RhoController
  include BrowserHelper

  # GET /Neighborhood
  def index
    @neighborhoods = Neighborhood.find(:all)
    render :back => '/app'
  end

  # GET /Neighborhood/{1}
  def show
    @neighborhood = Neighborhood.find(@params['id'])
    if @neighborhood
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Neighborhood/new
  def new
    @neighborhood = Neighborhood.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Neighborhood/{1}/edit
  def edit
    @neighborhood = Neighborhood.find(@params['id'])
    if @neighborhood
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Neighborhood/create
  def create
    @neighborhood = Neighborhood.create(@params['neighborhood'])
    redirect :action => :index
  end

  # POST /Neighborhood/{1}/update
  def update
    @neighborhood = Neighborhood.find(@params['id'])
    @neighborhood.update_attributes(@params['neighborhood']) if @neighborhood
    redirect :action => :index
  end

  # POST /Neighborhood/{1}/delete
  def delete
    @neighborhood = Neighborhood.find(@params['id'])
    @neighborhood.destroy if @neighborhood
    redirect :action => :index  
  end
  
  def mapview
#    @neighborhood = Neighborhood.find(@params['id'])
  end
  
  def quiz
    
  end
  
  def quiz_guess_1
    redirect :action => :wrong
  end
  def quiz_guess_2
    redirect :action => :correct
    end
  def quiz_guess_3
    redirect :action => :wrong
    end
    
   def correct
     $QuizScore = $QuizScore + 1
     render :back => '/app'
   end
   def wrong
   end
end
