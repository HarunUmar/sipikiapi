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
Instansi.create([{city_id:1,instansi:'Sekertariat'}, {city_id:1,instansi:'Dinas'}, {city_id:1,instansi: 'Bagian'}, {city_id:1,instansi:'Badan'}])
#


Skp.create([skp: 'Disiplin'])
Kinerja.create([kinerja: 'Disposisi'])
Spd.create([spd: 'Dinas Komunikasi dan Informatika',instansi_id: 4, alamat: 'manembo-nembo', no_tlp:'0852',status:1])
Jabatan.create([instansi_id: 2, city_id: 1, jabatan: 'Kepala Dinas'])

Eselon.create([{eselon:1},{eselon:2},{eselon:3},{eselon:4}])
User.create([spd_id: 1,jabatan_id: 1, eselon_id: 3,city_id: 1,fb: '9999',token: '9999888',nama: 'harun umar',hp: '08529841994'])
