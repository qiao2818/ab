class AbInfosController < ApplicationController
  before_action :set_ab_info, only: [:show, :edit, :update, :destroy]

  #skip_before_filter :verify_authenticity_token

  #var test_data = [{values:[{x:"20140201", y:1448}, {x:"20140202", y:2582}], key:"test wave", color:"#ff7f0e"}];

  def haha
    data = []
    colors = ["#ff7f0e","#2ca02c","#7777ff","#000000","#ff7f0e","#2ca02c","#7777ff","#000000"]
    ss = AbInfo.find(:all,:conditions=>["concurrency_num = ? and request_num = ? and src = ? and target = ?",1,10,"HangZhou","Tokyo"])
    colors_index = 0
    test = 0
    ss.each do |s|
      url = s.url
      response_time = s.response_time
      concurrency_num = s.concurrency_num
      request_num = s.request_num
      run_time = s.run_time

      hour = run_time.hour

      if(!data.blank?)
        flag = true
        data.each do |d|
          if (d[:key] == url)
            puts "---- url is in data -----"
            value = {}
            value[:x] = run_time.to_s.gsub(" UTC","")
            value[:y] = response_time
            d[:values] << value
            flag = false
          end
        end
        if(flag)
          puts "----- url is not in data ----"
          colors_index += 1
          hash = determine_data(url,response_time,concurrency_num,request_num,run_time,hour)
          hash[:color] = colors[colors_index]
          data << hash
        end
      else
        puts "----- data is null -----"
        hash = determine_data(url,response_time,concurrency_num,request_num,run_time,hour)
        hash[:color] = colors[colors_index]
        data << hash
      end
    end
    #data = [{values:[{x:"20140201", y:20000}, {x:"20140202", y:2582}, {x:"20140203", y:408}, {x:"20140204", y:426}, {x:"20140205", y:411}, {x:"20140206", y:409}, {x:"20140207", y:874}], key:"test wave", color:"#ff7f0e"}]
    respond_to do |format|
      format.json { render json: data }
    end
  end

  def determine_data(url,response_time,concurrency_num,request_num,run_time,hour)
    hash = {}
    colors_index = 0
    hash[:key] = url
    hash[:values] = []
    value = {}
    value[:x] = run_time.to_s.gsub(" UTC","")
    value[:y] = response_time
    hash[:values] << value
    return hash
  end

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
      puts "++++++++++++++++++++++"
      puts "++++++++++++++++++++++"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ab_info_params
      params.require(:ab_info).permit(:concurrency_num, :request_num, :response_time, :url, :src, :target, :created_at, :updated_at)
    end
end
