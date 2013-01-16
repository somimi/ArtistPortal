class Fee < ActiveRecord::Base
  has_and_belongs_to_many :order_items

  validates_presence_of :name, :amount
  validates_uniqueness_of :name
end
