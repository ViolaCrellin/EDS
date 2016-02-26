class Household

  include DataMapper::Resource

  belongs_to :stats

  property :id, Serial
  property :household_spending_millions, Float
  property :household_saving_ratio, Float
  property :household_disposable_income_inflation_adjusted_sterling, Float

end
