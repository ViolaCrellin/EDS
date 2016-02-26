class Unemployment


  include DataMapper::Resource

  belongs_to :stats
  
  property :id, Serial
  property :unemployment_rate, Float
  property :unemployment_thousands, Float
  property :claimant_count_thousands, Float

end
