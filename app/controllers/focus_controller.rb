class FocusController < ApplicationController
  before_action :current_user_must_be_focu_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_focu_user
    focu = Focu.find(params[:id])

    unless current_user == focu.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @focus = current_user.focus.page(params[:page]).per(10)

    render("focus/index.html.erb")
  end

  def show
    @focu = Focu.find(params[:id])

    render("focus/show.html.erb")
  end

  def new
    @focu = Focu.new

    render("focus/new.html.erb")
  end

  def create
    @focu = Focu.new

    @focu.name = params[:name]
    @focu.goals_id = params[:goals_id]
    @focu.mindsets_id = params[:mindsets_id]
    @focu.description = params[:description]
    @focu.user_id = params[:user_id]

    save_status = @focu.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/focus/new", "/create_focu"
        redirect_to("/focus")
      else
        redirect_back(:fallback_location => "/", :notice => "Focu created successfully.")
      end
    else
      render("focus/new.html.erb")
    end
  end

  def edit
    @focu = Focu.find(params[:id])

    render("focus/edit.html.erb")
  end

  def update
    @focu = Focu.find(params[:id])

    @focu.name = params[:name]
    @focu.goals_id = params[:goals_id]
    @focu.mindsets_id = params[:mindsets_id]
    @focu.description = params[:description]
    @focu.user_id = params[:user_id]

    save_status = @focu.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/focus/#{@focu.id}/edit", "/update_focu"
        redirect_to("/focus/#{@focu.id}", :notice => "Focu updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Focu updated successfully.")
      end
    else
      render("focus/edit.html.erb")
    end
  end

  def destroy
    @focu = Focu.find(params[:id])

    @focu.destroy

    if URI(request.referer).path == "/focus/#{@focu.id}"
      redirect_to("/", :notice => "Focu deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Focu deleted.")
    end
  end
end
