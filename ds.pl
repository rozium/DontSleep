
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
bisa_diambil('papan_tulis', tidak).
bisa_diambil('tempat_sampah', tidak).
bisa_diambil('meja', tidak).
bisa_diambil('lemari', tidak).

bisa_diambil('DVD_1', bisa).
bisa_diambil('DVD_2', bisa).
bisa_diambil('DVD_3', bisa).
bisa_diambil('laptop', bisa).
bisa_diambil('kunci_gembok', bisa).

%----------------------------------------------------------------------
%NPC NPC NPC
npc(kucing, 'kelas_1B').
bicara(kucing):-
	lokasi_sekarang('kelas_1B'),
	score(Score),
	Score = 0,
	write('Apakah kamu masih malas-malasan? Kamu belum membuka satupun'),nl,
	write('dari 4 kunci! Atau kau memang murid yang bodoh? kekeke...'),nl,nl.

bicara(kucing):-
	lokasi_sekarang('kelas_1B'),
	score(Score),
	Score = 1,
	write('Jadi kau sudah membuka salah satu kunci? Selamat, kau satu '),nl,
	write('langkah menuju kebebasan, kekeke...'),nl,nl.

bicara(kucing):-
	lokasi_sekarang('kelas_1B'),
	score(Score),
	Score = 2,
	write('Kau sudah setengah jalan! Lumayan juga untuk murid sepertimu kekeke!'),nl,nl.

bicara(kucing):-
	lokasi_sekarang('kelas_1B'),
	score(Score),
	Score = 3,
	write('Satu lagi... Tinggal satu lagi...'),nl, nl.

bicara(kucing):-
	lokasi_sekarang('kelas_1B'),
	score(Score),
	Score = 4,
	write('Jadi kau sudah membuka semua kunci... tunggu apa lagi? cepat pergi...'),nl,nl.

%----------------------------------------------------------------------


/*LIST LOKASI BENDA*/
	/*Lantai 1*/
	terletak(['papan_tulis', 'DVD_1'], 'kelas_1A').
	terletak(['papan_tulis'], 'kelas_1B').
	terletak(['papan_tulis'], 'lobby').
	terletak(['papan_tulis'], 'ruang_guru').
	terletak(['papan_tulis'], 'tata_usaha').
	terletak([meja], 'gudang').
		terletak([laci], meja).
			terletak(['DVD_3'], laci).
	terletak([meja, lemari, berankas], 'ruang_kepala_sekolah').
		terletak(['kunci_gembok'], 'piala_emas').
	terletak([], 'wc_pria_bawah').
	terletak([], 'wc_wanita_bawah').
	terletak(['tempat_sampah'], 'parkiran').
		terletak(['DVD_2'], 'tempat_sampah').
	terletak(['gerbang_keluar'], 'halaman').
	terletak([], 'koridor_bawah').

	/*Lantai 2*/
	terletak(['papan_tulis'], 'kelas_2B').
	terletak(['papan_tulis'], 'kelas_2A').
	terletak(['papan_tulis'], 'kelas_3').
	terletak(['papan_tulis'], 'perpustakaan').
	terletak([], 'laboratorium').
	terletak([laptop], 'multimedia').
	terletak([], 'wc_pria_atas').
	terletak([], 'wc_wanita_bawah').
	terletak([], 'koridor_atas').
	terletak([], 'koridor_atas').

	/*Lantai 3*/
	terletak([], 'roof_top').


%----------------------------------------------------------------------
%LANTAI 1
	jalan(lobby, u, ['koridor_atas']).
	jalan(lobby, n, ['ruang_kepala_sekolah']).
	jalan(lobby, w, ['koridor_bawah']).
	jalan(lobby, e, ['ruang_guru']).
	jalan(lobby, s, ['halaman']).
	jalan(lobby, d, []).

	jalan('exit', u, []).
	jalan('exit', n, []).
	jalan('exit', w, []).
	jalan('exit', e, []).
	jalan('exit', s, []).
	jalan('exit', d, []).

	jalan('ruang_guru', u, []).
	jalan('ruang_guru', n, []).
	jalan('ruang_guru', w, [lobby]).
	jalan('ruang_guru', e, []).
	jalan('ruang_guru', s, []).
	jalan('ruang_guru', d, []).

	jalan('ruang_kepala_sekolah', u, []).
	jalan('ruang_kepala_sekolah', n, []).
	jalan('ruang_kepala_sekolah', w, []).
	jalan('ruang_kepala_sekolah', e, []).
	jalan('ruang_kepala_sekolah', s, [lobby]).
	jalan('ruang_kepala_sekolah', d, []).

	jalan('koridor_bawah', u, []).
	jalan('koridor_bawah', n, ['wc_pria_bawah', 'wc_wanita_bawah', 'tata_usaha']).
	jalan('koridor_bawah', s, ['kelas_1A', 'kelas_1B']).
	jalan('koridor_bawah', w, ['parkiran']).
	jalan('koridor_bawah', e, ['lobby']).
	jalan('koridor_bawah', d, []).

	jalan('parkiran', u, []).
	jalan('parkiran', n, []).
	jalan('parkiran', w, []).
	jalan('parkiran', e, ['koridor_bawah']).
	jalan('parkiran', s, []).
	jalan('parkiran', d, []).

	jalan('kelas_1B', u, []).
	jalan('kelas_1B', n, ['koridor_bawah']).
	jalan('kelas_1B', w, []).
	jalan('kelas_1B', e, []).
	jalan('kelas_1B', s, []).
	jalan('kelas_1B', d, []).

	jalan('kelas_1A', u, []).
	jalan('kelas_1A', n, ['koridor_bawah']).
	jalan('kelas_1A', w, []).
	jalan('kelas_1A', e, []).
	jalan('kelas_1A', s, []).
	jalan('kelas_1A', d, []).

	jalan('halaman', u, []).
	jalan('halaman', n, ['lobby']).
	jalan('halaman', w, []).
	jalan('halaman', e, []).
	jalan('halaman', s, ['exit']).
	jalan('halaman', d, []).

	jalan('tata_usaha', u, []).
	jalan('tata_usaha', n, []).
	jalan('tata_usaha', w, [gudang]).
	jalan('tata_usaha', e, []).
	jalan('tata_usaha', s, ['koridor_bawah']).
	jalan('tata_usaha', d, []).

	jalan('gudang', u, []).
	jalan('gudang', n, []).
	jalan('gudang', w, []).
	jalan('gudang', e, ['tata_usaha']).
	jalan('gudang', s, []).
	jalan('gudang', d, []).

	jalan('wc_pria_bawah', u, []).
	jalan('wc_pria_bawah', n, []).
	jalan('wc_pria_bawah', w, []).
	jalan('wc_pria_bawah', e, []).
	jalan('wc_pria_bawah', s, ['koridor_bawah']).
	jalan('wc_pria_bawah', d, []).

	jalan('wc_wanita_bawah', u, []).
	jalan('wc_wanita_bawah', n, []).
	jalan('wc_wanita_bawah', w, []).
	jalan('wc_wanita_bawah', e, []).
	jalan('wc_wanita_bawah', s, ['koridor_bawah']).
	jalan('wc_wanita_bawah', d, []).

%lantai 2
	jalan('koridor_atas', u, ['roof_top']).
	jalan('koridor_atas', n, ['wc_pria_atas', 'wc wanita atas', 'multimedia', laboratorium]).
	jalan('koridor_atas', s, ['kelas_2A', 'kelas_2B', 'kelas_3']).
	jalan('koridor_atas', w, []).
	jalan('koridor_atas', e, ['perpustakaan']).
	jalan('koridor_atas', d, ['lobby']).

	jalan('perpustakaan', u, []).
	jalan('perpustakaan', n, []).
	jalan('perpustakaan', w, ['koridor_atas']).
	jalan('perpustakaan', e, []).
	jalan('perpustakaan', s, []).
	jalan('perpustakaan', d, []).

	jalan('laboratorium', u, []).
	jalan('laboratorium', n, []).
	jalan('laboratorium', w, []).
	jalan('laboratorium', e, []).
	jalan('laboratorium', s, ['koridor_atas']).
	jalan('laboratorium', d, []).

	jalan('multimedia', u, []).
	jalan('multimedia', n, []).
	jalan('multimedia', w, []).
	jalan('multimedia', e, []).
	jalan('multimedia', s, ['koridor_atas']).
	jalan('multimedia', d, []).

	jalan('gudang', u, []).
	jalan('gudang', n, []).
	jalan('gudang', w, []).
	jalan('gudang', e, ['tata_usaha']).
	jalan('gudang', s, []).
	jalan('gudang', d, []).

	jalan('kelas_2B', u, []).
	jalan('kelas_2B', n, ['koridor_atas']).
	jalan('kelas_2B', w, []).
	jalan('kelas_2B', e, []).
	jalan('kelas_2B', s, []).
	jalan('kelas_2B', d, []).

	jalan('kelas_2A', u, []).
	jalan('kelas_2A', n, ['koridor_atas']).
	jalan('kelas_2A', w, []).
	jalan('kelas_2A', e, []).
	jalan('kelas_2A', s, []).
	jalan('kelas_2A', d, []).

	jalan('kelas_3', u, []).
	jalan('kelas_3', n, ['koridor_atas']).
	jalan('kelas_3', w, []).
	jalan('kelas_3', e, []).
	jalan('kelas_3', s, []).
	jalan('kelas_3', d, []).

	jalan('wc_pria_atas', u, []).
	jalan('wc_pria_atas', n, []).
	jalan('wc_pria_atas', w, []).
	jalan('wc_pria_atas', e, []).
	jalan('wc_pria_atas', s, ['koridor_atas']).
	jalan('wc_pria_atas', d, []).

	jalan('wc_wanita_atas', u, []).
	jalan('wc_wanita_atas', n, []).
	jalan('wc_wanita_atas', w, []).
	jalan('wc_wanita_atas', e, []).
	jalan('wc_wanita_atas', s, ['koridor_atas']).
	jalan('wc_wanita_atas', d, []).

%lantai 3
	jalan('roof_top', u, []).
	jalan('roof_top', n, []).
	jalan('roof_top', w, []).
	jalan('roof_top', e, []).
	jalan('roof_top', s, []).
	jalan('roof_top', d, ['koridor_atas']).
%----------------------------------------------------------------------
%-------------------------%BAGIAN 2: BADAN GAME------------------------
%----------------------------------------------------------------------

lokasi_sekarang('ruang_guru').
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
	do(load(X)) :- loadf(X), !.
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
%save(X):-
%	lokasi_sekarang(Lokasi),
%	pemain(Makanan, Stress),
%	isi_tas(List_tas),
%
%	setup_call_cleanup(
%		open(X,write,Out),
%	    (
%	      write_term(Out,pemain(Makanan, Stress), [fullstop(true)]),nl(Out),
%	      write_term(Out,lokasi_sekarang(Lokasi), [fullstop(true)]),nl(Out),
%	      write_term(Out,isi_tas(List_tas), [fullstop(true)])
%	    ),
%	    close(Out)
%	    ),
%	write('Save berhasil!'),nl,nl.
%:- set_prolog_flag(double_quotes,chars).
%:- use_module(library(double_quotes)).

save(X):-
	open(X,write,Tulis),
	lokasi_sekarang(Loc),
	atom_concat(Loc,'.',Temp1),
	write(Tulis,Temp1),nl(Tulis),
	
	lock(gembok,Cond1),
	atom_concat(Cond1,'.',Temp2),
	write(Tulis,Temp2),nl(Tulis),
	
	lock(pin,Cond2),
	atom_concat(Cond2,'.',Temp3),
	write(Tulis,Temp3),nl(Tulis),

	lock(password,Cond3),
	atom_concat(Cond3,'.',Temp4),
	write(Tulis,Temp4),nl(Tulis),

	lock(rantai,Cond4),
	atom_concat(Cond4,'.',Temp5),
	write(Tulis,Temp5),nl(Tulis),

	isi_tas(List_tas),
	
	(isMember('DVD_1', List_tas) -> atom_concat(sudah,'.',Temp6);
	 atom_concat(belum,'.',Temp6)),
	write(Tulis,Temp6),nl(Tulis),
	
	(isMember('DVD_2', List_tas) -> atom_concat(sudah,'.',Temp7);
	 atom_concat(belum,'.',Temp7)),
	write(Tulis,Temp7),nl(Tulis),

	(isMember('DVD_3', List_tas) -> atom_concat(sudah,'.',Temp8);
	 atom_concat(belum,'.',Temp8)),
	write(Tulis,Temp8),nl(Tulis),	

	(isMember('laptop', List_tas) -> atom_concat(sudah,'.',Temp9);
	 atom_concat(belum,'.',Temp9)),
	write(Tulis,Temp9),nl(Tulis),

	(isMember('kunci_gembok', List_tas) -> atom_concat(sudah,'.',Temp10);
	 atom_concat(belum,'.',Temp10)),
	write(Tulis,Temp10),nl(Tulis),

	pemain(Makanan, Stress),
	write(Tulis,Makanan),write(Tulis,'.'),nl(Tulis),
	write(Tulis,Stress),write(Tulis,'.'),nl(Tulis),

	langkah(Step),
	write(Tulis,Step),write(Tulis,'.'),nl(Tulis),

	score(Nilai),
	write(Tulis,Nilai),write(Tulis,'.'),nl(Tulis),

	

	close(Tulis).



loadf(X):-
	open(X,read,Str),
	%lokasi sekarang
	read(Str,Rekam1),
		retract(lokasi_sekarang(A)),
		asserta(lokasi_sekarang(Rekam1)),
	
	%kunci
	read(Str,Rekam2),
		retract(lock(gembok, B1)),
		asserta(lock(gembok, Rekam2)),
	read(Str,Rekam3),
		retract(lock(pin, B2)),
		asserta(lock(pin, Rekam3)),
	read(Str,Rekam4),
		retract(lock(password, B3)),
		asserta(lock(password, Rekam4)),
	read(Str,Rekam5),
		retract(lock(rantai, B4)),
		asserta(lock(rantai, Rekam5)),

	%isi tas
	retractall(isi_tas(List_tas1)),
	asserta(isi_tas([])),

	isi_tas(List_tas2),
	read(Str,Rekam6),
		(Rekam6 == sudah -> append(['DVD_1'], List_tas2, New_List_tas);append([], List_tas2, New_List_tas)),
	read(Str,Rekam7),
		(Rekam7 == sudah -> append(['DVD_2'], New_List_tas1, New_List_tas2);append([], New_List_tas, New_List_tas2)),
	read(Str,Rekam8),
		(Rekam8 == sudah -> append(['DVD_3'], New_List_tas2, New_List_tas3);append([], New_List_tas2, New_List_tas3)),
	read(Str,Rekam9),
		(Rekam9 == sudah -> append(['laptop'], New_List_tas3, New_List_tas4);append([], New_List_tas3, New_List_tas4)),
	read(Str,Rekam10),
		(Rekam10 == sudah -> append(['kunci_gembok'], New_List_tas4, New_List_tas5);append([], New_List_tas4, New_List_tas5)),
	retract(isi_tas(List_tas2)),
	asserta(isi_tas(New_List_tas5)),

	%pemain
	retract(pemain(C1, C2)),
	read(Str, Rekam11),
	read(Str, Rekam12),
	asserta(pemain(Rekam11, Rekam12)),
	
	%jumlah langkah
	retract(langkah(Step)),
	read(Str, Rekam13),
	asserta(langkah(Rekam13)),

	%skor
	retract(score(Nilai)),
	read(Str, Rekam14),
	asserta(score(Rekam14)),

	close(Str).

/*
bisa_diambil('DVD_1', bisa).
bisa_diambil('DVD_2', bisa).
bisa_diambil('DVD_3', bisa).
bisa_diambil('laptop', bisa).
bisa_diambil('kunci_gembok', bisa).

terletak(['papan_tulis', 'DVD_1'], 'kelas_1A').
terletak(['DVD_3'], laci).
terletak(['DVD_2'], 'tempat_sampah').
terletak([laptop], 'multimedia').
terletak(['kunci_gembok'], 'piala_emas').

:- dynamic(lokasi_sekarang/1). !
:- dynamic(lock/2). !
:- dynamic(isi_tas/1).
:- dynamic(pemain/2).
:- dynamic(langkah/1).
:- dynamic(score/1).
:- dynamic(terletak/2).
*/

%-------------------------------------------------------------------------------------------------
%PERIKSA PERIKSA PERIKSA 

	periksa('papan_tulis'):-
	lokasi_sekarang('kelas_1B'),
	nl,
	write('Di papan tertulis: '),nl,
	write('Kamu terjebak di dimensi ini karena tidur di kelas!'),nl,
	write('Cobalah cari jalan keluar... jika kamu memang tidak malas.'),nl,!.

	periksa('papan_tulis'):-
		lokasi_sekarang('kelas_2B'),
		nl,
		write('Di papan tertulis: '),nl,
		write('LOBBY'),nl,!.

	periksa('papan_tulis'):-
		lokasi_sekarang('lobby'),
		nl,
		write('Di papan tertulis: '),nl,
		write('TU'),nl,!.

	periksa('papan_tulis'):-
		lokasi_sekarang('tata_usaha'),
		nl,
		write('Di papan tertulis: '),nl,
		write('HALAMAN'),nl,!.

	periksa('papan_tulis'):-
		lokasi_sekarang(X),
		terletak(List, X),
		isMember('papan_tulis', List),
		nl,
		write('Di papan tidak tetulis apa-apa...'),nl,!.

	periksa('papan_tulis'):-
		lokasi_sekarang(_),
		nl,
		write('Tidak ada papan_tulis di sini.'),nl,nl,!.

	%di parkiran
	periksa('tempat_sampah'):-
		lokasi_sekarang(parkiran),
		write('Ada tempat_sampah warna hijau dengan lambang daur ulang.'),nl,
		write('Kamu tidak bisa melihat isinya dari sini...'),nl.
	periksa('tempat_sampah'):-
		lokasi_sekarang('tempat_sampah'),
		terletak(['DVD_2'], 'tempat_sampah'),
		write('Di dalam tempat_sampah ada sebuah DVD berlabel angka "2".'),nl,nl.
	periksa('tempat_sampah'):-
		lokasi_sekarang('tempat_sampah'),
		terletak([], 'tempat_sampah'),
		write('Sudah tidak apa-apa di dalam tempat_sampah.'),nl,nl.

	%di gudang
	periksa(meja):-
		lokasi_sekarang(X),
		X == gudang,
		write('Pada meja ada 1 LACI yang bisa dibuka.'),nl,nl.
	periksa(laci):-
		lokasi_sekarang(gudang),
		terletak(['DVD_3'], laci),
		write('Kamu membuka laci pada meja. Di dalamnya terdapat sebuah DVD berlabel"3".'),nl,
		write('"Sebaiknya kuambil saja DVD ini"'),nl,
		dekati('laci'),
		ambil('DVD_3'),
		kembali,nl.
	periksa(laci):-
		lokasi_sekarang(gudang),
		terletak([], laci),
		write('Sudah tidak ada apa-apa di laci'),nl,nl.
		
	periksa(kucing):-
		lokasi_sekarang('kelas_1B'),
		write('Kucing berwarna hitam terlihat sedang bersantai di atas meja guru...'),nl,
		write('"HEI! Jangan berani-berani pegang aku!"').

	periksa(meja):-
		lokasi_sekarang('ruang_kepala_sekolah'),
		write('Kamu mencoba menyelidiki meja, tapi tidak menemukan apa-apa').

	periksa(lemari):-
		lokasi_sekarang('ruang_kepala_sekolah'),
		write('Pada lemari ada banyak PIALA yang dipamerkan, tetapi hanya satu yang berwarna EMAS.').

	periksa('piala_emas'):-
		lokasi_sekarang('ruang_kepala_sekolah'),
		terletak(['kunci_gembok'], 'piala_emas'),
		write('Kamu mengintip ke bagian dalam piala_emas. Di dalamnya ada sebuah kunci berkarat.'),nl,
		write('Kamu memutuskan sebaiknya mengambil kunci itu.'),nl,
		dekati('piala_emas'),
		ambil('kunci_gembok'),
		kembali,nl.

	periksa('piala_emas'):-
		lokasi_sekarang('ruang_kepala_sekolah'),
		terletak([], 'piala_emas'),
		write("Sudah tidak ada apa-apa dalam piala itu."),nl,nl.

	periksa('gerbang_keluar'):-
		lokasi_sekarang(halaman),
		score(Score),
		Score = 4,
		write('Gerbang sudah terbuka, sebaiknya segera pergi dari sini!'),nl,nl.
	periksa('gerbang_keluar'):-
		lokasi_sekarang(halaman),
		score(Score),
		Score < 4,
		X is 4 - Score,
		write('Masih ada '), write(X), write(' kunci yang perlu dibuka:'),nl,
		(lock(gembok,terkunci) -> write('Gembok'),nl ; lock(gembok,terbuka)),
		(lock(pin,terkunci) -> write('PIN'),nl ; lock(pin,terbuka)),
		(lock(password,terkunci) -> write('Password'),nl ; lock(password,terbuka)),
		(lock(rantai,terkunci) -> write('Rantai'),nl ; lock(rantai,terbuka)).
			
	periksa(_):-
		write('Tidak ada barang seperti itu di sini...'), nl.

		dekati(laci):-
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('laci')).
		dekati('piala_emas'):-
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('piala_emas')).
		dekati('tempat_sampah'):-
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('tempat_sampah')),
			write('Kamu mendekati tempat_sampah...'),nl,nl.

		kembali:-
			lokasi_sekarang('laci'),
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('gudang')).


		kembali:-
			lokasi_sekarang('piala_emas'),
			retract(lokasi_sekarang(X)),
			asserta(lokasi_sekarang('ruang_kepala_sekolah')).


		kembali:-
			lokasi_sekarang('tempat_sampah'),
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
	write('|   P   []        KORIDOR_BAWAH       []                 | Ruang |'), nl,
	write('|   A   |                             |       LOBBY      | Guru  |'), nl,
	write('|   R   |------[]--------------[]-----|                  |       |'), nl,
	write('|   K   |               |             |                 []       |'), nl,
	write('|   I   |   KELAS_1A    |   KELAS_1B  |                  |       |'), nl,
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
	write('|      KELAS_3       |    KELAS_2A     |    KELAS_2B     |       |'), nl,
	write('|----------------------------------------------------------------|'), nl.

peta(3) :-
	write('                                                         ROOF_TOP.'), nl,
	write('|----------------------------------------------------------------|'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                                                                |'), nl,
	write('|                            ROOF_TOP                            |'), nl,
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
	write('Ketik mau ke mana (ketik "batal." untuk tidak jadi pergi kemananapun): '), read(Input),
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

gabung('DVD_1', laptop):-
	isi_tas(List_tas),
	isMember('DVD_1', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD_1',laptop)),
	write('Kamu memasukkan DVD_1 ke dalam laptop'),nl,nl.

gabung('DVD_2', laptop):-
	isi_tas(List_tas),
	isMember('DVD_2', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD_2',laptop)),
	write('Kamu memasukkan DVD_2 ke dalam laptop'),nl,nl.

gabung('DVD_3', laptop):-
	isi_tas(List_tas),
	isMember('DVD_3', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD_3',laptop)),
	write('Kamu memasukkan DVD_3 ke dalam laptop'),nl,nl.

gabung(laptop, 'DVD_1'):-
	isi_tas(List_tas),
	isMember('DVD_1', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD_1',laptop)),
	write('Kamu memasukkan DVD_1 ke dalam laptop'),nl,nl.

gabung(laptop, 'DVD_2'):-
	isi_tas(List_tas),
	isMember('DVD_2', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD_1',laptop)),
	write('Kamu memasukkan DVD_2 ke dalam laptop'),nl,nl.

gabung(laptop, 'DVD_3'):-
	isi_tas(List_tas),
	isMember('DVD_3', List_tas),
	isMember(laptop, List_tas),
	retract(gabungan(X,laptop)),
	asserta(gabungan('DVD_1',laptop)),
	write('Kamu memasukkan DVD_3 ke dalam laptop'),nl,nl.

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
	write('"Mungkin kau perlu perhatikan papan_tulis... siapa tahu'),nl,
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
	X == 'DVD_1',
	write('B1saK4H k4U m3m3caHKAn p4ssW0rdKu???? CaR1 dVD l41N!!'),nl,nl.

use(laptop):-
	gabungan(X, laptop),
	X == 'DVD_2',
	write('PASSWORD: ybtvszralranatxna'),nl,nl.

use(laptop):-
	gabungan(X, laptop),
	X == 'DVD_3',
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

unlock(X):-
	lock(X, Y),
	pemain(_,Stress),
	Stress < 100,
	X == gembok,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terkunci,
	isi_tas(List_tas),
	isMember('kunci_gembok', List_tas),
	retract(lock(gembok, terkunci)),
	asserta(lock(gembok, terbuka)),

	retract(score(Score)),
	increment(Score,Score1),
	asserta(score(Score1)),

	write('Gembok terbuka!').

unlock(X):-
	lock(X, Y),
	pemain(_,Stress),
	Stress < 100,
	X == gembok,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terkunci,
	isi_tas(List_tas),
	isMember('kunci_gembok', List_tas),
	retract(lock(gembok, terkunci)),
	asserta(lock(gembok, terbuka)),

	retract(score(Score)),
	increment(Score,Score1),
	asserta(score(Score1)),

	write('Gembok terbuka!'),nl,nl.
	
unlock(X):-
	lock(X, Y),
	X == gembok,
	lokasi_sekarang(Place),
	Place = 'halaman',
	Y == terkunci,
	write('Tidak punya kunci apapun...'),nl,nl.

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
		retract(lock(password, terkunci)),
		asserta(lock(password, terbuka)),
		retract(score(Score)),
		increment(Score,Score1),
		asserta(score(Score1)),!.
	input_pass(X):-
		X == leave,
		write('Meninggalkan kunci...'),nl,!.
	input_pass(_):-
		write('Password salah...'),nl,
		write('Coba lagi! '),
		stress_increase,
		unlock(password),!.
%----------------------------------------------------------------------
s:- pindah_ke(s).

/*
	Referensi:
		http://www.amzi.com/AdventureInProlog/a1start.php

		http://www.dailyfreecode.com/code/prolog-delete-element-given-list-3093.aspx

		http://stackoverflow.com/questions/22774477/read-the-whole-fact-from-external-file
*/

