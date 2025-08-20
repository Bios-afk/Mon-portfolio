require "notion_ruby_client"

class NotionService
  def initialize
    @client = NotionRubyClient::Client.new(token: ENV["NOTION_API_KEY"])
  end

  def fetch_projects
    response = @client.database_query(database_id: ENV["NOTION_DATABASE_ID"])
    response["results"].map do |row|
      {
        name: row["properties"]["Nom"]["title"].first["plain_text"],
        description: row["properties"]["Description"]["rich_text"].first["plain_text"],
        technologies: row["properties"]["Technologies"]["multi_select"].map { |t| t["name"] },
        link: row["properties"]["Lien"]["url"],
        image: row["properties"]["Image"]["files"].first["file"]["url"]
      }
    end
  end
end
