%%
%% This is file `patentex.cls',
%% 
%%   Author: Peter J. Pupalaikis  (pete_pope  at hotmail dot com)
%%   Copyright 2012,2016 Peter J. Pupalaikis
%%   Version 2.0
%% 
%%   This work may be distributed and/or modified under the
%%   conditions of the LaTeX Project Public License, either
%%   version 1.3 of this license or (at your option) any
%%   later version.
%%   The latest version of the license is in
%%      http://www.latex-project.org/lppl.txt
%%   and version 1.3 or later is part of all distributions of
%%   LaTeX version 2003/06/01 or later.
%% 
%%   This work consists of the files listed in the README file.
%% 
\NeedsTeXFormat{LaTeX2e}

\newif\ifPatentDraftMode\PatentDraftModefalse

\ProvidesClass{patentex}[US Patent Application Class]

\DeclareOption{draft}{\PatentDraftModetrue}
\ProcessOptions
\LoadClass[letterpaper,12pt]{memoir}[1996/10/24]


% Additional Packages


\newcommand{\setDocketNumber}{\def\patentNumber}
\newcommand{\DocumentVersion}{\def\patentDocumentVersion}
\newcommand{\setDraftMode}{\PatentDraftModetrue}


\newcommand{\Assignee}[4]{\author{#1}
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


\ifpdf
\usepackage[pdftex]{graphicx}
\usepackage[hyperindex=true,pdfusetitle,bookmarks=true,extension=pdf,
linkcolor=black,colorlinks=true,hyperfootnotes=true,pdffitwindow=true,
pdftoolbar=true,pdfmenubar=true,debug=false,pagebackref=true]{hyperref}
\DeclareGraphicsExtensions{.pdf,.jpg,.tif}
\else
\usepackage[dvips]{graphicx}
\DeclareGraphicsExtensions{.eps,.jpg,.png}
\fi

\usepackage{lipsum}
\usepackage{amsmath}
\usepackage{enumitem}
\usepackage{memhfixc}
\usepackage{xspace}
\usepackage{prettyref}
\usepackage{mathptmx}
\usepackage[T1]{fontenc}
\usepackage{babel}
\usepackage{pgf,tikz}
\usepackage{import}
\usepackage[figuresright]{rotating}
\usepackage{todonotes}
\usepackage[usenames,dvipsnames]{pstricks}
\usepackage{epsfig}
\usepackage{pst-grad}
\usepackage{pst-plot}
\usepackage{booktabs}
\usepackage{setspace}
\usetikzlibrary{arrows,positioning,fit,shapes,calc}
% \usepackage[strings]{underscore}

% Page Layout

% \settrimmedsize{11in}{8.5in}{*}
% \setlength{\trimtop}{0pt}
% \setlength{\trimedge}{0pt}
% \settypeblocksize{8.5in}{36pc}{*}
% \setulmargins{1.5in}{*}{*}
% \setlrmargins{*}{*}{1}
% \setmarginnotes{17pt}{51pt}{\onelineskip}
% \setheadfoot{5\onelineskip}{3\onelineskip}
% \setheaderspaces{*}{2\onelineskip}{*}
% \checkandfixthelayout
% \captiondelim{}

\newrefformat{eq}{\textup{(\ref{#1})}}
\newrefformat{cla}{claim \ref{#1}}
\newrefformat{tab}{Table \ref{#1}}

\newcounter{alabelno}
\DeclareRobustCommand{\alabel}[1]{%
   \refstepcounter{alabelno}%
   \thealabelno\label{#1}}

\def\alab#1{\alabel{#1}}
\def\alabdup#1{\ref{#1}}
\def\flab#1{\underline{\alabel{#1}}}
\def\flabdup#1{\underline{\ref{#1}}}
\def\r#1{\textbf{\ref{#1}}}

\newcommand{\patentTitlePage}{%
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
\ifx\lawyerCity\undefined\global\edef\lawyerCity{~}\fi
\ifx\lawyerAddress\undefined\global\edef\lawyerAddress{~}\fi
\ifx\lawyerEmail\undefined\global\edef\lawyerEmail{~}\fi
\ifx\patentDocumentVersion\undefined\global\edef\patentDocumentVersion{0.0}\fi
\ifx\thedate\undefined\global\edef\thedate{\today}\fi

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
\aliaspagestyle{titlingpage}{myheadings}
\begin{center}

\vspace*{1in}

\large{\textbf{APPLICATION FOR UNITED STATES LETTERS PATENT}}

\vspace*{1in}

Title: \MakeUppercase{\thetitle} 

\end{center}

\vfill

\begin{minipage}[b]{0.5\textwidth}
\textbf{Attorney}
{
\vskip 5pt
\lawyerName \\
\lawyerNumber \\
\lawyerAddress \\
\lawyerCity \\
\lawyerPhone
}
\end{minipage}
\begin{minipage}[b]{0.5\textwidth}
\begin{flushright}
\textbf{Assignee} 
{
\vskip 5pt
\assigneeName \\
\assigneeAddress \\
\assigneeCity \\
\assigneePhone \\
}
\end{flushright}
\end{minipage}

\newpage

\begin{center}
\textbf{\underline{\MakeUppercase{Inventor List}}}
\end{center}

\vskip 1in 

{\renewcommand{\arraystretch}{2}
\begin{tabular}{llll}  Inventor & Address & City & Phone Number \\
\hline
 \inventorListName{1} & \inventorListAddress{1} & \inventorListCity{1} & \inventorListPhone{1}  \\
 \inventorListName{2} & \inventorListAddress{2} & \inventorListCity{2} & \inventorListPhone{2}  \\
 \inventorListName{3} & \inventorListAddress{3} & \inventorListCity{3}  & \inventorListPhone{3}  \\
 \inventorListName{4} & \inventorListAddress{4} & \inventorListCity{4} & \inventorListPhone{4}  \\
 \inventorListName{5} & \inventorListAddress{5} & \inventorListCity{5} & \inventorListPhone{5}  \\
 \inventorListName{6} & \inventorListAddress{6} & \inventorListCity{6} & \inventorListPhone{6}  \\
 \inventorListName{7} & \inventorListAddress{7} & \inventorListCity{7} & \inventorListPhone{7}  \\
 \inventorListName{8} & \inventorListAddress{8} & \inventorListCity{8} & \inventorListPhone{8}
\end{tabular}
}


\end{titlingpage}



\parindent 10pt
\DoubleSpacing

}

\renewcommand{\maketitle}{
\patentTitlePage
\patentStart
}


\def\etal{%
\expandafter\ifx\csname inventorName 1\endcsname\relax
\else
~et~al.
\fi
}

% use this command to put a comment in the margin
\newcommand{\patentComment}[1]{
\ifPatentDraftMode

%not patent office mode
\begin{SingleSpace}
\marginpar{\tiny\textcolor{red}{ \begin{flushleft} #1 \end{flushleft}}}
\end{SingleSpace}
\else
%patent office mode
\fi
}

\newcommand{\patentSection}[1]{
\Needspace{8pc}
\section[#1][]{}
%\label{#2}
\begin{center}
\textbf{\underline{\MakeUppercase{{#1}}}}
\end{center}
}

\newcommand{\npar}{
\par\noindent
\refstepcounter{parnum}[\textbf{%
\ifnum \value{parnum} < 10 0\else\fi
\ifnum \value{parnum} < 100 0\else\fi
\ifnum \value{parnum} < 1000 0\else\fi
\arabic{parnum}}]
\indent}

\newcommand{\patentStart}{

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
\setcounter{secnumdepth}{-1}
% let them go into the "TOC" (even though we won't print it) because
% this allows the PDF file to contain the appropriate bookmarks
\setcounter{tocdepth}{1}

\setbeforesecskip{0pc}
\setaftersecskip{0pc}
\parskip=10pt

% this is used to number paragraphs
\newcounter{parnum}
}

\makeatletter

\newcount\@inventornumber\@inventornumber=0

\def\Inventor#1#2#3#4{\global\advance\@inventornumber by 1 
  \expandafter\edef\csname inventorname \the\@inventornumber\endcsname{#1}
  \expandafter\edef\csname inventoraddress \the\@inventornumber\endcsname{#2}
  \expandafter\edef\csname inventorcity\the\@inventornumber\endcsname{#3}
  \expandafter\edef\csname inventorphone\the\@inventornumber\endcsname{#4}
  }

\makeatother


\def\inventorListName#1{\csname inventorname #1\endcsname}
\def\inventorListAddress#1{\csname inventoraddress #1\endcsname}
\def\inventorListCity#1{\csname inventorcity#1\endcsname}
\def\inventorListPhone#1{\csname inventorphone#1\endcsname}

% Claims are the only area where I still use labels, hence the
% prettyref include.
% \patentClaimsStart essentially begins the enumerate environment and 
% \patentClaimsEnd essentially ends it.
% I'd like to remove this dependency someday and use the counter
% mechanisms used elsewhere.

% Inside, a claim is begin with \beginClaim which labels it and starts
% an \item.
% Claims are referenced with \claimRef
\newcommand{\beginClaim}[1]{\item \label{cla:#1}}
\newcommand{\claimRef}[1]{claim \ref{cla:#1}}

\newcommand{\WhatIsClaimed}{What is claimed is:}

\newcommand{\patentClaimsStart}{
\newpage
\section[Claims][]{}
\parskip=0pt
\WhatIsClaimed
\begin{enumerate}
}

\newcommand{\patentClaimsEnd}{
\end{enumerate}
%\newpage
}

% Patent drawings have a special header that numbers the drawing pages
\newcommand{\patentDrawingsStart}
{
\cleartooddpage
%\newpage
\ifPatentDraftMode
%draft mode
\pagestyle{myheadings}
\makeoddhead{myheadings}
{\confidentialAssignee}
{}
{\scriptsize{Draft of \thedate\\version \patentDocumentVersion}}
\makeevenhead{myheadings}
{\confidentialAssignee}
{}
{\scriptsize{Draft of \thedate\\version \patentDocumentVersion}}
\makeoddfoot{myheadings}{\thepage}{}{\scshape{\tiny{\thetitle}}}
\makeevenfoot{myheadings}{\scshape{\tiny{\thetitle}}}{}{\thepage}
\else
%final version mode
\setcounter{page}{1}
\pagestyle{myheadings}
\makeoddhead{myheadings}{}
{
\thetitle \\
\assigneeName\etal \\
\patentNumber \\
\lawyerName\ \lawyerPhone\\[.1in]
\thepage/\thelastpage
}
{}
\makeevenhead{myheadings}{}{
\thetitle \\
\assigneeName\etal \\
\patentNumber \\
\lawyerName\ \lawyerPhone\\[.1in]
\thepage/\thelastpage
}{}
\makeoddfoot{myheadings}{}{}{}
\makeevenfoot{myheadings}{}{}{}
\fi
\section[Drawings][]{}
\begin{SingleSpace}
}

\makeatletter
\renewcommand{\fnum@figure}{\large{\textbf{FIG. \thefigure} \hspace{0.25in}}}

\counterwithout{figure}{section}
\counterwithout{figure}{subsection}

\endinput
%%
%% End of file `patent.cls'.
