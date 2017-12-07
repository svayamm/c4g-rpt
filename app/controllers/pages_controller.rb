class PagesController < ApplicationController
    before_action :set_params, only: [:show]
  
    def show
      
      # puts params.inspect
      @crop_id = params[:crop_id] unless params[:crop_id].nil?
      @farm_id = params[:farm] unless params[:farm].nil?
      @fin_id = params[:fin] unless params[:fin].nil?

      @farm = Farm.find(@farm_id)
      # @farm = Farm.first
      @district = Farm::DISTRICTS.find_index(@farm.location)
      @area = @farm.size

      @crop = Crop.find(@crop_id)
      @season_num = Crop::SEASONS.find_index(@crop.season)

      @finance = Finance.find(@fin_id)
      @t_c = @finance.budget
      @o_l = @finance.outstanding_loan
      @i_r = @finance.interest_rate
      # puts @season_num
      @res = `ruby test2.rb "#{@crop_id}" "#{@district}" "#{@season_num}" "#{@t_c}" "#{@area}" "#{@o_l}" "#{@i_r}"`
      # puts `ruby test2.rb`
      render template: "pages/result", locals: {res: @res}
    end

    private
    def set_params
      params.permit!
      # puts params.inspect
      # puts params[:action]
      # @crop_id = params[:crop_id] unless params[:crop_id].nil?
    end
  end