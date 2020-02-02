/// @description Insert description here
// You can write your code in this editor
if(winner != -1)
{
	draw_set_color(c_black);
	draw_text(room_width / 2 - 96-1, room_height/2+1, "Player "+ string(winner + 1) + " Wins!!");
	draw_set_color(c_white);
	draw_text(room_width / 2 - 96, room_height/2, "Player "+ string(winner + 1) + " Wins!!");
}