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
				{city_id:1,instansi:'Sekertariat'}, 
				{city_id:1,instansi:'Dinas'},  
				{city_id:1,instansi:'Bagian'}, 
				{city_id:1,instansi:'Badan'},
				{city_id:1,instansi:'Kecamatan'},
				{city_id:1,instansi:'Kelurahan'}])
#
Tingkat.create([{tingkat: 'walikota'},{tingkat: 'wakil walikota'},{tingkat: 'sekda'},{tingkat: 'asisten'},{tingkat: 'staf ahli'},{tingkat: 'dinas'},{tingkat: 'staf dinas'},{tingkat: 'staf biasa'},{tingkat: 'honorer'}])


Skp.create([skp: 'Disiplin'])
Kinerja.create([skp_id: 1, kinerja: 'Disposisi'])
Spd.create([{spd: 'Pimpinan Kota',instansi_id: 1, alamat: '-', no_tlp:'-',status:1},
			{spd: 'Dinas Kominfo',instansi_id: 2, alamat: '-', no_tlp:'-',status:1},
			{spd: 'Dinas Perijinan',instansi_id: 2, alamat: '-', no_tlp:'-',status:1},

			{spd: 'Bagian TUP',instansi_id: 3, alamat: '-', no_tlp:'-',status:1},
			{spd: 'Bagian Hukum',instansi_id: 3, alamat: '-', no_tlp:'-',status:1},
			{spd: 'BPBD',instansi_id: 4, alamat: '-', no_tlp:'-',status:1},

			{spd: 'Kecamatan Madidir',instansi_id: 5, alamat: '-', no_tlp:'-',status:1},
			{spd: 'Kelurahan Girian Indah',instansi_id: 6, alamat: '-', no_tlp:'-',status:1}])


Hak.create([{tingkat_id:1 , hak: 2},
			{tingkat_id:1 , hak: 3 },
			{tingkat_id:1 , hak: 4 },
			{tingkat_id:1 , hak: 5 },
			{tingkat_id:1 , hak: 6 },

			{tingkat_id:2 , hak: 3 },
			{tingkat_id:2 , hak: 4 },
			{tingkat_id:2 , hak: 5 },
			{tingkat_id:2 , hak: 6 },

			{tingkat_id:3 , hak: 4 },
			{tingkat_id:3 , hak: 5 },
			{tingkat_id:3 , hak: 6 },

			{tingkat_id:4 , hak: 5 },
			{tingkat_id:4 , hak: 6 },

			{tingkat_id:5 , hak: 6 },

			{tingkat_id:6 , hak: 7 },
			{tingkat_id:6 , hak: 8 },
			{tingkat_id:6 , hak: 9 },

			{tingkat_id:7 , hak: 8 },
			{tingkat_id:7 , hak: 9 }

			])


Jabatan.create([{instansi_id: 1, city_id: 1, tingkat_id:1, jabatan: 'Walikota'},
				{instansi_id: 1, city_id: 1, tingkat_id:2, jabatan: 'Wakil Walikota'},
				{instansi_id: 1, city_id: 1, tingkat_id:3, jabatan: 'Sekertaris Kota'},

				{instansi_id: 1, city_id: 1, tingkat_id:4, jabatan: 'Asisten I'},
				{instansi_id: 1, city_id: 1, tingkat_id:4, jabatan: 'Asisten II'},
				{instansi_id: 1, city_id: 1, tingkat_id:4, jabatan: 'Asisten III'},
				{instansi_id: 1, city_id: 1, tingkat_id:5, jabatan: 'Staf Ahli'},

				{instansi_id: 2, city_id: 1, tingkat_id:6, jabatan: 'Kepala Dinas'},
				{instansi_id: 2, city_id: 1, tingkat_id:7, jabatan: 'sek'},
				{instansi_id: 2, city_id: 1, tingkat_id:8, jabatan: 'Staf'},
				{instansi_id: 2, city_id: 1, tingkat_id:9, jabatan: 'Thl'},

				{instansi_id: 3, city_id: 1, tingkat_id:6, jabatan: 'Kepala Bagian'},
				{instansi_id: 3, city_id: 1, tingkat_id:7, jabatan: 'kasubag'},
				{instansi_id: 3, city_id: 1, tingkat_id:8, jabatan: 'Staf'},
				{instansi_id: 3, city_id: 1, tingkat_id:9, jabatan: 'Thl'},
				
				{instansi_id: 4, city_id: 1, tingkat_id:6, jabatan: 'Kepala Badan'},
				{instansi_id: 4, city_id: 1, tingkat_id:7, jabatan: 'wakil/sek'},
				{instansi_id: 4, city_id: 1, tingkat_id:8, jabatan: 'Staf'},
				{instansi_id: 4, city_id: 1, tingkat_id:9, jabatan: 'Thl'},

				{instansi_id: 5, city_id: 1, tingkat_id:6, jabatan: 'Camat'},
				{instansi_id: 5, city_id: 1, tingkat_id:7, jabatan: 'sek'},
				{instansi_id: 5, city_id: 1, tingkat_id:8, jabatan: 'Staf'},
				{instansi_id: 5, city_id: 1, tingkat_id:9, jabatan: 'Thl'},

				{instansi_id: 6, city_id: 1, tingkat_id:6, jabatan: 'Lurah'},
				{instansi_id: 6, city_id: 1, tingkat_id:7, jabatan: 'sek'},
				{instansi_id: 6, city_id: 1, tingkat_id:8, jabatan: 'Staf '},
				{instansi_id: 6, city_id: 1, tingkat_id:9, jabatan: 'Thl'



				}])

Eselon.create([{eselon:'I'},{eselon: 'II'},{eselon: 'III'},{eselon: 'IV'},{eselon: 'Non Asn'}])

User.create([spd_id: 1,jabatan_id: 1, eselon_id: 3,city_id: 1, tingkat_id:1, fb: '9999',token: '9999888',nama: 'harun umar',hp: '08529841994'])
