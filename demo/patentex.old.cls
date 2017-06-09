%%
%% This is file `patentex.cls',
%% 
%% 
\NeedsTeXFormat{LaTeX2e}

\newif\ifPatentDraftMode\PatentDraftModefalse

\ProvidesClass{patentex}[2017/05/30  Patent Application Class]
\DeclareOption{draft}{\PatentDraftModetrue}
\ProcessOptions
\LoadClass[12pt]{memoir}[1996/10/24]
%\LoadClass[12pt]{article}[1996/10/24]

%\usepackage{tgadventor}
%\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
%\usepackage[T1]{fontenc}

\usepackage{ifpdf}

\newcommand{\setDocketNumber}{\def\patentNumber}
\newcommand{\DocumentVersion}{\def\patentDocumentVersion}
\newcommand{\setDraftMode}{\PatentDraftModetrue}
\newcommand{\Assignee}[4]{
        \author{#1}
	\def\assigneeName{#1}
	\def\assigneeAddress{#2}
	\def\assigneeCity{#3}
	\def\assigneePhone{#4}}

\newcommand{\Lawyer}[5]{ 
	\def\lawyerName{#1}
	\def\lawyerAddress{#2}
	\def\lawyerCity{#3}
	\def\lawyerPhone{#4}
	\def\lawyerNumber{#5}
	
	
          }

\def\skipline{\vspace{\baselineskip}}

% PAGE SIZE SETTINGS

\ifpdf
\usepackage[pdftex]{graphicx}
%No Commas in the PDF Title!?!
%\usepackage[hyperindex=true,pdfusetitle,bookmarks=true,extension=pdf,linkcolor=black,colorlinks=true,hyperfootnotes=true,pdffitwindow=true,pdftoolbar=true,pdfmenubar=true,debug=false,pagebackref=true ]{hyperref}
\usepackage[extension=pdf,colorlinks=true,linkcolor=black]{hyperref}
\DeclareGraphicsExtensions{ .pdf, .jpg, .tif}
\else
\usepackage[dvips]{graphicx}
\DeclareGraphicsExtensions{ .eps, .jpg }
\fi





%\usepackage[paper=letterpaper,hmargin=1in,vmargin=1in,showframe]{geometry}
%\usepackage[paper=letterpaper,hmargin=1.0in,vmargin=1in,showframe]{geometry}
\usepackage[paper=letterpaper,hmargin=1.0in,vmargin=1in]{geometry}
%\usepackage{titlesec}
%\usepackage{sectsty}
\usepackage{lipsum}
\usepackage{amsmath}
%\usepackage{enumitem}
\usepackage{memhfixc}
\usepackage{xspace}
%\usepackage{prettyref}
\usepackage{charter}
\usepackage{babel}
\usepackage{pgf,tikz}
\usepackage{import}
\usepackage[figuresright]{rotating}
%\usepackage{todonotes}
\usepackage[usenames,dvipsnames]{pstricks}
%\usepackage{epsfig}
\usepackage{pst-grad}
\usepackage{pst-plot}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{setspace}
\usetikzlibrary{arrows,positioning,fit,shapes,calc}
%\usepackage[strings]{underscore}
%\usepackage[nofiglist,nomarkers,figuresonly]{endfloat}
%\usepackage{ulem}

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


% Inventor(s) on Title Sheet
\def\inventorTitleName{\ifnum\the\@inventornumber>1{Inventors}\else{Inventor}\fi}

% List of inventors (in header)
\def\inventorNames{\inventorListName{1}{\ifnum\the\@inventornumber>1{,~et~al}\fi}}


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


\newcommand{\patentTitlePage}{%

\ifPatentDraftMode
   %not patent office mode
   \pagestyle{title}
   \makeoddhead{myheadings}
   {\confidentialAssignee}
   {}
   {\scriptsize{Draft of \thedate\\version \patentDocumentVersion}}
   \makeevenhead{myheadings}
   {\confidentialAssignee}
   {}
   {\scriptsize{Draft of \thedate\\version \patentDocumentVersion}}
\else
   %patent office mode
   \pagestyle{title}
   \makeoddhead{myheadings}
   {}{}{\scriptsize{\patentNumber}}
   \makeevenhead{myheadings}
   {}{}{\scriptsize{\patentNumber}}
\fi



\begin{titlingpage}

%\aliaspagestyle{titlingpage}{myheadings}

\begin{center}
%\vspace*{2in}
\Large{\textbf{APPLICATION FOR UNITED STATES LETTERS PATENT}}
\vspace*{3in}

\underline{Title}


\MakeUppercase{\thetitle} 

\end{center}

\vfill

\setlength{\parindent}{0em} 
\makebox[0.5\textwidth][l]{\textbf{Attorney}}%
\makebox[0.5\textwidth][r]{\textbf{Assignee}}\\%
\makebox[0.5\textwidth][l]{\lawyerName}%
\makebox[0.5\textwidth][r]{\assigneeName}\\%
\makebox[0.5\textwidth][l]{\lawyerAddress}%
\makebox[0.5\textwidth][r]{\assigneeAddress}\\%
\makebox[0.5\textwidth][l]{\lawyerCity}%
\makebox[0.5\textwidth][r]{\assigneeCity}\\%
\makebox[0.5\textwidth][l]{\lawyerPhone}%
\makebox[0.5\textwidth][r]{\assigneePhone}\\%
\makebox[0.5\textwidth][l]{ID: \lawyerNumber}
\setlength{\parindent}{1em}


\DoubleSpacing

\newpage

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

\footnotesize{
\@inventornumber=1
\loop
\expandafter\ifx\csname inventorname \the\@inventornumber\endcsname\relax
 \else
   \par\noindent
   %\makebox[0.04\textwidth][l]{\the\@inventornumber.}%
   \makebox[0.25\textwidth][l]{\inventorListName{\the\@inventornumber}}%
   \makebox[0.55\textwidth][l]{\inventorListAddress{\the\@inventornumber},\inventorListCity{\the\@inventornumber}}%
   \makebox[0.2\textwidth][r]{\inventorListPhone{\the\@inventornumber}}%
   \advance\@inventornumber by 1
   \repeat
}
\end{titlingpage}
}

\renewcommand{\maketitle}{
\patentTitlePage
\patentStart
}


\newcommand{\patentStart}{

\iffalse
\ifPatentDraftMode
%not patent office mode
\pagestyle{myheadings}
\makeoddhead{myheadings}
{\confidentialAssignee}
{}{\scriptsize{Draft of \thedate\\version \patentDocumentVersion}}
\makeevenhead{myheadings}
{\confidentialAssignee}
{}{\scriptsize{Draft of \thedate\\version \patentDocumentVersion}}
\makeoddfoot{myheadings}{\thepage}{}{\scshape{\tiny{\thetitle}}}
\makeevenfoot{myheadings}{\scshape{\tiny{\thetitle}}}{}{\thepage}
\else
%patent office mode
\pagestyle{myheadings}
\makeoddhead{myheadings}{}{}{\scriptsize{\patentNumber}}
\makeevenhead{myheadings}{}{}{\scriptsize{\patentNumber}}
\makeoddfoot{myheadings}{}{\thepage}{}
\makeevenfoot{myheadings}{}{\thepage}{}
\fi

\begin{center}\textbf{\MakeUppercase{ \thetitle }}\end{center}

% don't show section numbers!
% let them go into the "TOC" (even though we won't print it) because
% this allows the PDF file to contain the appropriate bookmarks


\setcounter{secnumdepth}{-1}
\setcounter{tocdepth}{1}
\setbeforesecskip{0pc}
\setaftersecskip{0pc}
\parskip=10pt

\fi

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




% Claims are the only area where I still use labels, hence the

% FIGURES HAVE NO CAPTIONS and numbered by the \thefigure counter
\captiondelim{}
\counterwithout{figure}{section}
\counterwithout{figure}{subsection}
\renewcommand{\fnum@figure}{\huge{\textbf{FIG.~\thefigure} \hspace{0.25in}}}


% COMMAND TO CREATE A CENTERED FIGURE 
\newcommand{\pfigure}[4]{
\begin{figure}[p]
\centering
\def\svgwidth{#4\textwidth}
\import{#2}{#3}
\vspace*{1\onelineskip}
\caption{}
\vspace*{2\onelineskip}
\label{#1}
\end{figure}
}


%\setsecheadstyle{\centering\color{blue}\Large\bfseries}
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

\endinput
%%
%% End of file `patent.cls'.