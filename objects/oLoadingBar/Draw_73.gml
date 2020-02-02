/// @description Insert description here
// You can write your code in this editor
if (progress < maxProgress){
	var barColor = color;
	draw_rectangle_colour(x1,y1,x1+(x2-x1)*(progress/maxProgress),y2,barColor,barColor,barColor,barColor,false);
}
