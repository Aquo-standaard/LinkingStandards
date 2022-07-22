






# Kwaliteitsoordeel

In AQUO kunnen verschillende kwaliteitsoordelen worden toegekend aan een meetwaarde (tabel \@ref(tab:aquoKwaliteitsoordeel)). Het is niet eenvoudig om te bepalen welke codes in de praktijk worden toegepast. Het gebruik in de Data Distributielaag kan alleen bepaald worden wanneer data daadwerkelijk gedownloadt worden.



\begin{table}

\caption{(\#tab:aquoKwaliteitsoordeel)Aquo kwaliteitsoordeelcodes en -omschrijvingen.}
\centering
\begin{tabular}[t]{l|l|l}
\hline
  & Codes & Omschrijving\\
\hline
1 & 00 & Normale waarde\\
\hline
5 & 03 & Waarde heeft een grotere spreiding dan beschreven\\
\hline
7 & 04 & Bepaald met hele detectiegrens\\
\hline
8 & 05 & Bepaald met halve detectiegrens\\
\hline
12 & 06 & Bepaald met nul waarde voor detectiegrens\\
\hline
14 & 07 & Waarde is verhoogde rapportagegrens\\
\hline
2 & 10 & In de ruimte geïnterpoleerde waarde\\
\hline
3 & 20 & In de tijd geïnterpoleerde waarde\\
\hline
4 & 25 & In ruimte en tijd geïnterpoleerde waarde\\
\hline
6 & 30 & Waarde beïnvloedt door ruimtelijke activiteiten\\
\hline
9 & 50 & Niet-plausibele waarde\\
\hline
10 & 55 & Gevlagde waarde, bepaald met halve detectiegrens\\
\hline
11 & 56 & Gevlagde waarde, bepaald met nul waarde voor detectiegrens\\
\hline
13 & 61 & Gecorrigeerde waarde op basis van systematische fout\\
\hline
15 & 70 & Afgekeurde waarde op basis van trendgedrag\\
\hline
16 & 71 & Afgekeurde waarde op basis van harde grenzen\\
\hline
17 & 72 & Afgekeurde waarde op basis van ionenbalans\\
\hline
18 & 73 & Afgekeurde waarde op basis van springerigheid\\
\hline
19 & 74 & Afgekeurde waarde op basis van levendigheid\\
\hline
20 & 75 & Afgekeurde waarde op basis van uitbijter\\
\hline
21 & 76 & Afgekeurde waarde o.b.v. correlatie tussen meetlocaties\\
\hline
22 & 77 & Afgekeurde waarde op basis van correlatie tussen parameters\\
\hline
23 & 78 & Afgekeurde waarde opgeloste parameter is hoger dan totaal\\
\hline
24 & 79 & Afgekeurde waarde agv rapportage lager dan rapportagegrens\\
\hline
25 & 80 & Afgekeurde waarde op basis van trendbreuk\\
\hline
26 & 81 & Afgekeurde waarde op basis van controlemeting\\
\hline
27 & 82 & Afgekeurde waarde op basis van waterbalans\\
\hline
28 & 83 & Afwijkende waarde als gevolg van buiten meetbereik\\
\hline
29 & 84 & Afwijkende waarde als gevolg van foutieve nulpunt\\
\hline
30 & 90 & Afwijkende waarde na validatie goedgekeurd\\
\hline
31 & 91 & Afwijkende waarde i.v.m. extreme situatie (calamiteit)\\
\hline
32 & 98 & Waarde bepaald op onvolledige basis\\
\hline
33 & 99 & Hiaat waarde\\
\hline
\end{tabular}
\end{table}
De corresponderende tabel met algemene kwalititeitsoordelen van BODC is de tabel [L20](http://vocab.nerc.ac.uk/collection/L20/current/) (figuur \@ref(tab:bodcKwaliteitsoordeel)). BODC hanteert hiernaast tabellen met  meer specifieke "quality flags" voor bepaalde apparaten of organisaties (IODE). Hier gaan we nu niet verder op in. 





\begin{tabular}[t]{l|l|l}
\hline
conceptid & preflabel & definition\\
\hline
0 & no quality control & No quality control procedures have been applied to the data value. This is the initial status for all data values entering the working archive.\\
\hline
1 & good value & Good quality data value that is not part of any identified malfunction and has been verified as consistent with real phenomena during the quality control process.\\
\hline
2 & probably good value & Data value that is probably consistent with real phenomena but this is unconfirmed or data value forming part of a malfunction that is considered too small to affect the overall quality of the data object of which it is a part.\\
\hline
3 & probably bad value & Data value recognised as unusual during quality control that forms part of a feature that is probably inconsistent with real phenomena.\\
\hline
4 & bad value & An obviously erroneous data value.\\
\hline
5 & changed value & Data value adjusted during quality control.  Best practice strongly recommends that the value before the change be preserved in the data or its accompanying metadata.\\
\hline
6 & value below detection & The level of the measured phenomenon was less than the limit of detection (LoD) for the method employed to measure it. The accompanying value is the detection limit for the technique or zero if that value is unknown.\\
\hline
7 & value in excess & The level of the measured phenomenon was too large to be quantified by the technique employed to measure it.  The accompanying value is the measurement limit for the technique.\\
\hline
8 & interpolated value & This value has been derived by interpolation from other values in the data object.\\
\hline
9 & missing value & The data value is missing. There should be no accompanying value in ODV format files. The accompanying value in SeaDataNet NetCDF data must be the absent data representation specified by the \_FillValue parameter attribute and lie outside the range of data not flagged bad (4) or probably bad (3).\\
\hline
A & value phenomenon uncertain & There is uncertainty in the description of the measured phenomenon associated with the value such as chemical species or biological entity.\\
\hline
Q & value below limit of quantification & The level of the measured phenomenon was less than the limit of quantification (LoQ). The accompanying value is the limit of quantification for the analytical method.\\
\hline
\end{tabular}


In eerder werk (NWDM) is een mapping gemaakt op basis van data uit de DDL voor Noordzee en Waddenzee (fysische-chemische data). Het voorstel is om deze als basis te gebruiken. De tabel 



Dit


\begin{table}

\caption{(\#tab:Kwaliteitscodecomparison)Voorgestelde apping van kwaliteitscodes.}
\centering
\begin{tabular}[t]{l|l|l|l}
\hline
aquo\_code & aquo\_omschrijving & conceptid & preflabel\\
\hline
00 & Normale waarde & 1 & good value\\
\hline
03 & Waarde heeft een grotere spreiding dan beschreven & 2 & probably good value\\
\hline
04 & Bepaald met hele detectiegrens & 2 & probably good value\\
\hline
05 & Bepaald met halve detectiegrens & 2 & probably good value\\
\hline
06 & Bepaald met nul waarde voor detectiegrens & 2 & probably good value\\
\hline
07 & Waarde is verhoogde rapportagegrens & 2 & probably good value\\
\hline
10 & In de ruimte geïnterpoleerde waarde & 2 & probably good value\\
\hline
20 & In de tijd geïnterpoleerde waarde & 2 & probably good value\\
\hline
25 & In ruimte en tijd geïnterpoleerde waarde & 2 & probably good value\\
\hline
30 & Waarde beïnvloedt door ruimtelijke activiteiten & 2 & probably good value\\
\hline
50 & Niet-plausibele waarde & 3 & probably bad value\\
\hline
98 & Waarde bepaald op onvolledige basis & 3 & probably bad value\\
\hline
99 & Hiaat waarde & 4 & bad value\\
\hline
55 & Gevlagde waarde, bepaald met halve detectiegrens & NA & NA\\
\hline
56 & Gevlagde waarde, bepaald met nul waarde voor detectiegrens & NA & NA\\
\hline
61 & Gecorrigeerde waarde op basis van systematische fout & NA & NA\\
\hline
70 & Afgekeurde waarde op basis van trendgedrag & NA & NA\\
\hline
71 & Afgekeurde waarde op basis van harde grenzen & NA & NA\\
\hline
72 & Afgekeurde waarde op basis van ionenbalans & NA & NA\\
\hline
73 & Afgekeurde waarde op basis van springerigheid & NA & NA\\
\hline
74 & Afgekeurde waarde op basis van levendigheid & NA & NA\\
\hline
75 & Afgekeurde waarde op basis van uitbijter & NA & NA\\
\hline
76 & Afgekeurde waarde o.b.v. correlatie tussen meetlocaties & NA & NA\\
\hline
77 & Afgekeurde waarde op basis van correlatie tussen parameters & NA & NA\\
\hline
78 & Afgekeurde waarde opgeloste parameter is hoger dan totaal & NA & NA\\
\hline
79 & Afgekeurde waarde agv rapportage lager dan rapportagegrens & NA & NA\\
\hline
80 & Afgekeurde waarde op basis van trendbreuk & NA & NA\\
\hline
81 & Afgekeurde waarde op basis van controlemeting & NA & NA\\
\hline
82 & Afgekeurde waarde op basis van waterbalans & NA & NA\\
\hline
83 & Afwijkende waarde als gevolg van buiten meetbereik & NA & NA\\
\hline
84 & Afwijkende waarde als gevolg van foutieve nulpunt & NA & NA\\
\hline
90 & Afwijkende waarde na validatie goedgekeurd & NA & NA\\
\hline
91 & Afwijkende waarde i.v.m. extreme situatie (calamiteit) & NA & NA\\
\hline
NA & NA & 0 & no quality control\\
\hline
NA & NA & 5 & changed value\\
\hline
NA & NA & 6 & value below detection\\
\hline
NA & NA & 7 & value in excess\\
\hline
NA & NA & 8 & interpolated value\\
\hline
NA & NA & 9 & missing value\\
\hline
NA & NA & A & value phenomenon uncertain\\
\hline
NA & NA & Q & value below limit of quantification\\
\hline
\end{tabular}
\end{table}


