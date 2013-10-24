class Project < ActiveRecord::Base
  attr_accessible :title, :tagline, :category, :description, :role_needed, :role_details, :commitment_level, :status, :search_keywords
  belongs_to :user

  validates :title, presence: true
  validates :tagline, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :role_needed, presence: true
  validates :role_details, presence: true
  validates :commitment_level, presence: true

end
