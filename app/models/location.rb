class Location < ActiveRecord::Base
  attr_accessible :code, :name

  has_many :patients
  accepts_nested_attributes_for :patients

  validates :name, presence: true, length: { maximum: 80 }
  validates :code, length: { maximum: 10 }


end
