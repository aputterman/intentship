class RemindersController < ApplicationController
  before_action :current_user_must_be_reminder_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_reminder_user
    reminder = Reminder.find(params[:id])

    unless current_user == reminder.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @reminders = Reminder.all

    render("reminders/index.html.erb")
  end

  def show
    @reminder = Reminder.find(params[:id])

    render("reminders/show.html.erb")
  end

  def new
    @reminder = Reminder.new

    render("reminders/new.html.erb")
  end

  def create
    @reminder = Reminder.new

    @reminder.focus_id = params[:focus_id]
    @reminder.mindsets_id = params[:mindsets_id]
    @reminder.user_id = params[:user_id]

    save_status = @reminder.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reminders/new", "/create_reminder"
        redirect_to("/reminders")
      else
        redirect_back(:fallback_location => "/", :notice => "Reminder created successfully.")
      end
    else
      render("reminders/new.html.erb")
    end
  end

  def edit
    @reminder = Reminder.find(params[:id])

    render("reminders/edit.html.erb")
  end

  def update
    @reminder = Reminder.find(params[:id])

    @reminder.focus_id = params[:focus_id]
    @reminder.mindsets_id = params[:mindsets_id]
    @reminder.user_id = params[:user_id]

    save_status = @reminder.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reminders/#{@reminder.id}/edit", "/update_reminder"
        redirect_to("/reminders/#{@reminder.id}", :notice => "Reminder updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reminder updated successfully.")
      end
    else
      render("reminders/edit.html.erb")
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])

    @reminder.destroy

    if URI(request.referer).path == "/reminders/#{@reminder.id}"
      redirect_to("/", :notice => "Reminder deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reminder deleted.")
    end
  end
end
