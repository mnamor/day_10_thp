#library who is need by your programme
require 'google_drive'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
#define a fonction for show a list od website
def getwebsite()
	page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))
	session = GoogleDrive::Session.from_config("config.json")
	ws = session.spreadsheet_by_key("1v7XEnpGDtgjgRom3bp7OwzaK99zlUQIfKuW3QdawXBc").worksheets[0]
	cities = ""
	i = 1
	#define a loop for list of emails
	page.css('a.lientxt').each do |town|
		site = "https://annuaire-des-mairies.com" + town['href'][1..-1]
		cities = town.text
		ws[(i), 1] = cities
		ws[(i), 2] = getemail(site)
		i += 1
	end
	ws.save
end
#define fonction for show email
def getemail (adresse)
	page = Nokogiri::HTML(open(adresse))
	return page.css('td.style27 p.Style22 font')[6].text
end
#call th fonction get website
getwebsite()
