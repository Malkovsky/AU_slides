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
path p = ((-3, 5) -- (-2, 3) -- (-0.5, 2) -- (1, 4) -- (1.2, 5));
draw(p);



for(int i = 1; i <= length(p) - 1; ++i) {
	pair d = dir(p, i, sign=-1);
	//draw(point(p, i) -- point(p, i) + 0.7 * d, dashed);

	d = dir(p, i, sign=1);
	//draw(point(p, i) -- point(p, i) - 0.7 * d, dashed);
}

//label("$\max_{1\leq i\leq m}a_ix+b$", position=(-0.8, 4.5));
pathlabel("$a_ix+b_i$", p, position=0.7, align=W, sloped=true);

