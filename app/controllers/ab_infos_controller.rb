class AbInfosController < ApplicationController
  before_action :set_ab_info, only: [:show, :edit, :update, :destroy]

  # GET /ab_infos
  # GET /ab_infos.json
  def index
    @ab_infos = AbInfo.all
  end

  # GET /ab_infos/1
  # GET /ab_infos/1.json
  def show
  end

  # GET /ab_infos/new
  def new
    @ab_info = AbInfo.new
  end

  # GET /ab_infos/1/edit
  def edit
  end

  # POST /ab_infos
  # POST /ab_infos.json
  def create
    @ab_info = AbInfo.new(ab_info_params)

    respond_to do |format|
      if @ab_info.save
        format.html { redirect_to @ab_info, notice: 'Ab info was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ab_info }
      else
        format.html { render action: 'new' }
        format.json { render json: @ab_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ab_infos/1
  # PATCH/PUT /ab_infos/1.json
  def update
    respond_to do |format|
      if @ab_info.update(ab_info_params)
        format.html { redirect_to @ab_info, notice: 'Ab info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ab_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ab_infos/1
  # DELETE /ab_infos/1.json
  def destroy
    @ab_info.destroy
    respond_to do |format|
      format.html { redirect_to ab_infos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ab_info
      @ab_info = AbInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ab_info_params
      params.require(:ab_info).permit(:concurrency_num, :request_num, :response_time, :url, :src, :target)
    end
end
