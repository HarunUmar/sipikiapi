class City < ApplicationRecord
  belongs_to :provinsi
  has_many :instansi
end
