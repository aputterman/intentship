class MindsetsController < ApplicationController
  before_action :current_user_must_be_mindset_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_mindset_user
    mindset = Mindset.find(params[:id])

    unless current_user == mindset.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @mindsets = current_user.mindsets.page(params[:page]).per(10)

    render("mindsets/index.html.erb")
  end

  def show
    @primer = Primer.new
    @reminder = Reminder.new
    @mindset = Mindset.find(params[:id])

    render("mindsets/show.html.erb")
  end

  def new
    @mindset = Mindset.new

    render("mindsets/new.html.erb")
  end

  def create
    @mindset = Mindset.new

    @mindset.name = params[:name]
    @mindset.description = params[:description]
    @mindset.user_id = params[:user_id]

    save_status = @mindset.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mindsets/new", "/create_mindset"
        redirect_to("/mindsets")
      else
        redirect_back(:fallback_location => "/", :notice => "Mindset created successfully.")
      end
    else
      render("mindsets/new.html.erb")
    end
  end

  def edit
    @mindset = Mindset.find(params[:id])

    render("mindsets/edit.html.erb")
  end

  def update
    @mindset = Mindset.find(params[:id])

    @mindset.name = params[:name]
    @mindset.description = params[:description]
    @mindset.user_id = params[:user_id]

    save_status = @mindset.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mindsets/#{@mindset.id}/edit", "/update_mindset"
        redirect_to("/mindsets/#{@mindset.id}", :notice => "Mindset updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mindset updated successfully.")
      end
    else
      render("mindsets/edit.html.erb")
    end
  end

  def destroy
    @mindset = Mindset.find(params[:id])

    @mindset.destroy

    if URI(request.referer).path == "/mindsets/#{@mindset.id}"
      redirect_to("/", :notice => "Mindset deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mindset deleted.")
    end
  end
end
