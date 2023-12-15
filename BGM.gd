extends Node

enum THEMES {
	TITLE,
	OVERWORLD_MORNING,
	OVERWORLD_DAY,
	OVERWORLD_NIGHT,
	INDOORS,
	DUNGEON,
	CAVE,
	GARRISON,
	STRONGHOLD_DAY,
	STRONGHOLD_NIGHT,
	TAVERN,
	MONASTERY,
	SHIP,
	CATHEDRAL
}

var TRACKS = {
	THEMES.TITLE: [
		preload("res://Audio/bgm/Danca.mp3"),
		preload("res://Audio/bgm/Miri.mp3"),
		preload("res://Audio/bgm/Miri2.mp3"),
		preload("res://Audio/bgm/Moriar.mp3"),
		preload("res://Audio/bgm/Saltarello2.mp3"),
		preload("res://Audio/bgm/Saltarello3.mp3")],
	THEMES.OVERWORLD_MORNING: [
		preload("res://Audio/bgm/Beaute.mp3"),
		preload("res://Audio/bgm/Tout_par2.mp3"),
		preload("res://Audio/bgm/Brawle.mp3"),
		preload("res://Audio/bgm/Untitled.mp3"),
		preload("res://Audio/bgm/Par_maintes.mp3"),
		preload("res://Audio/bgm/Riches2.mp3"),
		preload("res://Audio/bgm/Se_zephirus3.mp3"),
		preload("res://Audio/bgm/Sera.mp3"),
		preload("res://Audio/bgm/Tousjours.mp3"),
		preload("res://Audio/bgm/Revenez.mp3"),
		preload("res://Audio/bgm/Helas_pitie.mp3"),
		preload("res://Audio/bgm/Questamor.mp3"),
		preload("res://Audio/bgm/Musica.mp3"),
		preload("res://Audio/bgm/Veder.mp3"),
		preload("res://Audio/bgm/Ce_jour.mp3")],
	THEMES.OVERWORLD_DAY: [
		preload("res://Audio/bgm/Corps_femenin.mp3"),
		preload("res://Audio/bgm/Aventure.mp3"),
		preload("res://Audio/bgm/Gedeon.mp3"),
		preload("res://Audio/bgm/Gentil_cuer.mp3"),
		preload("res://Audio/bgm/Jatendray.mp3"),
		preload("res://Audio/bgm/La_verdelete.mp3"),
		preload("res://Audio/bgm/Se_zephirus.mp3"),
		preload("res://Audio/bgm/Non_ara_may.mp3"),
		preload("res://Audio/bgm/Tout_par3.mp3"),
		preload("res://Audio/bgm/Qui.mp3"),
		preload("res://Audio/bgm/Quant_joyne.mp3"),
		preload("res://Audio/bgm/Tandernaken.mp3"),
		preload("res://Audio/bgm/Collinetto.mp3"),
		preload("res://Audio/bgm/Coloribus.mp3"),
		preload("res://Audio/bgm/Fortuna.mp3"),
		preload("res://Audio/bgm/Playsant.mp3")],
	THEMES.OVERWORLD_NIGHT: [
		preload("res://Audio/bgm/Chanconeta.mp3"),
		preload("res://Audio/bgm/Falla2.mp3"),
		preload("res://Audio/bgm/La_verdelete2.mp3"),
		preload("res://Audio/bgm/Liement.mp3"),
		preload("res://Audio/bgm/Mephisto.mp3"),
		preload("res://Audio/bgm/Riches.mp3"),
		preload("res://Audio/bgm/Se_zephirus2.mp3"),
		preload("res://Audio/bgm/Gentil_cuer2.mp3"),
		preload("res://Audio/bgm/La_fiamma.mp3"),
		preload("res://Audio/bgm/Chantar.mp3"),
		preload("res://Audio/bgm/Triste.mp3"),
		preload("res://Audio/bgm/Conditor.mp3"),
		preload("res://Audio/bgm/Deathe.mp3"),
		preload("res://Audio/bgm/Tousjours.mp3"),
		preload("res://Audio/bgm/Constantia.mp3"),
		preload("res://Audio/bgm/Bonne.mp3"),
		preload("res://Audio/bgm/Falla.mp3"),
		preload("res://Audio/bgm/Gedeon2.mp3"),
		preload("res://Audio/bgm/Specchio.mp3")],
	THEMES.INDOORS: [
		preload("res://Audio/bgm/Saltarello2.mp3"),
		preload("res://Audio/bgm/Stingo2.mp3"),
		preload("res://Audio/bgm/Virgen.mp3"),
		preload("res://Audio/bgm/Blazen.mp3"),
		preload("res://Audio/bgm/Sub_arturo.mp3"),
		preload("res://Audio/bgm/Spagnoletta.mp3"),
		preload("res://Audio/bgm/Recercada.mp3"),
		preload("res://Audio/bgm/Playne.mp3"),
		preload("res://Audio/bgm/Feuers.mp3"),
		preload("res://Audio/bgm/Naroit.mp3"),
		preload("res://Audio/bgm/Toute_flour.mp3"),
		preload("res://Audio/bgm/Paradis.mp3"),
		preload("res://Audio/bgm/Chanconeta2.mp3"),
		preload("res://Audio/bgm/Ricorditi.mp3"),
		preload("res://Audio/bgm/Doulse.mp3"),
		preload("res://Audio/bgm/Coloribus2.mp3"),
		preload("res://Audio/bgm/Lannoys.mp3"),
		preload("res://Audio/bgm/Ardente.mp3"),
		preload("res://Audio/bgm/Miri.mp3")],
	THEMES.DUNGEON: [
		preload("res://Audio/bgm/Mundi.mp3"),
		preload("res://Audio/bgm/Caida.mp3"),
		preload("res://Audio/bgm/Generosa.mp3"),
		preload("res://Audio/bgm/Irae.mp3"),
		preload("res://Audio/bgm/Morte.mp3"),
		preload("res://Audio/bgm/Leandro.mp3"),
		preload("res://Audio/bgm/Fuerza.mp3"),
		preload("res://Audio/bgm/Hedyaz.mp3"),
		preload("res://Audio/bgm/Bashraf.mp3"),
		preload("res://Audio/bgm/Andalusi.mp3")],
	THEMES.CAVE: [
		preload("res://Audio/bgm/Mater.mp3"),
		preload("res://Audio/bgm/Mulierum.mp3"),
		preload("res://Audio/bgm/Virgo.mp3"),
		preload("res://Audio/bgm/Caida.mp3"),
		preload("res://Audio/bgm/Coraige.mp3"),
		preload("res://Audio/bgm/Judici.mp3"),
		preload("res://Audio/bgm/Aucells.mp3"),
		preload("res://Audio/bgm/Plainte.mp3"),
		preload("res://Audio/bgm/Andalusi.mp3")],
	THEMES.GARRISON: [
		preload("res://Audio/bgm/Bourguignon.mp3"),
		preload("res://Audio/bgm/Alta.mp3"),
		preload("res://Audio/bgm/Zappay2.mp3")],
	THEMES.STRONGHOLD_DAY: [
		preload("res://Audio/bgm/Alla_caccia.mp3"),
		preload("res://Audio/bgm/Danca.mp3"),
		preload("res://Audio/bgm/Zappay.mp3"),
		preload("res://Audio/bgm/Bourguignon2.mp3"),
		preload("res://Audio/bgm/Sybilla.mp3"),
		preload("res://Audio/bgm/Alta2.mp3"),
		preload("res://Audio/bgm/Propinan.mp3"),
		preload("res://Audio/bgm/Trompette.mp3"),
		preload("res://Audio/bgm/Alla_bataglia.mp3"),
		preload("res://Audio/bgm/Amor.mp3"),
		preload("res://Audio/bgm/Collinetto2.mp3"),
		preload("res://Audio/bgm/Vaguza.mp3"),
		preload("res://Audio/bgm/Fede.mp3"),
		preload("res://Audio/bgm/Desiosa.mp3"),
		preload("res://Audio/bgm/Pavana.mp3"),
		preload("res://Audio/bgm/Moriar.mp3")],
	THEMES.STRONGHOLD_NIGHT: [
		preload("res://Audio/bgm/Zappay3.mp3"),
		preload("res://Audio/bgm/Villanicco.mp3"),
		preload("res://Audio/bgm/Mio.mp3"),
		preload("res://Audio/bgm/Costante.mp3"),
		preload("res://Audio/bgm/Passamezzo.mp3"),
		preload("res://Audio/bgm/Romanesca.mp3"),
		preload("res://Audio/bgm/Folias.mp3"),
		preload("res://Audio/bgm/Mabellist.mp3"),
		preload("res://Audio/bgm/Gotxs.mp3"),
		preload("res://Audio/bgm/Chacona.mp3"),
		preload("res://Audio/bgm/Morseca.mp3"),
		preload("res://Audio/bgm/Gugurumbe.mp3"),
		preload("res://Audio/bgm/Folias2.mp3"),
		preload("res://Audio/bgm/Gran_fuoco.mp3")],
	THEMES.TAVERN: [
		preload("res://Audio/bgm/Anello.mp3"),
		preload("res://Audio/bgm/Madonna_katerina.mp3"),
		preload("res://Audio/bgm/Saltarello.mp3"),
		preload("res://Audio/bgm/Danse_estampie.mp3"),
		preload("res://Audio/bgm/Ex_agone.mp3"),
		preload("res://Audio/bgm/Dregz.mp3"),
		preload("res://Audio/bgm/Par_mantes2.mp3"),
		preload("res://Audio/bgm/Zappay4.mp3"),
		preload("res://Audio/bgm/Berdolin.mp3"),
		preload("res://Audio/bgm/Absalon.mp3"),
		preload("res://Audio/bgm/Danza.mp3"),
		preload("res://Audio/bgm/Beliche.mp3"),
		preload("res://Audio/bgm/Chacona2.mp3"),
		preload("res://Audio/bgm/Paradiso.mp3")],
	THEMES.MONASTERY: [
		preload("res://Audio/bgm/Profundis.mp3"),
		preload("res://Audio/bgm/Spiritus.mp3"),
		preload("res://Audio/bgm/Domine.mp3"),
		preload("res://Audio/bgm/Lux.mp3")],
	THEMES.SHIP: [
		preload("res://Audio/bgm/Shatakhi.mp3"),
		preload("res://Audio/bgm/Zidane.mp3"),
		preload("res://Audio/bgm/Uitime.mp3"),
		preload("res://Audio/bgm/Ex_agone2.mp3"),
		preload("res://Audio/bgm/Naturalmente.mp3"),
		preload("res://Audio/bgm/Asbahan.mp3"),
		preload("res://Audio/bgm/Volgra.mp3"),
		preload("res://Audio/bgm/Danse_estampie.mp3"),
		preload("res://Audio/bgm/Berdolin.mp3"),
		preload("res://Audio/bgm/Dregz.mp3"),
		preload("res://Audio/bgm/Occasus.mp3")],
	THEMES.CATHEDRAL: [
		preload("res://Audio/bgm/Alium.mp3"),
		preload("res://Audio/bgm/Alma.mp3"),
		preload("res://Audio/bgm/Aeternam.mp3"),
		preload("res://Audio/bgm/Peccata_nostra.mp3"),
		preload("res://Audio/bgm/Magnificat.mp3")]
}

var current_theme:int = THEMES.OVERWORLD_NIGHT
var is_repeating:bool = true
@onready var streamPlayer:AudioStreamPlayer = $AudioStreamPlayer

func play_soundtrack(theme:int, repeat_themes:bool = true):
	if current_theme != theme or !streamPlayer.playing:
		is_repeating = false
		streamPlayer.stop()
		is_repeating = repeat_themes
		current_theme = theme
		
		var theme_tracks:Array = TRACKS[current_theme]
		if theme_tracks != []:
			streamPlayer.stream = theme_tracks[randi() % theme_tracks.size()]
			streamPlayer.play()

func replay_theme():
	var theme_tracks:Array = TRACKS[current_theme]
	streamPlayer.stream = theme_tracks[randi() % theme_tracks.size()]
	streamPlayer.play()

func _on_audio_stream_player_finished():
	if is_repeating:
		replay_theme()
