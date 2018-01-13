settings.outformat="png";
settings.prc=false;
settings.render=16;

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
import three;
import smoothcontour3;
import graph3;

size(8cm, 0);
defaultpen(fontsize(7pt));

currentprojection = perspective(4, 20, 20);


real alpha = sqrt(2);

real circ1(real x, real y, real z) {
	return (x-2)*(x-2)/2+y*y+z*z-9;
}

real circ2(real x, real y, real z) {
	return (x+2)*(x+2)/2+y*y+z*z-9;
}
real alpha = sqrt(7);


surface c1 = implicitsurface(circ1, (-4, -3, -3), (8, 3, 3));
draw(c1, surfacepen=material(red+opacity(0.4), ambientpen=white));
label("$g_1(x)=0$", position=(-4, 0, 0));
surface c2 = implicitsurface(circ2, (-8, -3, -3), (4, 3, 3));
draw(c2, surfacepen=material(blue+opacity(0.4), ambientpen=white));
label("$g_2(x)=0$", position=(4, 0, 0));

triple phi(real t) {
	return (0, alpha * sin(t), alpha * cos(t));
}

path3 inter = graph(phi, 0, 2pi, operator ..);
draw(inter, black);
triple x_star = (0, 0, alpha);
dot(x_star);

triple gr1(triple p) {
	return (p.x+2, 2 * p.y, 2 * p.z);
}
triple gr2(triple p) {
	return (p.x-2, 2 * p.y, 2 * p.z);
}

real grp1(triple p) {
	triple g = gr1(x_star);
	return g.x * (p.x - x_star.x) + g.y * (p.y - x_star.y) + g.z * (p.z - x_star.z);
}

real grp2(triple p) {
	triple g = gr2(x_star);
	return g.x * (p.x - x_star.x) + g.y * (p.y - x_star.y) + g.z * (p.z - x_star.z);
}                 
surface p1 = implicitsurface(grp1, x_star-(2, 2, 2), x_star+(2, 2, 2));
draw(p1, surfacepen=material(grey+opacity(0.4), ambientpen=white));
surface p2 = implicitsurface(grp2, x_star-(2, 2, 2), x_star+(2, 2, 2));
draw(p2, surfacepen=material(grey+opacity(0.4), ambientpen=white));

draw(x_star -- x_star+gr1(x_star)/3, black, arrow=Arrow3(), L=Label("$\nabla g_1(x^*)$", position=EndPoint));
draw(x_star -- x_star+gr2(x_star)/3, black, arrow=Arrow3(), L=Label("$\nabla g_2(x^*)$", position=EndPoint));

draw(x_star - (0, 2, 0) -- x_star + (0, 2, 0));

