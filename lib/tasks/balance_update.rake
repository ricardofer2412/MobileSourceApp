 desc "Fetch Balance"

 task :fetch_balance_empty => :environment  do
   require 'watir'
   require 'nokogiri'
   require 'open-uri'
   require 'selenium-webdriver'

       Account.where(balance: [nil, ""]).each do |account|

       # Credentials
       username = "29629"
       password = "1234"

       #Get SimCards
       #active

       phoneNumber = account.phoneNumber

       #open Browser
       browser = Watir::Browser.new :phantomjs

       browser.goto  "https://www.h2odealer.com/mainCtrl.php?page=DbBalance"
       #enter Credentials

       browser.text_field(:name => "dc").set username
       browser.text_field(:type => "password").set password
       browser.input(:type => "image").click


       #get DbBalance
       browser.option(:value => "GSM").click
       browser.text_field(:id => "txtMDN").set phoneNumber
       browser.image(:src => "images/db/bt_submit.png").click


       sleep(1)
       #collect Data
       balance = browser.element(:xpath, "//*[@id='fcard_bal']").text
       expiration = browser.element(:xpath, "//*[@id='exp']").text

       #Update Account
       account.update_attribute(:balance, balance)
       account.update_attribute(:expirationDate, expiration)
       sleep(1)
       browser.close



     end
   end

   task :fetch_balance_all => :environment  do
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

         #Update Account
         account.update_attribute(:balance, balance)
         account.update_attribute(:expirationDate, expiration)
         sleep(1)
         browser.close



       end
   end
