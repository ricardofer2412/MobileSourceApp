class BalancesController < ApplicationController
  def index

  end
  def show
  end
  def get_balance

    require 'watir'
    require 'nokogiri'
    require 'open-uri'
    require 'selenium-webdriver'

      sim_card_number = params[:sim_number]

        username = "29629"
        password = "1234"

        #get phone number
        #open Browser
        browser = Watir::Browser.new :chrome

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
        sleep(2)
        balance = browser.element(:xpath, "//*[@id='fcard_bal']").text
        expiration = browser.element(:xpath, "//*[@id='exp']").text
        account_plan = browser.element(:xpath, "//*[@id='plan']").text
        account_notes = browser.element(:xpath, "//*[@id='note']").text
        puts balance
        sleep(1)
        #collect Data
        @sim_number = sim_card_number
        @balance = balance
        @expiration = expiration
        @account_plan = account_plan
        @account_notes = account_
        notes
        #Update Account
        browser.close
        redirect_to balances_path and return

  end
end
