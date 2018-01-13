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
path x_axis = (0.9, 0) .. (9, 0);
path y_axis = (1, -2.1) .. (1,  3.5);
draw(x_axis, arrow=ArcArrow(HookHead));
draw(y_axis, arrow=ArcArrow(HookHead));

pair a = (2, 0);
pair b = (8, 0);
path f = (a - (0, 2)) .. ((2a+b)/3) .. ((a+b)/2+(0,1.6) .. ((a+2b)/3+(0,1.1)).. (b+(0,2)));
path pa = (a-(0, 2)) .. (a+(0, 2));
path pc= ((a+b)/2-(0,2)) .. ((a+b)/2+(0,2));
draw(pc, dashed+grey);
b = (a + b) / 2;
pair d = (a + b) / 2;
path pd = (d - (0, 2)) .. (d + (0, 2));
draw(pd, dashed+grey);
label("$b$", position=b, align=S+E);
label("$a$", position=d, align=S+W);
dot(b);
dot(d);

real mid = intersect(f, pc)[0];
real mid2 = intersect(f, pd)[0];
pathlabel("$f(x)$", subpath(f, 0, mid), position=0.75, align=N+W, sloped=true);
f = subpath(f, mid2, mid);
draw(f);

real t_star = intersect(f, x_axis)[0];
pair x_star = point(f, t_star);
dot(x_star);
label("$x^*$", position = x_star, align=S+E);





