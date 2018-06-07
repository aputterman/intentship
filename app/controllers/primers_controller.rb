class PrimersController < ApplicationController
  def index
    @q = Primer.ransack(params[:q])
    @primers = @q.result(:distinct => true).includes(:mindsets).page(params[:page]).per(10)

    render("primers/index.html.erb")
  end

  def show
    @primer = Primer.find(params[:id])

    render("primers/show.html.erb")
  end

  def new
    @primer = Primer.new

    render("primers/new.html.erb")
  end

  def create
    @primer = Primer.new

    @primer.name = params[:name]
    @primer.description = params[:description]
    @primer.mindsets_id = params[:mindsets_id]

    save_status = @primer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/primers/new", "/create_primer"
        redirect_to("/primers")
      else
        redirect_back(:fallback_location => "/", :notice => "Primer created successfully.")
      end
    else
      render("primers/new.html.erb")
    end
  end

  def edit
    @primer = Primer.find(params[:id])

    render("primers/edit.html.erb")
  end

  def update
    @primer = Primer.find(params[:id])

    @primer.name = params[:name]
    @primer.description = params[:description]
    @primer.mindsets_id = params[:mindsets_id]

    save_status = @primer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/primers/#{@primer.id}/edit", "/update_primer"
        redirect_to("/primers/#{@primer.id}", :notice => "Primer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Primer updated successfully.")
      end
    else
      render("primers/edit.html.erb")
    end
  end

  def destroy
    @primer = Primer.find(params[:id])

    @primer.destroy

    if URI(request.referer).path == "/primers/#{@primer.id}"
      redirect_to("/", :notice => "Primer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Primer deleted.")
    end
  end
end
