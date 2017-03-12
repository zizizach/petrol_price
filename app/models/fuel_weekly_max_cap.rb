class FuelWeeklyMaxCap < ApplicationRecord
  monetize :max_ron_95_price_cents, :max_ron_97_price_cents, :max_diesel_price_cents
end
