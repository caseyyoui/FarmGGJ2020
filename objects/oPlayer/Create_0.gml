/// @description Insert description here
// You can write your code in this editor
inventory = -1;

//Money variables
availableCurrency = 10 // start with 10 gold
currencyRate = 1
currencyUpdate = currencyRate
image_xscale = 2;
image_yscale = 2;
movementSpeed = 3;
alert = -1
alert_offset_x = 30
alert_offset_y = -64
alertMessage = ""
adx = 0;
ady = 0;

stunTimer = -1;

sprite_index = asset_get_index("s" + (controllerID == 0 ? "Casey" : "Anne") + "Front");

if(!audio_is_playing(snd_song))
	audio_play_sound(snd_song,0,true);

playerScore = 0;
