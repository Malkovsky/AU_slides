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

unitsize(0.8cm);

pair x1 = (0, 0);
pair x2 = (-1, 6);
pair x3 = (6, 6);
pair x4 = (6, -1);
path poly = x1 -- x2 -- x3 -- x4;
fill(poly -- cycle, lightgrey);
draw(x1 -- x2, black);
draw(x4 -- x1, black);
dot(x1);
label("$x^*$", x1, align=N+E, black);
pair x = (3, 1);
dot(x);
label("$x$", x, align=E, black);
draw(x1 -- x, arrow=ArcArrow(HookHead));


real alpha = 3;
path supp = (x1 - alpha * (1, -1) -- x1 + (alpha+1) * (1, -1));
draw(supp, black);
pathlabel("$\nabla f(x^*)^T(x-x^*)=0$", supp, 0.75, sloped=true);

real beta = 2;
path grad = (x1 -- x1 - beta * (1, 1));
draw(grad, black, arrow=ArcArrow(HookHead));

pathlabel("$\nabla f(x^*)$", grad);

label("$\mathcal{D}$", (4, 4));

                              



