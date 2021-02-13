class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: "category_id"
  belongs_to :category, class_name: "Category", optional: true

  scope :only_categories, -> {where category_id: nil}
  scope :only_subcategories, -> {where.not category_id: nil}
end
