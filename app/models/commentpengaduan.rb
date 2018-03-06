class Commentpengaduan < ApplicationRecord
  belongs_to :pengaduan
  belongs_to :user
end
