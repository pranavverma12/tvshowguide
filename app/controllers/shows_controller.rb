class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  # GET /shows
  # GET /shows.json
  def index
    unless params[:name].blank?
      @shows = Show.search_shows(params[:name])
    else
      @shows = Show.all
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show; end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit; end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)

    if @show.save
      redirect_to @show, notice: 'Show was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(:name, :channel_id, :timing)
    end
end
