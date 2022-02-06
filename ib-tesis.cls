\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ib-tesis}[2018/10/23 v0.1 IB - UnCuyo]
\LoadClassWithOptions{book}
%------------------Opciones------------------------------------%
\ProcessOptions
%------------------Paquetes------------------------------------%
\RequirePackage[T1]{fontenc}
\RequirePackage[english, spanish]{babel}
\decimalpoint
\RequirePackage[a4paper, inner=4cm, outer=3cm, top=3.5cm, bottom=4cm]{geometry}
\RequirePackage[labelfont={bf}, font={sf}, labelsep=period]{caption}
\RequirePackage{subcaption}
\RequirePackage{hyperref}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{csquotes}
\RequirePackage[style=nature, maxnames=2]{biblatex}
\DeclareNameAlias{author}{family-given}
\DefineBibliographyStrings{spanish}{andothers={\textit{et~al}\adddot}}
\renewcommand*{\multinamedelim}{\addcomma\addspace}
\renewcommand*{\finalnamedelim}{\addcomma\addspace}
\renewcommand*{\revsdnamepunct}{}
\setcounter{smartand}{0}
\renewbibmacro{in:}{}
\RequirePackage{siunitx}
\RequirePackage{physics}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{multirow}
\RequirePackage{pgffor}
\RequirePackage{pdflscape}
\RequirePackage{rotating}
\RequirePackage{epigraph}
\RequirePackage{contour}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
%------------------Formato-------------------------------------%
\DeclareRobustCommand\es@scroman{\@firstofone}
\def\cleardoublepage{
    \clearpage
    \if@twoside 
        \ifodd\c@page\else
            \hbox{}\thispagestyle{empty}\newpage
            \if@twocolumn\hbox{}\newpage\fi
        \fi
    \fi
}
%------------------Comandos------------------------------------%
\def\trabajo#1{\gdef\@trabajo{#1}}
\def\carrera#1{\gdef\@carrera{#1}}
\def\titulo#1{\gdef\@titulo{#1}}
\def\orientacion#1{\gdef\@orientacion{#1}}
\def\autor#1{\gdef\@autor{#1}}
\def\grado#1{\gdef\@grado{#1}}
\def\director#1{\gdef\@director{#1}}
\def\codirector#1{\gdef\@codirector{#1}}
\def\cotutor#1{\gdef\@cotutor{#1}}
\def\juradoa#1{\gdef\@juradoa{#1}}
\def\juradob#1{\gdef\@juradob{#1}}
\def\juradoc#1{\gdef\@juradoc{#1}}
\def\institucion#1{\gdef\@institucion{#1}}
\def\laboratorio#1{\gdef\@laboratorio{#1}}
\def\palabrasclave#1{\gdef\@palabrasclave{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\fecha#1{\gdef\@fecha{#1}}
%------------------\maketitle----------------------------------%
\renewcommand\maketitle{
    \begin{titlepage}
        \large
        \begin{center}
            {\Large \@trabajo\\}
            \vskip 1em
            \@orientacion
            \vskip 4em
            {\Large \textbf{\@titulo\\}}
            \vskip 2em
            {\Large \@autor\\}
            \vskip 4em
            {
                \begin{tabular}[t]{c}
                    \@director\\ \directorname                    
                \end{tabular}
                \ifx\@codirector\undefined{}
                \else
                {
                    \hfill
                    \begin{tabular}[t]{c}
                        \@codirector\\ \codirectorname                   
                    \end{tabular}
                }
                \fi
                \ifx\@cotutor\undefined{}
                \else
                {
                    \hfill
                    \begin{tabular}[t]{c}
                        \@cotutor\\ \cotutorname                   
                    \end{tabular}
                }
                \fi
                \\
            }
            \vskip 4em
            {
                \@juradoa\\
                \@juradob\\
                \@juradoc\\  
                \juradoname\\
            }
            \vskip 4em \vfill
            \@laboratorio
            \vskip 1em
            \@institucion
            \vskip 1em
            \@fecha
        \end{center}
    \end{titlepage}
    \global\let\maketitle\relax
    \hypersetup
    {
        pdfborder={0 0 0},
        pdfauthor={\@autor},
        pdftitle={\@carrera},
        pdfsubject={\@titulo},
        pdfkeywords={\@palabrasclave},
    }
}
%------------------Ambientes-----------------------------------%
\newcommand\dedicatoria[1]
{
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{10em}%
	\begin{flushright}
		\large
		\begin{tabular}[t]{l}
			#1 
		\end{tabular}
	\end{flushright}
	\cleardoublepage
}
\newenvironment{erratas}{\chapter{\errataname}}{}
\newenvironment{resumen}
{\chapter{\resumenname}}
{
	\vfill
	{\noindent \textbf{\palabrasclavename:} \MakeUppercase \@palabrasclave}
}
\newenvironment{abstract}
{
	\selectlanguage{english}
	\chapter{\abstractname}
	\noindent
    {\centering\bfseries\large\@title\par}
    \vspace{1em}
}
{	
	\vfill
	{\noindent  \textbf{\keywordsname:} \MakeUppercase \@keywords}
	\selectlanguage{spanish}
}
\newenvironment{publicaciones}{\chapter{\publicacionesname}}{}
\newenvironment{agradecimientos}{\chapter{\agradecimientosname}}{}

%------------------Nombres en Español--------------------------%
\newcommand\errataname{Fé de erratas}
\newcommand\resumenname{Resumen}
\newcommand\abstractname{Abstract}
\newcommand\agradecimientosname{Agradecimientos}
\newcommand\publicacionesname{Publicaciones asociadas}

\newcommand\keywordsname{Keywords}
\newcommand\palabrasclavename{Palabras clave}

\newcommand\directorname{DIRECTORA}
\newcommand\codirectorname{CO-DIRECTOR}
\newcommand\cotutorname{CO-TUTOR}
\newcommand\juradoname{JURADO}

\addto\captionsspanish
{
	\def\contentsname{Contenidos}
	\def\listfigurename{Índice de figuras}
	\def\listtablename{Índice de tablas}
	\def\figurename{Figura}
	\def\tablename{Tabla}
	\def\listsymbolname{Glosario de símbolos}
	\def\listacronymname{Índice de abreviaturas}
}
\endinput