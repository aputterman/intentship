class TimingsController < ApplicationController
  def index
    @q = Timing.ransack(params[:q])
    @timings = @q.result(:distinct => true).includes(:reminders).page(params[:page]).per(10)

    render("timings/index.html.erb")
  end

  def show
    @timing = Timing.find(params[:id])

    render("timings/show.html.erb")
  end

  def new
    @timing = Timing.new

    render("timings/new.html.erb")
  end

  def create
    @timing = Timing.new

    @timing.time = params[:time]
    @timing.date = params[:date]
    @timing.day = params[:day]
    @timing.reminders_id = params[:reminders_id]

    save_status = @timing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/timings/new", "/create_timing"
        redirect_to("/timings")
      else
        redirect_back(:fallback_location => "/", :notice => "Timing created successfully.")
      end
    else
      render("timings/new.html.erb")
    end
  end

  def edit
    @timing = Timing.find(params[:id])

    render("timings/edit.html.erb")
  end

  def update
    @timing = Timing.find(params[:id])

    @timing.time = params[:time]
    @timing.date = params[:date]
    @timing.day = params[:day]
    @timing.reminders_id = params[:reminders_id]

    save_status = @timing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/timings/#{@timing.id}/edit", "/update_timing"
        redirect_to("/timings/#{@timing.id}", :notice => "Timing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Timing updated successfully.")
      end
    else
      render("timings/edit.html.erb")
    end
  end

  def destroy
    @timing = Timing.find(params[:id])

    @timing.destroy

    if URI(request.referer).path == "/timings/#{@timing.id}"
      redirect_to("/", :notice => "Timing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Timing deleted.")
    end
  end
end
