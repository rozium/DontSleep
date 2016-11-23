
:- dynamic(lokasi_sekarang/1).
:- dynamic(lock/2).
:- dynamic(isi_tas/1).
:- dynamic(terletak/2).
:- dynamic(pemain/2).
:- dynamic(langkah/1).
:- dynamic(score/1).
:- dynamic(gabungan/2).

%----------------------------------------------------------------------
%-------------------------%BAGIAN 1: INISIALISASI----------------------
%----------------------------------------------------------------------
	lock('pin', terkunci).
	lock('rantai', terkunci).
	lock('gembok', terkunci).
	lock('password', terkunci).

%----------------------------------------------------------------------
%Berat barang; biar ga bisa diambil semua.
bisa_diambil('papan tulis', tidak).
bisa_diambil('tempat sampah', tidak).
bisa_diambil('meja', tidak).

bisa_diambil('DVD 1', bisa).
bisa_diambil('DVD 2', bisa).
bisa_diambil('DVD 3', bisa).
bisa_diambil('laptop', bisa).
%----------------------------------------------------------------------
%NPC NPC NPC
npc(kucing, 'kelas 1B').
bicara(kucing):-
	lokasi_sekarang('kelas 1B'),
	score(Score),
	Score = 0,
	write('Apakah kamu masih malas-malasan? Kamu belum membuka satupun'),nl,
	write('dari 4 kunci! Atau kau memang murid yang bodoh? kekeke...'),nl,nl.

bicara(kucing):-
	lokasi_sekarang('kelas 1B'),
	score(Score),
	Score = 1,
	write('Jadi kau sudah membuka salah satu kunci? Selamat, kau satu '),nl,
	write('langkah menuju kebebasan, kekeke...'),nl,nl.

bicara(kucing):-
	lokasi_sekarang('kelas 1B'),
	score(Score),
	Score = 2,
	write('Kau sudah setengah jalan! Lumayan juga untuk murid sepertimu kekeke!'),nl,nl.

bicara(kucing):-
	lokasi_sekarang('kelas 1B'),
	score(Score),
	Score = 3,
	write('Satu lagi... Tinggal satu lagi...'),nl, nl.

bicara(kucing):-
	lokasi_sekarang('kelas 1B'),
	score(Score),
	Score = 4,
	write('Jadi kau sudah membuka semua kunci... tunggu apa lagi? cepat pergi...'),nl,nl.

%----------------------------------------------------------------------


/*LIST LOKASI BENDA*/
	/*Lantai 1*/
	terletak(['papan tulis', 'DVD 1'], 'kelas 1A').
	terletak(['papan tulis'], 'kelas 1B').
	terletak(['papan tulis'], 'lobby').
	terletak(['papan tulis'], 'ruang guru').
	terletak(['papan tulis'], 'tata usaha').
	terletak([meja], 'gudang').
		terletak([laci], meja).
			terletak(['DVD 3'], laci).
	terletak([], 'ruang kepala sekolah').
	terletak([], 'wc pria bawah').
	terletak([], 'wc wanita bawah').
	terletak(['tempat sampah'], 'parkiran').
		terletak(['DVD 2'], 'tempat sampah').
	terletak([], 'halaman').
	terletak([], 'koridor bawah').

	/*Lantai 2*/
	terletak(['papan tulis'], 'kelas 2B').
	terletak(['papan tulis'], 'kelas 2A').
	terletak(['papan tulis'], 'kelas 3').
	terletak(['papan tulis'], 'perpustakaan').
	terletak([], 'laboratorium').
	terletak([laptop], 'multimedia').
	terletak([], 'wc pria atas').
	terletak([], 'wc wanita bawah').
	terletak([], 'koridor atas').
	terletak([], 'koridor atas').

	/*Lantai 3*/
	terletak([], 'roof top').

%----------------------------------------------------------------------
%LANTAI 1
	jalan(lobby, u, ['koridor atas']).
	jalan(lobby, n, ['ruang kepala sekolah']).
	jalan(lobby, w, ['koridor bawah']).
	jalan(lobby, e, ['ruang guru']).
	jalan(lobby, s, ['halaman']).
	jalan(lobby, d, []).

	jalan('exit', u, []).
	jalan('exit', n, []).
	jalan('exit', w, []).
	jalan('exit', e, []).
	jalan('exit', s, []).
	jalan('exit', d, []).

	jalan('ruang guru', u, []).
	jalan('ruang guru', n, []).
	jalan('ruang guru', w, [lobby]).
	jalan('ruang guru', e, []).
	jalan('ruang guru', s, []).
	jalan('ruang guru', d, []).

	jalan('ruang kepala sekolah', u, []).
	jalan('ruang kepala sekolah', n, []).
	jalan('ruang kepala sekolah', w, []).
	jalan('ruang kepala sekolah', e, []).
	jalan('ruang kepala sekolah', s, [lobby]).
	jalan('ruang kepala sekolah', d, []).

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

	jalan('kelas 1A', u, []).
	jalan('kelas 1A', n, ['koridor bawah']).
	jalan('kelas 1A', w, []).
	jalan('kelas 1A', e, []).
	jalan('kelas 1A', s, []).
	jalan('kelas 1A', d, []).

	jalan('halaman', u, []).
	jalan('halaman', n, ['lobby']).
	jalan('halaman', w, []).
	jalan('halaman', e, []).
	jalan('halaman', s, ['exit']).
	jalan('halaman', d, []).

	jalan('tata usaha', u, []).
	jalan('tata usaha', n, []).
	jalan('tata usaha', w, [gudang]).
	jalan('tata usaha', e, []).
	jalan('tata usaha', s, ['koridor bawah']).
	jalan('tata usaha', d, []).

	jalan('gudang', u, []).
	jalan('gudang', n, []).
	jalan('gudang', w, []).
	jalan('gudang', e, ['tata usaha']).
	jalan('gudang', s, []).
	jalan('gudang', d, []).

	jalan('wc pria bawah', u, []).
	jalan('wc pria bawah', n, []).
	jalan('wc pria bawah', w, []).
	jalan('wc pria bawah', e, []).
	jalan('wc pria bawah', s, ['koridor bawah']).
	jalan('wc pria bawah', d, []).

	jalan('wc wanita bawah', u, []).
	jalan('wc wanita bawah', n, []).
	jalan('wc wanita bawah', w, []).
	jalan('wc wanita bawah', e, []).
	jalan('wc wanita bawah', s, ['koridor bawah']).
	jalan('wc wanita bawah', d, []).

%lantai 2
	jalan('koridor atas', u, ['roof top']).
	jalan('koridor atas', n, ['wc pria atas', 'wc wanita atas', 'multimedia', laboratorium]).
	jalan('koridor atas', s, ['kelas 2A', 'kelas 2B', 'kelas 3']).
	jalan('koridor atas', w, []).
	jalan('koridor atas', e, ['perpustakaan']).
	jalan('koridor atas', d, ['lobby']).

	jalan('perpustakaan', u, []).
	jalan('perpustakaan', n, []).
	jalan('perpustakaan', w, ['koridor atas']).
	jalan('perpustakaan', e, []).
	jalan('perpustakaan', s, []).
	jalan('perpustakaan', d, []).

	jalan('laboratorium', u, []).
	jalan('laboratorium', n, []).
	jalan('laboratorium', w, []).
	jalan('laboratorium', e, []).
	jalan('laboratorium', s, ['koridor atas']).
	jalan('laboratorium', d, []).

	jalan('multimedia', u, []).
	jalan('multimedia', n, []).
	jalan('multimedia', w, []).
	jalan('multimedia', e, []).
	jalan('multimedia', s, ['koridor atas']).
	jalan('multimedia', d, []).

	jalan('gudang', u, []).
	jalan('gudang', n, []).
	jalan('gudang', w, []).
	jalan('gudang', e, ['tata usaha']).
	jalan('gudang', s, []).
	jalan('gudang', d, []).

	jalan('kelas 2B', u, []).
	jalan('kelas 2B', n, ['koridor atas']).
	jalan('kelas 2B', w, []).
	jalan('kelas 2B', e, []).
	jalan('kelas 2B', s, []).
	jalan('kelas 2B', d, []).

	jalan('kelas 2A', u, []).
	jalan('kelas 2A', n, ['koridor atas']).
	jalan('kelas 2A', w, []).
	jalan('kelas 2A', e, []).
	jalan('kelas 2A', s, []).
	jalan('kelas 2A', d, []).

	jalan('kelas 3', u, []).
	jalan('kelas 3', n, ['koridor atas']).
	jalan('kelas 3', w, []).
	jalan('kelas 3', e, []).
	jalan('kelas 3', s, []).
	jalan('kelas 3', d, []).

	jalan('wc pria atas', u, []).
	jalan('wc pria atas', n, []).
	jalan('wc pria atas', w, []).
	jalan('wc pria atas', e, []).
	jalan('wc pria atas', s, ['koridor atas']).
	jalan('wc pria atas', d, []).

	jalan('wc wanita atas', u, []).
	jalan('wc wanita atas', n, []).
	jalan('wc wanita atas', w, []).
	jalan('wc wanita atas', e, []).
	jalan('wc wanita atas', s, ['koridor atas']).
	jalan('wc wanita bawah', d, []).

%lantai 3
	jalan('roof top', u, []).
	jalan('roof top', n, []).
	jalan('roof top', w, []).
	jalan('roof top', e, []).
	jalan('roof top', s, []).
	jalan('roof top', d, ['koridor atas']).
%----------------------------------------------------------------------
%-------------------------%BAGIAN 2: BADAN GAME------------------------
%----------------------------------------------------------------------

lokasi_sekarang('halaman').
isi_tas([tes1, tes2]).
pemain(5,80).
langkah(100).
score(100).

gabungan(kosong, laptop).

new_game:-
	persiapan_game,
	write('Narasi.....'), nl, nl,
	instructions, nl,
	start.

start:-	
	lihat_sekitar,
	repeat,
		write('Command: '), read(X),
		do(X), nl,
	(X == quit ; X == menyerah ; bete; win).

	/* Sinonim */
	
	do(n) :- n, !.
	do(s) :- s, !.
	do(w) :- w, !, write('test'),nl.
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
	do(map(X)) :- peta(X), !.
	do(peta(X)) :- peta(X), !.
	do(lihat_tas) :- lihat_tas, !.
	do(inventory) :- lihat_tas, !.
	do(ambil(X)) :- ambil(X), !.
	do(periksa(X)) :- periksa(X),!.
	do(dekati(X)) :- dekati(X), !.
	do(kembali) :- kembali, !.
	do(stat) :- stat, !.
	do(status) :- stat, !.
	do(hint) :- minta_hint, !.
	do(minta_hint) :- minta_hint, !.
	do(menyerah) :- menyerah, !.
	do(bicara(X)) :- bicara(X), !.
	do(gabung(X,Y)) :- gabung(X,Y), !.
	do(gabungkan(X,Y)) :- gabung(X,Y), !.
	do(gunakan(X)) :- use(X), !.
	do(use(X)) :- use(X), !.
	do(jatuhkan(X)) :- drop(X), !.
	do(drop(X)) :- drop(X), !.
	do(save(X)) :- save(X), !.
	do(load(X)) :- load(X), !.
	do(bongkar(X)) :- bongkar(X), !.
	do(goto(X)) :- goto(X), !.

	do(unlock(X)) :- unlock(X),!.
	do(look) :- lihat_sekitar, !.
	do(lihat_sekitar) :- lihat_sekitar, !.
	do(quit).
	do(_) :-
		write('Perintah tidak valid!'), nl.	

persiapan_game:-
	retract(lokasi_sekarang(X)),
	asserta(lokasi_sekarang('gudang')),

	retract(isi_tas(List_tas)),
	asserta(isi_tas([])),

	retract(pemain(H,S)),
	asserta(pemain(2,0)),

	retract(langkah(Langkah)),
	asserta(langkah(0)),

	retract(score(Score)),
	asserta(score(0)),

	retract(lock(gembok, A1)),
	asserta(lock(gembok, terkunci)),

	retract(lock(pin, A2)),
	asserta(lock(pin, terkunci)),

	retract(lock(password, A3)),
	asserta(lock(password, terkunci)),

	retract(lock(rantai, A4)),
	asserta(lock(rantai, terkunci)),

	retract(gabungan(D, laptop)),
	asserta(gabungan(kosong, laptop)).

bete:-
	pemain(_,Stress),
	Stress == 100,
	write('Karena salah terus kamu jadi bete dan memutuskan untuk tinggal'), nl,
	write('saja di dimensi ini...'),nl,nl,
	write('GAME OVER...'),nl,nl.
win:-
	lokasi_sekarang(exit),
	write('Akhirnya kamu berhasil keluar dari dimensi ini!! Semoga kamu berpikir'),nl,
	write('dua kali sebelum tidur di kelas setelah ini!'),nl,nl.
%----------------------------------------------------------------------
%-------------------------%BAGIAN 3: RULES DAN FUNGSI------------------
%----------------------------------------------------------------------

instructions:-
	write('Berikut instruksi yang dapat dilakukan:'),nl,
	write('start.							-- untuk memulai permainan.'), nl,
	write('n. s. e. w. u. d.					-- untuk berpindah dari satu tempat ke tempat lainnya.'), nl,
	write('ambil(Object)					-- untuk mengambil Objek.'), nl,
	write('drop(Object)						-- untuk mengeluarkan dan menaruh Objek dari ransel.'), nl,
	write('use(Object)						-- untuk menggunakan Objek.'), nl,
	write('bicara(Object)						-- untuk berbicara dengan Objek.'), nl,
	write('periksa(Objek).					-- melihat suatu benda dengan lebih detail.'),nl,
	write('gabungkan(Objek1, Objek2).		-- menggabungkan dua benda yang ada di di tas (jika bisa).'),nl,
	write('bongkar(objek).			!		-- membongkar suatu objek menjadi bagian lebih kecil (jika bisa).'),nl,
	write('hint.							-- memberi makanan kucing ke kucing misterius untuk mendapatkan hint.'),nl,
	write('peta(nomor lantai).				-- menampilkan peta sekolah pada lantai tertentu.'),nl,
	write('stat.							-- untuk menampilkan atribut player.'), nl,
	write('menyerah.							-- untuk mengakhiri permainan dan menampilkan status akhir player.'), nl,
	write('lihat_sekitar.							-- untuk melihat apa saja yang ada di ruangan saat ini dan mencari tahu lokasi mana yang dapat dituju.'), nl,
	write('instructions.						-- untuk menampilkan instruksi-instruksi yang dapat dilakukan.'), nl,
	write('save(Filename).!						-- untuk menyimpan status permainan.'), nl,
	write('load(Filename).!						-- untuk memuat status permainan yang pernah disimpan.'), nl,
	write('quit.							-- untuk keluar dari permainan.'), nl,
	nl,
	lihat_sekitar.

%-------------------------------------------------------------------------------------------------
%SAVE LOAD SAVE LOAD
save(X):-
	write('Belum ada fitur ini...'),nl,nl.

load(X):-
	write('Belum ada fitur ini...'),nl,nl.

%-------------------------------------------------------------------------------------------------
%PERIKSA PERIKSA PERIKSA 

	periksa('papan tulis'):-
	lokasi_sekarang('kelas 1B'),
	nl,
	write('Di papan tertulis: '),nl,
	write('Kamu terjebak di dimensi ini karena tidur di kelas!'),nl,
	write('Cobalah cari jalan keluar... jika kamu memang tidak malas.'),nl,!.

	periksa('papan tulis'):-
		lokasi_sekarang('kelas 2B'),
		nl,
		write('Di papan tertulis: '),nl,
		write('LOBBY'),nl,!.

	periksa('papan tulis'):-
		lokasi_sekarang('lobby'),
		nl,
		write('Di papan tertulis: '),nl,
		write('TU'),nl,!.

	periksa('papan tulis'):-
		lokasi_sekarang('tata usaha'),
		nl,
		write('Di papan tertulis: '),nl,
		write('HALAMAN'),nl,!.

	periksa('papan tulis'):-
		lokasi_sekarang(X),
		terletak(List, X),
		isMember('papan tulis', List),
		nl,
		write('Di papan tidak tetulis apa-apa...'),nl,!.

	periksa('papan tulis'):-
		lokasi_sekarang(_),
		nl,
		write('Tidak ada papan tulis di sini.'),nl,nl,!.

	%di parkiran
	periksa('tempat sampah'):-
		lokasi_sekarang(parkiran),
		write('Ada tempat sampah warna hijau dengan lambang daur ulang.'),nl,
		write('Kamu tidak bisa melihat isinya dari sini...'),nl.
	periksa('tempat sampah'):-
		lokasi_sekarang('tempat sampah'),
		terletak(['DVD 2'], 'tempat sampah'),
		write('Di dalam tempat sampah ada sebuah DVD berlabel angka "2".'),nl,nl.
	periksa('tempat sampah'):-
		lokasi_sekarang('tempat sampah'),
		terletak([], 'tempat sampah'),
		write('Sudah tidak apa-apa di dalam tempat sampah.'),nl,nl.

	%di gudang
	periksa(meja):-
		lokasi_sekarang(X),
		X == gudang,
		write('Pada meja ada 1 LACI yang bisa dibuka.'),nl,nl.
	periksa(laci):-
		lokasi_sekarang(gudang),
		terletak(['DVD 3'], laci),
		write('Kamu membuka laci pada meja. Di dalamnya terdapat sebuah DVD berlabel"3".'),nl,
		write('"Sebaiknya kuambil saja DVD ini"'),nl,
		dekati('laci'),
		ambil('DVD 3'),
		kembali,nl.
	periksa(laci):-
		lokasi_sekarang(gudang),
		terletak([], laci),
		write('Sudah tidak ada apa-apa di laci'),nl,nl.
		
	periksa(kucing):-
		lokasi_sekarang('kelas 1B'),
		write('Kucing berwarna hitam terlihat sedang bersantai di atas meja guru...'),nl,
		write('"HEI! Jangan berani-berani pegang aku!"').

	periksa(_):-
		write('Tidak ada barang seperti itu di sini...'), nl.

		dekati(laci):-
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('laci')).

		kembali:-
			lokasi_sekarang('laci'),
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('gudang')).

		dekati('tempat sampah'):-
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('tempat sampah')),
			write('Kamu mendekati tempat sampah...'),nl,nl.

		kembali:-
			lokasi_sekarang('tempat sampah'),
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('parkiran')),
			write('Kamu kembali ke parkiran...'),nl,nl.


	
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
	daftar_npc(X),
	write('Dari sini bisa ke: '),nl,
	write('Utara 	: '), daftar_tujuan(X,n),nl,
	write('Selatan : '), daftar_tujuan(X,s),nl,
	write('Barat 	: '), daftar_tujuan(X,w),nl,
	write('Timur 	: '), daftar_tujuan(X,e),nl,
	write('Atas 	: '), daftar_tujuan(X,u),nl,
	write('Bawah 	: '), daftar_tujuan(X,d),nl.
	

daftar_objek(X):-
	terletak(List, X),
	tulis_list(List).

daftar_tujuan(X,Arah):-
	jalan(X, Arah,List),
	tulis_list_h(List).

daftar_npc(X):-
	npc(Nama, X),
	tab(2),write(Nama),nl,
	fail.	
daftar_npc(_).

tulis_list([]).
tulis_list([H|T]):-
	tab(2), write(H), nl,
	tulis_list(T).

tulis_list_h([]).
tulis_list_h([H|T]):-
	write(H), write(', '),
	tulis_list_h(T).


%---------------------------------------------------------------------
%NAVIGASI MAP

goto(X):-
	retract(lokasi_sekarang(Y)),
	asserta(lokasi_sekarang(X)),
	lihat_sekitar.

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


input_tujuan(exit, s):-
	lokasi_sekarang(halaman),
	score(4),

	retract(lokasi_sekarang(X)),
	asserta(lokasi_sekarang(Input)),!.
input_tujuan(exit,s):-
	write('Gerbang masih terkunci...'),nl,nl.

input_tujuan(Input, Arah):-
	lokasi_sekarang(X),
	jalan(X, Arah, List),
	isMember(Input,List),
	retract(lokasi_sekarang(X)),
	asserta(lokasi_sekarang(Input)),

	retract(langkah(Jumlah_langkah)),
	increment(Jumlah_langkah, Jumlah_langkah1),
	asserta(langkah(Jumlah_langkah1)),

	lihat_sekitar,!.
input_tujuan(batal,_):-
	write('Tidak jadi pergi...'),nl.
input_tujuan(A, B):-
	jalan(A,B,[]),
	write('Tidak bisa ke sana...'),nl,
	write('Coba lagi: '), read(X),
	input_tujuan(X, Arah).

isMember(X,[X|T]).
isMember(X,[H|T]):-
	isMember(X,T).


%-------------------------------------------------------------------------------------------------
%Manipulasi lokasi barang
lihat_tas:-
	write('Isi tas saat ini:'),nl,nl,
	isi_tas(List),
	tulis_list(List),nl.

ambil(X):-
	lokasi_sekarang(Place),
	isi_tas(List_tas),
	terletak(List_barang, Place),
	isMember(X,List_barang),
	bisa_diambil(X, bisa),
	append([X], List_tas, New_List_tas),
	del(X,List_barang, New_List_Barang),
	retract(isi_tas(List_tas)),
	asserta(isi_tas(New_List_tas)),
	retract(terletak(List_barang, Place)),
	asserta(terletak(New_List_Barang,Place)),
	write('Kamu telah mengambil '), write(X),nl,nl, !.
ambil(X):-
	bisa_diambil(X, tidak),
	write(X),write(' tidak bisa diambil...'),nl,nl.

drop(X):-
	lokasi_sekarang(Place),
	isi_tas(List_tas),
	isMember(X, List_tas),
	terletak(List_barang, Place),
	append([X], List_barang, New_List_Barang),
	del(X, List_tas, New_List_tas),
	retract(isi_tas(List_tas)),
	asserta(isi_tas(New_List_tas)),
	retract(terletak(List_barang, Place)),
	asserta(terletak(New_List_Barang,Place)),
	write('Kamu telah menaruh '), write(X), write(' di '), write(Place),nl,nl, !.

bongkar(X):-
	isi_tas(List_tas),
	isMember(X, List_tas),
	gabungan(Y,X),
	\+(Y = kosong),
	retract(gabungan(Y,X)),
	asserta(gabungan(kosong,X)),
	write('Kamu berhasil membongkar '),write(X),nl,nl,!.
bongkar(_):-
	write('Tidak bisa membongkar itu...').

gabung('DVD 1', laptop):-
	isi_tas(List_tas),
	isMember('DVD 1', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD 1',laptop)),
	write('Kamu memasukkan DVD 1 ke dalam laptop'),nl,nl.

gabung('DVD 2', laptop):-
	isi_tas(List_tas),
	isMember('DVD 2', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD 2',laptop)),
	write('Kamu memasukkan DVD 2 ke dalam laptop'),nl,nl.

gabung('DVD 3', laptop):-
	isi_tas(List_tas),
	isMember('DVD 3', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD 3',laptop)),
	write('Kamu memasukkan DVD 3 ke dalam laptop'),nl,nl.

gabung(laptop, 'DVD 1'):-
	isi_tas(List_tas),
	isMember('DVD 1', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD 1',laptop)),
	write('Kamu memasukkan DVD 1 ke dalam laptop'),nl,nl.

gabung(laptop, 'DVD 2'):-
	isi_tas(List_tas),
	isMember('DVD 2', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD 1',laptop)),
	write('Kamu memasukkan DVD 2 ke dalam laptop'),nl,nl.

gabung(laptop, 'DVD 3'):-
	isi_tas(List_tas),
	isMember('DVD 3', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD 1',laptop)),
	write('Kamu memasukkan DVD 3 ke dalam laptop'),nl,nl.

gabung(_,_):-
	write('Tidak bisa menggabung kedua benda itu...'),nl,nl.

ambil(_):-
	write('Tidak bisa diambil...'),nl,nl.

del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1]):-
    del(X,Tail,Tail1).
%-------------------------------------------------------------------------------------------------
pemain(2,0).

minta_hint:-
	pemain(0,_),
	write('Tidak punya makanan kucing...').
minta_hint:-
	pemain(Food,_),
	Food > 0,
	write('Beri satu makanan kucing untuk satu hint?(y/n)'),nl,
	write('> '), read(Answer),
	jawaban_kucing(Answer).

jawaban_kucing(Answer):-
	(Answer == y ; Answer == Y),
	lock(gembok, terkunci),
	write('"Kunci pertama ada di...", jawab kucing.'), nl,
	retract(pemain(Food,Stress)),
	decrement(Food,Food1),
	asserta(pemain(Food1,Stress)).
jawaban_kucing(Answer):-
	(Answer == y ; Answer == Y),
	lock(pin, terkunci),
	write('"Mungkin kau perlu perhatikan papan tulis... siapa tahu'),nl,
	write('ada jawabannya disana.", jawab kucing.'), nl,
	retract(pemain(Food,Stress)),
	decrement(Food,Food1),
	asserta(pemain(Food-1,Stress)).
jawaban_kucing(Answer):-
	(Answer == y ; Answer == Y),
	lock(password, terkunci),
	write('"Mungkin kau perlu perhatikan LAPTOP... siapa tahu'),nl,
	write('ada jawabannya disana.", jawab kucing.'), nl,
	retract(pemain(Food,Stress)),
	decrement(Food,Food1),
	asserta(pemain(Food-1,Stress)).
jawaban_kucing(Answer):-
	(Answer == y ; Answer == Y),
	lock(rantai, terkunci),
	write('"Mungkin kau perlu perhatikan PELAJARAN KIMIA... siapa tahu'),nl,
	write('ada jawabannya disana.", jawab kucing.'), nl,
	retract(pemain(Food,Stress)),
	decrement(Food,Food1),
	asserta(pemain(Food-1,Stress)).
jawaban_kucing(Answer):-
	(Answer == n ; Answer == N),
	write('"Sayang sekali... Mungkin lain kali.", jawab kucing.'),nl.
jawaban_kucing(_):-
	write('Si kucing bingung dengan jawabanmu...'),nl,
	minta_hint.

decrement(X,X1):-
	X1 is X-1.

increment(X,X1):-
	X1 is X+1.

%-----------------------------------------------------------------------

stress_increase:-
	retract(pemain(Food,Stress)),
	Stress1 is Stress+20,
	asserta(pemain(Food,Stress1)).

stress_decrease:-
	pemain(Food,Stress),
	Stress > 0,
	retract(pemain(Food,Stress)),
	Stress1 is Stress-20,
	asserta(pemain(Food,Stress1)).

%-------------------------------------------------------------------------------------------------
%Stats pemain
stat:-
	langkah(X),
	pemain(A,B),
	score(Score),
	write('Statusmu saat ini:'),nl,
	write('Jumlah kunci yang dibuka:'), write(Score),nl,
	write('Jumlah langkah: '), write(X),nl,
	write('Jumlah makanan kucing: '), write(A), nl,
	write('Tingkat stress: '), write(B),write('%'),nl,nl.

%-------------------------------------------------------------------------------------------------
%menyerah
menyerah:-
	write('Sayang sekali... kamu terjebak selamanya di dimensi ini...'),nl,nl,
	stat.

%-------------------------------------------------------------------------------------------------
%USE USE USE

use(laptop):-
	gabungan(X, laptop),
	X == 'DVD 1',
	write('B1saK4H k4U m3m3caHKAn p4ssW0rdKu???? CaR1 dVD l41N!!'),nl,nl.

use(laptop):-
	gabungan(X, laptop),
	X == 'DVD 2',
	write('PASSWORD: ybtvszralranatxna'),nl,nl.

use(laptop):-
	gabungan(X, laptop),
	X == 'DVD 3',
	write('hint: seorang ibu terpaksa melahirkan tidak pada waktunya sebanyak 13 kali...'),nl,nl.

use(laptop):-
	gabungan(kosong, laptop),
	write('Layar laptop tidak tampil apa-apa... Mungkin laptop ini perlu dimasukkan sesuatu terlebih'),nl,
	write('dahulu...'),nl,nl.



use(_):-
	write('Tidak ada barang seperti itu...'),nl,nl.

%-------------------------------------------------------------------------------------------------


/*MEMBUKA KUNCI GERBANG*/
unlock(X):-
	lock(X, Y),
	X == pin,
	pemain(_,Stress),
	Stress < 100,
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
	pemain(_,Stress),
	Stress < 100,
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
unlock(_):-
	pemain(_,Stress),
	Stress = 100.


	input_pin(X):-
		X == 527,
		write('Kunci terbuka!'),nl,
		retract(lock(pin, terkunci)),
		asserta(lock(pin, terbuka)),

		retract(score(Score)),
		increment(Score,Score1),
		asserta(score(Score1)).
	input_pin(X):-
		X == leave,
		write('Meninggalkan kunci...'),nl.
	input_pin(_):-
		write('Kombinasi salah...'),nl,
		write('Coba lagi! '),
		stress_increase,
		unlock(pin).

	input_pass(X):-
		X == logifmenyenangkan,
		write('Kunci terbuka!'),nl,
		retract(lock(pass, terkunci)),
		asserta(lock(pass, terbuka)),
		retract(score(Score)),
		increment(Score,Score1),
		asserta(score(Score1)).
	input_pass(leave):-
		X == leave,
		write('Meninggalkan kunci...'),nl.
	input_pass(_):-
		write('Password salah...'),nl,
		write('Coba lagi! '),
		stress_increase,
		unlock(password).
%----------------------------------------------------------------------
s:- pindah_ke(s).

/*
	Referensi:
		http://www.amzi.com/AdventureInProlog/a1start.php

		http://www.dailyfreecode.com/code/prolog-delete-element-given-list-3093.aspx
*/

