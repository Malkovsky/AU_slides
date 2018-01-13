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

unitsize(1.7cm);
path p = (-2, 1) -- (2, -1);
draw(p);
pair y = (1, 1);
dot(y);
label("$y$", position=y, align=E+N);
real t = intersect(p, y .. (0, -1))[0];
dot(point(p, t));
path d = y .. point(p, t);
draw(d, arrow=ArcArrow(HookHead));
pathlabel("$\frac{\lambda a}{2}$", d, align=E+S);
pathlabel("$a^Tx=c$", p, 0.25, sloped=true);

