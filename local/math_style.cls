\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math_style}[2026/03/08 math style LaTeX class]

%%%%%%%%%%%%%%%%%
%generale part
%%%%%%%%%%%%%%%%%

\LoadClass{general_style}

%%%%%%%%%%%%%%%
% math part
%%%%%%%%%%%%%%%

% general appearence
\RequirePackage{setspace}
\doublespacing


% define titles apparence
\RequirePackage[bf,raggedright]{titlesec}
\titleclass{\part}{top}
\titleformat{\part}[block]{}{}{0pt}{\thispagestyle{fancy}\centering\Huge\bfseries}

\renewcommand\thesection{\Roman{section}.}
\titleclass{\section}{top}
\titleformat{\section}[block]{}{}{0pt}{\thispagestyle{fancy}\centering\Huge\bfseries}

\renewcommand\thesubsection{\arabic{subsection}.}
\titlespacing*{\subsection}{-40pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\renewcommand\thesubsubsection{\thesubsection\arabic{subsubsection}.}
\titlespacing*{\subsubsection}{-30pt}{3.25ex plus 1ex minus .2ex}{0.5ex plus .2ex}

\RequirePackage[titles]{tocloft}
\addtolength{\cftsecnumwidth}{15pt}


% liens hypertextes
\RequirePackage{hyperref} %%% à mettre en dernier !!! %%%


% cover
\newcommand{\Title}{	
	\begin{flushleft}	
		\begin{LARGE}	
			\textbf{\textit{Mathemathiques}}
		\end{LARGE}
	\end{flushleft}
}

\newcommand{\ThemeCours}[1]{	
	% #1 titre
	% tracé d'une ligne horizontale
	% titre en Huge, couleur bleue
	% seconde ligne horizontale
	\noindent\rule[2mm]{0.99\linewidth}{0.5mm} 
	\begin{Huge}	
		\textcolor{blue}{\textit{#1}}
	\end{Huge}
	\noindent\rule[0pt]{0.99\linewidth}{0.5mm} 
}

\newcommand{\AuteurCours}[1]{	
	% #1 : auteur
	\begin{flushright}	
		\begin{Large}	
			\textit{#1}
		\end{Large}
	\end{flushright}
}

\newcommand{\Cover}[4][Mael GOODALL]{	
	% #1 : auteur
	% #2 : titre 
	\begin{titlepage}	
		\Title{}
		
		\begin{center}	
			\vspace*{4cm}
			\ThemeCours{#2}
			\AuteurCours{#1}
		\end{center}
		
		\tableofcontents
		\thispagestyle{empty}
	\end{titlepage}
	%\clearpage
	\setcounter{page}{1}
	% éliminer le numéro de page
	%	\thispagestyle{empty}
}

\newcommand{\TableDesMatieres}{	
	\tableofcontents
	\thispagestyle{empty}
	\clearpage
	\setcounter{page}{1}
}
