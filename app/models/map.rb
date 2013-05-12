class Map < ActiveRecord::Base
  validates :name, :presence => true
  attr_accessible :name
  # After Save
  after_create :generate_map
  
  private
  
  def generate_map
    Resque.enqueue(GenerateMap) # self.perform
  end
end