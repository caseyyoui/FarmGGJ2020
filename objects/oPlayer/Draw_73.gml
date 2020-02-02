/// @description Insert description here
// You can write your code in this editor
draw_text(x, y, string(availableCurrency))

var throwPower = sqrt(adx*adx + ady*ady) ;

if (throwPower > .25)
{
	draw_line(x, y, x + adx * 30, y + ady * 30);
}
