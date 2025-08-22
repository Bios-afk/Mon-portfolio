require "notion_ruby_client"

class NotionService
  def initialize
    @client = Notion::Client.new(token: ENV["NOTION_API_KEY"])
  end

  def fetch_projects
    response = @client.database_query(database_id: ENV["NOTION_DATABASE_ID"])
    response["results"].map do |row|
      {
        status: row["properties"]["Status"]["status"]["name"].present? ? row["properties"]["Status"]["status"]["name"] : "",
        name: row["properties"]["Nom"]["title"].first["plain_text"],
        description: row["properties"]["Description"]["rich_text"].map { |text| text["plain_text"] }.join(" "),
        technologies: row["properties"]["Technologies"]["multi_select"].present? ? map { |t| t["name"] } : [],
        link: row["properties"]["Lien"]["url"].present? ? row["properties"]["Lien"]["url"] : nil,
        image: row["properties"]["Image"]["url"].present? ? row["properties"]["Image"]["url"] : nil
      }
    end
  end
end
