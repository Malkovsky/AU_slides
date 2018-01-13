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
fill(p -- cycle, lightgrey);
label("$g(x)\leq 0$", position=(0, 1));
//pathlabel("$g(x)=0$", p, position = 0.75, align = Relative(W), sloped = true);
real t_star = intersect (p, (-1, 0.12)..(1,0.12))[0];
pair x_star = point(p, t_star);
draw(p);
dot(x_star);
path q = x_star - 1 * dir(p, t_star) .. x_star  .. x_star + 0.6 * dir(p, t_star);
draw(q);
path grad = (x_star .. x_star + rotate(-90) * 0.6 * dir(p, t_star));
draw(grad, arrow=Arrow(TeXHead));
pathlabel("$\nabla g(x^*)$", grad, position = 0.5, align = Relative(W));
label("$x^*$", x_star, align=E+N);
pathlabel("$\nabla g(x^*)^T(x-x^*)=0$", q, position = 0.21, align = Relative(E), sloped = true);
