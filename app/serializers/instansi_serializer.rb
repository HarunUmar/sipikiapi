class InstansiSerializer < ActiveModel::Serializer
  attributes :id, :instansi, :status
  belongs_to :city
  has_many  :spd




  def spd

  	custum_ess = []

  	object.spd.each do |ess|
  		custum_es = ess.attributes
  		custum_es[:spd] = ess.spd

 

   custum_ess.push(custum_es)

  	end
  	return custum_ess
  end


end
