class H2oReUpsController < ApplicationController
  before_action :set_h2o_re_up, only: [:show, :edit, :update, :destroy]

  # GET /h2o_re_ups
  # GET /h2o_re_ups.json
  def index
    @h2o_re_ups = H2oReUp.where(["simCard LIKE ?" , "%#{params[:search]}%"])
    @h2o_re_ups = H2oReUp.order(params[:sort] + "  " + params[:direction])
  end

  # GET /h2o_re_ups/1
  # GET /h2o_re_ups/1.json
  def show
  end

  # GET /h2o_re_ups/new
  def new
    @h2o_re_up = H2oReUp.new
  end

  # GET /h2o_re_ups/1/edit
  def edit
  end

  # POST /h2o_re_ups
  # POST /h2o_re_ups.json
  def create
    @h2o_re_up = H2oReUp.new(h2o_re_up_params)

    respond_to do |format|
      if @h2o_re_up.save
        format.html { redirect_to @h2o_re_up, notice: 'H2o re up was successfully created.' }
        format.json { render :show, status: :created, location: @h2o_re_up }
      else
        format.html { render :new }
        format.json { render json: @h2o_re_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /h2o_re_ups/1
  # PATCH/PUT /h2o_re_ups/1.json
  def update
    respond_to do |format|
      if @h2o_re_up.update(h2o_re_up_params)
        format.html { redirect_to @h2o_re_up, notice: 'H2o re up was successfully updated.' }
        format.json { render :show, status: :ok, location: @h2o_re_up }
      else
        format.html { render :edit }
        format.json { render json: @h2o_re_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /h2o_re_ups/1
  # DELETE /h2o_re_ups/1.json
  def destroy
    @h2o_re_up.destroy
    respond_to do |format|
      format.html { redirect_to h2o_re_ups_url, notice: 'H2o re up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_h2o_re_up
      @h2o_re_up = H2oReUp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def h2o_re_up_params
      params.require(:h2o_re_up).permit(:companyName, :simCard, :phoneNumber, :reupDate, :expirationDate, :pinNumber)
    end
end
