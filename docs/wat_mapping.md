# Mapping van "wat" tabellen






## Vergelijking DDL metadata en P01 vocabulaire

De Data Distributie Laag (DDL) bevat fysische, chemische en deels biologische gegevens van Rijkswaterstaat in het waterdomein. Zie voor een overzicht [deze weblink](https://rijkswaterstaatdata.nl/waterdata/). Hier staan ook links naar instructies voor benadering van de webservices. Een beknopt overzicht van de DDL kan worden opgevraagd via de metadata service. Hieruit blijkt dat het totale aantal unieke combinaties van de metadatavelden Compartiment.Code, Grootheid.Code, Hoedanigheid.Code, Parameter.Code in de DDL is 1710. 

Binnen de aquo domeintabellen is in eerdere projecten de mapping tabel idsw_aquo_map_PO1 gemaakt om sommige elementen van aquo te koppelen aan de seadatanet semantiek. Deze tabel wordt hier als uitgangspunt gebruikt om P01 termen te koppelen aan metadata uit de Data Distributielaag (DDL). Hierna moeten de P01 termen uitgesplitst worden in de verschillende onderliggende componenten om een 1:1 mapping te verkrijgen van de individuele *S*-termen.

De AquoMetadataLijst uit de DDL metadata is grotendeels opgebouwd volgens AQUO IM-metingen, maar wijkt op een aantal punten af. Onder andere doordat het veld Hoedanigheid.code is opgebouwd uit twee verschillende AQUO codes, namelijk Hoedanigheid.code en Monstercriterium.code. Idem voor de omschrijvingen. In de idsw_aquo_map_PO1 zijn deze twee velden niet gecombineerd. Voor een kansrijke automatische mapping worden in idsw_aquo_map_PO1 deze velden aan elkaar geplakt. In idsw_aquo_map_PO1 zijn "lege" velden echt leeg terwijl deze in de DDL metadata gevuld zijn met "NVT". Dus, vóórdat de P01 koppeltabel gekoppeld kan worden aan de AQUO catalogustabel worden Hoedanigheid.code en Monstercriterium.code gecombineerd in één veld en alle lege plekken gevuld met "NVT". 



De metadata uit de DDL worden hierna gecombineerd met de mapping_P01 tabel op de velden:





waarin *Aquo_Monstercriterium_Hoedanigheid_code* de combinatie is van monstercriterium en hoedanigheid. 






De uiteindelijke mapping geeft als resultaat een tabel met 2015 regels. 




## Uitsplitsing in onderdelen van P01

\begin{table}

\caption{(\#tab:unnamed-chunk-5)BODC "S-tabellen" die onderdelen bevatten van de P01 parameter tabel.}
\centering
\fontsize{10}{12}\selectfont
\begin{tabu} to \linewidth {>{\raggedright}X>{\raggedright}X>{\raggedright}X}
\hline
Library & Alt.Title & Title\\
\hline
S02 & Where/what relationships & BODC parameter semantic model relationships between what theme and where theme\\
\hline
S03 & Sample preparation & BODC parameter semantic model sample preparation entity descriptions\\
\hline
S04 & Analytical method & BODC parameter semantic model analytical method entity descriptions\\
\hline
S05 & Data processing & BODC parameter semantic model data processing entity descriptions\\
\hline
S06 & Parameter entity names & BODC parameter semantic model parameter entity names\\
\hline
S07 & Parameter statistic & BODC parameter semantic model parameter statistic\\
\hline
S11 & Biological entity life stage terms & BODC parameter semantic model biological entity development stage terms\\
\hline
S21 & Sphere names & BODC parameter semantic model sphere names\\
\hline
S23 & Sphere phase names & BODC semantic model sphere phase names\\
\hline
S25 & Biological entity names & BODC parameter semantic model biological entity names\\
\hline
S26 & BODC matrices & BODC parameter semantic model matrices\\
\hline
S27 & BODC substances & BODC parameter semantic model chemical substances\\
\hline
\end{tabu}
\end{table}





### parameter vs BODC substances

!!! Een eenduidige mapping kan onafhankelijk van eerdere mappings worden gemaakt door het vergelijken van CAS nummers, deze staan in p01s tabel, maar het staat verborgen in de P01 beschrijving. Een betere manier is waarschijnlijk om de S27 termen te relateren aan CAS nummers door deze op te halen via https://www.w3.org/2002/07/owl#sameAs , bijvoorbeeld:

S27 http://vocab.nerc.ac.uk/collection/S27/current/CS026903/ 
https://www.w3.org/2002/07/owl#sameAs
https://chem.nlm.nih.gov/chemidplus/rn/17181-37-2

zo is voor Silicate een van de bijbehorende links "same as" naar https://chem.nlm.nih.gov/chemidplus/rn/17181-37-2. Hierin staat een CAS nummer. Door deze te relateren kan een verbinding worden gemaakt met de technische tabel "chemische stof". 






Vanuit de gekoppelde tabel wordt een mapping geëxtraheerd door de unieke combinaties van relevante AQUO (parameter.code, parameter.omschrijving) en SDN (S27_preflabel, S27_altlabel, s27_conceptid) velden te combineren. Deze lijst dient nog handmatig gecontroleerd te worden. Met deze methode kunnen 161 van de 875 (totaal aantal unieke parameter.code waarden) gecombineerd worden met een S27 term.


\begin{tabular}[t]{l|l|l|l|l}
\hline
Parameter.Code & Parameter.Omschrijving & s27\_conceptid & S27\_preflabel & S27\_altlabel\\
\hline
O2 & zuurstof & CS002779 & oxygen & O2\\
\hline
Fe & ijzer & CS000284 & total iron & total\_Fe\\
\hline
Ca & calcium & CS002921 & calcium & Ca\\
\hline
K & kalium & CS002923 & potassium & K\\
\hline
Mg & magnesium & CS002981 & magnesium & Mg\\
\hline
Na & natrium & CS002904 & sodium & Na\\
\hline
DC4ySn & dibutyltin (kation) & CS000431 & dibutyltin & DBT dibutylstannane\\
\hline
DFySn & difenyltin (kation) & CS000452 & diphenyltin & DPT diphenylstannane\\
\hline
TC4ySn & tributyltin (kation) & CS002650 & tributyltin cation & tributylstannylium TBT+\\
\hline
T4C4ySn & tetrabutyltin & CS003148 & tetrabutyltin & \\
\hline
Ag & zilver & CS002615 & silver & Ag\\
\hline
As & arseen & CS002328 & arsenic & As\\
\hline
B & boor & CS003263 & boron & B\\
\hline
Ba & barium & CS002335 & barium & Ba\\
\hline
Be & beryllium & CS003266 & beryllium & Be\\
\hline
Cd & cadmium & CS002363 & cadmium & Cd\\
\hline
Co & kobalt & CS002447 & cobalt & Co\\
\hline
Cr & chroom & CS002377 & chromium & Cr\\
\hline
Cu & koper & CS002454 & copper & Cu\\
\hline
Hg & kwik & CS001621 & total mercury & total\_Hg\\
\hline
Li & lithium & CS002552 & lithium & Li\\
\hline
Mn & mangaan & CS000305 & total manganese & total\_Mn\\
\hline
Mo & molybdeen & CS003003 & molybdenum & Mo\\
\hline
Ni & nikkel & CS002566 & nickel & Ni\\
\hline
Pb & lood & CS002545 & lead & Pb\\
\hline
Rb & rubidium & CS003116 & rubidium & Rb\\
\hline
Sb & antimoon & CS002962 & antimony & Sb\\
\hline
Se & seleen & CS002608 & selenium & Se\\
\hline
Sn & tin & CS003004 & tin & Sn\\
\hline
Sr & strontium & CS002622 & strontium & Sr\\
\hline
Te & tellurium & CS003145 & tellurium & Te\\
\hline
Ti & titaan & CS002918 & titanium & Ti\\
\hline
Tl & thallium & CS003132 & thallium & Tl\\
\hline
U & uranium & CS026907 & uranium & U\\
\hline
V & vanadium & CS002664 & vanadium & V\\
\hline
Zn & zink & CS002678 & zinc & Zn\\
\hline
aedsfn & alfa-endosulfan & CS002307 & alpha-endosulfan & \\
\hline
aHCH & alfa-hexachloorcyclohexaan & CS002321 & alpha-hexachlorocyclohexane & alpha-HCH\\
\hline
alCl & alachloor & CS001173 & alachlor & \\
\hline
aldn & aldrin & CS002293 & aldrin & \\
\hline
Ant & antraceen & CS002027 & anthracene & \\
\hline
atzne & atrazine & CS001579 & atrazine & \\
\hline
BaP & benzo(a)pyreen & CS001908 & benzo(a)pyrene & \\
\hline
BbF & benzo(b)fluorantheen & CS001915 & benzo(b)fluoranthene & \\
\hline
bedsfn & beta-endosulfan & CS003282 & beta-endosulfan & \\
\hline
Ben & benzeen & CS003272 & benzene & \\
\hline
bentzn & bentazon & CS001187 & bentazone & bentazon\\
\hline
BghiPe & benzo(ghi)peryleen & CS001936 & benzo(g,h,i)perylene & \\
\hline
bHCH & beta-hexachloorcyclohexaan & CS002349 & beta-hexachlorocyclohexane & beta-HCH\\
\hline
BkF & benzo(k)fluorantheen & CS001950 & benzo(k)fluoranthene & \\
\hline
captn & captan & CS003284 & captan & \\
\hline
cHCH & gamma-hexachloorcyclohexaan (lindaan) & CS002503 & gamma-hexachlorocyclohexane & lindane gamma-HCH\\
\hline
CHLFa & chlorofyl-a & CS002942 & chlorophyllide-a & \\
\hline
cHpClepO & cis-heptachloorepoxide & CS002440 & cis-heptachlor epoxide & \\
\hline
ClBen & chloorbenzeen & CS003286 & chlorobenzene & \\
\hline
Clfvfs & chloorfenvinfos & CS001201 & chlorfenvinphos & chlorfenvinfos\\
\hline
Clidzn & chloridazon & CS001208 & chloridazon & \\
\hline
Clpfm & chloorprofam & CS001600 & chlorpropham & \\
\hline
Cltlrn & chloortoluron & CS001222 & chlortoluron & chlorotoluron\\
\hline
cumfs & cumafos & CS000375 & coumaphos & \\
\hline
cumn & cumeen & CS003258 & (1-methylethyl)benzene & isopropylbenzene cumene\\
\hline
C1yazfs & methylazinfos & CS001586 & azinphos-methyl & \\
\hline
C1yClprfs & methylchloorpyrifos & CS001215 & chlorpyrifos-methyl & \\
\hline
C1ymsfrn & methyl-metsulfuron & CS000725 & metsulfuron-methyl & \\
\hline
C1yprmfs & methylpirimifos & CS001425 & pirimiphos-methyl & \\
\hline
C1yprton & methylparathion & CS003164 & parathion-methyl & \\
\hline
c12DClC2e & cis-1,2-dichlooretheen & CS000333 & cis-1,2-dichloroethene & \\
\hline
C2yazfs & ethylazinfos & CS001180 & azinphos-ethyl & \\
\hline
C2yBen & ethylbenzeen & CS003317 & ethylbenzene & \\
\hline
C2yClprfs & ethylchloorpyrifos & CS003289 & chlorpyrifos & \\
\hline
C2yprton & ethylparathion & CS000781 & parathion-ethyl & \\
\hline
Daznn & diazinon & CS000424 & diazinon & \\
\hline
DClC1a & dichloormethaan & CS003270 & dichloromethane & \\
\hline
DClvs & dichloorvos & CS003283 & dichlorvos & \\
\hline
DEHP & bis(2-ethylhexyl)ftalaat (DEHP) & CS001194 & bis(2-ethylhexyl)phthalate & DEHP\\
\hline
dHCH & delta-hexachloorcyclohexaan & CS000396 & delta-hexachlorocyclohexane & delta-HCH\\
\hline
dieldn & dieldrin & CS002468 & dieldrin & \\
\hline
Dmtat & dimethoaat & CS000438 & dimethoate & \\
\hline
dmtn & deltamethrin & CS000403 & deltamethrin & \\
\hline
dodne & dodine & CS000508 & dodine & 1-dodecylguanidine acetate\\
\hline
Dtann & dithianon & CS000459 & dithianon & \\
\hline
Durn & diuron & CS003293 & diuron & 3-(3,4-dichlorophenyl)-1,1-dimethylurea\\
\hline
endn & endrin & CS002489 & endrin & \\
\hline
esfvlrt & esfenvaleraat & CS000543 & esfenvalerate & \\
\hline
fenamfs & fenamifos & CS000564 & fenamiphos & \\
\hline
fenOxcb & fenoxycarb & CS000578 & fenoxycarb & \\
\hline
feNO2ton & fenitrothion & CS000571 & fenitrothion & \\
\hline
fenton & fenthion & CS000585 & fenthion & \\
\hline
Flu & fluorantheen & CS002069 & fluoranthene & \\
\hline
HCB & hexachloorbenzeen & CS002531 & hexachlorobenzene & HCB\\
\hline
heptnfs & heptenofos & CS000641 & heptenophos & \\
\hline
HpCl & heptachloor & CS002510 & heptachlor & \\
\hline
HxClbtDen & hexachloorbutadieen & CS002524 & hexachloro-1,3-butadiene & \\
\hline
HxClC2a & hexachloorethaan & CS000648 & hexachloroethane & \\
\hline
idn & isodrin & CS002538 & isodrin & \\
\hline
imdcpd & imidacloprid & CS000683 & imidacloprid & \\
\hline
InP & indeno(1,2,3-cd)pyreen & CS002118 & indeno(1,2,3-cd)pyrene & \\
\hline
iptrn & isoproturon & CS000690 & isoproturon & \\
\hline
irgrl & irgarol & CS003184 & irgarol & \\
\hline
lcyhltn & lambda-cyhalothrin & CS003187 & lambda-cyhalothrin & \\
\hline
linrn & linuron & CS000697 & linuron & \\
\hline
malton & malathion & CS001348 & malathion & \\
\hline
metbtazrn & metabenzthiazuron & CS000704 & methabenzthiazuron & \\
\hline
metlCl & metolachloor & CS001362 & metolachlor & \\
\hline
mevfs & mevinfos & CS000732 & mevinphos & \\
\hline
Mlnrn & monolinuron & CS000739 & monolinuron & \\
\hline
Naf & naftaleen & CS002013 & naphthalene & \\
\hline
PBDE100 & 2,2',4,4',6-pentabroomdifenylether & CS002146 & 2,2',4,4',6-pentabromodiphenyl ether & BDE100\\
\hline
PBDE138 & 2,2',3,4,4',5'-hexabroomdifenylether & CS002132 & 2,2',3,4,4',5'-hexabromodiphenyl ether & BDE138\\
\hline
PBDE153 & 2,2',4,4',5,5'-hexabroomdifenylether & CS000998 & 2,2',4,4',5,5'-hexabromodiphenyl ether & BDE153\\
\hline
PBDE154 & 2,2',4,4',5,6'-hexabroomdifenylether & CS001005 & 2,2',4,4',5,6'-hexabromodiphenyl ether & BDE154\\
\hline
PBDE209 & 2,2',3,3',4,4',5,5',6,6'-decabroomdiphenylether & CS000382 & decabromodiphenyl ether & BDE209 decabromodiphenyl oxide\\
\hline
PBDE28 & 2,4,4'-tribroomdifenylether & CS002209 & 2,4,4'-tribromodiphenyl ether & BDE28\\
\hline
PBDE47 & 2,2',4,4'-tetrabroomdifenylether & CS001026 & 2,2',4,4'-tetrabromodiphenyl ether & BDE47\\
\hline
PBDE49 & 2,2',4,5'-tetrabroomdifenylether & CS001040 & 2,2',4,5'-tetrabromodiphenyl ether & BDE49\\
\hline
PBDE85 & 2,2',3,4,4'-pentabroomdifenylether & CS002139 & 2,2',3,4,4'-pentabromodiphenyl ether & BDE85\\
\hline
PBDE99 & 2,2',4,4',5-pentabroomdifenylether & CS001012 & 2,2',4,4',5-pentabromodiphenyl ether & BDE99\\
\hline
PeClBen & pentachloorbenzeen & CS002587 & pentachlorobenzene & \\
\hline
PeClFol & pentachloorfenol & CS003165 & pentachlorophenol & \\
\hline
pirmcb & pirimicarb & CS000809 & pirimicarb & \\
\hline
propxr & propoxur & CS001432 & propoxur & \\
\hline
pyrdbn & pyridaben & CS000830 & pyridaben & \\
\hline
pyrpxfn & pyriproxyfen & CS001439 & pyriproxyfen & \\
\hline
simzne & simazine & CS000837 & simazine & \\
\hline
styrn & styreen & CS003166 & styrene & \\
\hline
s4C9yFol & som 4-nonylfenol-isomeren (vertakt) &  &  & \\
\hline
Tazfs & triazofos & CS001495 & triazophos & \\
\hline
TClC1a & trichloormethaan (chloroform) & CS003033 & trichloromethane & chloroform\\
\hline
TClC2e & trichlooretheen (tri) & CS003226 & 1,1,2-trichloroethene & trichloroethylene TCE\\
\hline
tefbzrn & teflubenzuron & CS001446 & teflubenzuron & \\
\hline
terbtn & terbutrin & CS000851 & terbutryn & \\
\hline
terC4yazne & terbutylazine & CS000858 & terbuthylazine & TBA\\
\hline
Tfrlne & trifluraline & CS001243 & trifluralin & \\
\hline
TFySn & trifenyltin (kation) & CS001250 & triphenyltin cation & TPT+\\
\hline
tHpClepO & trans-heptachloorepoxide & CS002636 & trans-heptachlor epoxide & \\
\hline
Tol & tolueen & CS003183 & methylbenzene & toluene\\
\hline
tolcfsC1y & tolclofos-methyl & CS000893 & tolclofos-methyl & \\
\hline
t12DClC2e & trans-1,2-dichlooretheen & CS003149 & trans-1,2-dichloroethene & \\
\hline
T4ClC1a & tetrachloormethaan (tetra) & CS003013 & tetrachloromethane & CCl4 carbon tetrachloride\\
\hline
T4ClC2e & tetrachlooretheen (per) & CS003138 & tetrachloroethene & tetrachloroethylene\\
\hline
11DClC2a & 1,1-dichloorethaan & CS000942 & 1,1-dichloroethane & \\
\hline
11DClC2e & 1,1-dichlooretheen & CS003250 & 1,1-dichloroethene & \\
\hline
111TClC2a & 1,1,1-trichloorethaan & CS003246 & 1,1,1-trichloroethane & \\
\hline
112TClC2a & 1,1,2-trichloorethaan & CS003233 & 1,1,2-trichloroethane & \\
\hline
1122T4ClC2a & 1,1,2,2-tetrachloorethaan & CS003232 & 1,1,2,2-tetrachloroethane & \\
\hline
12DClBen & 1,2-dichloorbenzeen & CS003235 & 1,2-dichlorobenzene & \\
\hline
12DClC2a & 1,2-dichloorethaan & CS003247 & 1,2-dichloroethane & \\
\hline
12DClC3a & 1,2-dichloorpropaan & CS001516 & 1,2-dichloropropane & \\
\hline
12xyln & 1,2-xyleen & CS000963 & 1,2-dimethylbenzene & 1,2-xylene o-xylene\\
\hline
123TClBen & 1,2,3-trichloorbenzeen & CS000949 & 1,2,3-trichlorobenzene & 1,2,3-TCB\\
\hline
124TClBen & 1,2,4-trichloorbenzeen & CS000956 & 1,2,4-trichlorobenzene & 1,2,4-TCB\\
\hline
13DClBen & 1,3-dichloorbenzeen & CS003249 & 1,3-dichlorobenzene & \\
\hline
135TClBen & 1,3,5-trichloorbenzeen & CS000970 & 1,3,5-trichlorobenzene & 1,3,5-TCB\\
\hline
14DClBen & 1,4-dichloorbenzeen & CS003234 & 1,4-dichlorobenzene & \\
\hline
24DDT & 2,4'-dichloordifenyltrichloorethaan & CS001117 & 2,4'-dichlorodiphenyltrichloroethane & o,p'-DDT\\
\hline
24DP & 2,4-dichloorfenoxypropionzuur & CS001124 & dichloroprop & 2,4-DP 2,4-dichlorophenoxypropionic acid\\
\hline
44DDD & 4,4'-dichloordifenyldichloorethaan & CS002244 & 4,4'-dichlorodiphenyldichloroethane & p,p'-DDD\\
\hline
44DDE & 4,4'-dichloordifenyldichlooretheen & CS002251 & 4,4'-dichlorodiphenyldichloroethylene & p,p'-DDE\\
\hline
44DDT & 4,4'-dichloordifenyltrichloorethaan & CS002258 & 4,4'-dichlorodiphenyltrichloroethane & p,p'-DDT\\
\hline
BaP & benzo(a)pyreen & CS001929 & benzo(e)pyrene & \\
\hline
teldn & telodrin & CS002629 & telodrin & isobenzan\\
\hline
\end{tabular}




### Compartimenten vs S26	BODC matrices


\begin{tabular}[t]{l|l|l|l|l}
\hline
Compartiment.Code & Compartiment.Omschrijving & Hoedanigheid.Code & S26\_conceptid & S26\_preflabel\\
\hline
BS & Bodem/Sediment & NVT & MAT00850 & bed\\
\hline
OW & Oppervlaktewater & NVT & MAT00633 & water body [dissolved plus reactive particulate phase]\\
\hline
OW & Oppervlaktewater & NVT & MAT00640 & water body\\
\hline
OW & Oppervlaktewater & nf & MAT00626 & water body [dissolved plus reactive particulate <unknown phase]\\
\hline
OW & Oppervlaktewater & NVT & MAT00997 & water body [particulate >GF/F phase]\\
\hline
ZS & Zwevende stof & dg & MAT00528 & suspended particulate material\\
\hline
\end{tabular}


### Grootheden vs S06	Parameter entity names




\begin{tabular}[t]{l|l|l|l|l}
\hline
Grootheid.Code & Grootheid.Omschrijving & Hoedanigheid.Code & S06\_conceptid & S06\_preflabel\\
\hline
AANTPOPVTE & Aantal per oppervlakte & NVT & S0600002 & Abundance\\
\hline
VERZDGGD & Verzadigingsgraad & NVT & S0600045 & Concentration\\
\hline
SALNTT & Saliniteit & NVT & S0600085 & Salinity\\
\hline
CONCTTE & (massa)Concentratie & nf & S0600045 & Concentration\\
\hline
CONCTTE & (massa)Concentratie & NVT & S0600045 & Concentration\\
\hline
T & Temperatuur & NVT & S0600082 & Temperature\\
\hline
CONCTTE & (massa)Concentratie & NVT &  & \\
\hline
MASSFTE & Massafractie & dg & S0600045 & Concentration\\
\hline
\end{tabular}



### Specials - Grain size

**in water**


\begin{tabular}[t]{r|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l}
\hline
n\_code & P01\_conceptid & P01\_preflabel & S06\_conceptid & S06\_preflabel & S07\_conceptid & S07\_preflabel & s27\_conceptid & S27\_preflabel & S27\_altlabel & CAS no & S02\_conceptid & S02\_preflabel & S26\_conceptid & S26\_preflabel & S25\_conceptid & S25\_preflabel & S03\_conceptid & S03\_preflabel & S04\_conceptid & S04\_preflabel & S05\_conceptid & S05\_preflabel & P02\_conceptid & P02\_preflabel & S21\_conceptid & S21\_preflabel\\
\hline
23075 & MNGSIXAG & Grain-size mean of aggregates in the water body by image analysis & S0600192 & Grain-size & S0700003 & mean &  &  &  &  & S028 & in the & MAT00640 & water body &  &  &  &  & S0415 & image analysis &  &  & SPGS & Suspended particulate material grain size parameters & NA & NA\\
\hline
23239 & MSAGIXPZ & Grain-size median of aggregates in the water body by image analysis & S0600192 & Grain-size & S0700004 & median &  &  &  &  & S028 & in the & MAT00640 & water body &  &  &  &  & S0415 & image analysis &  &  & ABAG & Suspended particulate material aggregates & NA & NA\\
\hline
\end{tabular}




**in sediment**


\begin{tabular}[t]{r|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l}
\hline
n\_code & P01\_conceptid & P01\_preflabel & S06\_conceptid & S06\_preflabel & S07\_conceptid & S07\_preflabel & s27\_conceptid & S27\_preflabel & S27\_altlabel & CAS no & S02\_conceptid & S02\_preflabel & S26\_conceptid & S26\_preflabel & S25\_conceptid & S25\_preflabel & S03\_conceptid & S03\_preflabel & S04\_conceptid & S04\_preflabel & S05\_conceptid & S05\_preflabel & P02\_conceptid & P02\_preflabel & S21\_conceptid & S21\_preflabel\\
\hline
15531 & GRSIZEMM & Grain-size minimum of particles in sediment by visual estimation & S0600192 & Grain-size & S0700005 & minimum &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04366 & visual estimation &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
15532 & GRSIZEMX & Grain-size maximum of particles in sediment by visual estimation & S0600192 & Grain-size & S0700002 & maximum &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04366 & visual estimation &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
21902 & KRGSPSXX & Grain-size kurtosis of particles in sediment by particle sizer & S0600192 & Grain-size & S0700030 & kurtosis &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
21903 & KRGSSSXX & Grain-size kurtosis of particles in sediment by sieving and settling tube method & S0600192 & Grain-size & S0700030 & kurtosis &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
21905 & KRTSSSXX & Grain-size kurtosis of particles in sediment by sieving and settling tube method & S0600192 & Grain-size & S0700030 & kurtosis &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
22696 & MDGSPPXX & Grain-size median of particles in sediment by optical microscopy (coarse fraction) and pipette method (fines) & S0600192 & Grain-size & S0700004 & median &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04275 & optical microscopy (coarse fraction) and pipette method (fines) &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
22698 & MDGSPSXX & Grain-size median of particles in sediment by particle sizer & S0600192 & Grain-size & S0700004 & median &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
22699 & MDGSSSXX & Grain-size median of particles in sediment by sieving and settling tube method & S0600192 & Grain-size & S0700004 & median &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
23076 & MNGSPSNC & Grain-size mean of particles in sediment [non-carbonate phase] by acidification and particle sizer & S0600192 & Grain-size & S0700003 & mean &  &  &  &  & S026 & in & MAT00129 & sediment [non-carbonate phase] &  &  & S0366 & acidification & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
23078 & MNGSPSSA & Grain-size mean of particles in sediment 63-1000um by particle sizer & S0600192 & Grain-size & S0700003 & mean &  &  &  &  & S026 & in & MAT00059 & sediment 63-1000um &  &  &  &  & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
23079 & MNGSPSXX & Grain-size mean of particles in sediment by particle sizer & S0600192 & Grain-size & S0700003 & mean &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
23081 & MNGSSSXX & Grain-size mean of particles in sediment by sieving and settling tube method & S0600192 & Grain-size & S0700003 & mean &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
23133 & MOGSPSXX & Grain-size mode of particles in sediment by particle sizer & S0600192 & Grain-size & S0700041 & mode &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
23134 & MOGSSSXX & Grain-size mode of particles in sediment by sieving and settling tube method & S0600192 & Grain-size & S0700041 & mode &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27891 & PC01SSXX & Grain-size 1st percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700039 & 1st percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27893 & PC05PSXX & Grain-size 5th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700034 & 5th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27894 & PC05SSXX & Grain-size 5th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700034 & 5th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27895 & PC10PSNC & Grain-size 10th percentile of particles in sediment [non-carbonate phase] by acidification and particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700031 & 10th percentile &  &  &  &  & S026 & in & MAT00129 & sediment [non-carbonate phase] &  &  & S0366 & acidification & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27896 & PC10PSXX & Grain-size 10th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700031 & 10th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27898 & PC16PSXX & Grain-size 16th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700032 & 16th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27899 & PC16SSXX & Grain-size 16th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700032 & 16th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27900 & PC25PSXX & Grain-size 25th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700033 & 25th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27901 & PC25SSXX & Grain-size 25th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700033 & 25th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27902 & PC50PSNC & Grain-size 50th percentile of particles \{grain-size median\} in sediment [non-carbonate phase] by acidification and particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700040 & 50th percentile &  &  &  &  & S026 & in & MAT00129 & sediment [non-carbonate phase] &  &  & S0366 & acidification & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27903 & PC50PSXX & Grain-size 50th percentile of particles \{grain-size median\} in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700040 & 50th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27904 & PC50SSXX & Grain-size 50th percentile of particles \{grain-size median\} in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700040 & 50th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27906 & PC75PSXX & Grain-size 75th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700035 & 75th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27907 & PC75SSXX & Grain-size 75th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700035 & 75th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27908 & PC84PSXX & Grain-size 84th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700038 & 84th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27909 & PC84SSXX & Grain-size 84th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700038 & 84th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27910 & PC90PSNC & Grain-size 90th percentile of particles in sediment [non-carbonate phase] by acidification and particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700037 & 90th percentile &  &  &  &  & S026 & in & MAT00129 & sediment [non-carbonate phase] &  &  & S0366 & acidification & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27911 & PC90PSXX & Grain-size 90th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700037 & 90th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27913 & PC90SSXX & Grain-size 90th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700037 & 90th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27915 & PC95PSXX & Grain-size 95th percentile of particles in sediment by particle sizer and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700036 & 95th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
27916 & PC95SSXX & Grain-size 95th percentile of particles in sediment by sieving and settling tube method and analysis of cumulative frequency ordered by phi (coarse to fine) & S0600192 & Grain-size & S0700036 & 95th percentile &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method & S050063 & analysis of cumulative frequency ordered by phi (coarse to fine) & MNGS & Sediment grain size parameters & NA & NA\\
\hline
33147 & SED50VIS & Grain-size median of particles in sediment by visual estimation & S0600192 & Grain-size & S0700004 & median &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04366 & visual estimation &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
33410 & SKGSPSXX & Grain-size skewness of particles in sediment by particle sizer & S0600192 & Grain-size & S0700029 & skewness &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04278 & particle sizer &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
33411 & SKGSSSXX & Grain-size skewness of particles in sediment by sieving and settling tube method & S0600192 & Grain-size & S0700029 & skewness &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04321 & sieving and settling tube method &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
33522 & SND50VIS & Grain-size median of particles (sand size-fraction) in sediment by visual estimation & S0600192 & Grain-size & S0700004 & median &  &  &  &  & S026 & in & MAT00136 & sediment &  &  &  &  & S04366 & visual estimation &  &  & MNGS & Sediment grain size parameters & NA & NA\\
\hline
\end{tabular}



### Specials - Taxonomical names


\begin{tabular}[t]{l}
\hline
S25\_preflabel\\
\hline
\\
\hline
Coscinodiscus (ITIS: 2546: WoRMS 148917)\\
\hline
Navicula directa (ITIS: 3669: WoRMS 149467)\\
\hline
Nitzschia (ITIS: 5070: WoRMS 119270)\\
\hline
Rhizosolenia shrubsoleii (ITIS: 2910)\\
\hline
Thalassiosira (ITIS: 2484: WoRMS 148912)\\
\hline
Tropodoneis\\
\hline
Torodinium (ITIS: 10121: WoRMS 109479) [Size: medium]\\
\hline
Sula nebouxii (ITIS: 174702: WoRMS 343959)\\
\hline
Thysanoessa inermis (ITIS: 95573: WoRMS 110708) [Stage: adult Sex: male Subgroup: with spermatophores at the genital aperture or attached to the petasma]\\
\hline
Pseudo-nitzschia (ITIS: 584561: WoRMS 149151)\\
\hline
Umbellula (ITIS: 52384: WoRMS 128499)\\
\hline
Amphidinium (ITIS: 9997: WoRMS 109473)\\
\hline
Ceratium furca (ITIS: 10399: WoRMS 109950)\\
\hline
Ceratium fusus (ITIS: 10400: WoRMS 109951)\\
\hline
Ceratium lineatum (ITIS: 10401: WoRMS 109963)\\
\hline
Gonyaulax polygramma (ITIS: 10371: WoRMS 110035)\\
\hline
Gymnodinium splendens (ITIS: 10037: WoRMS 109832)\\
\hline
Gyrodinium (ITIS: 10077: WoRMS 109476)\\
\hline
Gyrodinium (ITIS: 10077: WoRMS 109476) [Subgroup: sp. B heterotrophic]\\
\hline
Calanus finmarchicus/helgolandicus/glacialis (ITIS: 85263: WoRMS 104152) [Stage: eggs]\\
\hline
Chaetoceros radicans (ITIS: 2822: WoRMS 163112)\\
\hline
Prorocentrum (ITIS: 9877: WoRMS 109566)\\
\hline
Amphorellopsis (WoRMS 136791) [Size: 80-99um]\\
\hline
Mesodinium (ITIS: 46287: WoRMS 179320) [Size: <30um]\\
\hline
Stylocheiron (ITIS: 95556: WoRMS 110678) [Stage: adult Sex: female Subgroup: without spermatophores]\\
\hline
Thalassiosira gravida (ITIS: 2490: WoRMS 149102) [Size: 25um]\\
\hline
Oxytoxum scolopax (ITIS: 10472: WoRMS 110115)\\
\hline
Protoperidinium (ITIS: 10340: WoRMS 109553)\\
\hline
Ptychodiscus noctiluca (ITIS: 331267: WoRMS 109888)\\
\hline
Balanion (WoRMS 292899) [Size: <20um Subgroup: sp. 2]\\
\hline
Torodinium (ITIS: 10121: WoRMS 109479)\\
\hline
Protoperidinium ovum (ITIS: 573488: WoRMS 110243)\\
\hline
Eumicrotremus spinosus (ITIS: 167545: WoRMS 127217)\\
\hline
Amphipoda (ITIS: 93294: WoRMS 1135) [Size: >1000um]\\
\hline
Nematobrachion boopis (ITIS: 95537: WoRMS 110691) [Stage: sub-adult Sex: female]\\
\hline
Euphausia krohnii (ITIS: 660849: WoRMS 110687) [Sex: male]\\
\hline
Urotricha (ITIS: 46243) [Size: <20um]\\
\hline
Chaetoceros atlanticus (ITIS: 2769: WoRMS 149288)\\
\hline
Calanus finmarchicus (ITIS: 85272: WoRMS 104464) [Stage: copepodites C3]\\
\hline
Calanus finmarchicus (ITIS: 85272: WoRMS 104464) [Stage: copepodites C2]\\
\hline
Thysanoessa inermis (ITIS: 95573: WoRMS 110708) [Stage: adult Sex: female]\\
\hline
Hymenaster (ITIS: 157097: WoRMS 123333) [Morphology: visible interbrachial membrane]\\
\hline
Calanus finmarchicus (ITIS: 85272: WoRMS 104464) [Stage: adult Sex: male]\\
\hline
Thysanoessa raschi (ITIS: 95577: WoRMS 416602) [Stage: juvenile]\\
\hline
Ceriantharia (ITIS: 51984: WoRMS 1361) [Size: diameter \textasciitilde{}10cm Morphology: many brown tentacles]\\
\hline
Prorocentrum lenticulatum (WoRMS 232417)\\
\hline
Demospongiae (ITIS: 47528: WoRMS 164811) [Size: height \textasciitilde{}10cm, diameter 30cm Morphology: mass of branches Colour: brown]\\
\hline
Microsetella (ITIS: 86208: WoRMS 115341) [Stage: copepodites plus adults]\\
\hline
Podolampas elegans (ITIS: 10500: WoRMS 110201)\\
\hline
Fragilariopsis kerguelensis (ITIS: 573688: WoRMS 341555) [Subgroup: colonial]\\
\hline
Thalassiosira angustelineata (ITIS: 550490)\\
\hline
Thysanoessa inermis (ITIS: 95573: WoRMS 110708) [Stage: sub-adult+adult Sex: female Subgroup: without spermatophores]\\
\hline
Thysanopoda acutifrons (ITIS: 95583: WoRMS 110712) [Stage: sub-adult+adult Sex: male Subgroup: without external spermatophores]\\
\hline
Mysida (ITIS: 89855: WoRMS 149668) [Stage: adult]\\
\hline
Scomber scombrus (ITIS: 172414: WoRMS 127023) [Stage: eggs]\\
\hline
Trachurus trachurus (ITIS: 168588: WoRMS 126822) [Stage: eggs]\\
\hline
Nematoscelis megalops (ITIS: 95542: WoRMS 110695) [Stage: adult Sex: male Subgroup: without external spermatophores]\\
\hline
Strombidium (ITIS: 46608: WoRMS 101195) [Size: 40-59um Subgroup: sp. 7]\\
\hline
Pseudorca crassidens (ITIS: 180463: WoRMS 137104)\\
\hline
Pseudotriceratium\\
\hline
Stylocheiron maximum (ITIS: 95558: WoRMS 110704) [Sex: female]\\
\hline
Diplopeltopsis (ITIS: 10197: WoRMS 109536) [Stage: cysts]\\
\hline
Lycodes (ITIS: 165255: WoRMS 126104)\\
\hline
aloricate ciliates\\
\hline
Anguilla anguilla (ITIS: 161128: WoRMS 126281)\\
\hline
Pelagostrombidium [Size: 20-39um]\\
\hline
Thysanoessa longicaudata (ITIS: 95575: WoRMS 110709) [Stage: sub-adult+adult Sex: male Subgroup: without external spermatophores]\\
\hline
Gammaproteobacteria (WoRMS 393018) [Subcomponent: nifH gene copies Subgroup: gamma A phylotype]\\
\hline
Ampelisca (ITIS: 93321: WoRMS 101445) [Subgroup: sp. 1]\\
\hline
Amphiuridae (ITIS: 157646: WoRMS 123206) [Stage: juvenile]\\
\hline
Ampharete (ITIS: 67727: WoRMS 129155) [Stage: juvenile]\\
\hline
Astrorhizidae (ITIS: 44046: WoRMS 111958)\\
\hline
Aphroditidae (ITIS: 64359: WoRMS 938) [Stage: juvenile]\\
\hline
Amphictene auricoma (ITIS: 67695: WoRMS 152448)\\
\hline
Ampelisca (ITIS: 93321: WoRMS 101445) [Stage: juvenile]\\
\hline
Aponuphis bilineata (WoRMS 130452)\\
\hline
Abyssorchomene (WoRMS 101585)\\
\hline
Abyssorchomene plebs (WoRMS 237124)\\
\hline
Abyssorchomene rossi (WoRMS 236922)\\
\hline
Abylidae (WoRMS 135336)\\
\hline
Calanus finmarchicus (ITIS: 85272: WoRMS 104464) [Stage: copepodites C4]\\
\hline
Acanthoica quattrospina (ITIS: 2190: WoRMS 235802)\\
\hline
\end{tabular}







