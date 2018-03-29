class Provinsi < ApplicationRecord
	has_many :city ,autosave: true, dependent: :destroy
end
