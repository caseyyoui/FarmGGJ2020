/// @description Insert description here
// You can write your code in this editor
draw_text(x, y, string(availableCurrency))

var your_string = "your_text";
draw_text(x - (string_width(your_string) / 2),y - (sprite_height / 2) - (string_height(your_string) / 2),your_string);

if (sqrt(adx*adx + ady*ady) > .25)
	draw_line(x,y,x + adx * 50, y + ady * 50);
