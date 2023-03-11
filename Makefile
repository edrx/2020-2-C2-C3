# This file:
#   http://anggtwu.net/2020-2-C2-C3/Makefile.html
#   http://anggtwu.net/2020-2-C2-C3/Makefile
#          (find-angg "2020-2-C2-C3/Makefile")
# Author: Eduardo Ochs <eduardoochs@gmail.com>
#
# (defun e () (interactive) (find-angg "2020-2-C2-C3/Makefile"))
#
# Created by hand from:
#   (find-angg "2020-2-C2-C3/README.org")
#   (find-fline "/tmp/.filest0.tex")
#   (setq last-kbd-macro (kbd "C-a C-q TAB lualatex SPC C-a <down>"))

all: compile_all_texs

compile_basic_texs:
	lualatex 2020-2-C2-MT1.tex
	lualatex 2020-2-C2-MT2.tex
	lualatex 2020-2-C2-P1.tex
	lualatex 2020-2-C2-P2.tex
	lualatex 2020-2-C2-TFC.tex
	lualatex 2020-2-C2-edovs.tex
	lualatex 2020-2-C2-escadas.tex
	lualatex 2020-2-C2-fracs-parcs.tex
	lualatex 2020-2-C2-ids-trigs.tex
	lualatex 2020-2-C2-int-subst.tex
	lualatex 2020-2-C2-intro.tex
	lualatex 2020-2-C2-somas-1.tex
	lualatex 2020-2-C2-somas-2.tex
	lualatex 2020-2-C2-subst-trig.tex
	lualatex 2020-2-C3-MT1.tex
	lualatex 2020-2-C3-MT2.tex
	lualatex 2020-2-C3-P1.tex
	lualatex 2020-2-C3-P2.tex
	lualatex 2020-2-C3-aceleracao.tex
	lualatex 2020-2-C3-intro.tex
	lualatex 2020-2-C3-plano-tang.tex
	lualatex 2020-2-C3-rcadeia1.tex
	lualatex 2020-2-C3-taylor.tex
	lualatex 2020-2-C3-vetor-tangente.tex

compile_all_texs:
	lualatex 2020-2-C2-MT1.tex
	lualatex 2020-2-C2-MT2.tex
	lualatex 2020-2-C2-P1.tex
	lualatex 2020-2-C2-P2.tex
	lualatex 2020-2-C2-TFC.tex
	lualatex 2020-2-C2-edovs.tex
	lualatex 2020-2-C2-escadas.tex
	lualatex 2020-2-C2-fracs-parcs.tex
	lualatex 2020-2-C2-ids-trigs.tex
	lualatex 2020-2-C2-int-subst.tex
	lualatex 2020-2-C2-intro.tex
	lualatex 2020-2-C2-somas-1.tex
	lualatex 2020-2-C2-somas-2.tex
	lualatex 2020-2-C2-subst-trig.tex
	lualatex 2020-2-C3-MT1.tex
	lualatex 2020-2-C3-MT2.tex
	lualatex 2020-2-C3-P1.tex
	lualatex 2020-2-C3-P2.tex
	lualatex 2020-2-C3-aceleracao.tex
	lualatex 2020-2-C3-intro.tex
	lualatex 2020-2-C3-plano-tang.tex
	lualatex 2020-2-C3-rcadeia1.tex
	lualatex 2020-2-C3-taylor.tex
	lualatex 2020-2-C3-vetor-tangente.tex
	lualatex 2020-2-C2-tudo.tex
	lualatex 2020-2-C3-tudo.tex
