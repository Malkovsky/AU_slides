settings.outformat = "pdf";

void pathlabel(picture pic = currentpicture, Label L, path g,
	real position=0.5, align align=NoAlign, bool sloped=false,
	pen p=currentpen, filltype filltype=NoFill) {
	Label L2 = Label(L, align, p, filltype,
	position=Relative(position));	
	if (sloped) {
		pair direction = dir(g, reltime(g, position));
		real angle = degrees(atan2(direction.y, direction.x));
		L2 = rotate(angle)*L2;
	}
	label(pic, L2, g);
}

unitsize(1cm);
path x_axis = (-5, 0) .. (5, 0);
path y_axis = (0, -5) .. (0,  5);
draw(x_axis, arrow=ArcArrow(HookHead));
draw(y_axis, arrow=ArcArrow(HookHead));

path circ = circle((0, 0), 3);
draw(circ);
draw((3, 0) -- (3, 0) + (1.5, 1.5), arrow=ArcArrow(HookHead));
draw((-3, 0)-- (-3, 0) + (1.5, 1.5), arrow=ArcArrow(HookHead));
draw((3 / sqrt(2), 3 / sqrt(2)) -- (3 / sqrt(2), 3 / sqrt(2)) + (1.5, 1.5), arrow=ArcArrow(HookHead));
draw((-3 / sqrt(2), -3 / sqrt(2)) -- (-3 / sqrt(2), -3 / sqrt(2)) + (1.5, 1.5), arrow=ArcArrow(HookHead));
dot((3, 0));
dot((-3, 0));
dot((3 / sqrt(2), 3 / sqrt(2)));
dot((-3 / sqrt(2), -3 / sqrt(2)));
label("$x^*$", position=(3 / sqrt(2), 3 / sqrt(2)), align=S+W);

