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
path x_axis = (0.9, 0) .. (7, 0);
path y_axis = (1, -2.1) .. (1,  3.5);
draw(x_axis, arrow=ArcArrow(HookHead));
draw(y_axis, arrow=ArcArrow(HookHead));

pair a = (2, 0);
pair b = (6, 0);
path pb = (b-(0, 2)) .. (b+(0, 3));
pair center = (4, 0);
path central = (center .. center - (0, 2));
dot(b);
dot(center);     
path f1=(a+(0, 3)).. (a+(1, 1)) .. (a + (2, -2));
path f2=((a+(2, -2)) .. (a+(3, 0)) .. (a+(4, 3)));

pair m1 = (2a+b) / 3;
pair m2 = (a+2b) / 3;
path pm1 = (m1-(0, 2)) .. (m1+(0, 3));
path pm2 = (m2-(0, 2)) .. (m2+(0, 3));
a = m1;
path pa = (a-(0, 2)) .. (a+(0, 3));
dot(a);

real t1 = intersect(f1, pm1)[0];
real t2 = intersect(f2, pm2)[0];
f1 = subpath(f1, t1, 2);
draw(f1);
draw(f2);

m1 = (2a+b) / 3;
m2 = (a+2b) / 3;
pm1 = (m1-(0, 2)) .. (m1+(0, 3));
pm2 = (m2-(0, 2)) .. (m2+(0, 3));

draw(pm1, dashed+grey);
draw(pm2, dashed+grey);

t1 = intersect(f2, pm1)[0];
t2 = intersect(f2, pm2)[0];
dot(point(f2, t1));
dot(point(f2, t2));

draw(pa, dashed+grey);
draw(pb, dashed+grey);
draw(central, dashed+grey);
label("$a$", position = a, align = S+W);
label("$b$", position = b, align = S+E);
label("$x^*$", position = center, align = S+E);



