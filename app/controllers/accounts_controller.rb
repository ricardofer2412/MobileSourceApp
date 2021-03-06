 class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]


  # GET /accounts
  # GET /accounts.json
  helper_method :sort_column, :sort_direction
  def index
    @accounts = Account.order("#{sort_column} #{sort_direction}").search(params[:search])
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  def fetch_account

    @account = Account.find(params[:id])
    sim_card_number =  @account.sim_card_number

    #open Browser
    browser = Watir::Browser.new :phantomjs
    browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbEquip"

    #Login
    browser.text_field(:name => "dc").set username
    browser.text_field(:type => "password").set password
    browser.input(:type => "image").click

    #Get SimNumber
    browser.option(:value => "GSM").click
    browser.text_field(:id => "gsm_mdn_sim").set sim_card_number
    browser.image(:src => "images/db/bt_submit.png").click

    sleep (10)

    if browser.element(:xpath, "//*[@id='rep_error_note']").text == "Cancelled"
      phoneNumber = browser.element(:xpath, "//*[@id='rep_error_mdn']").text
      account_status =  browser.element(:xpath, "//*[@id='rep_error_note']").text
    else
      phoneNumber = browser.element(:xpath, "//*[@id='rep_gsm_mdn']").text
      account_status = browser.element(:xpath, "//*[@id='rep_gsm_mdn_status']").text
    end
    sleep(1)

    @account.update_attribute(:account_status, account_status)
    @account.update_attribute(:phoneNumber, phoneNumber)
    browser.close

  redirect_to accounts_path and return
  end


  def fetch_single_balance

    require 'watir'
    require 'nokogiri'
    require 'open-uri'
    require 'selenium-webdriver'

      @account = Account.find(params[:id])

      sim_card_number = @account.sim_card_number
      phoneNumber = @account.phoneNumber


        # Credentials
        username = "29629"
        password = "1234"

        #get phone number
        if phoneNumber == nil
        #open Browser
        browser = Watir::Browser.new :phantomjs

        browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbEquip"

        #Login
        browser.text_field(:name => "dc").set username
        browser.text_field(:type => "password").set password
        browser.input(:type => "image").click

        #Get SimNumber
        browser.option(:value => "GSM").click
        browser.text_field(:id => "gsm_mdn_sim").set sim_card_number
        browser.image(:src => "images/db/bt_submit.png").click

        sleep (8)

        if browser.element(:xpath, "//*[@id='rep_error_note']").text == "Cancelled"
          phoneNumber = browser.element(:xpath, "//*[@id='rep_error_mdn']").text
          account_status =  browser.element(:xpath, "//*[@id='rep_error_note']").text
        else
          phoneNumber = browser.element(:xpath, "//*[@id='rep_gsm_mdn']").text
          account_status = browser.element(:xpath, "//*[@id='rep_gsm_mdn_status']").text
        end
        sleep(1)



        browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbBalance"

        #Login

        #get DbBalance
        browser.option(:value => "GSM").click
        browser.text_field(:id => "txtMDN").set phoneNumber
        browser.image(:src => "images/db/bt_submit.png").click



        sleep(1)
        #collect Data
        balance = browser.element(:xpath, "//*[@id='fcard_bal']").text
        expiration = browser.element(:xpath, "//*[@id='exp']").text
        account_plan = browser.element(:xpath, "//*[@id='plan']").text
        account_notes = browser.element(:xpath, "//*[@id='note']").text
        #Update Account
        @account.update_attribute(:balance, balance)
        @account.update_attribute(:expiration_date, expiration)
        @account.update_attribute(:account_status, account_status)
        @account.update_attribute(:phoneNumber, phoneNumber)
        @account.update_attribute(:account_plan, account_plan)
        @account.update_attribute(:account_notes, account_notes)
        sleep(1)

        browser.close

        redirect_to accounts_path and return

      else

          browser = Watir::Browser.new :phantomjs
          browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbBalance"

          #Login
          browser.text_field(:name => "dc").set username
          browser.text_field(:type => "password").set password
          browser.input(:type => "image").click
          sleep(1)
          #get DbBalance
          browser.option(:value => "GSM").click
          browser.text_field(:id => "txtMDN").set phoneNumber
          browser.image(:src => "images/db/bt_submit.png").click


          sleep(1)
          #collect Data
          balance = browser.element(:xpath, "//*[@id='fcard_bal']").text
          expiration = browser.element(:xpath, "//*[@id='exp']").text
          account_plan = browser.element(:xpath, "//*[@id='plan']").text
          account_notes = browser.element(:xpath, "//*[@id='note']").text
          #Update Account
          @account.update_attribute(:balance, balance)
          @account.update_attribute(:expiration_date, expiration)
          @account.update_attribute(:account_status, account_status)
          @account.update_attribute(:phoneNumber, phoneNumber)
          @account.update_attribute(:account_plan, account_plan)
          @account.update_attribute(:account_notes, account_notes)

          sleep(1)
          browser.close

          redirect_to accounts_path and return
        end
  end

  def fetch_all_balance

    require 'watir'
    require 'nokogiri'
    require 'open-uri'
    require 'selenium-webdriver'

    Account.all.each do |account|

        # Credentials
        username = "29629"
        password = "1234"

        #get phone number
        phoneNumber = account.phoneNumber
        #open Browser
        browser = Watir::Browser.new :phantomjs
        browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbEquip"

        #Login
        browser.text_field(:name => "dc").set username
        browser.text_field(:type => "password").set password
        browser.input(:type => "image").click

        sleep(1)
        browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbBalance"

        #get DbBalance
        browser.option(:value => "GSM").click
        browser.text_field(:id => "txtMDN").set phoneNumber
        browser.image(:src => "images/db/bt_submit.png").click


        sleep(1)
        #collect Data
        balance = browser.element(:xpath, "//*[@id='fcard_bal']").text
        expiration = browser.element(:xpath, "//*[@id='exp']").text
        account_plan = browser.element(:xpath, "//*[@id='plan']").text
        account_notes = browser.element(:xpath, "//*[@id='note']").text
        #Update Account
        @account.update_attribute(:balance, balance)
        @account.update_attribute(:expiration_date, expiration)
        @account.update_attribute(:account_status, account_status)
        @account.update_attribute(:phoneNumber, phoneNumber)
        @account.update_attribute(:account_plan, account_plan)
        @account.update_attribute(:account_notes, account_notes)

        sleep(1)
        browser.close



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
    def sortable_columns
      ["customer_name", "balance", "account_status", "expiration_date", "updated_at"]
    end
    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "updated_at"

    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:balance, :customer_name,:account_notes, :nickname, :expiration_date, :account_status, :expiredAccount, :sim_card_number, :phoneNumber)
    end
end
