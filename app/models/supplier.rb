class Supplier < ApplicationRecord
  has_one :address, as: :addressable, dependent: :destroy
  has_one :contact, as: :contactable, dependent: :destroy
  has_many :products

  accepts_nested_attributes_for :contact

  validates :name, presence: true
  validates_associated :contact

  scope :name_contains, -> (name) { where "name like ?", "%#{name}%" }
  scope :name_starts_with, -> (name) { where "name like ?", "#{name}%" }
end
