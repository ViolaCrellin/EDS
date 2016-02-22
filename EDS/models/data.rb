
class Data

include DataMapper::Resource

  property :id, Serial
  property :year, Integer
  property :gov, Text
  property :RPI_inflation_percentage_change, Float
  property :CPI_inflation_percentage_change, Float
  property :GDP_per_head, Float
  property :GDP_millions, Float
  property :GDP_q_on_q, Float
  property :total_gov_income_millions, Float
  property :household_spending_millions, Float
  property :household_saving_ratio, Float
  property :household_disposable_income_inflation_adjusted_sterling, Float
  property :unemployment_rate, Float
  property :unemployment_thousands, Float
  property :claimant_count_thousands, Float
  property :balance_of_payment_millions, Float
  property :public_sector_borrowing_millions, Float
  property :net_national_debt_billions, Float
  property :net_national_debt_as_perc_of_gdp, Float
  property :net_national_inc_intervention, Float
  property :net_national_exc_intervention, Float
  property :house_price_index, Float
  property :mean_av_house_price, Float
  property :mean_av_house_price_ldn, Float

end
