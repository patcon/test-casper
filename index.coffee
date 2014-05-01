links = []
casper_data =
  verbose: true
  logLevel: "debug"
  pageSettings:
    loadImages: false
    loadPlugins: false
    userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4"

casper = require('casper').create casper_data
x = require('casper').selectXPath
system = require('system')

casper.on "remote.message", (msg) ->
  @echo "remote message caught: #{msg}"

casper.on "page.error", (msg, trace) ->
  @echo "Page Error: #{msg}", "ERROR"

url = "https://www.google.com/accounts/ServiceLogin?service=oz&passive=1209600&continue=https://plus.google.com/b/110591317655791133884/hangouts"

casper.start url, ->
  login_form_selector = "form[action='https://accounts.google.com/ServiceLoginAuth']"

  login_form_data =
    Email: system.env.GOOGLE_EMAIL
    Passwd: system.env.GOOGLE_PASSWORD

  @fill login_form_selector, login_form_data, submit=true

casper.then ->
  @waitForSelector "div[guidedhelpid='streamcontent']", ->
    @captureSelector "image1.png", x("//*[normalize-space()='Start a Hangout On Air']")

casper.then ->
  @click x("//*[normalize-space()='Start a Hangout On Air']")

casper.then ->
  #@waitForSelector "div[guidedhelpid='sharebox']", ->
  @wait 1000, ->
    @capture "image2.png"

casper.run()
