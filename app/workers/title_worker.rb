class TitleWorker
  include Sidekiq::Worker

  def perform(link_id)
    link = Link.find(link_id)
    agent = Mechanize.new
    page = agent.get(link.full_url)
    link.title = page.title
    link.save
  end
end
