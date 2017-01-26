class Order < ApplicationRecord
  include AASM
  enum status: { order_accepted: 0, paid: 1, delivered: 2 }

  enum column: :status do
    state :order_accepted, initial: true
    state :paid
    state :delivered

    event :confirm_payment do
      transitions form: :order_accepted, to: :paid
    end

    event :deliver do
      transitions form: :paid, to: :delivered
    end
  end

  belongs_to :user
  has_one :order_detail
  after_commit :send_order_mail, on: :create

  def checkout(product_id)
    build_order_detail(product_id: product_id)
    save!
  end

  private

  def send_order_mail
    OrderMailer.completed_mail(self).deliver
  end
end
