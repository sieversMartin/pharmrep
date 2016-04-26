%%
%% This is file `pharmrep.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% pharmrep.dtx  (with options: `class')
%% Copyright (C) 2015,2016 by Barbara Bredner <bredner@bb-sbl.de>,
%% Barbara Jentges <barbara.jentges@phact.ch> and
%% Martin Sievers <martin.sievers@schoenerpublizieren.de>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Barbara Bredner, Barbara Jentges and Martin Sievers.
%% 
%% This work consists of all files listed in manifest.txt.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{pharmrep}
    [2016/04/26 v2.0 PharmRep -- a LaTeX package for medical reports]
\RequirePackage{kvoptions}
\SetupKeyvalOptions {
   family  = pharmrep,%
   prefix  = pharmrep@,%
   setkeys = \kvsetkeys,%
}

\DeclareStringOption[utf8]{inputenc}
\DeclareStringOption[sRGB_IEC61966-2-1_black_scaled.icc]{colorprofile}
\DeclareBoolOption[true]{pdfa}
\DeclareBoolOption[false]{letter}
\DeclareVoidOption{US}{\pharmrep@lettertrue}
\ProcessKeyvalOptions*\relax
\PassOptionsToPackage{\pharmrep@inputenc}{inputenc}
\RequirePackage{etoolbox}
\RequirePackage{pdf14}
\input glyphtounicode.tex
\input glyphtounicode-cmr.tex
\pdfgentounicode=1
\pdfobjcompresslevel=0
\pdfinclusioncopyfonts=1
\ifpharmrep@letter
   \PassOptionsToPackage{paper=letter,pagesize}{typearea}
\fi%
\LoadClass[parskip=half,fontsize=12bp,%
      bibliography=totoc,listof=totoc,%
      numbers=noendperiod]{scrartcl}
\RequirePackage{hyperxmp}
\RequirePackage{inputenc}
\RequirePackage[T1]{fontenc}
   \hyphenchar\font=\string"7F
\RequirePackage[english]{babel}
   \addto{\captionsenglish}{\renewcommand*{\contentsname}{Table of Contents}}
   \addto{\extrasenglish}{\def\figureautorefname{figure}}
   \addto{\extrasenglish}{\def\tableautorefname{table}}

\RequirePackage{mathptmx} % times font
\RequirePackage{couriers} % monospace fonts
\RequirePackage[scaled=0.91]{helvet}   % for sans serif fonts (\textsf{...} or \sffamiliy)
\RequirePackage{pifont}   % symbols
\RequirePackage[full]{textcomp} % symbols
\RequirePackage{upquote}
\RequirePackage{microtype}% microtypographic extensions
\RequirePackage{xspace}   % automatic spacing with own commands
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage[rgb]{xcolor}
\ifpharmrep@pdfa
   \IfFileExists{\pharmrep@colorprofile}
      {\immediate\pdfobj stream attr{/N 3}  file{\pharmrep@colorprofile}
      \pdfcatalog{%
      /OutputIntents [ <<
      /Type /OutputIntent
      /S/GTS_PDFA1
      /DestOutputProfile \the\pdflastobj\space 0 R
      /OutputConditionIdentifier (\pharmrep@colorprofile)
      /Info(\pharmrep@colorprofile)
      >> ]
      }}{\ClassError{pharmrep}{Color profile \pharmrep@colorprofile not found!}{Please check your installation}}
\else
   \ClassInfo{pharmrep}{PDF/A support is disabled!}
\fi%
\RequirePackage{siunitx}
\RequirePackage{geometry}
    \geometry{textheight=600pt,head=50pt,left=60pt,right=60pt,includeheadfoot}
    \setlength{\footheight}{38pt}
\RequirePackage[section]{placeins}
\RequirePackage{lastpage}
\RequirePackage{totcount}
   \regtotcounter{figure}
   \regtotcounter{table}
\IfFileExists{scrlayer-scrpage.sty}
   {\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}}%
   {\RequirePackage[headsepline,footsepline]{scrpage2}}%
   \setkomafont{pageheadfoot}{\small}
   \setkomafont{pagenumber}{\small}
   \clearscrheadfoot
    \ihead{\begin{minipage}[b][16mm]{0.48\textwidth}Applicant: \@Applicant\\Drug Product:
    \@DrugProduct\hspace{0pt}\end{minipage}}
    \ohead{\begin{minipage}[b][16mm]{0.48\textwidth}\raggedleft\@PharmRepTitle\hspace{0pt}\end{minipage}}
    \ifoot{\begin{minipage}[t][10mm]{0.3\textwidth}\vspace{0pt}\@eCTDno\end{minipage}}
    \cfoot{\begin{minipage}[t][10mm]{0.3\textwidth}\vspace{0pt}\centering\jobname{}\end{minipage}}
    \ofoot{\begin{minipage}[t][10mm]{0.3\textwidth}\vspace{0pt}\flushright\pagemark/\upshape\pageref*{LastPage}\end{minipage}}
    \pagestyle{scrheadings}
\newcommand{\landscapeformat}{%
   \clearpage%
   \pdfpagewidth=\paperheight%
   \pdfpageheight=\paperwidth%
   \newgeometry{textwidth=600pt,left=50pt,top=60pt,bottom=60pt,includeheadfoot}}
\newcommand{\portraitformat}{%
   \clearpage%
   \pdfpagewidth=\paperwidth%
   \pdfpageheight=\paperheight%
   \restoregeometry}
\renewcommand{\fps@table}{htbp}
\renewcommand{\fps@figure}{htbp}
\RequirePackage[justification=RaggedRight,singlelinecheck=false,labelfont=bf,hypcap=false]{caption}
\RequirePackage{rotating}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{ltablex}
\RequirePackage{enumitem}
   \setlist[1]{parsep=4pt}
\RequirePackage[backgroundcolor=orange!40,%
    linecolor=black!20!orange,%
    textsize=footnotesize,%
    colorinlistoftodos]{todonotes}
   \reversemarginpar
   \setlength{\marginparwidth}{20mm}

\RequirePackage[autostyle]{csquotes}
\RequirePackage[backend=biber,%
   style=authoryear,%
   ]{biblatex}
\RequirePackage{xpatch}% author bold
   \xpretobibmacro{author}{\mkbibbold\bgroup}{}{}
   \xapptobibmacro{author}{\egroup}{}{}
   \xpretobibmacro{bbx:editor}{\mkbibbold\bgroup}{}{}
   \xapptobibmacro{bbx:editor}{\egroup}{}{}
   \renewcommand*{\labelnamepunct}{\mkbibbold{\addcolon\space}}
\AtEndPreamble{%
   \ifdefempty{\@BibFileName}{%
      \ClassError{pharmrep}{You have to provide a bib file!}{Please use the macro
      \string\BibFileName{<MYFILE.bib>} in the preamble}}%
      {\addbibresource{\@BibFileName}}%
}%
\RequirePackage[pdftex,pdfa]{hyperref}%
   \AtEndPreamble{%
   \hypersetup{%
      pdftitle       = {\@PharmRepTitle},%
      pdfauthor      = {\@Applicant},%
      pdfsubject     = {\@eCTDno},%
      pdfkeywords    = {},%
      pdflang        = en,%
      bookmarks      = true,%
      pdfdisplaydoctitle = true,%
      plainpages     = false,%
      hypertexnames  = false,%
      pdfpagelabels  = true,%
      hyperindex     = true,%
      unicode        = true,%
      pdfmetalang    = {en},%
      pdfpagemode    = UseOutlines,%
      bookmarksopen  = true,%
      bookmarksnumbered  = true, %
      bookmarksopenlevel = 2,%
      colorlinks         = true,%
      allcolors          = blue,%
      breaklinks         = true,%
      linktoc            = all,%
   }}%
\apptocmd{\UrlBreaks}{\do\f\do\m}{}{}
   \setcounter{biburllcpenalty}{9000}%
   \setcounter{biburlucpenalty}{9000}%
\RequirePackage[nopostdot,nonumberlist,toc]{glossaries}
   \setlength{\glspagelistwidth}{\linewidth}
\RequirePackage{glossary-list}
   \setglossarystyle{list}
   \makenoidxglossaries
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}
%%%\AtBeginDocument{\addto\extrasenglish{\def\figureautorefname{Abb.}}
%%%\addto\extrasenglish{\def\tableautorefname{table}}}
%%%\renewcaptionname{english}{\figureautorefname}{figure}
%%%\renewcaptionname{english}{\tableautorefname}{tab}
\newcommand*{\@Applicant}{}
\newcommand*{\@DrugProduct}{}
\newcommand*{\@PharmRepTitle}{}
\newcommand*{\@eCTDno}{}
\newcommand*{\@BibFileName}{}
\newcommand*{\Applicant}[1]{\renewcommand*{\@Applicant}{#1}}
\newcommand*{\DrugProduct}[1]{\renewcommand*{\@DrugProduct}{#1}}
\newcommand*{\PharmRepTitle}[1]{\renewcommand*{\@PharmRepTitle}{#1}}
\newcommand*{\eCTDno}[1]{\renewcommand*{\@eCTDno}{#1}}
\newcommand*{\BibFileName}[1]{\renewcommand*{\@BibFileName}{#1}}
\AtBeginDocument{%
   \listoftodos % List of ToDo's if at least 1 \todo{xxx} is present in the document
   \clearpage

   \pdfbookmark[1]{\@PharmRepTitle}{Sec:Title}
   \section*{\@PharmRepTitle}
   \bigskip

   \tableofcontents
   \clearpage
   \ifnum\totvalue{table}>0
      \listoftables
      \clearpage
   \fi%
   \ifnum\totvalue{figure}>0
      \listoffigures
      \clearpage
   \fi%
   \cleardoubleemptypage
}%
