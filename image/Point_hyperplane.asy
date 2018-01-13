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
label("$y$", position=y, align=E+N);
real t = intersect(p, y .. (0, -1))[0];
label("$x^*$", position = point(p,t), align=W+S);
draw(y .. point(p, t - 0.2), dashed+grey);
draw(y .. point(p, t), dashed+grey);
draw(y .. point(p, t + 0.1), dashed+grey);
pathlabel("$a^Tx=c$", p, 0.25, sloped=true);
dot(point(p, t));
dot(point(p, t-0.2));
dot(point(p, t+0.1));
dot(y);

