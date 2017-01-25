# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('db/tags.csv', headers: :first_row) do |row|
    tag = Tag.find_or_create_by(name: row['name'])
end

CSV.foreach('db/books.csv', headers: :first_row) do |row|
    book    = Book.find_or_create_by(title: row['title'], author: row['author'], price: row['price'])
    book.published_on = Date.parse(row['published_on'])
    book.save

    unless row['tag_name1'].blank?
        tag = Tag.where(name: row['tag_name1']).first
        tagging = Tagging.find_or_create_by(book_id: book.id, tag_id: tag.id)
    end

    unless row['tag_name2'].blank?
        tag = Tag.where(name: row['tag_name2']).first
        tagging = Tagging.find_or_create_by(book_id: book.id, tag_id: tag.id)
    end
end

CSV.foreach('db/musics.csv',headers: :first_row) do |row|
    music    = Music.find_or_create_by(title: row['title'], author: row['author'], price: row['price'], play_time: row['play_time'], showing: row['showing'])
    music.published_on = Date.parse(row['published_on'])
    music.save
end

admin = User.where(email: 'test@example.com')
unless admin.present?
    User.create(name: 'Admin', email: 'test@examle.com', password: 'monka_project', password_confirmation: 'monka_project')
end
