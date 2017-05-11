class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:tags)
  validates :name, presence: true
  validates(:name, {:presence => true, :length => { :maximum => 50 }})

end
