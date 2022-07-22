# Mapping van eenheden



## Welke eenheden komen voor?

Er is uitgegaan van de volgende lijsten met eenheden:

*   BODC - De vocabulary [P06](https://vocab.nerc.ac.uk/search_nvs/P06/)
*   AQUO - De door AQUO beheerde lijst [Eenheid](https://www.aquo.nl/index.php/Id-04f4f467-021b-4218-baa8-9742ed977c61)
*   DDL - Eenheden in de [metadata]((https://rijkswaterstaat.github.io/wm-ws-dl/#ophalencatalogus)) van in de praktijk uitgeleverde gegevens uit de [Data Distributielaag](https://rijkswaterstaat.github.io/wm-ws-dl/#introduction)

De eenheden in de DDL zouden moeten voldoen aan AQUO, de verwachting is dus dat we alle eenheden in DDL kunnen matchen met eenheden in AQUO. 




### Vergelijking DDL en AQUO

De verwachting is dat alle eenheden die in de DDL gebruikt worden in de AQUO Eenheid lijst voorkomen. Dit is onderzocht door de eenheidcodes van de DDL te vergelijken met de eenheidcodes in de AQUO tabel Eenheid. Verreweg de meeste eenheden uit de DDL werden teruggevonden in de AQUO tabel. Tabel \@ref(tab:missingDDL) laat de eenheden zien die wel in de DDL gebruikt worden, maar niet teruggevonden konden worden in de AQUO Eenheid tabel, met de bijbehorende parameter.wat.omschrijving uit de DDL. 


::: {.rmdnote}


\begin{table}

\caption{(\#tab:missingDDL)DDL eenheid codes die niet in de AQUO eenheid lijst voorkomen.}
\centering
\begin{tabular}[t]{l|l|l}
\hline
Eenheid.Code & Eenheid.Omschrijving & Parameter\_Wat\_Omschrijving\\
\hline
/l & per liter & Aantal per volume Faecale coliformen in Organisme (biota) t.o.v. natgewicht in Vlees Mytilus edulis/l\\
\hline
RFU & Relative Fluorescence Units & (massa)Concentratie Chlorofyl fluorescentie in rel. fluorescentie eenh.(RFU) in Oppervlaktewater RFU\\
\hline
RFU & Relative Fluorescence Units & Fluorescentie Oppervlaktewater RFU\\
\hline
U & Unit & Fluorescentie Oppervlaktewater U\\
\hline
\end{tabular}
\end{table}




Hierbij moet aangetekend worden dat de eenheid "/l" in dit geval ook gelijkgesteld kan worden met de eenheid "n/l", die wel in de AQUO lijst voorkomt. 

AANBEVELING: verander eenheid "/l" in "n/l" in de DDL.

:::


### Vergelijking DDL en SDN (P0)

Het "Eenheid.Code" veld uit de ddl tabel lijkt op het veld "altlabel" uit de SDN tabel. Hierbij zijn alle "^" (bijv. in g/m^2) tekens uit de SDN tabel voor de vergelijking verwijderd. Een eerste poging om de twee modellen te mappen wordt daarom gedaan op die twee velden. Het blijkt (tabel \@ref(tab:ddl-sdn-eenheden)) dat er 30 codes precies gelijk zijn. De validiteit van deze mapping kan in de tabel \@ref(tab:ddl-sdn-eenheden)) geïnspecteerd worden. 

\begin{table}

\caption{(\#tab:ddl-sdn-eenheden)Eenheidcodes uit de DDL die direct vergelijkbaar zijn met de eenheidcodes uit de SDN tabel (veldnaam altlabel).}
\centering
\begin{tabular}[t]{l|l|l|l|l}
\hline
Eenheid.Code & Eenheid.Omschrijving & altlabel & preflabel & conceptid\\
\hline
\% & procent & \% & Percent & UPCT\\
\hline
Bq/kg & becquerel per kilogram & Bq/kg & Becquerels per kilogram & UBQK\\
\hline
g & gram & g & Grams & UGRM\\
\hline
g/kg & gram per kilogram & g/kg & Grams per kilogram & UGKG\\
\hline
mg/g & milligram per gram & mg/g & Milligrams per gram & MGPG\\
\hline
mg/kg & milligram per kilogram & mg/kg & Milligrams per kilogram & UMKG\\
\hline
mg/m2 & milligram per vierkante meter & mg/m\textasciicircum{}2 & Milligrams per square metre & UMMS\\
\hline
mm & millimeter & mm & Millimetres & UXMM\\
\hline
ug/kg & microgram per kilogram & ug/kg & Micrograms per kilogram & UUKG\\
\hline
um & micrometer & um & Micrometres (microns) & UMIC\\
\hline
hPa & hectopascal & hPa & Hectopascals & HPAX\\
\hline
m & meter & m & Metres & ULAA\\
\hline
m/s & meter per seconde & m/s & Metres per second & UVAA\\
\hline
cm & centimeter & cm & Centimetres & ULCM\\
\hline
d & dag & d & Days & UTAA\\
\hline
cm2 & vierkante centimeter & cm\textasciicircum{}2 & Square centimetres & SQCM\\
\hline
dB & decibel & dB & Decibels & UDBL\\
\hline
dm & decimeter & dm & Decimetres & ULDM\\
\hline
Hz & hertz & Hz & Hertz & UTHZ\\
\hline
kg/m3 & kilogram per kubieke meter & kg/m\textasciicircum{}3 & Kilograms per cubic metre & UKMC\\
\hline
mBq/l & millibecquerel per liter & mBq/l & Millibecquerels per litre & UMBQ\\
\hline
mg/l & milligram per liter & mg/l & Milligrams per litre & UMGL\\
\hline
min & minuut & min & Minutes & UMIN\\
\hline
mS/m & millisiemens per meter & mS/m & MilliSiemens per metre & MSPM\\
\hline
m3/s & kubieke meter per seconde & m\textasciicircum{}3/s & Cubic metres per second & CMPS\\
\hline
ng/l & nanogram per liter & ng/l & Nanograms per litre & UNGL\\
\hline
NTU & Nephelometric Turbidity Unit & NTU & Nephelometric Turbidity Units & USTU\\
\hline
s & seconde & s & Seconds & UTBB\\
\hline
S/m & siemens per meter & S/m & Siemens per metre & UECA\\
\hline
ug/l & microgram per liter & ug/l & Micrograms per litre & UGPL\\
\hline
h & uur & h & Hours & UHOR\\
\hline
l & liter & l & Litres & ULIT\\
\hline
ng/g & nanogram per gram & ng/g & Nanograms per gram & NGPG\\
\hline
ng/kg & nanogram per kilogram & ng/kg & Nanograms per kilogram & NGKG\\
\hline
\end{tabular}
\end{table}

Eenheden uit de DDL waar met de automatische methode geen exacte match gevonden werd in de SDN eenhedentabel (23) staan in tabel \@ref(tab:DDL-SDN-antijoin). 

\begin{table}

\caption{(\#tab:DDL-SDN-antijoin)Eenheidcodes uit de DDL die niet direct vergelijkbaar zijn met de eenheidcodes uit de SDN tabel (veldnaam altlabel).}
\centering
\begin{tabular}[t]{l|l}
\hline
Eenheid.Code & Eenheid.Omschrijving\\
\hline
mg & milligram\\
\hline
n & exemplaren\\
\hline
n/m2 & exemplaren per vierkante meter\\
\hline
n/l & exemplaren per liter\\
\hline
DIMSLS & dimensieloos\\
\hline
graad & graad\\
\hline
oC & graad Celsius\\
\hline
/l & per liter\\
\hline
n/hm & exemplaren per hectometer\\
\hline
FTU & Formazine Turbidity Unit\\
\hline
JTU & Jackson Turbidity Unit\\
\hline
meq/l & milliequivalent per liter\\
\hline
mHz & millihertz\\
\hline
m3/d & kubieke meter per dag\\
\hline
n/ml & exemplaren per milliliter\\
\hline
oD & Duitse graad\\
\hline
RFU & Relative Fluorescence Units\\
\hline
U & Unit\\
\hline
uE & microeinstein\\
\hline
\end{tabular}
\end{table}


### Handmatige mapping

Voor de niet-gematchte eenheden uit tabel \@ref(tab:DDL-SDN-antijoin) wordt hieronder een voorstel gedaan voor een handmatige mapping. 


```r
DDL_SDN_eenheid_hand <- DDL_SDN_verschil %>%
  mutate(altlabel = 
           case_when(
             Eenheid.Code == "mg" ~ NA_character_, # Grams (UGRM) en Micrograms (UGUG) komt wel voor
             Eenheid.Code == "n" ~ NA_character_, # in BODC altijd gerelateerd aan volume of lengte
             Eenheid.Code == "n/m2" ~ "#/m^2",
             Eenheid.Code == "n/l" ~ "#/l",
             Eenheid.Code == "DIMSLS" ~ "",
             Eenheid.Code == "graad" ~ "deg",
             Eenheid.Code == "oC" ~ "degC",
             Eenheid.Code == "/l" ~ "#/l",
             Eenheid.Code == "n/hm" ~ NA_character_, # (#/m komt wel voor)
             Eenheid.Code == "FTU" ~ NA_character_, # komt ook niet in AQUO voor
             Eenheid.Code == "JTU" ~ NA_character_, # komt ook niet in AQUO voor
             Eenheid.Code == "meq/l" ~ "mEquiv/l",
             Eenheid.Code == "mHz" ~ NA_character_, # (Hz komt wel voor)
             Eenheid.Code == "m3/d" ~ NA_character_,  # (m^3/s komt wel voor)
             Eenheid.Code == "n/ml" ~ "#/ml",
             Eenheid.Code == "oD" ~ NA_character_,  # (duitse graad, komt in mariene metingen niet voor)
             Eenheid.Code == "RFU" ~ NA_character_, # komt ook niet in AQUO voor
             Eenheid.Code == "U" ~ NA_character_,   # komt ook niet in AQUO voor
             Eenheid.Code == "uE"  ~ NA_character_  # waarschijnlijk uE/cm^2/s, vraag is of het voorkomt in marien milieu
           )
         )

```



Er is een probleem bij het mappen van de eenheid "DIMSLS" die in de DDL gebruikt wordt. Weliswaar is er een eenheid met preflabel = "Dimensionless" in de P06 tabel, maar dit leidt vermoedelijk niet tot een goede mapping. 

De eenheid "DIMSLS" wordt in de DDL gebruikt voor de parameter.wat.omschrijvingen zoals in tabel \@ref(tab:DDL-DIMSLS)).  Hier zitten grootheden als Extinctie, Zuurgraad en Saliniteit tussen, die in SDN termen een eigen eenheid hebben. In de P06 tabel zijn de eenheden "pH units", "per metre" en "g/kg" te vinden die gangbaar zijn voor respectievelijk Zuurgraad, Extinctie en Saliniteit. Een mapping hiervan kan in de huidige situatie niet alleen op grond van eenheidcode, maar moet ook de grootheid meenemen. 

Afgezien van het feit dat er geen een-op-een mapping mogelijk is, is ook de meer inhoudelijke vraag belangrijk of "dimensieloos" wel informatief is in deze gevallen. 


\begin{table}

\caption{(\#tab:DDL-DIMSLS)DDL Grootheid.Omschrijving waarden die de eenheid DIMSLS hebben. }
\centering
\begin{tabular}[t]{l|l}
\hline
Parameter\_Wat\_Omschrijving & Grootheid.Omschrijving\\
\hline
Bewolkingsgraad Lucht & Waarde is niet van toepassing\\
\hline
Intersexindex Organisme (biota) Littorina littorea & Intersexindex\\
\hline
Vas Deferens Sequence Index (zaadleider index) Organisme (biota) Nassarius reticulatus & Vas Deferens Sequence Index (zaadleider index)\\
\hline
Aanwezigheid Geur in Oppervlaktewater & Aanwezigheid\\
\hline
Aanwezigheid Kleur in Oppervlaktewater & Aanwezigheid\\
\hline
Aanwezigheid Olie in Oppervlaktewater & Aanwezigheid\\
\hline
Aanwezigheid Schuim in Oppervlaktewater & Aanwezigheid\\
\hline
Aanwezigheid Vuil in Oppervlaktewater & Aanwezigheid\\
\hline
Aantal golven in 20 minuten periode Oppervlaktewater & Aantal golven in 20 minuten periode\\
\hline
Anomalie Oppervlaktewater Uitgedrukt in Gadolinium na filtratie in & Anomalie\\
\hline
Aantal vrijheidsgraden bij het variantiedichtheidspectrum Oppervlaktewater & Aantal vrijheidsgraden bij het variantiedichtheidspectrum\\
\hline
Aantal vrijheidsgraden behorend bij het golfrichtingspectrum Oppervlaktewater & Aantal vrijheidsgraden behorend bij het golfrichtingspectrum\\
\hline
Extinctie Oppervlaktewater & Extinctie\\
\hline
Geurverdunningsfactor Oppervlaktewater & Geurverdunningsfactor\\
\hline
Getijextreemtype Oppervlaktewater & Waarde is niet van toepassing\\
\hline
Kleur intensiteit Oppervlaktewater uitgedrukt volgens PtCo-schaal in & Waarde is niet van toepassing\\
\hline
Zuurgraad Oppervlaktewater & Zuurgraad\\
\hline
Reuk Oppervlaktewater & Reuk\\
\hline
Saliniteit Oppervlaktewater & Saliniteit\\
\hline
\end{tabular}
\end{table}

::: {.rmdnote}

**Aanbeveling**

De AQUO eenheidcode DIMSLS (Dimensieloos) die in de DDL gebruikt wordt is misschien formeel correct, maar is niet informatief. Bovendien zorgt dit ervoor dat eenheden niet te converteren zijn naar BODC termen. Het verdient daarom aanbeveling om deze te veranderen naar een meer informatieve eenheid. Voor een koppeling naar BODC (beperkt tot waarnemingen in mariene milie) zijn vooral eenheden voor de volgende grootheden van belang:

Grootheid | Huidige eenheid DDL | Voorstel nieuwe eenheid | P06 alt label
--------|----------|----------
Saliniteit | DIMSLS | g/kg | g/kg
Zuurgraad | DIMSLS| pH-eenheid | pH units
Extinctie | DIMSLS | /m | per metre

:::

### Uiteindelijke mapping van eenheden.

Door de tabellen met de automatische en de handmatige mapping samen te voegen, wordt een mappingtabel gemaakt die zo veel mogelijk compleet is. 

\begin{table}

\caption{(\#tab:unnamed-chunk-3)Samengevoegde tabel (automatisch en handmatig gematcht. }
\centering
\begin{tabular}[t]{l|l|l|l|l}
\hline
Eenheid.Code & Eenheid.Omschrijving & altlabel & preflabel & uri\\
\hline
\% & procent & \% & Percent & http://vocab.nerc.ac.uk/collection/P06/current/UPCT/\\
\hline
Bq/kg & becquerel per kilogram & Bq/kg & Becquerels per kilogram & http://vocab.nerc.ac.uk/collection/P06/current/UBQK/\\
\hline
g & gram & g & Grams & http://vocab.nerc.ac.uk/collection/P06/current/UGRM/\\
\hline
g/kg & gram per kilogram & g/kg & Grams per kilogram & http://vocab.nerc.ac.uk/collection/P06/current/UGKG/\\
\hline
mg/g & milligram per gram & mg/g & Milligrams per gram & http://vocab.nerc.ac.uk/collection/P06/current/MGPG/\\
\hline
mg/kg & milligram per kilogram & mg/kg & Milligrams per kilogram & http://vocab.nerc.ac.uk/collection/P06/current/UMKG/\\
\hline
mg/m2 & milligram per vierkante meter & mg/m\textasciicircum{}2 & Milligrams per square metre & http://vocab.nerc.ac.uk/collection/P06/current/UMMS/\\
\hline
mm & millimeter & mm & Millimetres & http://vocab.nerc.ac.uk/collection/P06/current/UXMM/\\
\hline
ug/kg & microgram per kilogram & ug/kg & Micrograms per kilogram & http://vocab.nerc.ac.uk/collection/P06/current/UUKG/\\
\hline
um & micrometer & um & Micrometres (microns) & http://vocab.nerc.ac.uk/collection/P06/current/UMIC/\\
\hline
hPa & hectopascal & hPa & Hectopascals & http://vocab.nerc.ac.uk/collection/P06/current/HPAX/\\
\hline
m & meter & m & Metres & http://vocab.nerc.ac.uk/collection/P06/current/ULAA/\\
\hline
m/s & meter per seconde & m/s & Metres per second & http://vocab.nerc.ac.uk/collection/P06/current/UVAA/\\
\hline
cm & centimeter & cm & Centimetres & http://vocab.nerc.ac.uk/collection/P06/current/ULCM/\\
\hline
d & dag & d & Days & http://vocab.nerc.ac.uk/collection/P06/current/UTAA/\\
\hline
cm2 & vierkante centimeter & cm\textasciicircum{}2 & Square centimetres & http://vocab.nerc.ac.uk/collection/P06/current/SQCM/\\
\hline
dB & decibel & dB & Decibels & http://vocab.nerc.ac.uk/collection/P06/current/UDBL/\\
\hline
dm & decimeter & dm & Decimetres & http://vocab.nerc.ac.uk/collection/P06/current/ULDM/\\
\hline
Hz & hertz & Hz & Hertz & http://vocab.nerc.ac.uk/collection/P06/current/UTHZ/\\
\hline
kg/m3 & kilogram per kubieke meter & kg/m\textasciicircum{}3 & Kilograms per cubic metre & http://vocab.nerc.ac.uk/collection/P06/current/UKMC/\\
\hline
mBq/l & millibecquerel per liter & mBq/l & Millibecquerels per litre & http://vocab.nerc.ac.uk/collection/P06/current/UMBQ/\\
\hline
mg/l & milligram per liter & mg/l & Milligrams per litre & http://vocab.nerc.ac.uk/collection/P06/current/UMGL/\\
\hline
min & minuut & min & Minutes & http://vocab.nerc.ac.uk/collection/P06/current/UMIN/\\
\hline
mS/m & millisiemens per meter & mS/m & MilliSiemens per metre & http://vocab.nerc.ac.uk/collection/P06/current/MSPM/\\
\hline
m3/s & kubieke meter per seconde & m\textasciicircum{}3/s & Cubic metres per second & http://vocab.nerc.ac.uk/collection/P06/current/CMPS/\\
\hline
ng/l & nanogram per liter & ng/l & Nanograms per litre & http://vocab.nerc.ac.uk/collection/P06/current/UNGL/\\
\hline
NTU & Nephelometric Turbidity Unit & NTU & Nephelometric Turbidity Units & http://vocab.nerc.ac.uk/collection/P06/current/USTU/\\
\hline
s & seconde & s & Seconds & http://vocab.nerc.ac.uk/collection/P06/current/UTBB/\\
\hline
S/m & siemens per meter & S/m & Siemens per metre & http://vocab.nerc.ac.uk/collection/P06/current/UECA/\\
\hline
ug/l & microgram per liter & ug/l & Micrograms per litre & http://vocab.nerc.ac.uk/collection/P06/current/UGPL/\\
\hline
h & uur & h & Hours & http://vocab.nerc.ac.uk/collection/P06/current/UHOR/\\
\hline
l & liter & l & Litres & http://vocab.nerc.ac.uk/collection/P06/current/ULIT/\\
\hline
ng/g & nanogram per gram & ng/g & Nanograms per gram & http://vocab.nerc.ac.uk/collection/P06/current/NGPG/\\
\hline
ng/kg & nanogram per kilogram & ng/kg & Nanograms per kilogram & http://vocab.nerc.ac.uk/collection/P06/current/NGKG/\\
\hline
mg & milligram & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
n & exemplaren & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
n/m2 & exemplaren per vierkante meter & \#/m\textasciicircum{}2 & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
n/l & exemplaren per liter & \#/l & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
DIMSLS & dimensieloos &  & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
graad & graad & deg & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
oC & graad Celsius & degC & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
/l & per liter & \#/l & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
n/hm & exemplaren per hectometer & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
FTU & Formazine Turbidity Unit & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
JTU & Jackson Turbidity Unit & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
meq/l & milliequivalent per liter & mEquiv/l & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
mHz & millihertz & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
m3/d & kubieke meter per dag & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
n/ml & exemplaren per milliliter & \#/ml & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
oD & Duitse graad & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
RFU & Relative Fluorescence Units & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
U & Unit & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
uE & microeinstein & NA & NA & http://vocab.nerc.ac.uk/collection/P06/current/NA/\\
\hline
\end{tabular}
\end{table}


