\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jcsie}[2018/1/18 y-hirokawa]
\LoadClass[a4j, 11pt]{jsreport}

\RequirePackage{url}

\newif\if@sotsuron
\@sotsuronfalse
\DeclareOption{sotsuron}{\@sotsurontrue}

\ProcessOptions

\newcommand{\id}[1]{\gdef\@id{#1}}
\newcommand{\@id}{\@latex@warning@no@line{No \noexpand\id given}}
\newcommand{\etitle}[1]{\gdef\@etitle{#1}}
\newcommand{\@etitle}{\@latex@warning@no@line{No \noexpand\etitle given}}
\newcommand{\eauthor}[1]{\gdef\@eauthor{#1}}
\newcommand{\@eauthor}{\@latex@warning@no@line{No \noexpand\eauthor given}}

\newcounter{fiscal}
\setcounter{fiscal}{\the\year}
\addtocounter{fiscal}{\m@ne}

\renewcommand{\maketitle}{
  \begin{titlepage}
    \begin{center}
      {\large
        \arabic{fiscal}年度
        \if@sotsuron
        \hskip 1em 卒業論文
        \fi
        \par
      }
      \vspace{\stretch{1}}
      {\LARGE \@title \par}
      \vspace{\stretch{2}}
      {\large
        学籍番号: \@id \par
        \@author \par
      }
      \vskip \stretch{3}
      {\large 指導教員: 萩原 威志 助教 \par}
      \vskip \stretch{4}
      {\large 新潟大学工学部情報工学科 \par}
      \vskip \stretch{5}
    \end{center}
  \end{titlepage}
}

\newcommand{\emaketitle}{
  \begin{titlepage}
    \begin{center}
      {\large
        Year \arabic{fiscal}
        \if@sotsuron
        \hskip 1em Graduation thesis
        \fi
        \par
      }
      \vspace{\stretch{1}}
      {\LARGE \@etitle \par}
      \vspace{\stretch{2}}
      {\large
        Student number: \@id \par
        \@eauthor \par
      }
      \vskip \stretch{3}
      {\large Advising professor: Assistant Professor Takeshi Hagiwara \par}
      \vskip \stretch{4}
      {\large Department of Information Engineering, Faculty of Engineering, \par Niigata University \par}
      \vskip \stretch{5}
    \end{center}
  \end{titlepage}
}

\newcommand{\keywordname}{キーワード}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand{\@keywords}{\@latex@warning@no@line{No \noexpand\keywords given}}

\renewenvironment{abstract}{
  \newpage
  \null\vfil
  \begin{center}
    \Large \headfont \abstractname
  \end{center}
  \par}
{\par\vfil\null{\noindent \bf \keywordname} \hskip 1em \@keywords}

\newcommand{\eabstractname}{abstract}
\newcommand{\ekeywordname}{keywords}
\newcommand{\ekeywords}[1]{\gdef\@ekeywords{#1}}
\newcommand{\@ekeywords}{\@latex@warning@no@line{No \noexpand\ekeywords given}}

\newenvironment{eabstract}{
  \newpage
  \null\vfil
  \begin{center}
    \Large \headfont \eabstractname
  \end{center}}
{\par\vfil\null{\noindent \bf \ekeywordname} \hskip 1em \@ekeywords}

\renewcommand{\tableofcontents}{
  \settowidth\jsc@tocl@width{\headfont\prechaptername\postchaptername}
  \settowidth\@tempdima{\headfont\appendixname}
  \ifdim\jsc@tocl@width<\@tempdima \setlength\jsc@tocl@width{\@tempdima}\fi
  \ifdim\jsc@tocl@width<2zw \divide\jsc@tocl@width by 2 \advance\jsc@tocl@width 1zw\fi
  \chapter*{\contentsname}
  \@mkboth{\contentsname}{}
  \@starttoc{toc}
  \newpage
}

\newcommand{\acknowledgmentname}{謝辞}

\newenvironment{acknowledgment}{
  \addcontentsline{toc}{chapter}{\acknowledgmentname}
  \chapter*{\acknowledgmentname}
}{}

\renewenvironment{thebibliography}[1]{
  \chapter*{\bibname}\@mkboth{\bibname}{\bibname}
  \addcontentsline{toc}{chapter}{\bibname}
  \list{\@biblabel{\@arabic\c@enumiv}}
  {\settowidth\labelwidth{\@biblabel{#1}}
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy
  \clubpenalty4000
  \@clubpenalty\clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}
  \endlist}
