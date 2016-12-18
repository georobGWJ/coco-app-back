require 'nokogiri'
require 'open-uri'

class DisneyScraper

  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def get_class_items(class)
    data.css(class)
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

end
