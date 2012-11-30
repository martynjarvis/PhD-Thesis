%% Base class

%% ========================================================================
%% Admin
%% ========================================================================
\def\fileversion{1.4.3}
\def\filedate{2010/05/27}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mythesis}[\filedate\space my thesis class loosely based on hepthesis by Andy Buckley (v\fileversion)]

%% ========================================================================
%% Option parsing
%% ========================================================================


%% ========================================================================
%% Base class and packages
%% ========================================================================
\LoadClass[a4paper,12pt]{book}

\RequirePackage{graphicx}
\RequirePackage{mythesis} %% my custom .sty packages
\RequirePackage{mythesismath}
\RequirePackage{cite}
\RequirePackage{verbatim}
\RequirePackage{nicefrac}
\RequirePackage{fancyhdr}

%% Nice tables (optional) from hepthesis
\RequirePackage{booktabs}

%% ========================================================================
%% Length definitions
%% ========================================================================
% use \layout to print example layout page

% from hepthesis
\setlength{\parindent}{17pt}          % tweak the initial indent in paras
\setlength{\parskip}{8.5pt}            % tweak the intra-para gap size
\setlength{\topmargin}{0pt}
\setlength{\textheight}{648pt}
\setlength{\footskip}{36pt}
\setlength{\textwidth}{446pt}

% equal margins
\setlength{\oddsidemargin}{2pt}
\setlength{\evensidemargin}{\oddsidemargin}

%% Increase inner margins for binding
\newlength{\@bindextramargin}
\setlength{\@bindextramargin}{0pt}% change this for binding offset
\addtolength{\oddsidemargin}{\@bindextramargin}
\addtolength{\evensidemargin}{-\@bindextramargin}

% not sure what to set for these
\setlength{\headheight}{15pt}
\setlength{\headsep}{25pt}

% not sure what to set for these
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparpush}{0pt}

% for the front matter pages
\newlength{\@frontmattertopskip}
\setlength{\@frontmattertopskip}{55pt}  % Add a little extra space at top of front matter pages

%% ========================================================================
%% Headers and footers
%% ========================================================================

\pagestyle{fancy}

%% Normal headers and footers (headers are all like RH pages for oneside)
\fancyhead[RO,R]{\bfseries\thepage}%
\fancyhead[LO,L]{\bfseries\leftmark}%
\fancyfoot{}%

%% Headers and footers for plain (blank) pages
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\bfseries \thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

%% Treat forced blank pages in the same way as chapter title pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else%
  \hbox{}%
  \thispagestyle{plain}%
  \newpage%
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}%


%% ========================================================================
%% Environments 
%% ========================================================================

% frontmatter environments
\newenvironment{abstract}[1][Abstract]{%defaults to title Abstract
  \cleardoublepage%
  \vspace*{\@frontmattertopskip}%
  \thispagestyle{plain}%
  \begin{center}%
    {\LARGE\textbf{#1}}%
  \end{center}%
  \vspace*{1cm}%
}{ }

\newenvironment{declaration}{%
  \cleardoublepage%
  \vspace*{\@frontmattertopskip}%
  \thispagestyle{plain}%
  \begin{center}%
    {\LARGE\textbf{Declaration}}%
  \end{center}%
  \vspace*{1cm}%
}{ }

\newenvironment{acknowledgements}{%
  \cleardoublepage%
  \vspace*{\@frontmattertopskip}%
  \thispagestyle{plain}%
  \begin{center}%
    {\LARGE\textbf{Acknowledgements}}%
  \end{center}%
  \vspace*{1cm}%
}{ }

\newenvironment{preface}{%
  \cleardoublepage%
  \vspace*{\@frontmattertopskip}%
  \thispagestyle{plain}%
  \begin{center}%
    {\LARGE\textbf{Preface}}%
  \end{center}%
  \vspace*{1cm}%
}{ }

\DeclareRobustCommand{\dedication}[1]{%
  \cleardoublepage%
  \vspace*{\stretch{2}}%
  \thispagestyle{plain}%
  \begin{center}%
    \noindent\textsl{#1}%
  \end{center}%
  \vspace*{\stretch{4}}%
}

%% ========================================================================
%% Commands
%% ========================================================================

%% In-document references
\DeclareRobustCommand{\Chapter}{Chapter\xspace}
\DeclareRobustCommand{\Section}{Section\xspace}
\DeclareRobustCommand{\Appendix}{Appendix\xspace}
\DeclareRobustCommand{\Figure}{Figure\xspace}
\DeclareRobustCommand{\Table}{Table\xspace}
\DeclareRobustCommand{\Equation}{equation\xspace}
\DeclareRobustCommand{\Reference}{reference\xspace}
%% Standard way to refer to a page number
\DeclareRobustCommand{\Page}{page\xspace}

%% Reference terms with built-in reference
\DeclareRobustCommand{\ChapterRef}[1]{\Chapter~\ref{#1}}
\DeclareRobustCommand{\SectionRef}[1]{\Section~\ref{#1}}
\DeclareRobustCommand{\AppendixRef}[1]{\Appendix~\ref{#1}}
\DeclareRobustCommand{\FigureRef}[1]{\Figure~\ref{#1}}
\DeclareRobustCommand{\TableRef}[1]{\Table~\ref{#1}}
\DeclareRobustCommand{\EquationRef}[1]{\Equation~\eqref{#1}}
\DeclareRobustCommand{\ReferenceRef}[1]{\Reference~\cite{#1}}
\DeclareRobustCommand{\PageRef}[1]{\Page~\pageref{#1}}
