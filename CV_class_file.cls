\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%-----------------------------------------------------------------------	-----------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\usepackage{pstricks}

\usepackage{fontawesome5}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 DEFINING COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{mainpurple}{HTML}{884EA0}
\definecolor{maingray}{HTML}{85929E}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}


\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\newfontfamily\headingfont[Path = ]{segoeuib.ttf}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{headercolor} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{  \justifying#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
   
% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainpurple,mainpurple,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\programmingSkills[1]{ 
	\renewcommand{\programmingSkills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.35) {\x};
			}
		\end{tikzpicture}
	}
}

\newcommand\languageSkills[1]{ 
	\renewcommand{\languageSkills}{
		\begin{tikzpicture}
		\foreach [count=\i] \x/\y in {#1}{
			\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
			\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
			\node [above right] at (0,\i+0.35) {\x};
		}
		\end{tikzpicture}
	}
}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=sidecolor, anchor=north, minimum width=9.2cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}
	
	%------------------------------------------------
	
	\begin{textblock}{6}(0.55, 0.2)
	    \begin{center}
		%------------------------------------------------
		
		\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
		\clip (600/2, 567/2) circle (567/2);
		
		\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
		\end{tikzpicture}
		
		%------------------------------------------------
		
		\vspace{2mm}
		{\Huge\color{mainblue}\hspace{5mm}\cvname}
		\vspace{2mm}
		
		%------------------------------------------------
		
		{\Large\color{headercolor}\hspace{0.1mm}\cvjobtitle}
		\vspace{0.5cm}
		\end{center}
		%------------------------------------------------
		
		\renewcommand{\arraystretch}{2}
		\begin{tabular}{p{0.4cm} @{\hskip 0.5cm}p{20cm}}
      \ifthenelse{\equal{\cvsite}{}}{}{
            {$
              \begin{array}{l}
              \hspace{-0.5mm}  \textnormal{\textcolor{test}{\Large \faLink}}
              \end{array}
              $}
            & \cvsite\\}
            
      \ifthenelse{\equal{\cvmail}{}}{}{
            {$
              \begin{array}{l}
              \hspace{-0.5mm} \Large \textnormal{\textcolor{yt}{\faEnvelope}}
              \end{array}
              $} 
            & \href{mailto:\cvmail}{\cvmail} \\}
            
      \ifthenelse{\equal{\cvnumberphone}{}}{}{
      		{$
              \begin{array}{l}
              \hspace{-0.5mm} \Large \textnormal{\faPhone} 
              \end{array}
              $} 
            & \cvnumberphone\\}
      
       \ifthenelse{\equal{\cvlinkedin}{}}{}{
            {$
              \begin{array}{l}
              \hspace{-0.5mm} \Large \textnormal{\textcolor{linkedin}{\faLinkedin}}
              \end{array}
              $} & \href{https://www.linkedin.com/in/\cvlinkedin/}{\cvlinkedin} \\
            }
        \ifthenelse{\equal{\cvgithub}{}}{}{
		{$
		\begin{array}{l}
		\hspace{-0.5mm} \Large \textnormal{\faGithub}
		\end{array}
		$} & \href{https://www.github.com/\cvgithub}{\cvgithub} \\
		}   
    \end{tabular}
    

    %------------------------------------------------
    \vspace{0.7cm}

    {\large \textbf{\color{headercolor}Programming Skills}}

    \programmingSkills

    \vspace{0.7cm}

    {\large \textbf{\color{headercolor}Languages}}

    \languageSkills

    \vspace{0.7cm}

    \renewcommand{\arraystretch}{1.6}
    
    \vspace{0.5cm}

    
  \end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------


\renewcommand{\section}[1]{
  \par\vspace{\parskip}
	{%
		\LARGE\headingfont\color{mainblue}%
		\@sectioncolor #1%
	}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

\pagestyle{empty}

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[6]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#3}% 
		\hfill%
		{\footnotesize#4}%
        }\\%
    #2&\parbox[t]{0.83\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}


\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.1cm,nohead,nofoot]{geometry}


%%% Second page sidebar


\newcommand{\makeseconda}{

\begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=sidecolor, anchor=north, minimum width=9.2cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
\end{tikzpicture}

%------------------------------------------------

\begin{textblock}{6}(0.55, 0.2)
			
%------------------------------------------------



\end{textblock}
}