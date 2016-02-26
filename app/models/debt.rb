class Debt

  include DataMapper::Resource

  belongs_to :stats

  property :id, Serial
  property :balance_of_payment_millions, Float
  property :public_sector_borrowing_millions, Float
  property :net_national_debt_billions, Float
  property :net_national_debt_as_perc_of_gdp, Float
  property :net_national_inc_intervention, Float
  property :net_national_exc_intervention, Float

end
