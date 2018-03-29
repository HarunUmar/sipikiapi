class ProvinsiSerializer < ActiveModel::Serializer

  attributes :id,:provinsi,:status
  has_many :city
  


  def city

  	custum_ess = []

  	object.city.each do |ess|
  		custum_es = ess.attributes
  		custum_es[:instansi] = ess.instansi
  	    custum_es[:spd] = ess.instansi.collect{|spd| spd.slice(:id,:spd)}
  	    custum_es[:jabatan] = ess.instansi.collect{|spd| spd.slice(:id,:jabatan)}

   custum_ess.push(custum_es)

  	end

  	return custum_ess
  end



end