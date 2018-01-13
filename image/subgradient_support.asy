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

unitsize(1cm);
import graph;


pair g(real t) {
	return (t, t*t / 8);
}
pair f(real t) {
	return (t, t*t / 2 - 3 / 2);
}

pair df(real t) {
	return f(-2)+(t, t*(-2));
}
pair dg(real t) {
	return f(-2)+(t, t*(-1/2));
}

path p1 = graph(f, -4, -2);
path p2 = graph(g, -2, 2);
path p3 = graph(f, 2, 4);
label("$x^*$", position=f(-2), align=N+E);

path dp1 = graph(df, -1.5, 1);
path dp2 = graph(dg, -2, 3);
pair x1 = f(-2) + (4, 2) / (-4);
pair x2 = f(-2) + (1, 2) / (-2);
path g1 = f(-2) -- x1 ;
path g2 = f(-2) -- x2 ;
//draw(g1, arrow=ArcArrow(HookHead));
//draw(g2, arrow=ArcArrow(HookHead));
//label("$g_1$", position = x1, align=W+S);
//label("$g_2$", position = x2, align=W+S);
label("$f(x)$", position = f(3.5), align=W);
pathlabel("$f(x^*)+g_1^T(x-x^*)$", dp1, position=0.25, sloped=true, scaled=0.8);
pathlabel("$f(x^*)+g_2^T(x-x^*)$", dp2, position=0.80, sloped=true, scaled=0.75);

dot(f(-2));

draw(p1);
draw(p2);
draw(p3);
draw(dp1, dashed);
draw(dp2, dashed);



