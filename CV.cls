\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{CV}
\LoadClassWithOptions{article}

% Load various useful packages
\RequirePackage{microtype}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{csquotes}
\RequirePackage{url}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% If you want to change page size, margins, etc., change the arguments for the
% geometry package.
\RequirePackage[]{geometry}

% The length of the hanging indentation of headlines.
\newlength\hang
\setlength\hang{1cm}    % Change this number to your liking

% Define/change some to get the hanging headlines effect. Ignore this.
\addtolength{\oddsidemargin}{\hang}
\newlength{\fullwidth}
\setlength\fullwidth{\textwidth}
\addtolength{\textwidth}{-\hang}

% Define CV environment.
% See the enumitem package documentation for possible options passed to the
% \setlist command.
\newlist{CV}{description}{1}
\setlist[CV]{
    style=sameline,
    labelindent=0cm,    % Do not indent the label/date (it is already indented by \hang).
    itemindent=0cm,    
    leftmargin=2.5cm,   % Indent the actual text by this much.
    font=\normalfont,   % Formatting applied to the label/date.
}

% The headlines. See the titlesec package documentation for what could be done
% here.
\titleformat{\section}[hang]
    {\bfseries}         % Overall formatting
    {}                  % The section number. We leave this empty to not print one.
    {-\hang}            % The distance between number and text. We use this to have the hanging headlines.
    {}                  % Code inserted before the headline
    []                  % Code inserted after the headline.

% Do no indent paragraphs
\setlength\parindent{0pt}

% We redefine the \title and \author commands to make them equivalent.
\renewcommand\title[1]{%
	\def\@title{#1 (Curriculum Vitae)}% This will be put into the pdf title (not the title shown on the page).
	\def\@author{#1}%
}
\let\author\title

% Redefine \maketitle. If you change anything remember to add comment
% characters "%" at the end of each line to avoid introducing unwelcome white
% space.
\renewcommand\maketitle{%
    \hspace{-\hang}%                                   
    {\Large\scshape\MakeLowercase{\@author}}\par%           % Change this line to change the formating of the title.
    \vspace{-0.5em}\hspace{-\hang}\rule{\fullwidth}{0.4pt}% % Put a line under the title.
}

% The foot line (see the fancyhdr package)
\fancyhead{}    % Clear defaults
\fancyfoot{}
\renewcommand{\headrulewidth}{0.0pt}    % We don't want a line at the top.
\renewcommand{\footrulewidth}{0.0pt}    % Change this to have a line at the bottom.
\fancyfoot[R]{\color{gray}Curriculum Vitae, \@author, p.~\thepage}
\pagestyle{fancy}

% Load the hyperref package. Load any packages that need to be loaded before 
% hyperref before this.
\RequirePackage{hyperref}

% Set pdf info.
\AtBeginDocument{%
    \hypersetup{
        pdfinfo={
            Title={\@title},
            Author={\@author},
        }
    }%
}

% Set URLs in roman font.
\urlstyle{rm}

% Define a command for e-mails
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}} 
