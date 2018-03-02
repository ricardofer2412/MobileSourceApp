class H2oCustomersController < ApplicationController
  before_action :set_h2o_customer, only: [:show, :edit, :update, :destroy]

  # GET /h2o_customers
  # GET /h2o_customers.json
  def index
    @h2o_customers = H2oCustomer.all
  end

  # GET /h2o_customers/1
  # GET /h2o_customers/1.json
  def show
  end

  # GET /h2o_customers/new
  def new
    @h2o_customer = H2oCustomer.new
  end

  # GET /h2o_customers/1/edit
  def edit
  end

  # POST /h2o_customers
  # POST /h2o_customers.json
  def create
    @h2o_customer = H2oCustomer.new(h2o_customer_params)

    respond_to do |format|
      if @h2o_customer.save
        format.html { redirect_to @h2o_customer, notice: 'H2o customer was successfully created.' }
        format.json { render :show, status: :created, location: @h2o_customer }
      else
        format.html { render :new }
        format.json { render json: @h2o_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /h2o_customers/1
  # PATCH/PUT /h2o_customers/1.json
  def update
    respond_to do |format|
      if @h2o_customer.update(h2o_customer_params)
        format.html { redirect_to @h2o_customer, notice: 'H2o customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @h2o_customer }
      else
        format.html { render :edit }
        format.json { render json: @h2o_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /h2o_customers/1
  # DELETE /h2o_customers/1.json
  def destroy
    @h2o_customer.destroy
    respond_to do |format|
      format.html { redirect_to h2o_customers_url, notice: 'H2o customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_h2o_customer
      @h2o_customer = H2oCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def h2o_customer_params
      params.require(:h2o_customer).permit(:companyName)
    end
end
