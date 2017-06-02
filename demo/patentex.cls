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

\usepackage[T1]{fontenc}

%\usepackage[paper=letterpaper,hmargin=1in,vmargin=1in,showframe]{geometry}
%\usepackage[paper=letterpaper,hmargin=1.0in,vmargin=1in,showframe]{geometry}
\usepackage[paper=letterpaper,hmargin=1.0in,vmargin=1in]{geometry}
\usepackage{lipsum}
\usepackage{amsmath}
\usepackage{enumitem}
\usepackage{memhfixc}
\usepackage{xspace}
\usepackage{prettyref}
\usepackage{charter}
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
\usepackage{tabularx}
\usepackage{setspace}
\usetikzlibrary{arrows,positioning,fit,shapes,calc}
\usepackage[strings]{underscore}
%\usepackage[nofiglist,nomarkers,figuresonly]{endfloat}


\newrefformat{cla}{claim \ref{#1}}

\newcounter{figlabelno}
\DeclareRobustCommand{\figlabel}[1]{
  \refstepcounter{figlabelno}
  \thefiglabelno\label{#1}
  }
 
\newcounter{alabelno}
\DeclareRobustCommand{\alabel}[1]{%
   \refstepcounter{alabelno}%
   \thealabelno\label{#1}}

\def\alab#1{\alabel{#1}}
\def\alabdup#1{\ref{#1}}
\def\flab#1{\underline{\alabel{#1}}}
\def\flabdup#1{\underline{\ref{#1}}}
\def\bref#1{\textbf{\ref{#1}}}
\def\figref#1{\textbf{FIG.~\ref{#1}}}
\def\inventorTitleName{\ifnum\the\@inventornumber>1{Inventors}\else{Inventor}\fi}
\def\inventorNames{\inventorListName{1}{\ifnum\the\@inventornumber>1{,~et~al}\fi}}
\def\etal{\ifnum\the\@inventornumber>1{et~al}\fi}






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
\ifx\lawyerAddress\undefined\global\edef\lawyerAddress{~}\fi
\ifx\lawyerCity\undefined\global\edef\lawyerCity{~}\fi
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

\Large{\textbf{APPLICATION FOR UNITED STATES LETTERS PATENT}}

\vspace*{1in}

Title: \MakeUppercase{\thetitle} 

\end{center}

\vfill

\noindent
\begin{minipage}[t]{0.5\textwidth}
\raggedright
\textbf{Attorney}\\
\lawyerName \\
\lawyerAddress \\
\lawyerCity \\
\lawyerPhone \\
\lawyerNumber 
\end{minipage}%
\begin{minipage}[t]{0.5\textwidth}
\raggedleft
\textbf{Assignee}\\
\assigneeName \\
\assigneeAddress \\
\assigneeCity \\
\assigneePhone
\end{minipage}%


\newpage

\begin{center}
\textbf{\underline{\MakeUppercase{\inventorTitleName}}}
\end{center}

\vspace{3\baselineskip}

\noindent
\begin{minipage}[t]{0.35\textwidth}
\raggedright
\textbf{Inventor}\\
\skipline
\inventorListName{1}\\
\skipline
\skipline
\inventorListName{2}\\
\skipline
\skipline
\inventorListName{3}\\
\skipline
\skipline
\inventorListName{4}\\
\skipline
\skipline
\inventorListName{5}\\
\skipline
\skipline
\inventorListName{6}\\
\skipline
\skipline
\inventorListName{7}\\
\skipline
\skipline
\inventorListName{8}
\end{minipage}%
\begin{minipage}[t]{0.45\textwidth}
\raggedright
\textbf{Address}\\
\skipline
\inventorListAddress{1}\\
\inventorListCity{1}\\
\skipline
\inventorListAddress{2}\\
\inventorListCity{2}\\
\skipline
\inventorListAddress{3}\\
\inventorListCity{3}\\
\skipline
\inventorListAddress{4}\\
\inventorListCity{4}\\
\skipline
\inventorListAddress{5}\\
\inventorListCity{5}\\
\skipline
\inventorListAddress{6}\\
\inventorListCity{6}\\
\skipline
\inventorListAddress{7}\\
\inventorListCity{7}\\
\skipline
\inventorListAddress{8}\\
\inventorListCity{8}\\
\end{minipage}%
\begin{minipage}[t]{0.2\textwidth}
\raggedleft
\textbf{Phone}\\
\skipline
\inventorListPhone{1}\\
\skipline
\skipline
\inventorListPhone{2}\\
\skipline
\skipline
\inventorListPhone{3}\\
\skipline
\skipline
\inventorListPhone{4}\\
\skipline
\skipline
\inventorListPhone{5}\\
\skipline
\skipline
\inventorListPhone{6}\\
\skipline
\skipline
\inventorListPhone{7}\\
\skipline
\skipline
\inventorListPhone{8}
\end{minipage}%

\iffalse
\vskip  0.5in 
 \newcolumntype{b}{>{\hsize=0.75\hsize}X}
 \newcolumntype{c}{>{\hsize=2\hsize}X}
 \newcolumntype{d}{>{\hsize=0.75\hsize}X}
 \noindent\small{
 \begin{tabularx}{\textwidth}{l X r}  \textbf{Inventor} & \textbf{Address} & \textbf{Phone Number} \\
 \addlinespace
 \inventorListName{1} & \inventorListAddress{1} & \inventorListPhone{1}  \\
                      & \inventorListCity{1}    &                        \\
 \addlinespace
 \inventorListName{2} & \inventorListAddress{2} & \inventorListPhone{2}  \\
                      & \inventorListCity{2}    &                        \\
 \addlinespace
 \inventorListName{3} & \inventorListAddress{3} & \inventorListPhone{3}  \\
                      & \inventorListCity{3}    &                        \\
 \addlinespace
 \inventorListName{4} & \inventorListAddress{4} & \inventorListPhone{4}  \\
                      & \inventorListCity{4}    &                        \\
 \addlinespace
 \inventorListName{5} & \inventorListAddress{5} & \inventorListPhone{5}  \\
                      & \inventorListCity{5}    &                        \\
 \addlinespace
 \inventorListName{6} & \inventorListAddress{6} & \inventorListPhone{6}  \\
                      & \inventorListCity{6}    &                        \\
 \addlinespace
 \inventorListName{7} & \inventorListAddress{7} & \inventorListPhone{7}  \\
                      & \inventorListCity{7}    &                        \\
 \addlinespace
 \inventorListName{8} & \inventorListAddress{8} & \inventorListPhone{8}  \\
                      & \inventorListCity{8}    &                        
 \end{tabularx}
 }
\fi

\end{titlingpage}



\DoubleSpacing

}

\renewcommand{\maketitle}{
\patentTitlePage
\patentStart
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


\newcount\@inventornumber\@inventornumber=0

\def\Inventor#1#2#3#4{\global\advance\@inventornumber by 1 
  \expandafter\edef\csname inventorname \the\@inventornumber\endcsname{#1}
  \expandafter\edef\csname inventoraddress \the\@inventornumber\endcsname{#2}
  \expandafter\edef\csname inventorcity \the\@inventornumber\endcsname{#3}
  \expandafter\edef\csname inventorphone\the\@inventornumber\endcsname{#4}
  }


\def\inventorListName#1{\csname inventorname #1\endcsname}
\def\inventorListAddress#1{\csname inventoraddress #1\endcsname}
\def\inventorListCity#1{\csname inventorcity #1\endcsname}
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
}

\captiondelim{}
\counterwithout{figure}{section}
\counterwithout{figure}{subsection}
\renewcommand{\fnum@figure}{\huge{\textbf{FIG.~\thefigure} \hspace{0.25in}}}


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


\endinput
%%
%% End of file `patent.cls'.
