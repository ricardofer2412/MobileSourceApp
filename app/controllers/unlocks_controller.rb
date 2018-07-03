class UnlocksController < ApplicationController
  before_action :set_unlock, only: [:show, :edit, :update, :destroy]

  # GET /unlocks
  # GET /unlocks.json
  def index
    @unlocks = Unlock.all
  end

  # GET /unlocks/1
  # GET /unlocks/1.json
  def show
  end

  # GET /unlocks/new
  def new
    @unlock = Unlock.new
  end

  # GET /unlocks/1/edit
  def edit
  end

  # POST /unlocks
  # POST /unlocks.json
  def create
    @unlock = Unlock.new(unlock_params)

    respond_to do |format|
      if @unlock.save
        format.html { redirect_to @unlock, notice: 'Unlock was successfully created.' }
        format.json { render :show, status: :created, location: @unlock }
      else
        format.html { render :new }
        format.json { render json: @unlock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unlocks/1
  # PATCH/PUT /unlocks/1.json
  def update
    respond_to do |format|
      if @unlock.update(unlock_params)
        format.html { redirect_to @unlock, notice: 'Unlock was successfully updated.' }
        format.json { render :show, status: :ok, location: @unlock }
      else
        format.html { render :edit }
        format.json { render json: @unlock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unlocks/1
  # DELETE /unlocks/1.json
  def destroy
    @unlock.destroy
    respond_to do |format|
      format.html { redirect_to unlocks_url, notice: 'Unlock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unlock
      @unlock = Unlock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unlock_params
      params.require(:unlock).permit(:imei, :request_number, :date_submitted, :status)
    end
end
