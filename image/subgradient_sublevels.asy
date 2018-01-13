settings.outformat = "pdf";

void pathlabel(picture pic = currentpicture, Label L, path g,
	real position=0.5, align align=NoAlign, bool sloped=false,
	pen p=currentpen, filltype filltype=NoFill, real scaled=1, real rotated=0) {
	Label L2 = Label(L, align, p, filltype,
	position=Relative(position));	
	if (sloped) {
		pair direction = dir(g, reltime(g, position));
		real angle = degrees(atan2(direction.y, direction.x));
		L2 = rotate(angle)*L2;
	}
	label(pic, scale(scaled)*rotate(rotated)*L2, g);
}

unitsize(2cm);
import graph;

pair f1(real t) {
	return (3 * cos(t) - 1, 2 * sin(t));
}

pair f2(real t) {
	return (3 * cos(t) + 1, 2 * sin(t));
}

path p1 = graph(f1, -acos(1.0/3), +acos(1.0/3));
path p2 = graph(f2, pi-acos(1.0/3), pi+acos(1.0/3));

draw(p1);
draw(p2);
fill(p1--p2--cycle, lightgrey);
label("$f(x)\leq \alpha$", position=(0,0)); 

pair x_star=relpoint(p1, 1);
dot(x_star);

label("$x^*$", position=x_star, align=S);

pair dir1 = dir(p1);
path dp1 = x_star-dir1*2 -- x_star+dir1*2;
draw(dp1, dashed);

pair dir2 = dir(p2, 1);
path dp2 = x_star-dir2*2 -- x_star+dir2*2;
draw(dp2, dashed);

path g1 = x_star -- x_star+ rotate(-90)*dir1;
path g2 = x_star -- x_star+ rotate(-90)*dir2;

draw(g1, arrow=ArcArrow(HookHead));
draw(g2, arrow=ArcArrow(HookHead));

label("$g_1$", position = relpoint(g1, 1), align=E);
label("$g_2$", position = relpoint(g2, 1), align=W);

pathlabel("$g_1^T(x-x^*)=0$", dp1, position=0.25, sloped=true, scaled=0.8, rotated=180);
pathlabel("$g_2^T(x-x^*)=0$", dp2, position=0.75, sloped=true, scaled=0.8, rotated=180);




                                           


