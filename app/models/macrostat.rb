class Macrostat

  include DataMapper::Resource

  belongs_to :stats

  property :id, Serial

  property :RPI_inflation_percentage_change, Float
  property :CPI_inflation_percentage_change, Float
  property :GDP_per_head, Float
  property :GDP_millions, Float
  property :GDP_q_on_q, Float
  property :total_gov_income_millions, Float


end
