class UserDisposisiSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :nilai, :status
  belongs_to :disposisi
end
