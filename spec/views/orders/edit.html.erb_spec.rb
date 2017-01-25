require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :shipping_address => "MyString",
      :user => nil
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_shipping_address[name=?]", "order[shipping_address]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"
    end
  end
end
