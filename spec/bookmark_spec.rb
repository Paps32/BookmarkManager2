# frozen_string_literal: true

require 'bookmark'
require 'database_helpers'

describe '.all' do
  it 'returns list of bookmarks' do
    conn = PG.connect(dbname: 'bookmark_manager_test')

     bookmark = Bookmark.create(url: "http://www.makers.tech", title: "Makers")
     Bookmark.create(url: "http://www.google.com", title: "Google")
     Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All")

    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers'
    expect(bookmarks.first.url).to eq 'http://www.makers.tech'
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Facebook'
      expect(bookmark.url).to eq 'http://www.facebook.com'
    end
  end
end
