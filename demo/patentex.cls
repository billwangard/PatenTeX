%%
%% This is file `patentex.cls',
%% 
%% 
\NeedsTeXFormat{LaTeX2e}

\newif\ifDraft\Draftfalse

\ProvidesClass{patentex}[2017/05/30  Patent Application Class]
\DeclareOption{draft}{\Drafttrue}
\ProcessOptions
\LoadClass{report}[1996/10/24]

\usepackage{ifpdf}

\newcommand{\setTitle}{\def\patentTitle}
\newcommand{\setDate}{\def\patentDate}
\newcommand{\setDocketNumber}{\def\patentNumber}
\newcommand{\DocumentVersion}{\def\patentDocumentVersion}
\newcommand{\setDraftMode}{\PatentDraftModetrue}
\newcommand{\Assignee}[4]{\author{#1}
	                  \def\assigneeName{#1}
	                  \def\assigneeAddress{#2}
	                  \def\assigneeCity{#3}
	                  \def\assigneePhone{#4}
                          \def\assigneeTitle{Assignee}}
\newcommand{\Lawyer}[5]{\def\lawyerName{#1}
	                \def\lawyerAddress{#2}
	                \def\lawyerCity{#3}
	                \def\lawyerPhone{#4}
	                \def\lawyerNumber{#5}
                        \def\lawyerTitle{Attorney}}

% PAGE SIZE SETTINGS
\def\skipline{\vspace{\baselineskip}}


\ifpdf
\usepackage[pdftex]{graphicx}
\usepackage[hyperindex=true,pdfusetitle,bookmarks=true,extension=pdf,linkcolor=black,colorlinks=true,hyperfootnotes=true,pdffitwindow=true,pdftoolbar=true,pdfmenubar=true,debug=false,pagebackref=true ]{hyperref}
%\usepackage[extension=pdf,colorlinks=true,linkcolor=black,backref=true]{hyperref}
%\usepackage[extension=pdf,linkcolor=black,colorlinks=true,debug=false]{hyperref}
\DeclareGraphicsExtensions{ .pdf, .jpg, .tif}
\else
\usepackage[dvips]{graphicx}
\DeclareGraphicsExtensions{ .eps, .jpg }
\fi

\ifDraft
\usepackage[paper=letterpaper,hmargin=1.0in,vmargin=1in,showframe,headheight=20pt]{geometry}
\else
\usepackage[paper=letterpaper,hmargin=1.0in,vmargin=1.5in,headheight=20pt]{geometry}
\fi
\usepackage{titlesec}
\usepackage{lipsum}
\usepackage{amsmath}
\usepackage{memhfixc}
\usepackage{xspace}
\usepackage[utf8]{inputenc}
%\usepackage{palatino}

\usepackage{XCharter}
\usepackage[T1]{fontenc}

% HELVETICA LIKE
%\usepackage[scaled]{helvet}
%\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
%\usepackage[T1]{fontenc}

% SANS SERIF FONT
%\usepackage{tgheros}
% \usepackage[default,osfigures,scale=0.95]{opensans} %% Alternatively
%% use the option 'defaultsans' instead of 'default' to replace the
%% sans serif font only.
%\usepackage[T1]{fontenc}

% \usepackage{tgheros}
% \renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
% \usepackage[T1]{fontenc}


\usepackage{pgf,tikz}
\usepackage{import}
\usepackage[figuresright]{rotating}
\usepackage[usenames,dvipsnames]{pstricks}
\usepackage{pst-grad}
\usepackage{pst-plot}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{setspace}
\usepackage{caption}
\usepackage{fancyhdr}
\captionsetup[figure]{labelsep=none}
\usepackage[normalem]{ulem}
\usetikzlibrary{arrows,positioning,fit,shapes,calc}

% Default double spacing
\doublespacing

% Annotation Labels and References
\newcounter{alabelno}
\DeclareRobustCommand{\alabel}[1]{%
   \refstepcounter{alabelno}%
   \thealabelno\label{#1}}

% Labels for the figure .tex files
\def\alab#1{\alabel{#1}}
\def\flab#1{\underline{\alabel{#1}}}
\def\alabdup#1{\ref{#1}}
\def\flabdup#1{\underline{\ref{#1}}}
\def\figref#1{\textbf{FIG.~\ref{#1}}}

% Annotation Reference (in bold).

\def\bref#1{\textbf{\ref{#1}}}

% Claim labels
\newcounter{clabelno}
\DeclareRobustCommand{\clabel}[1]{%
   \refstepcounter{clabelno}%
   \theclabelno\label{#1}}

% Claim References
\def\cref#1{claim~\ref{#1}}
\def\Cref#1{Claim~\ref{#1}}

\pagestyle{fancy}

% Inventor(s) on Title Sheet
\def\inventorTitleName{\ifnum\the\@inventornumber>1{Inventors}\else{Inventor}\fi}

% List of inventors (in header)
\def\inventorNames{\inventorListName{1}{\ifnum\the\@inventornumber>1{,~et~al}\fi}}

\ifx\patentTitle\undefined\global\edef\patentTitle{~}\fi
\ifx\patentDate\undefined\global\edef\patentDate{~}\fi
\ifx\assigneeName\undefined
\global\edef\assigneeName{~}
\global\edef\confidentialAssignee{~}
\else
\global\edef\confidentialAssignee{Confidential Property of \assigneeName}
\fi
\ifx\assigneeAddress\undefined\global\edef\assigneeAddress{~}\fi
\ifx\assigneeCity\undefined\global\edef\assigneeCity{~}\fi
\ifx\assigneePhone\undefined\global\edef\assigneePhone{~}\fi
\ifx\patentNumber\undefined\global\edef\patentNumber{~}\fi
\ifx\lawyerName\undefined\global\edef\lawyerName{~}\fi
\ifx\lawyerNumber\undefined\global\edef\lawyerNumber{~}\fi
\ifx\lawyerPhone\undefined\global\edef\lawyerPhone{~}\fi
\ifx\lawyerAddress\undefined\global\edef\lawyerAddress{~}\fi
\ifx\lawyerCity\undefined\global\edef\lawyerCity{~}\fi
\ifx\lawyerEmail\undefined\global\edef\lawyerEmail{~}\fi
\ifx\patentDocumentVersion\undefined\global\edef\patentDocumentVersion{0.0}\fi
\ifx\thedate\undefined\global\edef\thedate{\today}\fi
\ifx\lawyerTitle\undefined\global\edef\lawyerTitle{~}\fi
\ifx\assigneeTitle\undefined\global\edef\assigneeTitle{~}\fi

%\pagenumbering{alph}

\renewcommand{\maketitle}{
  \lhead{}
  \chead{}
  \rhead{\patentNumber}
  \lfoot{}
  \cfoot{\thepage}
  \rfoot{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \begin{titlepage}
    \frontPage
    \newpage
    \inventorPage
  \end{titlepage}

  \newpage

   \setcounter{page}{3}

  % Paragraph separation
  \parskip=0.5\baselineskip plus 2 pt minus 2 pt

  \begin{center}\Large\scshape{\bfseries{\patentTitle}}\end{center}

}

\newcommand{\frontPage}
{
\singlespacing
\begin{center}
%\vspace*{2in}
\Large{\textbf{APPLICATION FOR UNITED STATES LETTERS PATENT}}
\vspace*{3in}

\underline{TITLE}

\skipline

{\Large\scshape\bfseries{\patentTitle}}

\vspace*{1 in}
\patentDate

\end{center}

\vfill

\setlength{\parindent}{0em} 
\makebox[0.5\textwidth][l]{\textbf{\lawyerTitle}}%
\makebox[0.5\textwidth][r]{\textbf{\assigneeTitle}}\\%
\makebox[0.5\textwidth][l]{\lawyerName}%
\makebox[0.5\textwidth][r]{\assigneeName}\\%
\makebox[0.5\textwidth][l]{\lawyerAddress}%
\makebox[0.5\textwidth][r]{\assigneeAddress}\\%
\makebox[0.5\textwidth][l]{\lawyerCity}%
\makebox[0.5\textwidth][r]{\assigneeCity}\\%
\makebox[0.5\textwidth][l]{\lawyerPhone}%
\makebox[0.5\textwidth][r]{\assigneePhone}\\%
\makebox[0.5\textwidth][l]{\lawyerNumber}
\setlength{\parindent}{1em}
}

\newcommand{\inventorPage}
{

% Double spacing
\doublespacing

%% INVENTOR OR INVENTORS?
\begin{center}
\textbf{\underline{\MakeUppercase{\inventorTitleName}}}
\end{center}


%%% TABLE OF INVENTORS
\par\noindent
%\makebox[0.04\textwidth][l]{}%
\makebox[0.25\textwidth][l]{\textbf{Name}}%
\makebox[0.55\textwidth][l]{\textbf{Address}}%
\makebox[0.2\textwidth][r]{\textbf{Phone}}%

\normalsize{
  \@inventornumber=1
  \loop
  \expandafter\ifx\csname inventorname \the\@inventornumber\endcsname\relax
   \else
     \par\noindent
     %\makebox[0.04\textwidth][l]{\the\@inventornumber.}%
     \makebox[0.25\textwidth][l]{\inventorListName{\the\@inventornumber}}%
     \makebox[0.55\textwidth][l]{\inventorListAddress{\the\@inventornumber},~\inventorListCity{\the\@inventornumber}}%
     \makebox[0.2\textwidth][r]{\inventorListPhone{\the\@inventornumber}}%
     \advance\@inventornumber by 1
     \repeat
  }

}


% INVENTOR COUNTER
\newcount\@inventornumber\@inventornumber=0

% DEFINE\Inventor{name}{address}{city}{phone}
\def\Inventor#1#2#3#4{\global\advance\@inventornumber by 1 
  \expandafter\edef\csname inventorname \the\@inventornumber\endcsname{#1}
  \expandafter\edef\csname inventoraddress \the\@inventornumber\endcsname{#2}
  \expandafter\edef\csname inventorcity \the\@inventornumber\endcsname{#3}
  \expandafter\edef\csname inventorphone\the\@inventornumber\endcsname{#4}
  }

% Access Inventor array data
\def\inventorListName#1{\csname inventorname #1\endcsname}
\def\inventorListAddress#1{\csname inventoraddress #1\endcsname}
\def\inventorListCity#1{\csname inventorcity #1\endcsname}
\def\inventorListPhone#1{\csname inventorphone#1\endcsname}


% COMMAND TO CREATE A CENTERED FIGURE 
\newcommand{\pfigure}[4]{
\begin{figure}[p]
\centering
\def\svgwidth{#4\textwidth}
\import{#2}{#3}
\vspace*{2\baselineskip}
\caption{}
\vspace*{2\baselineskip}
\label{#1}
\end{figure}
}

% Counter to number paragraphs
\newcounter{parnum}

% Create paragraph counter BOLD [\parnum]
\newcommand{\npar}{%
\par\noindent%
\refstepcounter{parnum}[\textbf{%
\ifnum \value{parnum} < 10 0\else\fi%
\ifnum \value{parnum} < 100 0\else\fi%
\ifnum \value{parnum} < 1000 0\else\fi%
\arabic{parnum}}]%
\indent}%

% use this command to put a comment in the margin
\newcommand{\patentComment}[1]{
\begin{SingleSpace}
\marginpar{\tiny\textcolor{red}{ \begin{flushleft} #1 \end{flushleft}}}
\end{SingleSpace}
}

\renewcommand{\fnum@figure}{\bfseries{\Huge{FIG.~\thefigure}}}

% Section Style
\titleformat*{\section}{\centering\large\bfseries}
\titleformat*{\subsection}{\large\scshape}

\newcommand{\pSection}[1]{\section*{\underline{\MakeUppercase{#1}}}}
\newcommand{\pSubsection}[1]{\subsection*{#1}}


\AtBeginDocument{ 
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}


\endinput
%%
%% End of file `patent.cls'.
