class Fuel < ApplicationRecord
    monetize :ron_95_price_cents, :ron_97_price_cents, :diesel_price_cents
end
