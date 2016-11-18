:- dynamic(here/1).
:- dynamic(have/1).
:- dynamic(location/2).



/*Nama lokasi*/	
	/*Lantai 1*/
	room('halaman').
	room('lapangan olahraga').
	room('tempat parkir').
		room('tempat sampah').
	room('koridor lantai 1 timur').
	room('koridor lantai 1 barat').
	room('wc pria lantai 1').
	room('wc wanita lantai 1').
	room('kelas 1A').
	room('kelas 1B').
	room('tata usaha').
		room(gudang).
	room('ruang kepala sekolah').
	room(lobby).
	room('ruang guru').

	/*Lantai 2*/
	room('koridor lantai 2').
	room(perpustakaan).
	room('kelas 2A').
	room('kelas 2B').
	room('kelas 3').
	room('wc pria lantai 2').
	room('wc wanita lantai 2').
	room('lab. IPA').
	room('ruang multimedia').

	/*Genteng*/
	room('roof top').

/*Koneksi ruangan*/
/*Lantai 1*/
	door(lobby, 'ruang guru').
	door(lobby, 'ruang kepala sekolah').
	door(lobby, 'halaman').
	door(lobby, 'koridor lantai 1 timur').

	door('koridor lantai 1 timur', 'kelas 1B').
	door('koridor lantai 1 timur', 'tata usaha').
		door('tata usaha', 'gudang').
	door('koridor lantai 1 timur', 'koridor lantai 1 barat').
	
	door('koridor lantai 1 barat', 'kelas 1A').
	door('koridor lantai 1 barat', 'wc pria lantai 1').
	door('koridor lantai 1 barat', 'wc wanita lantai 1').
	door('koridor lantai 1 barat', 'tempat parkir').
		door('tempat parkir', 'lapangan olahraga').
		door('tempat parkir', 'tempat sampah').
			door('lapangan olahraga', 'halaman depan').

/*Lantai 2*/
	door('kelas 2A','koridor lantai 2').
	door('kelas 3','koridor lantai 2').
	door('kelas 2B','koridor lantai 2').
	door(perpustakaan,'koridor lantai 2').
	door('wc pria lantai 2','koridor lantai 2').
	door('wc wanita lantai 2','koridor lantai 2').
	door('ruang multimedia','koridor lantai 2').
	door('lab. IPA','koridor lantai 2').


/*Lantai 1 - Lantai 2*/
	door('koridor lantai 2', lobby).

/*Lantai 2 - Roof Top*/
	door('koridor lantai 2','roof top').

/* Membuat koneksi ruangan dua arah */
	connection(X,Y) :- door(X,Y).
	connection(X,Y) :- door(Y,X).		

	lock('PIN', terkunci).
	lock('rantai', terkunci).
	lock('gembok', terkunci).
	lock('password', terkunci).

/* MAP */
map1 :-
	write('                                                        1ST FLOOR.'), nl,
	write('|----------------------------------------------------------------|'), nl,
	write('|       |  WC  |  WC  | Gudang [] TU  |  Ruang  | Tangga |       |'), nl,
	write('|       | PRIA |WANITA|        |      |  Kepsek |        |       |'), nl,
	write('|       |--[]-----[]------[]------[]-------[]-------[]---|       |'), nl,
	write('|       |                             |                  |       |'), nl,
	write('|   P   []            HALL            []                 | Ruang |'), nl,
	write('|   A   |                             |       LOBBY      | Guru  |'), nl,
	write('|   R   |------[]--------------[]-----|                  |       |'), nl,
	write('|   K   |               |             |                 []       |'), nl,
	write('|   I   |   KELAS 1A    |   KELAS 1B  |                  |       |'), nl,
	write('|   R   |--------------------------------------------[]----------|'), nl,
	write('|   A   |                                                        |'), nl,
	write('|   N   |                                                        |'), nl,
	write('|       |                      HALAMAN                           |'), nl,
	write('|       |                                                        |'), nl,
	write('|       |                                                        |'), nl,
	write('|       |                                                        |'), nl,
	write('|------------------------------------------------------------[]--|'), nl.

map2 :-
	write('                                                        2ND FLOOR.'), nl,
	write('|----------------------------------------------------------------|'), nl,
	write('|  WC  |  WC  |      Ruang     |  Laboratorium  | Tangga |       |'), nl,
	write('| PRIA |WANITA|    Multimedia  |      KIMIA     |        |       |'), nl,
	write('|-[]-----[]----------------[]----------------[]-----[]---|   P   |'), nl,
	write('|                                                        |   E   |'), nl,
	write('|                          HALL                          []  R   |'), nl,
	write('|                                                        |   P   |'), nl,
	write('|-[]-------------------[]----------------[]--------------|   U   |'), nl,
	write('|                    |                 |                 |   S   |'), nl,
	write('|      KELAS 3       |    KELAS 2A     |    KELAS 2B     |       |'), nl,
	write('|----------------------------------------------------------------|'), nl.

map3 :-
	write('                                                         ROOF TOP.'), nl,
	write('|----------------------------------------------------------------|'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                            ROOF TOP                            |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|----------------------------------------------------------------|'), nl.
	
/*Membukan kunci gerbang*/

/*PIN*/

unlock(X) :-
	here(Y),
	Y = 'halaman',
	X = 'password',
	lock(X,terkunci),
	repeat,
		write('Masukkan password (diakhiri "."): '), read(A),
		test_password(A).

unlock(X) :-
	here(Y),
	Y = 'halaman',
	X = 'PIN',
	lock(X,terkunci),
	repeat,
		write('Masukkan PIN 3 angka (tanpa spasi diakhiri "."): '), read_line_to_codes(A,Z),
		test_pin(Z).


	test_password('umumum'):-
		write('Wah terbuka!'), nl,
		/*Mengubah nilai terkunci*/
		!.
	test_password(_) :-
		write('sayang sekali, passwordnya salah :( '), nl,
		write('Coba lagi? (y./n.)'), read(Input),
		coba_lagi(Input).	
	

	test_pin(527):-
		write('Wah terbuka!'), nl,
		/*Mengubah nilai terkunci*/
		!.
	test_pin(_) :-
		write('sepertinya kombinasi salah...'), nl,
		write('Coba lagi?(y./n.): '), read(Input),
		coba_lagi(Input).

coba_lagi(y):-
	fail, !.
coba_lagi(n).

/*Lokasi benda*/
list_lokasi(['papan tulis'], 'kelas 1A').
list_lokasi(['papan tulis'], 'kelas 1B').
list_lokasi(['papan tulis'], 'kelas 2A').
list_lokasi(['papan tulis'], 'kelas 2B').
list_lokasi(['papan tulis'], 'kelas 3').
list_lokasi(['papan tulis'], 'lobby').
list_lokasi(['papan tulis'], 'tata usaha').
list_lokasi(['papan tulis'], 'ruang guru').
list_lokasi(['papan tulis'], 'perpustakaan').
list_lokasi(['papan tulis'], 'tempat parkir').

list_lokasi(['PIN'], 'halaman').
list_lokasi(['panel kode'], 'halaman').

list_lokasi(['DVD 1'], 'kelas 1A').
list_lokasi(['DVD 2'], 'tempat sampah').
list_lokasi(['DVD 3'], 'laci').

list_lokasi(['meja'], 'gudang').

list_lokasi([laptop], 'ruang multimedia').

examine('papan tulis'):-
	here(X),
	X = 'kelas 2B',
	nl,	write('Di papan tulis ada tulisan "LOBBY".'), nl,
	!.

examine('papan tulis'):-
	here(X),
	X = 'lobby',
	nl, write('Di papan tulis ada tulisan "TU".'), nl,
	!.

examine('papan tulis'):-
	here(X),
	X = 'tata usaha',
	write('Di papan tulis ada tulisan "HALAMAN".'), nl,
	!.



/*Objek game
	objek(nama, berat, tag).
*/
	objek('papan tulis', 2, kombinasi).
	objek('kunci 2', 2, kombinasi).
	objek('laptop', 1, password).


/*Fungsi-fungsi penting*/
start:-
	write('Narasi.....'), nl, nl,
	instructions, nl,
	repeat,
		write('Command: '), read(X),
		do(X), nl,
	X = end.

instructions:-
	write('Berikut instruksi yang dapat dilakukan:'),nl,
	write('start.							-- untuk memulai permainan.'), nl,
	write('n. s. e. w. u. d.					-- untuk berpindah dari satu tempat ke tempat lainnya.'), nl,
	write('take(Object)						-- untuk mengambil Objek.'), nl,
	write('drop(Object)						-- untuk mengeluarkan dan menaruh Objek dari ransel.'), nl,
	write('use(Object)						-- untuk menggunakan Objek.'), nl,
	write('talk(Object)						-- untuk berbicara dengan Objek.'), nl,
	write('stat(Object)						-- untuk menampilkan atribut Objek.'), nl,
	write('stat.							-- untuk menampilkan atribut player.'), nl,
	write('giveup.							-- untuk mengakhiri permainan dan menampilkan status akhir player.'), nl,
	write('look.							-- untuk melihat apa saja yang ada di ruangan saat ini dan mencari tahu lokasi mana yang dapat dituju.'), nl,
	write('instructions.						-- untuk menampilkan instruksi-instruksi yang dapat dilakukan.'), nl,
	write('save(Filename).						-- untuk menyimpan status permainan.'), nl,
	write('load(Filename).						-- untuk memuat status permainan yang pernah disimpan.'), nl,
	write('quit.							-- untuk keluar dari permainan.'), nl,
	here(X),
	write('Saat ini anda berada di '), write(X),nl.


/*Membuat list barang yang ada di suatu tempat DAN menghasilkan TRUE*/
	list_things(Place):-
		location(X, Place),
		tab(2),
		write(X),
		nl,
		fail.
	list_things(_).

/* Lokasi saat ini */
	here('halaman').
	inventory([]).

	goto(Place):-
		can_go(Place),
		move(Place),
		look.

	can_go(Place):-
		here(X),
		connection(X,Place).

	can_go(Place):-
		write('You can''t get there frome here.'),nl,
		fail.

	move(Place):-
		retract(here(X)),
		asserta(here(Place)).

	look :-
		here(Place),
		write('You are in the: '), write(Place), nl,
		write('You can see: '), nl,
		list_things(Place),
		write('You can go to: '), nl,
		list_connections(Place).

	list_connections(Place) :-
		connection(Place,X),
		tab(2),
		write(X),nl,
		fail.
	list_connections(_).	

/* Sinonim */
	do(go(X)) :- goto(X),!.
	do(go(_)) :- !.
	do(unlock(X)) :- unlock(X),!.
	do(look) :- look, !.
	do(quit).
	do(use(X)) :- use(X),!.
	do(_) :-
		write('Perintah tidak valid!').	

/*
	Referensi:
		http://www.amzi.com/AdventureInProlog/a1start.php

*/	
