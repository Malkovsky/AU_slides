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
path x_axis = (-.7, 0) .. (11, 0);
path y_axis = (0, -.7) .. (0, 8);
real[] y;
srand(11);
for(int i = 0; i < 10; ++i) {
	y.push(rand() % 11 * (7 / 11));
}
y.push(0);


real level = (y[3] + y[2]) / 2;
for(int i = 0; i < 10; ++i) {
	if(y[i] >= level) continue;
	fill((i, y[i]) -- (i + 1, y[i]) -- (i+1, level) -- (i, level) -- cycle, lightblue);
}

draw(x_axis, arrow=ArcArrow(HookHead));
draw(y_axis, arrow=ArcArrow(HookHead));

draw((0, y[0]) .. (1, y[0]));
draw((1, min(y[0], y[1])) .. (1, max(y[0], y[1])) );	


for(int i = 1; i < 10; ++i) {
	draw((i, y[i]) .. (i + 1, y[i]));
	draw((i, min(y[i - 1], y[i])) .. (i, min(y[i - 1], y[i])));	
	draw((i + 1, min(y[i], y[i+1])) .. (i + 1, max(y[i], y[i+1])) );	
}

draw((10.5, 0) -- (10.5, y[9]-0.05), arrow=ArcArrow(HookHead));
pathlabel("$\alpha_i$", (10.5, 0) -- (10.5, y[9]-0.05), align = E);
draw((10.5, y[9]-0.05) -- (10.5, 0), arrow=ArcArrow(HookHead));
draw((10.5, level) -- (10.5, y[9]+0.05), arrow=ArcArrow(HookHead));
pathlabel("$x_i$", (10.5, level) -- (10.5, y[9]+0.05), align = E);
draw((10.5, y[9]+0.05) -- (10.5, level), arrow=ArcArrow(HookHead));
label("$1/\mu$", position = (-0.5, level));



