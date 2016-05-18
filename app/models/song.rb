class Song  < ActiveRecord::Base

  belongs_to :album

  validates :artist, presence: true, length: {maximum: 50}
  validates :name, presence: true 


end
