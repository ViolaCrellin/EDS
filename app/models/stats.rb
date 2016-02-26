
class Stats

include DataMapper::Resource

  property :id, Serial
  property :year, Integer
  property :gov, Text


  has 1, :debt
  has 1, :household
  has 1, :unemployment

  has 1, :macrostat

end
