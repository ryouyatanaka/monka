require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "scope visible" do
    let(:show_book) { Book.create(title: 'New Ruby3.0', author: 'Matz', published_on: Time.zone.now, showing: true) }
    let(:hide_book) { Book.create(title: 'New Ruby2.0', author: 'Matz', published_on: 1.year.ago, showing: false) }
    
    it { expect(Book.visible).to include show_book }
    it { expect(Book.visible).not_to include hide_book }
  end
end