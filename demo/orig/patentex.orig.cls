%%
%% This is file `uspatent.cls',
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

\ProvidesClass{uspatent}%
  [2016/30/11 v2.0 U.S. Patent Application Class]
\DeclareOption{draft}{\PatentDraftModetrue}
\ProcessOptions
\LoadClass[letterpaper,12pt]{memoir}[1996/10/24]

\newif\ifFigureCaptionsOnTop\FigureCaptionsOnTopfalse

\newcommand{\setDocketNumber}{\def\patentNumber}

\newcommand{\DocumentVersion}{\def\patentDocumentVersion}
\newcommand{\setDraftMode}{\PatentDraftModetrue}
\newcommand{\setFigureCaptionsOnTop}{\FigureCaptionsOnToptrue}

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


% PAGE SIZE SETTINGS

\settrimmedsize{11in}{8.5in}{*}
\setlength{\trimtop}{0pt}
\setlength{\trimedge}{0pt}
\settypeblocksize{8.5in}{36pc}{*}
\setulmargins{1.5in}{*}{*}
\setlrmargins{*}{*}{1}
\setmarginnotes{17pt}{51pt}{\onelineskip}
\setheadfoot{5\onelineskip}{3\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout
\captiondelim{}

\ifpdf
\usepackage[pdftex]{graphicx}
%No Commas in the PDF Title!?!
\usepackage[
hyperindex=true,
pdfusetitle,
bookmarks=true,
extension= pdf,
linkcolor=black,
colorlinks=true,
hyperfootnotes=true,
pdffitwindow=true,
pdftoolbar=true,
pdfmenubar=true,
debug=false,
pagebackref=true
]{hyperref}
\DeclareGraphicsExtensions{ .pdf, .jpg, .tif}
\else
\usepackage[dvips]{graphicx}
\DeclareGraphicsExtensions{ .eps, .jpg }
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
\usepackage[strings]{underscore}

\newrefformat{eq}{\textup{(\ref{#1})}}
\newrefformat{cla}{claim \ref{#1}}
\newrefformat{tab}{Table \ref{#1}}
\newrefformat{fig}{\figurename \ \textbf{\ref{#1}}}

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
 \inventorListName{1} & \inventorListAddress{1} &  \inventorListCity{1} & \inventorListPhone{1}  \\
 \inventorListName{2} & \inventorListAddress{2} & \inventorListCity{2} & \inventorListPhone{2}  \\
 \inventorListName{3} & \inventorListAddress{3} &\inventorListCity{3} & \inventorListPhone{3}  \\
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

\def\figureName{FIG.}

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

\newcommand{\patentDrawingsEnd}{
\end{SingleSpace}
%\newpage
\clearpage
}

\def\annotationnextfigure{\global\advance\@annotationfigurenumber by 1}

\makeatletter
\newcount\@annotationnumber\@annotationnumber=0
\newcount\@annotationfigurenumber\@annotationfigurenumber=0
\def\advanceannotationfigurenumber{\global\advance\@annotationfigurenumber by 1}
\def\setannotationnumber#1{\global\@annotationnumber=#1\global\advance\@annotationnumber by -1}
\def\setannotationfigurenumber#1{\global\@annotationfigurenumber=#1}

\def\@newannotation#1{
\expandafter\ifx\csname anonum#1 \endcsname\relax
\global\advance\@annotationnumber by 1
\expandafter\edef\csname anoele \the\@annotationnumber\endcsname{#1}
\expandafter\edef\csname anonum#1 \endcsname{\the\@annotationnumber}
\expandafter\edef\csname anofignum \the\@annotationnumber\endcsname{\the\@annotationfigurenumber}
\else\message*{error: duplicate annotation #1}\fi}

\def\annotationDefinition{%
\@ifnextchar[{\@annotationDefinitionmulti}{\@newannotation}}
\def\@annotationDefinitionmulti[#1]#2{%
\@newannotation{#2}\annotationName{#1}
\@ifnextchar[{\@annotationDefinitionfull}{}}
\def\@annotationDefinitionfull[#1]{\annotationDescription{#1}}

\def\annotationDescription#1{%
\expandafter\ifx\csname anodesc \the\@annotationnumber\endcsname\relax
\expandafter\def\csname anodesc \the\@annotationnumber\endcsname{#1}
\else
\message{error while assigning description ``#1'' to annotation variable
``\annotationListVariableName{\the\@annotationnumber}''
 - it was already defined as
``\annotationListDescription{\the\@annotationnumber}''.}\fi}

\def\annotationName#1{%
\expandafter\ifx\csname anotext \the\@annotationnumber\endcsname\relax
\expandafter\def\csname anotext \the\@annotationnumber\endcsname{#1}
\else
\message{error while assigning text name ``#1'' to annotation variable
``\annotationListVariableName{\the\@annotationnumber}''
 - it was already defined as
``\annotationListText{\the\@annotationnumber}''.}\fi}

\def\annotationReference#1{%
\thinspace\annotationNumberReference{#1}\thinspace}

\def\annotationLabel#1{%
\thinspace\annotationNumberReference{#1}\thinspace}

\def\annotationLabelField#1{%
\thinspace\underline{\annotationNumberReference{#1}}\thinspace}
\makeatother

\def\annotationNameAndReference#1{\annotationTextReference{#1}~\annotationReference{#1}}

\def\annotationDescriptionreference#1{%
\csname anodesc \annotationNumberReference{#1}\endcsname}

\def\annotationTextReference#1{%
\csname anotext \annotationNumberReference{#1}\endcsname}

\def\annotationNumberReference#1{\csname anonum#1 \endcsname}
\def\annotationNumberReferenceUnderlined#1{\underline{\csname anonum#1 \endcsname}}
\def\annotationListVariableName#1{\csname anoele #1\endcsname}
\def\annotationListText#1{\csname anotext #1\endcsname}
\def\annotationListDescription#1{\csname anodesc #1\endcsname}
\def\annotationListFigureNumber#1{\csname anofignum #1\endcsname}
\def\annotationListFigureDescription#1{\csname anofigdesc #1\endcsname}
\def\annotationListFigureExtension#1{\csname anofigext #1\endcsname}
\def\annotationListFigureCaption#1{\csname anofigcap #1\endcsname}
\def\annotationListFigureName#1{\csname anofigname #1\endcsname}
\def\annotationListFigureOrientation#1{\csname anofigor #1\endcsname}
\def\annotationListFigureDirectory#1{\csname anofigdir #1\endcsname}
\newenvironment{pfigure}{\begin{figure}}{\end{figure}}

\def\figureStartWithOrientation#1{
\expandafter\ifx\csname anofigor #1\endcsname\relax
\renewenvironment{pfigure}{\begin{figure}[ht]}{\end{figure}}
\else
\renewenvironment{pfigure}{\begin{sidewaysfigure}}{\end{sidewaysfigure}}
\fi
}

\def\annotationListPrintFigure#1#2{
\edef\testa{#1}\edef\testb{#2}\edef\testzero{0}
\ifx\testb\testzero
\figureName #1 ~---~\annotationListFigureName{#1}.%
\annotationListFigureExtension{#1}%
~---~\annotationListFigureDescription{#1}
~---~\annotationListFigureDirectory{#1}
\par
\else
\ifx\testa\testb
\else
\figureName #1~---~\annotationListFigureName{#1}.%
\annotationListFigureExtension{#1}%
~---~\annotationListFigureDescription{#1}
~---~\annotationListFigureDirectory{#1}
\par
\fi\fi
}

\def\annotationListSectionName{\section*{Annotation List}}

\makeatletter
\def\printAnnotationList{{%
\@annotationnumber=1
\@annotationfigurenumber=0
\expandafter\ifx\csname anoele \the\@annotationnumber\endcsname\relax
\else
\annotationListSectionName\par
\loop
\expandafter\ifx\csname anoele \the\@annotationnumber\endcsname\relax
\else
\leftskip = 0 pt
\annotationListPrintFigure{%
\annotationListFigureNumber{\the\@annotationnumber}}
{\the\@annotationfigurenumber}
\leftskip = 40 pt
\par
\@annotationfigurenumber=%
\annotationListFigureNumber{\the\@annotationnumber}
\the\@annotationnumber~---~%
\annotationListVariableName{\the\@annotationnumber}~---~%
\annotationListText{\the\@annotationnumber}~---~%
\annotationListDescription{\the\@annotationnumber}
\par
\leftskip = 0 pt
\advance\@annotationnumber by 1
\repeat
\fi
}}
\makeatother


\def\annotationFigureListSectionName{%
\section*{Brief Description of the Drawings}}

\def\setFigureListNoRunOn{%
\def\annotationFigureListLast{.}
\def\annotationFigureListNextLast{.}
\def\annotationFigureListOther{.}
}

\def\annotationFigureListLast{.}
\def\annotationFigureListNextLast{; and}
\def\annotationFigureListOther{;}

\makeatletter
\def\printAnnotationFigureList{{
\@annotationfigurenumber=1
\expandafter\ifx\csname anofigdesc \the\@annotationfigurenumber\endcsname\relax
\else
\annotationFigureListSectionName\par
\annotationFigureListPreamble\par
\loop
\expandafter\ifx\csname anofigdesc \the\@annotationfigurenumber\endcsname\relax
\else
\annotationFigureListPrintFigure{\the\@annotationfigurenumber}%
{\advance\@annotationfigurenumber by 1
\expandafter\ifx\csname anofigdesc \the\@annotationfigurenumber\endcsname\relax
\annotationFigureListLast\else{\advance\@annotationfigurenumber by 1
\expandafter\ifx\csname anofigdesc \the\@annotationfigurenumber\endcsname\relax
\annotationFigureListNextLast\else\annotationFigureListOther\par\fi}\fi}
\advance\@annotationfigurenumber by 1
\repeat
\fi
}}
\makeatother

\makeatletter
\def\figureDescription#1{%
\expandafter\ifx\csname anofigdesc \the\@annotationfigurenumber\endcsname\relax
\expandafter\def\csname anofigdesc \the\@annotationfigurenumber\endcsname{#1}
\else
\message{error while assigning description ``#1'' to annotation figure number
``\the\@annotationfigurenumber'' - it was already defined as
``\annotationListFigureDescription{\the\@annotationfigurenumber}''.}\fi}
\makeatother

\makeatletter
\def\figureExtension#1{%
\expandafter\ifx\csname anofigext \the\@annotationfigurenumber\endcsname\relax
\expandafter\def\csname anofigext \the\@annotationfigurenumber\endcsname{#1}
\else
\message{error while assigning extension ``#1'' to annotation figure number
``\the\@annotationfigurenumber'' - it was already defined as
``\annotationListFigureExtension{\the\@annotationfigurenumber}''.}\fi}
\makeatother

\makeatletter
\def\figureCaption#1{%
\expandafter\ifx\csname anofigcap \the\@annotationfigurenumber\endcsname\relax
\expandafter\def\csname anofigcap \the\@annotationfigurenumber\endcsname{#1}
\else
\message{error while assigning caption ``#1'' to annotation figure number 
``\the\@annotationfigurenumber'' - it was already defined as
``\annotationListFigureCaption{\the\@annotationfigurenumber}''.}\fi}
\makeatother

\makeatletter
\def\figureOrientationSideways#1{%
\expandafter\ifx\csname anofigor \the\@annotationfigurenumber\endcsname\relax
\expandafter\def\csname anofigor \the\@annotationfigurenumber\endcsname{#1}
\else
\message{error while assigning orientation ``#1'' to annotation figure number 
``\the\@annotationfigurenumber'' - it was already defined as
``\annotationListFigureOrientation{\the\@annotationfigurenumber}''.}\fi}
\makeatother

\makeatletter
\def\figureDirectory#1{%
\expandafter\ifx\csname anofigdir \the\@annotationfigurenumber\endcsname\relax
\expandafter\def\csname anofigdir \the\@annotationfigurenumber\endcsname{#1}
\else
\message{error while assigning directory ``#1'' to annotation figure number 
``\the\@annotationfigurenumber'' - it was already defined as
``\annotationListFigureDirectory{\the\@annotationfigurenumber}''.}\fi}
\makeatother

\makeatletter
\def\figureClearPageAfter{%
\expandafter\def\csname anofigcp \the\@annotationfigurenumber\endcsname{}}
\makeatother

\makeatletter
\def\@newfigure#1{
\expandafter\ifx\csname fignum#1 \endcsname\relax
\global\advance\@annotationfigurenumber by 1
\expandafter\edef\csname anofigname \the\@annotationfigurenumber\endcsname{#1}
\expandafter\edef\csname fignum#1 \endcsname{\the\@annotationfigurenumber}
\else\message{error: duplicate annotation #1}\fi}
\makeatother

\makeatletter
\def\figureDefinition{\@ifnextchar[{\@figuredefinitionmulti}{\@newfigure}}
\def\@figuredefinitionmulti[#1]#2{\@newfigure{#2}\figureDescription{#1}}
\makeatother

\makeatletter
\def\figureReference#1{\figureName~\figurenumberreference{#1}}
%\def\figureReference#1{\figureName~\figlabel{#1}}
\makeatother

\def\figurenumberreference#1{\csname fignum#1 \endcsname}

\expandafter\def\csname showfigure vbs\endcsname #1#2#3{\lstinputlisting[language=VBScript]{#3/#1.#2}}
\expandafter\def\csname showfigure VBS\endcsname #1#2#3{\lstinputlisting[language=VBScript]{#3/#1.#2}}
\expandafter\def\csname showfigure py\endcsname #1#2#3{\lstinputlisting[language=Python]{#3/#1.#2}}
\expandafter\def\csname showfigure pdf\endcsname #1#2#3{\includegraphics[]{#3/#1.#2}}
\expandafter\def\csname showfigure tpx\endcsname #1#2#3{\input{"#3/#1.#2"}}
\expandafter\def\csname showfigure PDF\endcsname #1#2#3{\includegraphics[]{#3/#1.#2}}
\expandafter\def\csname showfigure TpX\endcsname #1#2#3{\input{"#3/#1.#2"}}
\expandafter\def\csname showfigure tex\endcsname #1#2#3{\input{"#3/#1.tex"}}
\expandafter\def\csname showfigure pdftex\endcsname #1#2#3{\input{"#3/#1.#2"}}
\expandafter\def\csname showfigure placeholder\endcsname #1#2#3{\missingfigure[figwidth=0.5\textwidth]{#1}}
\expandafter\def\csname showfigure unk\endcsname #1#2{\includegraphics[]{#1.#2}}

\makeatletter
\def\figures{{%
\@annotationfigurenumber=1
\expandafter\ifx\csname anofigname \the\@annotationfigurenumber\endcsname\relax
\else
\figuresStart
\loop
\expandafter\ifx\csname anofigname \the\@annotationfigurenumber\endcsname\relax
\else
\expandafter\ifx\csname anofigext \the\@annotationfigurenumber\endcsname\relax
\edef\figureextension{placeholder}
\else
\edef\figureextension{%
\annotationListFigureExtension{\the\@annotationfigurenumber}}
\fi
\expandafter\ifx\csname showfigure \figureextension\endcsname\relax
% this is an unknown figure extension
\def\figureshower{\csname showfigure unk\endcsname}
\else
\def\figureshower{\csname showfigure \figureextension\endcsname}

\fi
\def\figurename{\annotationListFigureName{\the\@annotationfigurenumber}}
\def\figurecaption{\annotationListFigureCaption{\the\@annotationfigurenumber}}
\def\figuredir{\annotationListFigureDirectory{\the\@annotationfigurenumber}}
\figureStartWithOrientation{\the\@annotationfigurenumber}
\par
\begin{pfigure}
\ifFigureCaptionsOnTop
\centering\figureReference{\figurename}~~\figurecaption\par\figureshower{\figurename}{\figureextension}{\figuredir}\par
\else
\centering\figureshower{\figurename}{\figureextension}{\figuredir}\par\figureReference{\figurename}~~\figurecaption\par
\fi
%\figlabel{\figurename}
\end{pfigure}
\expandafter\ifx\csname anofigcp \the\@annotationfigurenumber\endcsname\relax
\else
\clearpage
\fi
\advance\@annotationfigurenumber by 1
\repeat
\figuresEnd
\fi
}}
\makeatother

\def\annotationFigureListSectionName{
\patentSection{Brief Description of the Drawings}}

\def\annotationListSectionName{\patentSection{Annotation List}}
\def\annotationFigureListPreamble{\par{For a more complete understanding of the invention, reference is made to the following description and accompanying drawings, in which:\par}}
\def\patentDrawingDescriptions{\printAnnotationFigureList}
\def\referencePatentFigure#1{\figureReference{#1}}
\def\annotate#1{\annotationReference{#1}}
\def\annotateWithName#1{\annotationNameAndReference{#1}}
\def\anref#1{\textbf{\annotationReference{#1}}}
\def\antref#1{\textbf{\annotationReference{#1}~[FIG.~\annotationListFigureNumber{\annotationNumberReference{#1}}:\annotationTextReference{#1}]}}
\def\atref#1{\textbf{[FIG.~\annotationListFigureNumber{\annotationNumberReference{#1}}:\annotationTextReference{#1}]}}
\def\aLabel#1{\annotationLabel{#1}}
\def\aLabelField#1{\annotationLabelField{#1}}
\def\annotationFigureListPrintFigure#1{\par{\figureName ~#1~---~\annotationListFigureDescription{#1}}}
\def\annotateNoBrackets#1{\annotationNumberReference{#1}}
\def\figuresStart{\patentDrawingsStart}
\def\figuresEnd{\patentDrawingsEnd}

\def\patentDrawings{\ifPatentDraftMode
	\printAnnotationList
		\else
		\fi
		\figures
}
\endinput
%%
%% End of file `patent.cls'.
