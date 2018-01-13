settings.outformat = "pdf";

void pathlabel(picture pic = currentpicture, Label L, path g,
	real position=0.5, align align=NoAlign, bool sloped=false,
	pen p=currentpen, filltype filltype=NoFill, real scaled=1) {
	Label L2 = Label(L, align, p, filltype,
	position=Relative(position));	
	if (sloped) {
		pair direction = dir(g, reltime(g, position));
		real angle = degrees(atan2(direction.y, direction.x));
		L2 = rotate(angle)*L2;
	}
	label(pic, scale(scaled)*L2, g);
}

unitsize(2cm);
path p = ((-2, 2) -- (0, 0) -- (2, 2));
pathlabel("$|x|$", p, position = 0.75, align = W, sloped=true);
draw(p);
draw((-2, 0) -- (2, 0), arrow=ArcArrow(HookHead));
draw((0, -0.3) -- (0, 2.3), arrow=ArcArrow(HookHead));
