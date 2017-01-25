require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:admin_user) { User.all.first }
  before(:each) { sign_in admin_user }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
