class Offer < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: %i(negotiating close), default: :negotiating

  belongs_to :item
  belongs_to :user

  has_many :comments

  def comment(body, writer)
    comment = comments.build(body: body, user_id: writer.id)
  end
end
