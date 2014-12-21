class Offer < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: %i(negotiating close), default: :negotiating

  belongs_to :item
  belongs_to :user

end
