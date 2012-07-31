\ProvidesClass{mythesis}

%% For normal draft builds
\LoadClass[hyperpdf,nobind,draft,sftitles,oneside]{hepthesis}

%% For short draft builds (breaks citations by necessity)
%\LoadClass[hyperpdf,nobind,draft,hidefrontback]{hepthesis}

%% For Cambridge soft-bound version
%\LoadClass[hyperpdf,bindnopdf]{hepthesis}

%% For Cambridge hard-bound version (must be one-sided)
%\LoadClass[hyperpdf,oneside]{hepthesis}

%% -------------------------------------
%% Standard packages
%% -------------------------------------
\RequirePackage{cite}
\RequirePackage{mathrsfs} % script font
\RequirePackage{afterpage}

%% Subfigures - note subfig is incompatible with ccaption
\RequirePackage{subfig}

