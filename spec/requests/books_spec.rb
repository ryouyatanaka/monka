require 'rails_helper'

let(:admin_user) { User.all.first }
before(:each) { sign_in admin_user }

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "works! (now write some real specs)" do
      get books_path
      expect(response).to have_http_status(200)
    end
  end
end
