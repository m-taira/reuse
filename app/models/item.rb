class Item < ActiveRecord::Base

  scope :all_taken, ->{where(classification: :taken)}
  scope :all_given, ->{where(classification: :given)}

  extend Enumerize

  # sample code
  # enumerize :sex, in: {male: 1, female: 2}

  enumerize :classification, in: %i(given taken)
  enumerize :status, in: %i(open negtiating close), default: :open

  mount_uploader :image1, ItemImageUploader
  mount_uploader :image2, ItemImageUploader
  mount_uploader :image3, ItemImageUploader

  has_many :offers

  def offered?(user)
    !!offer(user)
  end

  def offer(user)
    return nil unless user

    id = user.kind_of?(Numeric) ? user : user.id

    offers.find_by(user_id: id)
  end
end
