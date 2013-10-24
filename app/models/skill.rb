class Skill < ActiveRecord::Base
  attr_accessible :primary_skill, :skills, :commitment_level, :interests, :status, :category, :search_keywords
  belongs_to :user

  validates :primary_skill, presence: true
  validates :commitment_level, presence: true
  validates :interests, presence: true
  validates :category, presence: true

end
