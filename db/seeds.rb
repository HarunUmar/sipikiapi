# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
harun = User.where(name: Faker::Name.name).create
olan  = User.where(name: Faker::Name.name).create

2.times do 
	post = harun.posts.create(
		title: [Faker::Hacker.adjective, Faker::Hacker.noun].join('').titleize,
		body: Faker::Hacker.say_something_smart
		)
	post.comments.create(body: Faker::Hipster.sentence, user: olan)

end

=end

Provinsi.create([provinsi: 'Sulawesi Utara'])
City.create([provinsi_id: 1, city: 'Bitung'])

Instansi.create([ 
				{city_id:1,instansi:'Pimpinan Kota'}, 
				{city_id:1,instansi:'Sekertariat Daerah'}, 
				{city_id:1,instansi:'Sekertariat Dewan'},
				{city_id:1,instansi:'Inspektorat'},  
				{city_id:1,instansi:'Dinas'}, 
				{city_id:1,instansi:'Badan'},
				{city_id:1,instansi:'Kecamatan'}])



Skp.create([skp: 'Disiplin'])
Kinerja.create([skp_id: 1, kinerja: 'Disposisi'])



Spd.create([
			{spd: 'Pemkot',instansi_id: 1, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Asisten I',instansi_id: 2, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Asisten II',instansi_id: 2, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Asisten III',instansi_id: 2, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Sekertariat Dewan',instansi_id: 3, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Inspektorat',instansi_id: 4, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Kominfo',instansi_id: 5, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Bpbd',instansi_id: 6, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Kecamatan Madidir',instansi_id: 7, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1}
			])





Eselon.create([{eselon:'I'},{eselon: 'II'},{eselon: 'III'},{eselon: 'IV'},{eselon: 'Non Asn'}])

