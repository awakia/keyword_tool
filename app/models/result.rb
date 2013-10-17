class Result < ActiveRecord::Base
  def uri=(uri)
    self.host = Result.get_host(uri)
    self[:uri] = uri
  end

  def self.of(query)
    results = Result.where(keyword: query).order('"results.index" ASC').to_a
    if results.blank?
      results = Result.search(query)
    end
    results
  end

  def self.search(query)
    search_results = Google::Search::Web.new do |search|
      search.query = query
      search.size = :large
      search.language = :ja
    end
    search_results.map do |web|
      result = Result.where(keyword: query, index: web.index).first_or_initialize
      result.uri = web.uri
      result.visible_uri = web.visible_uri
      result.title = web.title
      result.snippet = web.content
      result.save!
      result
    end
  end

  UNSAFE_URL = /[^\-_.!~*'()a-zA-Z\d;\/?:@&=+$,]/  # URL::UNSAFE - '\[\]'
  def self.get_host(uri)
    begin
      result = URI.parse(URI.escape(uri, UNSAFE_URL)).host
    rescue URI::InvalidURIError
      result = 'INVALID_URI'
    end
    result
  end
end
