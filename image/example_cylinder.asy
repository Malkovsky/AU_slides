settings.outformat="png";
settings.prc=false;
settings.render=32;

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
currentprojection = perspective(2, -10, 5);

draw((0,0,0)--(2.5,0,0), black, arrow=Arrow3(), L=Label("$x$", position=EndPoint)); //x-axis
draw((0,0,0)--(0,4,0), black, arrow=Arrow3(), L=Label("$y$", position=EndPoint)); //y-axis
draw((0,0,0)--(0,0,2.5), black, arrow=Arrow3(), L=Label("$z$", position=EndPoint)); //z-axis

real alpha = sqrt(2);

real cyl(real x, real y, real z) {
	return x*x+y*y-alpha*alpha;
}

real pl(pair xy) {
	return xy.x + xy.y;
}

surface scyl = implicitsurface(cyl, (-2, -2, -2), (2, 2, 2));
draw(scyl, surfacepen=material(red+opacity(0.4), ambientpen=white));
surface p = surface(pl, (-alpha, -alpha), (alpha, alpha), Spline);
draw(p, surfacepen=material(blue+opacity(0.4), ambientpen=white));
label(rotate(45) * Label("$z=x+y$"), position = (0, -0.5, -0.5));
label("$x^2+y^2=a^2$", position = (-0.5, 1, 1.5));

triple phi(real t) {
	return (alpha * cos(t), alpha * sin(t), alpha * (sin(t)+cos(t)));
}

path3 inter = graph(phi, 0, 2pi, operator ..);
draw(inter, black);
dot((sqrt(2) * alpha / 2, sqrt(2) * alpha / 2, sqrt(2) * alpha));
dot(-(sqrt(2) * alpha / 2, sqrt(2) * alpha / 2, sqrt(2) * alpha));

