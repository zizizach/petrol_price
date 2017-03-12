class Fuel < ApplicationRecord
  monetize :ron_95_price_cents, :ron_97_price_cents, :diesel_price_cents

  validates :state, :area, :brand, presence: true

  scope :all_field, (lambda do |query|
    query.present? ? where('area like ? OR state like ? or brand like ?',
      "%#{query}%", "%#{query}%", "%#{query}%") : all
  end)

  scope :ron_95, -> { where.not(ron_95_price_cents: 0).order(ron_95_price_cents: :asc).first }
  scope :ron_97, -> { where.not(ron_97_price_cents: 0).order(ron_97_price_cents: :asc).first }
  scope :diesel, -> { where.not(diesel_price_cents: 0).order(diesel_price_cents: :asc).first }

  scope :this_week, -> { where('created_at > ?', DateTime.current.beginning_of_week + 6) }

  def self.search(params)
    query = all
    query = query.this_week
    query = query.all_field(params[:query])
    query
  end
end
