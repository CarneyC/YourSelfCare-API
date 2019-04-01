class Provider < ApplicationRecord
  belongs_to :user, optional: true
  has_many :departments, :dependent => :destroy
  accepts_nested_attributes_for :departments

  validates_presence_of :name, :address, :phone, :first_visit, :notes

  def make_title_case
    self.name = self.name.titlecase
    self.address = self.address.titlecase
  end
end
