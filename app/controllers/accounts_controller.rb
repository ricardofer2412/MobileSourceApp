class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  helper_method :sort_column, :sort_direction
  def index
    @accounts = Account.order(sort_column + " " + sort_direction)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end



  def fetch_balance

    require 'watir'
    require 'nokogiri'
    require 'open-uri'
    require 'selenium-webdriver'

    Account.all.each do |account|

        # Credentials
        username = "29629"
        password = "1234"

        #Get SimCards
        #active

        simcardNumber = account.simcardNumber

        #open Browser
        browser = Watir::Browser.new :phantomjs
        browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbEquip"

        #Login
        browser.text_field(:name => "dc").set username
        browser.text_field(:type => "password").set password
        browser.input(:type => "image").click

        #Get SimNumber
        browser.option(:value => "GSM").click
        browser.text_field(:id => "gsm_mdn_sim").set simcardNumber
        browser.image(:src => "images/db/bt_submit.png").click

        sleep (11)

        if browser.element(:xpath, "//*[@id='rep_error_note']").text == "Cancelled"
          phoneNumber = browser.element(:xpath, "//*[@id='rep_error_mdn']").text
          accountStatus =  browser.element(:xpath, "//*[@id='rep_error_note']").text
        else
          phoneNumber = browser.element(:xpath, "//*[@id='rep_gsm_mdn']").text
          accountStatus = browser.element(:xpath, "//*[@id='rep_gsm_mdn_status']").text
        end
        sleep(1)


        browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbBalance"

        #get DbBalance
        browser.option(:value => "GSM").click
        browser.text_field(:id => "txtMDN").set phoneNumber
        browser.image(:src => "images/db/bt_submit.png").click


        sleep(2)
        #collect Data
        balance = browser.element(:xpath, "//*[@id='fcard_bal']").text
        expiration = browser.element(:xpath, "//*[@id='exp']").text

        #Update Account
        account.update_attribute(:balance, balance)
        account.update_attribute(:accountStatus, accountStatus)
        account.update_attribute(:phoneNumber, phoneNumber)
        account.update_attribute(:expirationDate, expiration)
        sleep(1)



      end
      redirect_to accounts_path and return
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end
    def sort_column
      Account.column_names.include?(params[:sort]) ? params[:sort] : "balance"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:balance, :customerName, :nickname, :expirationDate, :accountStatus, :expiredAccount, :simcardNumber, :phoneNumber)
    end
end
