class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  validates :menu_label, :slug, uniqueness: true, presence: true
  validates :h1, :description, :title, :priority, presence: true
end
