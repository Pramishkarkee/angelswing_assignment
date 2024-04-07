class Content < ApplicationRecord
  validates :title, presence: true 
  validates :body, presence: true 
  validates :summary, presence: true
  validates_uniqueness_of :slug
  belongs_to :author,class_name: 'User'
  before_save :format_text

  private

  def format_text
    self.slug = slug.downcase.tr(' ', '-')
  end
end