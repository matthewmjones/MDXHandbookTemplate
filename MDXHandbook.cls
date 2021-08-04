%%% A Class for Module Handbooks
%%% Written by Matthew M. Jones
%%% 21 June 2018
%%%
%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MDXHandbook}[2021/08/04]

\LoadClass[12pt,twoside]{article}

\RequirePackage[a4paper, margin=1in]{geometry}
\RequirePackage{xkeyval}
\RequirePackage{tabularx}
\RequirePackage{rotating}
\RequirePackage{array}
\RequirePackage{dcolumn}
\RequirePackage{pdflscape}

\RequirePackage{fancyhdr}
\PassOptionsToPackage{hyphens}{url}\RequirePackage{hyperref}
%\RequirePackage{hyperref}

\RequirePackage{etoolbox}

\RequirePackage[table]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\RequirePackage{graphicx}

\RequirePackage{arev}

\RequirePackage{ifxetex,ifluatex}

\ifluatex
	\RequirePackage{fontspec}
	\setmainfont{Arial}

	\newfontfamily{\@facultyfont}[SizeFeatures = {Size = 26}]{Arial Bold}
	\newfontfamily{\@deptfont}[SizeFeatures = {Size = 22}]{Arial}
	\newfontfamily{\@mcfont}[SizeFeatures = {Size = 26}]{Arial}
	\newfontfamily{\@mtfont}[SizeFeatures = {Size = 36}]{Arial Bold}
	\newfontfamily{\@mlfont}[SizeFeatures = {Size = 18}]{Arial}
	\newfontfamily{\@genfont}[SizeFeatures = {Size = 18}]{Arial}
	
\else
	\ifxetex
	\RequirePackage{fontspec}
	\setmainfont{Arial}
	
	\newfontfamily{\@facultyfont}[SizeFeatures = {Size = 26}]{Arial Bold}
	\newfontfamily{\@deptfont}[SizeFeatures = {Size = 22}]{Arial}
	\newfontfamily{\@mcfont}[SizeFeatures = {Size = 26}]{Arial}
	\newfontfamily{\@mtfont}[SizeFeatures = {Size = 36}]{Arial Bold}
	\newfontfamily{\@mlfont}[SizeFeatures = {Size = 18}]{Arial}
	\newfontfamily{\@genfont}[SizeFeatures = {Size = 18}]{Arial}
	
	\else
	\RequirePackage{moresize}
	\RequirePackage{helvet}
	\renewcommand{\familydefault}{\sfdefault}
	
	\newcommand{\@facultyfont}{\bfseries\Large}
	\newcommand{\@deptfont}{\large}	
	\newcommand{\@mcfont}{\huge}
	\newcommand{\@mtfont}{\bfseries \HUGE}
	\newcommand{\@mlfont}{\Large}
	\newcommand{\@genfont}{\large}
	
	\fi
\fi
%%%%%%%%%%%%%%%% Colour definitions %%%%%%%%%%%%%%%%%%%%%%

\definecolor{MDXCorporateLightGrey}{RGB}{175,175,175}
\definecolor{MDXCorporateDarkGrey}{RGB}{110,110,110}
\definecolor{MDXCorporateBlack}{RGB}{0,0,0}
\definecolor{MDXCorporateRed}{RGB}{213,43,30}
\definecolor{MDXCorporateRedDark}{RGB}{196,22,28}

\definecolor{MDXBrightsYellow}{RGB}{254,209,0}
\definecolor{MDXBrightsOrange}{RGB}{233,131,0}
\definecolor{MDXBrightsPink}{RGB}{202,0,93}
\definecolor{MDXBrightsPurple}{RGB}{142,37,141}

\definecolor{MDXBrightsLightBlueA}{RGB}{143,202,231}
\definecolor{MDXBrightsLightBlueB}{RGB}{61,183,228}
\definecolor{MDXBrightsBlue}{RGB}{0,101,189}
\definecolor{MDXBrightsDarkBlue}{RGB}{0,65,101}

\definecolor{MDXBrightsLightGreen}{RGB}{162,173,0}
\definecolor{MDXBrightsGreen}{RGB}{122,184,0}
\definecolor{MDXBrightsBlueGreen}{RGB}{0,173,131}
\definecolor{MDXBrightsDarkGreen}{RGB}{3,86,66}

\definecolor{MDXNeutralsPinkGrey}{RGB}{221,185,154}
\definecolor{MDXNeutralsLightGrey}{RGB}{219,206,172}
\definecolor{MDXNeutralsGrey}{RGB}{170,163,142}
\definecolor{MDXNeutralsBlue}{RGB}{172,192,198}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@modulecode{[MODULE CODE]}
\newcommand{\modulecode}[1]{\global\def\@modulecode{#1}\hypersetup{pdfkeywords = {#1}}}

\def\@moduletitle{[Module Title]}
\newcommand{\moduletitle}[1]{\global\def\@moduletitle{#1}\hypersetup{pdftitle = {#1}}}

\def\@moduleleader{[Name]}
\newcommand{\moduleleader}[1]{\global\def\@moduleleader{#1}\hypersetup{pdfauthor = {#1}}}

\def\@term{AY (2021)}
\newcommand{\term}[1]{\global\def\@term{#1}}

\def\@duration{24 weeks}
\newcommand{\duration}[1]{\global\def\@duration{#1}}

\def\@version{1}
\newcommand{\version}[1]{\global\def\@version{#1}}

\def\@dept{Design Engineering and Mathematics}
\newcommand{\dept}[1]{\def\@dept{#1}}

\setlength{\baselineskip}{20pt}

\renewcommand{\maketitle}{%
	%%% Set pdf information
		
	\begin{titlepage}
		\begin{tikzpicture}[remember picture, overlay]
			\draw (current page.north east) ++ (-1in, -1in) node [anchor = north east] {\includegraphics[width = 2.63in]{MU_LDN_Logo.pdf}};	
			
			\draw (current page.center) ++ (0cm,4cm) node [text width = .8\pagewidth, align = center] {\textcolor{MDXCorporateRed}{\@facultyfont Science and Technology}};
			\draw (current page.center) ++ (0cm,2cm) node [align = center] {\textcolor{MDXCorporateDarkGrey}{\@deptfont \@dept}};
		
			\draw (current page.center) ++ (0,-3.5cm) node {\textcolor{MDXCorporateDarkGrey}{\@mcfont\@modulecode}};			
			\draw (current page.center) ++ (0,-2cm) node {\textcolor{MDXCorporateRed}{\parbox[][][c]{.9\textwidth}{\centering\@mtfont\@moduletitle}}};
			
			\draw (current page.south west) ++ (2cm, 5.6cm) node [anchor = west] {\@mlfont Module Leader: \@moduleleader};
			\draw (current page.south west) ++ (2cm,4.4cm) node [anchor = west] {\@genfont Term: \@term};			
			\draw (current page.south west) ++ (2cm, 3.2cm) node [anchor = west]  {\@genfont Duration of the module: \@duration};			
			\draw (current page.south west) ++ (2cm, 2cm) node  [anchor = west] {\@genfont Document version: \@version};

		\end{tikzpicture}
	\end{titlepage}%
}

\setlength{\parindent}{\z@}
\setlength{\parskip}{8pt}

%%%%%%%%%%% Set headers and footers %%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhead{}
\fancyhead[R]{\@moduletitle\quad\@modulecode\quad\includegraphics[height=0.75cm]{MU_LDN_Logo.pdf}}
\fancyfoot{} % clear all footer fields
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}


%%%%%%%%%%% \moduleStaf[]{Name} %%%%%%%%%%%%%%%%%%%%%

\def\@photo{NO PHOTO}
\define@key{tm}{role}{\def\@role{#1}}
\define@key{tm}{telephone}{\def\@telephone{#1}}
\define@key{tm}{tel}{\def\@telephone{#1}}
\define@key{tm}{photo}{\def\@photo{\includegraphics[width = .2\textwidth]{#1}}}
\define@key{tm}{room}{\def\@room{#1}}
\define@key{tm}{email}{\def\@email{#1}}
\setkeys{tm}{role=,telephone=,room=,email=}

\newcommand{\moduleStaff}[2][]{%
\setkeys{tm}{role=,telephone=,room=,email=}
\def\@photo{NO PHOTO}
\setkeys{tm}{#1}%
\begin{center}
	\begin{tabular}{|p{.2\textwidth}|p{.8\textwidth}|}
	\hline
	\rowcolor{MDXCorporateRed}\multicolumn{2}{c}{\textcolor{white}{\textbf{#2}}}\\
	\hline \raisebox{-.5\totalheight}{\@photo}%
						 	&	\def\arraystretch{1.75}%
						 		\begin{tabularx}{.8\textwidth}{p{.2\textwidth}|X}
									Role:						&		\@role			\\
									\hline Room:			&		\@room		\\
									\hline Email:			&		\@email			\\
									\hline Telephone:	&		\@telephone			\\								
								\end{tabularx}%
								\def\arraystretch{1}\\
	\hline
	\end{tabular}
\end{center}}

%%%%%%%%%%%%%%%%%% Twenty point grade scales %%%%%%%%%%%%%%%%%%%%%%

\newlength{\@tpgtablewidth}

\define@key{tpg}{subject}{	\def\@subj{#1}}
\define@key{tpg}{width}{\setlength{\@tpgtablewidth}{#1}}
\define@key{tpg}{level}{\def\@level{#1}}
\setkeys{tpg}{subject = MSO, width = \textheight, level = UG}

\newcommand{\TwentyPointGradeTable}[1][]{%
\setkeys{tpg}{subject = MSO, width = \textheight, level = UG}
\setkeys{tpg}{#1}
\ifdefstring{\@subj}{MSO}{
	\ifdefstring{\@level}{UG}{ %% UG MSO Table
		\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering\arraybackslash}X|}
\hline \rowcolor{MDXCorporateLightGrey}	

20-point scale & General scale & General scale (full ranges) & Percentage used for aggregation purposes only

\textbf{(for areas marking directly to the 20 point scale on modules with multiple assessment components)} \\\hline
1	& 80\% - 100\% & 79.50\% - 100\%   & 90\% \\\hline
2	& 76\% - 79\%  & 75.50\% - 79.49\% & 77.5\% \\\hline
3	& 73\% - 75\%  & 72.50\% - 75.49\% & 74\% \\\hline
4	& 70\% - 72\%  & 69.50\% - 72.49\% & 71\% \\\hline
5	& 67\% - 69\%  & 66.50\% - 69.49\% & 68\% \\\hline
6   & 65\% - 66\%  & 64.50\% - 66.49\% & 65.5\% \\\hline
7	& 62\% - 64\%  & 61.50\% - 64.49\% & 63\% \\\hline
8	& 60\% - 61\%  & 59.50\% - 61.49\% & 60.5\% \\\hline
9	& 57\% - 59\%  & 56.50\% - 59.49\% & 58\% \\\hline
10	& 55\% - 56\%  & 54.50\% - 56.49\% & 55.5\% \\\hline
11	& 52\% - 54\%  & 51.50\% - 54.49\% & 53\% \\\hline
12	& 50\% - 51\%  & 49.50\% - 51.49\% & 50.5\% \\\hline
13	& 47\% - 49\%  & 46.50\% - 49.49\% & 48\% \\\hline
14	& 45\% - 46\%  & 44.50\% - 46.49\% & 45.5\% \\\hline
15	& 42\% - 44\%  & 41.50\% - 44.49\% & 43\% \\\hline
16	& 40\% - 41\%  & 39.50\% - 41.49\% & 40.5\% \\\hline
17	& 35\% - 39\%  & 34.50\% - 39.49\% & 37\% \\\hline
18	& 30\% - 34\%  & 29.50\% - 34.49\% & 32\% \\\hline
19	& 0\% - 29\%   & 0.01\% - 29.49\% & 15\% \\\hline
20	& Non-participation & 0\% & 0\% (non-submission of a component)\\\hline
\end{tabularx}
	}{ %% PG MSO Table
	\def\arraystretch{1.25}		
	\begin{tabularx}{\@tpgtablewidth}{|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering\arraybackslash}X|}
\hline \rowcolor{MDXCorporateLightGrey}	

20-point scale & General scale & General scale (full ranges) & Percentage used for aggregation purposes only

\textbf{(for areas marking directly to the 20 point scale on modules with multiple assessment components)} \\\hline
1	& 80\% - 100\% & 79.50\% - 100\%   & 90\% \\\hline
2	& 76\% - 79\%  & 75.50\% - 79.49\% & 77.5\% \\\hline
3	& 73\% - 75\%  & 72.50\% - 75.49\% & 74\% \\\hline
4	& 70\% - 72\%  & 69.50\% - 72.49\% & 71\% \\\hline
5	& 67\% - 69\%  & 66.50\% - 69.49\% & 68\% \\\hline
6   & 65\% - 66\%  & 64.50\% - 66.49\% & 65.5\% \\\hline
7	& 62\% - 64\%  & 61.50\% - 64.49\% & 63\% \\\hline
8	& 60\% - 61\%  & 59.50\% - 61.49\% & 60.5\% \\\hline
9	& 57\% - 59\%  & 56.50\% - 59.49\% & 58\% \\\hline
10	& 55\% - 56\%  & 54.50\% - 56.49\% & 55.5\% \\\hline
11	& 52\% - 54\%  & 51.50\% - 54.49\% & 53\% \\\hline
12	& 50\% - 51\%  & 49.50\% - 51.49\% & 50.5\% \\\hline
13	& 47\% - 49\%  & 46.50\% - 49.49\% & 48\% \\\hline
14	& 45\% - 46\%  & 44.50\% - 46.49\% & 45.5\% \\\hline
15	& 42\% - 44\%  & 41.50\% - 44.49\% & 43\% \\\hline
16	& 40\% - 41\%  & 39.50\% - 41.49\% & 40.5\% \\\hline
17	& 35\% - 39\%  & 34.50\% - 39.49\% & 37\% \\\hline
18	& 30\% - 34\%  & 29.50\% - 34.49\% & 32\% \\\hline
19	& 0\% - 29\%   & 0.01\% - 29.49\% & 15\% \\\hline
20	& Non-participation & 0\% & 0\% (non-submission of a component)\\\hline
\end{tabularx}
	}
}{}

\ifdefstring{\@subj}{PDE}{
	\ifdefstring{\@level}{UG}{%% PDE UG 
	\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering\arraybackslash}X|}
\hline \rowcolor{MDXCorporateLightGrey}	

20-point scale & General scale & General scale (full ranges) & Percentage used for aggregation purposes only

\textbf{(for areas marking directly to the 20 point scale on modules with multiple assessment components)} \\\hline
1	& 80\% - 100\% & 79.50\% - 100\%   & 90\% \\\hline
2	& 76\% - 79\%  & 75.50\% - 79.49\% & 77.5\% \\\hline
3	& 73\% - 75\%  & 72.50\% - 75.49\% & 74\% \\\hline
4	& 70\% - 72\%  & 69.50\% - 72.49\% & 71\% \\\hline
5	& 67\% - 69\%  & 66.50\% - 69.49\% & 68\% \\\hline
6   & 65\% - 66\%  & 64.50\% - 66.49\% & 65.5\% \\\hline
7	& 62\% - 64\%  & 61.50\% - 64.49\% & 63\% \\\hline
8	& 60\% - 61\%  & 59.50\% - 61.49\% & 60.5\% \\\hline
9	& 57\% - 59\%  & 56.50\% - 59.49\% & 58\% \\\hline
10	& 55\% - 56\%  & 54.50\% - 56.49\% & 55.5\% \\\hline
11	& 52\% - 54\%  & 51.50\% - 54.49\% & 53\% \\\hline
12	& 50\% - 51\%  & 49.50\% - 51.49\% & 50.5\% \\\hline
13	& 47\% - 49\%  & 46.50\% - 49.49\% & 48\% \\\hline
14	& 45\% - 46\%  & 44.50\% - 46.49\% & 45.5\% \\\hline
15	& 42\% - 44\%  & 41.50\% - 44.49\% & 43\% \\\hline
16	& 40\% - 41\%  & 39.50\% - 41.49\% & 40.5\% \\\hline
17	& 35\% - 39\%  & 34.50\% - 39.49\% & 37\% \\\hline
18	& 30\% - 34\%  & 29.50\% - 34.49\% & 32\% \\\hline
19	& 0\% - 29\%   & 0.01\% - 29.49\% & 15\% \\\hline
20	& Non-participation & 0\% & 0\% (non-submission of a component)\\\hline
\end{tabularx}
	}{ %% PDE PG
	\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering}p{.25\@tpgtablewidth}|>{\centering\arraybackslash}X|}
\hline \rowcolor{MDXCorporateLightGrey}	

20-point scale & General scale & General scale (full ranges) & Percentage used for aggregation purposes only

\textbf{(for areas marking directly to the 20 point scale on modules with multiple assessment components)} \\\hline
1	& 80\% - 100\% & 79.50\% - 100\%   & 90\% \\\hline
2	& 76\% - 79\%  & 75.50\% - 79.49\% & 77.5\% \\\hline
3	& 73\% - 75\%  & 72.50\% - 75.49\% & 74\% \\\hline
4	& 70\% - 72\%  & 69.50\% - 72.49\% & 71\% \\\hline
5	& 67\% - 69\%  & 66.50\% - 69.49\% & 68\% \\\hline
6   & 65\% - 66\%  & 64.50\% - 66.49\% & 65.5\% \\\hline
7	& 62\% - 64\%  & 61.50\% - 64.49\% & 63\% \\\hline
8	& 60\% - 61\%  & 59.50\% - 61.49\% & 60.5\% \\\hline
9	& 57\% - 59\%  & 56.50\% - 59.49\% & 58\% \\\hline
10	& 55\% - 56\%  & 54.50\% - 56.49\% & 55.5\% \\\hline
11	& 52\% - 54\%  & 51.50\% - 54.49\% & 53\% \\\hline
12	& 50\% - 51\%  & 49.50\% - 51.49\% & 50.5\% \\\hline
13	& 47\% - 49\%  & 46.50\% - 49.49\% & 48\% \\\hline
14	& 45\% - 46\%  & 44.50\% - 46.49\% & 45.5\% \\\hline
15	& 42\% - 44\%  & 41.50\% - 44.49\% & 43\% \\\hline
16	& 40\% - 41\%  & 39.50\% - 41.49\% & 40.5\% \\\hline
17	& 35\% - 39\%  & 34.50\% - 39.49\% & 37\% \\\hline
18	& 30\% - 34\%  & 29.50\% - 34.49\% & 32\% \\\hline
19	& 0\% - 29\%   & 0.01\% - 29.49\% & 15\% \\\hline
20	& Non-participation & 0\% & 0\% (non-submission of a component)\\\hline
\end{tabularx}
	}
}{}
}

