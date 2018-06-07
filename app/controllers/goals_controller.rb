class GoalsController < ApplicationController
  before_action :current_user_must_be_goal_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_goal_user
    goal = Goal.find(params[:id])

    unless current_user == goal.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @goals = current_user.goals.page(params[:page]).per(10)

    render("goals/index.html.erb")
  end

  def show
    @focu = Focu.new
    @goal = Goal.find(params[:id])

    render("goals/show.html.erb")
  end

  def new
    @goal = Goal.new

    render("goals/new.html.erb")
  end

  def create
    @goal = Goal.new

    @goal.name = params[:name]
    @goal.user_id = params[:user_id]

    save_status = @goal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/goals/new", "/create_goal"
        redirect_to("/goals")
      else
        redirect_back(:fallback_location => "/", :notice => "Goal created successfully.")
      end
    else
      render("goals/new.html.erb")
    end
  end

  def edit
    @goal = Goal.find(params[:id])

    render("goals/edit.html.erb")
  end

  def update
    @goal = Goal.find(params[:id])

    @goal.name = params[:name]
    @goal.user_id = params[:user_id]

    save_status = @goal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/goals/#{@goal.id}/edit", "/update_goal"
        redirect_to("/goals/#{@goal.id}", :notice => "Goal updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Goal updated successfully.")
      end
    else
      render("goals/edit.html.erb")
    end
  end

  def destroy
    @goal = Goal.find(params[:id])

    @goal.destroy

    if URI(request.referer).path == "/goals/#{@goal.id}"
      redirect_to("/", :notice => "Goal deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Goal deleted.")
    end
  end
end
