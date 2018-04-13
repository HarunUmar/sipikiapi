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
				{city_id:1,instansi:'Sekertariat'}, 
				{city_id:1,instansi:'Badan'},
				{city_id:1,instansi:'Dinas'},  
				{city_id:1,instansi:'Bagian'}, 
				{city_id:1,instansi:'Kecamatan'},
				{city_id:1,instansi:'Kelurahan'},
				{city_id:1,instansi:'BUMD'}])
#
Tingkat.create([{tingkat: 'admin'},
				{tingkat: 'walikota'},
				{tingkat: 'wakil walikota'},
				{tingkat: 'sekda'},
				{tingkat: 'asisten'},
				{tingkat: 'staf ahli'},
				{tingkat: 'dinas'},
				{tingkat: 'staf dinas'},
				{tingkat: 'staf biasa'},
				{tingkat: 'honorer'}])

Skp.create([skp: 'Disiplin'])
Kinerja.create([skp_id: 1, kinerja: 'Disposisi'])

Spd.create([
			{spd: 'Pimpinan Kota',instansi_id: 1, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Sekertariat',instansi_id: 2, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Diskominfo',instansi_id: 4, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Disnaker',instansi_id: 4, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'TUP',instansi_id: 5, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Bagian Organisasi',instansi_id: 3, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'BPBD',instansi_id: 3, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Kec Maesa',instansi_id: 6, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Kel Madidir',instansi_id: 7, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1},
			{spd: 'Pdam',instansi_id: 8, alamat: '-', lat: '-' , lang: '-', no_tlp:'-',status:1}]
			)


Hak.create([
			{tingkat_id:1 , hak: 2},
			{tingkat_id:1 , hak: 3},
			{tingkat_id:1 , hak: 4},
			{tingkat_id:1 , hak: 5},
			{tingkat_id:1 , hak: 6},
			{tingkat_id:1 , hak: 7},
			{tingkat_id:1 , hak: 8},
			{tingkat_id:1 , hak: 9},
			{tingkat_id:1 , hak: 10},

			{tingkat_id:2 , hak: 3},
			{tingkat_id:2 , hak: 4 },
			{tingkat_id:2 , hak: 5 },
			{tingkat_id:2 , hak: 6 },
			{tingkat_id:2 , hak: 7 },

			{tingkat_id:3 , hak: 4 },
			{tingkat_id:3 , hak: 5 },
			{tingkat_id:3 , hak: 6 },
			{tingkat_id:3 , hak: 7 },

			{tingkat_id:4 , hak: 5 },
			{tingkat_id:4 , hak: 6 },
			{tingkat_id:4 , hak: 7 },

			{tingkat_id:5 , hak: 6 },
			{tingkat_id:5 , hak: 7 },

			{tingkat_id:6 , hak: 7 },
			{tingkat_id:7 , hak: 8 },
			{tingkat_id:7 , hak: 9 },
			{tingkat_id:7 , hak: 10 },

			{tingkat_id:8 , hak: 9 },
			{tingkat_id:8 , hak: 10 }

			])


Jabatan.create([
				{instansi_id: 2, city_id: 1, tingkat_id:1, jabatan: 'Administrator'},
				{instansi_id: 1, city_id: 1, tingkat_id:2, jabatan: 'Walikota'},
				{instansi_id: 1, city_id: 1, tingkat_id:3, jabatan: 'Wakil Walikota'},
				{instansi_id: 1, city_id: 1, tingkat_id:4, jabatan: 'Sekertaris Kota'},

				{instansi_id: 2, city_id: 1, tingkat_id:5, jabatan: 'Asisten I'},
				{instansi_id: 2, city_id: 1, tingkat_id:5, jabatan: 'Asisten II'},
				{instansi_id: 2, city_id: 1, tingkat_id:5, jabatan: 'Asisten III'},
				{instansi_id: 2, city_id: 1, tingkat_id:6, jabatan: 'Staf Ahli'},

				{instansi_id: 3, city_id: 1, tingkat_id:7, jabatan: 'Kepala Dinas'},
				{instansi_id: 3, city_id: 1, tingkat_id:8, jabatan: 'sek'},
				{instansi_id: 3, city_id: 1, tingkat_id:9, jabatan: 'Staf'},
				{instansi_id: 3, city_id: 1, tingkat_id:10, jabatan: 'Thl'},

				{instansi_id: 4, city_id: 1, tingkat_id:7, jabatan: 'Kepala Bagian'},
				{instansi_id: 4, city_id: 1, tingkat_id:8, jabatan: 'kasubag'},
				{instansi_id: 4, city_id: 1, tingkat_id:9, jabatan: 'Staf'},
				{instansi_id: 4, city_id: 1, tingkat_id:10, jabatan: 'Thl'},
				
				{instansi_id: 5, city_id: 1, tingkat_id:7, jabatan: 'Kepala Badan'},
				{instansi_id: 5, city_id: 1, tingkat_id:9, jabatan: 'wakil/sek'},
				{instansi_id: 5, city_id: 1, tingkat_id:9, jabatan: 'Staf'},
				{instansi_id: 5, city_id: 1, tingkat_id:10, jabatan: 'Thl'},

				{instansi_id: 6, city_id: 1, tingkat_id:7, jabatan: 'Camat'},
				{instansi_id: 6, city_id: 1, tingkat_id:8, jabatan: 'sek'},
				{instansi_id: 6, city_id: 1, tingkat_id:9, jabatan: 'Staf'},
				{instansi_id: 6, city_id: 1, tingkat_id:10, jabatan: 'Thl'},

				{instansi_id: 7, city_id: 1, tingkat_id:7, jabatan: 'Lurah'},
				{instansi_id: 7, city_id: 1, tingkat_id:8, jabatan: 'sek'},
				{instansi_id: 7, city_id: 1, tingkat_id:9, jabatan: 'Staf '},
				{instansi_id: 7, city_id: 1, tingkat_id:10, jabatan: 'Thl'},

				{instansi_id: 8, city_id: 1, tingkat_id:7, jabatan: 'Kepala/Dirut'},
				{instansi_id: 8, city_id: 1, tingkat_id:8, jabatan: 'sek'},
				{instansi_id: 8, city_id: 1, tingkat_id:9, jabatan: 'Staf '},
				{instansi_id: 8, city_id: 1, tingkat_id:10, jabatan: 'Honorer'}

				])

Eselon.create([{eselon:'I'},{eselon: 'II'},{eselon: 'III'},{eselon: 'IV'},{eselon: 'Non Asn'}])

#walkota /wakil /sekda
User.create([spd_id: 1,jabatan_id: 4, eselon_id: 1,city_id: 1, tingkat_id:4, fb: '100000474098464',token: '9999888',nama: 'DR Audy Pangemanan, M.SI',hp: '08529841994'])
#admin
User.create([spd_id: 2,jabatan_id: 1, eselon_id: 3,city_id: 1, tingkat_id:1, fb: '100000000666307',token: '9999888',nama: 'Rizal',hp: '08529841994'])

User.create([spd_id: 3,jabatan_id: 9, eselon_id: 2,city_id: 1, tingkat_id:7, fb: '100000140065832',token: '9999888',nama: 'bily pusung',hp: '08529841994'])
User.create([spd_id: 3,jabatan_id: 11, eselon_id: 2,city_id: 1, tingkat_id:9, fb: '100000140065832',token: '9999888',nama: 'rolan pesik',hp: '08529841994'])


User.create([spd_id: 5,jabatan_id: 13, eselon_id: 2,city_id: 1, tingkat_id:7, fb: '100000568947569',token: '9999888',nama: 'sintia',hp: '08529841994'])

User.create([spd_id: 9,jabatan_id: 25, eselon_id: 4,city_id: 1, tingkat_id:7, fb: '100000957906450',token: '9999888',nama: 'marmud',hp: '08529841994'])
