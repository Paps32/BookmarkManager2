# frozen_string_literal: true

require 'pg'

# List of bookmarks in the database
class Bookmark

attr_reader :id, :title, :url

def initialize(id:, title:, url:)
  @id = id
  @title = title
  @url = url
end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end

    result = conn.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  end
end

  def self.create(url:, title:)
    
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
       conn = PG.connect(dbname: 'bookmark_manager')
    end
     result = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
     Bookmark.new(id: result [0]['id'], url: result [0]['url'], title: result [0]['title'])
   end
end
