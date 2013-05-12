class GenerateMap
  @queue = :snippets_queue # Required
  
  # Required for resque
  #
  # To procrastinate your work do this 
  #    Resque.enqueue(GenerateMap)
  # 
  #
  def self.perform(map_id)
    `rake generate:map`
  end
end