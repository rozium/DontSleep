:- dynamic(lokasi_sekarang/1).
:- dynamic(lock/2).

%----------------------------------------------------------------------
%-------------------------%BAGIAN 1: INISIALISASI----------------------
%----------------------------------------------------------------------
	lock('pin', terkunci).
	lock('rantai', terkunci).
	lock('gembok', terkunci).
	lock('password', terkunci).

%----------------------------------------------------------------------


/*LIST LOKASI BENDA*/
	/*Lantai 1*/
	terletak(['papan tulis'], 'kelas 1A').
	terletak(['papan tulis'], 'kelas 1B').
	terletak(['papan tulis'], 'lobby').
	terletak(['papan tulis'], 'ruang guru').
	terletak(['papan tulis'], 'tata usaha').
	terletak([], 'gudang').
	terletak([], 'wc pria bawah').
	terletak([], 'wc wanita bawah').
	terletak([], 'tempat parkir').
	terletak([], 'halaman').

	/*Lantai 2*/
	terletak(['papan tulis'], 'kelas 2B').
	terletak(['papan tulis'], 'kelas 2A').
	terletak(['papan tulis'], 'kelas 3').
	terletak(['papan tulis'], 'perpustakaan').
	terletak([], 'laboratorium').
	terletak([], 'multimedia').
	terletak([], 'wc pria atas').
	terletak([], 'wc wanita bawah').
	terletak([], 'koridor atas').

	/*Lantai 3*/
	terletak([], 'roof top').

%----------------------------------------------------------------------
%LANTAI1
	jalan(lobby, u, ['koridor atas']).
	jalan(lobby, n, ['ruang kepala sekolah']).
	jalan(lobby, w, ['koridor bawah']).
	jalan(lobby, e, ['ruang guru']).
	jalan(lobby, s, ['halaman']).
	jalan(lobby, d, []).

	jalan('koridor bawah', u, []).
	jalan('koridor bawah', n, ['wc pria bawah', 'wc wanita bawah', 'tata usaha']).
	jalan('koridor bawah', s, ['kelas 1A', 'kelas 1B']).
	jalan('koridor bawah', w, ['parkiran']).
	jalan('koridor bawah', e, ['lobby']).
	jalan('koridor bawah', d, []).

	jalan('parkiran', u, []).
	jalan('parkiran', n, []).
	jalan('parkiran', w, []).
	jalan('parkiran', e, ['koridor bawah']).
	jalan('parkiran', s, []).
	jalan('parkiran', d, []).

	jalan('kelas 1B', u, []).
	jalan('kelas 1B', n, ['koridor bawah']).
	jalan('kelas 1B', w, []).
	jalan('kelas 1B', e, []).
	jalan('kelas 1B', s, []).
	jalan('kelas 1B', d, []).

	jalan('halaman', u, []).
	jalan('halaman', n, ['lobby']).
	jalan('halaman', w, []).
	jalan('halaman', e, []).
	jalan('halaman', s, ['exit']).
	jalan('halaman', d, []).

%----------------------------------------------------------------------
%-------------------------%BAGIAN 2: BADAN GAME------------------------
%----------------------------------------------------------------------

lokasi_sekarang('halaman').
isi_tas([]).

start:-
	persiapan_game,
	write('Narasi.....'), nl, nl,
	instructions, nl,
	repeat,
		write('Command: '), read(X),
		do(X), nl,
	X == quit.

	/* Sinonim */
	
	do(n) :- n, !.
	do(s) :- s, !.
	do(w) :- w, !.
	do(e) :- e, !.
	do(u) :- u, !.
	do(d) :- d, !.
	do(utara) :- n, !.
	do(selatan) :- s, !.
	do(barat) :- w, !.
	do(timur) :- e, !.
	do(atas) :- u, !.
	do(bawah) :- d, !.

	do(help) :- instructions, !.
	do(instruksi) :- instructions, !.
	do(map(X)) :- map(X), !.
	do(peta(X)) :- map(X), !.
	
	do(unlock(X)) :- unlock(X),!.
	do(look) :- lihat_sekitar, !.
	do(lihat_sekitar) :- lihat_sekitar, !.
	do(quit).
	do(_) :-
		write('Perintah tidak valid!'), nl.	

persiapan_game:-
	retract(lokasi_sekarang(X)),
	asserta(lokasi_sekarang('lobby')).

%----------------------------------------------------------------------
%-------------------------%BAGIAN 3: RULES DAN FUNGSI------------------
%----------------------------------------------------------------------

instructions:-
	write('Berikut instruksi yang dapat dilakukan:'),nl,
	write('start.							-- untuk memulai permainan.'), nl,
	write('n. s. e. w. u. d.					-- untuk berpindah dari satu tempat ke tempat lainnya.'), nl,
	write('take(Object)	!					-- untuk mengambil Objek.'), nl,
	write('drop(Object)	!					-- untuk mengeluarkan dan menaruh Objek dari ransel.'), nl,
	write('use(Object)	!					-- untuk menggunakan Objek.'), nl,
	write('talk(Object)	!					-- untuk berbicara dengan Objek.'), nl,
	write('periksa(Objek).					-- melihat suatu benda dengan lebih detail.'),nl,
	write('gabungkan(Objek1, Objek2).		-- menggabungkan dua benda yang ada di di tas (jika bisa).'),nl,
	write('bongkar(objek).					-- membongkar suatu objek menjadi bagian lebih kecil (jika bisa).'),nl,
	write('hint.							-- memberi makanan kucing ke kucing misterius untuk mendapatkan hint.'),nl,
	write('peta(nomor lantai).				-- menampilkan peta sekolah pada lantai tertentu.'),nl,
	write('stat(Object)	!					-- untuk menampilkan atribut Objek.'), nl,
	write('stat.							-- untuk menampilkan atribut player.'), nl,
	write('menyerah.							-- untuk mengakhiri permainan dan menampilkan status akhir player.'), nl,
	write('look.							-- untuk melihat apa saja yang ada di ruangan saat ini dan mencari tahu lokasi mana yang dapat dituju.'), nl,
	write('instructions.						-- untuk menampilkan instruksi-instruksi yang dapat dilakukan.'), nl,
	write('save(Filename).						-- untuk menyimpan status permainan.'), nl,
	write('load(Filename).						-- untuk memuat status permainan yang pernah disimpan.'), nl,
	write('quit.							-- untuk keluar dari permainan.'), nl,
	nl,
	lihat_sekitar.

%-------------------------------------------------------------------------------------------------
	
	puzzle('exit'):-
		lock('pin', terbuka),
		lock('rantai', terbuka),
		lock('gembok', terbuka),
		lock('password', terbuka).
	puzzle(_).

%-------------------------------------------------------------------------------------------------

/* MAP */
peta(1) :-
	write('                                                        1ST FLOOR.'), nl,
	write('|----------------------------------------------------------------|'), nl,
	write('|       |  WC  |  WC  | GUDANG | Tata |  Ruang  | Tangga |       |'), nl,
	write('|       | PRIA |WANITA|       [] Usaha|  Kepsek |        |       |'), nl,
	write('|       |--[]-----[]--------------[]-------[]-------[]---|       |'), nl,
	write('|       |                             |                  |       |'), nl,
	write('|   P   []        KORIDOR BAWAH       []                 | Ruang |'), nl,
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

peta(2) :-
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

peta(3) :-
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
peta(_) :-
	write('Tidak ada peta untuk tempat itu...'), nl.

%-------------------------------------------------------------------------------------------------
%LIHAT_SEKITAR

lihat_sekitar:-
	lokasi_sekarang(X),
	write('Saat ini ada di: '), nl,
	tab(2),write(X),nl,
	write('Di sini ada: '),nl,
	daftar_objek(X),
	write('Dari sini bisa ke: '),nl.
	

daftar_objek(X):-
	terletak(List, X),
	tulis_list(List).

daftar_tujuan(X,Arah):-
	jalan(X, Arah,List),
	tulis_list(List).
	
tulis_list([]).
tulis_list([H|T]):-
	tab(2), write(H), nl,
	tulis_list(T).



%---------------------------------------------------------------------
%NAVIGASI

n:- pindah_ke(n).
  %s ada di paling bawah.
w:- pindah_ke(w).
e:- pindah_ke(e).
u:- pindah_ke(u).
d:- pindah_ke(d).

pindah_ke(Arah):-
	lokasi_sekarang(X),
	jalan(X, Arah, List),
	write('Kamu bisa ke:'),nl,
	tulis_list(List),
	write('Pilih mau ke mana: '), read(Input),
	input_tujuan(Input, Arah).

input_tujuan(Input, Arah):-
	lokasi_sekarang(X),
	jalan(X, Arah, List),
	isMember(Input,List),
	(puzzle(X) ->
	retract(lokasi_sekarang(X)),
	asserta(lokasi_sekarang(Input)),
	lihat_sekitar).
input_tujuan(batal,_):-
	write('Tidak jadi pergi...'),nl.
input_tujuan(Input, Arah):-
	write('Tidak bisa ke sana...'),nl,
	write('Coba lagi (input batal jika tidak jadi):  '), read(X),
	input_tujuan(X, Arah).

isMember(X,[X|T]).
isMember(X,[H|T]):-
	isMember(X,T).


%-------------------------------------------------------------------------------------------------


/*MEMBUKA KUNCI GERBANG*/
unlock(X):-
	lock(X, Y),
	X == pin,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terkunci,
	write('masukkan pin (masukkan leave untuk keluar): '), read(Answer),
	input_pin(Answer).
unlock(X):-
	lock(X, Y),
	X == pin,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terbuka,
	write('PIN sudah benar...'),nl.

unlock(X):-
	lock(X, Y),
	X == password,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terkunci,
	write('masukkan password (masukkan leave untuk keluar): '), read(Answer),
	input_pass(Answer).
unlock(X):-
	lock(X, Y),
	X == password,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terbuka,
	write('Password sudah dijawab...'),nl.


	input_pin(X):-
		X == 527,
		write('Kunci terbuka!'),nl,
		retract(lock(pin, terkunci)),
		asserta(lock(pin, terbuka)).
	input_pin(X):-
		X == leave,
		write('Meninggalkan kunci...'),nl.
	input_pin(_):-
		write('Kombinasi salah...'),nl,
		write('Coba lagi: '), read(Z),
		input_pin(Z).

	input_pass(X):-
		X == umumum,
		write('Kunci terbuka!'),nl,
		retract(lock(pass, terkunci)),
		asserta(lock(pass, terbuka)).
	input_pass(leave):-
		X == leave,
		write('Meninggalkan kunci...'),nl.
	input_pass(_):-
		write('Password salah...'),nl,
		write('Coba lagi: '), read(Z),
		input_pin(Z).
%----------------------------------------------------------------------
s:- pindah_ke(s).

/*
	Referensi:
		http://www.amzi.com/AdventureInProlog/a1start.php

*/	
