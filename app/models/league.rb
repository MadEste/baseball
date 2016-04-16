class League < ActiveRecord::Base
	require 'open-uri'
	has_many :teams, :dependent => :destroy
	validates :leagueID, length: {is: 6}, numericality: true
	validate :valid_league, on: :create
	after_create :scrape_teams

	protected

	def valid_league
		url = "http://games.espn.go.com/flb/leaguerosters?leagueId=#{CGI.escape(leagueID)}"
		doc = Nokogiri::HTML(open(url))
		if doc.at_xpath("//*[@id='content']/div/div[2]/div[1]/a[3]").nil?
			errors.add(:leagueID, "League Does Not Exist!")
		end
	end

	def scrape_teams
		url = "http://games.espn.go.com/flb/leaguerosters?leagueId=#{CGI.escape(leagueID)}"
		doc = Nokogiri::HTML(open(url))
		#league Name
		update_attribute(:title, doc.at_xpath("//*[@id='content']/div/div[2]/div[1]/a[3]").text)
		doc.css(".playerTableTable.tableBody").each do |team|
			#Team Name
			self.teams.create(:title => team.at_css(".playertableSectionHeader a").text)
		end
	end
end
