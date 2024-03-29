class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  has_one_attached :group_image

  validates :name, presence: true
  validates :introduction, presence: true

  def get_group_image
    (group_image.attached?) ? group_image : 'no_image.jpg'
  end


end
