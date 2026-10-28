\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{general_style}[2026/03/08 general style LaTeX class]

% general format
\pdfoutput=1
\LoadClass[11pt,a4paper]{article}
\RequirePackage[a4paper, total={6.5in, 10in}]{geometry}
\RequirePackage{graphicx}
\graphicspath{{images/}}    % dossier pour les graphiques
\RequirePackage{hyperref}   % liens hypertextes
% \RequirePackage{xcolor}		% gestion des couleurs

% header and footer
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}   % pacackage pour gerer les en-tête et pieds de pages

\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{14.6pt}
\fancyhead[L]{\leftmark\hfill\today}
\fancyfoot[C]{p. \thepage/\pageref*{LastPage}}
\renewcommand{\footrulewidth}{0.3pt}
