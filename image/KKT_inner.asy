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

unitsize(3cm);
path p = (-1.09, 1.9) .. (-1, 1.4) .. (0,0) .. (1, 1) .. (1.4,1.9);
pathlabel("$g(x)\leq 0$", p, position = 0.75, align = Relative(W), sloped = true);
real t_star = intersect (p, (-1, 0.12)..(1,0.12))[0];
pair x_star = point(p, t_star);
x_star = x_star + (0.5, 0.5);
path circ = circle(x_star, 0.25);
fill(p -- cycle, lightgrey);
fill(circ -- cycle, yellow);
draw(p);
dot(x_star);
label("$x^*$", position = x_star, align=E+N);

