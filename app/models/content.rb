class Content < ApplicationRecord
  validates :title, presence: true 
  validates :body, presence: true 
  validates :summary, presence: true
  validates_uniqueness_of :slug
  belongs_to :author,class_name: 'User'
end