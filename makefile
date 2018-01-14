all: pic gradient_descent gradient_optimal KKT_cond iterative_schemes stochastic methods subgradient constraint_methods newton slau linear_algebra intro_analysis simple_methods
pic:
	cd image; make
gradient_descent:
	pdflatex gradient_descent.tex
gradient_optimal:
	pdflatex gradient_optimal.tex
KKT_cond:
	pdflatex KKT_cond.tex
iterative_schemes:
	pdflatex iterative_schemes.tex
stochastic methods:
	pdflatex stochastic_methods.tex
subgradient:
	pdflatex subgradient.tex
constraint_methods:
	pdflatex constraint_methods.tex
newton:
	pdflatex "Newton method.tex"
slau:
	pdflatex matrix_decompositions.tex
linear_algebra:
	pdflatex linear_algebra.tex
intro_analysis:
	pdflatex intro_analysis.tex
simple_methods:
	pdflatex simple_methods.tex

