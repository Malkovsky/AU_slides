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

unitsize(3cm);
path p = (-1.09, 1.9) .. (-1, 1.4) .. (0,0) .. (1, 1) .. (1.4,1.9);
pathlabel("$f(x)$", p, position = 0.75, align = Relative(W));
real t_star = intersect (p, (-1, 0.12)..(1,0.12))[0];
pair x_star = point(p, t_star);
draw(p);
dot(x_star);
path q = x_star - 1.2 * dir(p, t_star) .. x_star  .. x_star + 0.8 * dir(p, t_star);
draw(q, dashed);
path grad = (x_star .. x_star + rotate(-90) * 0.6 * dir(p, t_star));
//draw(grad, arrow=Arrow(TeXHead));
//pathlabel("$\nabla f(x^*)$", grad, position = 0.5, align = Relative(W));
label("$x^*$", x_star, align=E+N);
pathlabel("$f(x^*)+\nabla f(x^*)^T(x-x^*)$", q, position = 0.25, align = Relative(E), sloped = true, scaled=0.8);

