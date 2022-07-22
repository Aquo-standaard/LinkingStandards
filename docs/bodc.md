# BODC semantic standard



De Brittisch Oceanographic Data Centre ([BODC](https://www.bodc.ac.uk/)) is in 1969 ingesteld door de Natural Environmental Research Council ([NERC](https://www.ukri.org/councils/nerc/)), en beheert een set vocabulaires voor gebruik in het mariene domein. Bij de oprichting van [SeaDataNet](https://www.seadatanet.org/), een infrastructuur voor het zoeken, vinden en distribueren van in situ data, zijn deze vocabulaires geadopteerd als "[common vocabularies](https://www.seadatanet.org/Standards/Common-Vocabularies)"voor gebruik als semantische standaard. SeaDataNet houdt daarnaast catalogi bij van [metadataformats](https://www.seadatanet.org/Standards/Metadata-formats) voor bijv cruise rapporten ([CSR](https://www.seadatanet.org/Standards/Metadata-formats/CSR)), projecten ([EDMERP](https://www.seadatanet.org/Standards/Metadata-formats/EDMERP)), datasets ([EDMED](https://www.seadatanet.org/Standards/Metadata-formats/EDMED)) en platforms ([EDIOS](https://www.seadatanet.org/Standards/Metadata-formats/EDIOS)). 

Voor de beschrijving van parameter namen is indertijd de P01 vocabulaire opgezet. Dit is een verzameling van beschrijvinde namen die de grootheid, parameter, eventuele details in de bemonstering en/of meetmethode en de matrix vastlegt. De tabel is "organisch" gegroeid doordat veel verschillende Europese databeheerders hieraan hun eigen specifieke waarde aan toevoegden. Later is de P01 tabel onderverdeeld in de verschillende onderdelen ("S-tabellen"). De relatie hiertussen is vastgelegd in de "one-armed bandit" tabel. Merk op dat door het combineren van de verschillende S-tabelwaarden in principe nieuwe P01 namen gemaakt kunnen worden. Een mapping op het niveau van de "S"-componenten kan daarom leiden tot niet-bestaande P01 namen. 

## De "wat" beschrijving - koppeling P01 met S tabellen (one-armed bandit)

De relatie tussen de primaire parameternamen (P01) en de afzonderlijke componenten voor bestaande P01 namen kan interactief doorzocht worden in [deze link](https://vocab.seadatanet.org/p01-facet-search?&step_more=6). 

\begin{table}

\caption{(\#tab:p01s-tabel)Voorbeeld 10 elementen uit de tabel [P01 VOCABULARY - FACET SEARCH ON SEMANTIC COMPONENTS]. }
\centering
\begin{tabular}[t]{r|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l|l}
\hline
n\_code & P01\_conceptid & P01\_preflabel & S06\_conceptid & S06\_preflabel & S07\_conceptid & S07\_preflabel & s27\_conceptid & S27\_preflabel & S27\_altlabel & CAS no & S02\_conceptid & S02\_preflabel & S26\_conceptid & S26\_preflabel & S25\_conceptid & S25\_preflabel & S03\_conceptid & S03\_preflabel & S04\_conceptid & S04\_preflabel & S05\_conceptid & S05\_preflabel & P02\_conceptid & P02\_preflabel & S21\_conceptid & S21\_preflabel\\
\hline
25411 & P002M09Z & Abundance of Actinocyclus roperi (ITIS: 2660: WoRMS 160651) per unit volume of the water body by optical microscopy & S0600002 & Abundance &  &  &  &  &  &  & S053 & per unit volume of the & MAT00640 & water body & BE000101 & Actinocyclus roperi (ITIS: 2660: WoRMS 160651) &  &  & S0423 & optical microscopy &  &  & PATX & Phytoplankton taxonomic abundance in water bodies & NA & NA\\
\hline
1578 & AEC043SD & Concentration standard deviation of soluble lead \{soluble\_Pb CAS 7439-92-1\} per unit volume of the atmosphere [aerosol >1um phase] by filtration, water leaching & S0600045 & Concentration & S0700007 & standard deviation & CS003069 & soluble lead & soluble\_Pb & 7439-92-1 & S053 & per unit volume of the & MAT00808 & atmosphere [aerosol >1um phase] &  &  & S03413 & filtration, water leaching &  &  &  &  & MTAT & Metal concentrations in the atmosphere & NA & NA\\
\hline
15209 & GEOLSARB & Concentration of rubidium \{Rb CAS 7440-17-7\} per unit dry weight of geological sample & S0600045 & Concentration &  &  & CS003116 & rubidium & Rb & 7440-17-7 & S041 & per unit dry weight of & MAT00892 & geological sample &  &  &  &  &  &  &  &  & RMIN & Inorganic chemical composition of sediment or rocks & NA & NA\\
\hline
34225 & SULAD418 & Absorbance of electromagnetic radiation (418nm wavelength) \{light absorbance\} by the suspended particulate material >GF/F [non-algal particle phase] by filtration and spectrophotometry on residue after NaOCl bleaching & S0600080 & Absorbance &  &  &  &  &  &  & S022 & by the & MAT00241 & suspended particulate material >GF/F [non-algal particle phase] &  &  & S0393 & filtration & S041008 & spectrophotometry on residue after NaOCl bleaching &  &  & PPAB & Light absorption in the water column & NA & NA\\
\hline
15970 & HCMR0032 & Concentration of antimony \{Sb CAS 7440-36-0\} per unit dry weight of sediment & S0600045 & Concentration &  &  & CS002962 & antimony & Sb & 7440-36-0 & S041 & per unit dry weight of & MAT00136 & sediment &  &  &  &  &  &  &  &  & RMIN & Inorganic chemical composition of sediment or rocks & NA & NA\\
\hline
7290 & C978M00Z & Biomass as carbon of Eutreptiella (ITIS: 9609: WoRMS 17657) per unit volume of the water body by optical microscopy and computation of carbon biomass from abundance & S0600272 & Biomass as carbon &  &  &  &  &  &  & S053 & per unit volume of the & MAT00640 & water body & BE002235 & Eutreptiella (ITIS: 9609: WoRMS 17657) &  &  & S0423 & optical microscopy & S050058 & computation of carbon biomass from abundance & CATX & Phytoplankton taxonomic biomass in water bodies & NA & NA\\
\hline
24305 & NEOXHPP5 & Concentration of neoxanthin \{CAS 30743-41-0\} per unit volume of the water body [particulate >0.2um phase] by filtration, acetone extraction and high performance liquid chromatography (HPLC) & S0600045 & Concentration &  &  & CS002938 & neoxanthin &  & 30743-41-0 & S053 & per unit volume of the & MAT00430 & water body [particulate >0.2um phase] &  &  & S0398 & filtration, acetone extraction & S04204 & high performance liquid chromatography (HPLC) &  &  & CARO & Carotenoid and flavenoid pigment concentrations in water bodies & NA & NA\\
\hline
24448 & NIXXCVDX & Concentration of nickel \{Ni CAS 7440-02-0\} per unit volume of the water body [dissolved plus reactive particulate phase] by UV digestion and cathodic stripping voltammetry & S0600045 & Concentration &  &  & CS002566 & nickel & Ni & 7440-02-0 & S053 & per unit volume of the & MAT00633 & water body [dissolved plus reactive particulate phase] &  &  & S0359 & UV digestion & S04133 & cathodic stripping voltammetry &  &  & MTWD & Dissolved metal concentrations in the water column & NA & NA\\
\hline
25640 & P043M00Z & Abundance of Diploneis (ITIS: 4325: WoRMS 149018) per unit volume of the water body by optical microscopy & S0600002 & Abundance &  &  &  &  &  &  & S053 & per unit volume of the & MAT00640 & water body & BE001892 & Diploneis (ITIS: 4325: WoRMS 149018) &  &  & S0423 & optical microscopy &  &  & PATX & Phytoplankton taxonomic abundance in water bodies & NA & NA\\
\hline
27290 & P498M06Z & Abundance of Dinobryon sociale (ITIS: 1525: WoRMS 157254) per unit volume of the water body by optical microscopy & S0600002 & Abundance &  &  &  &  &  &  & S053 & per unit volume of the & MAT00640 & water body & BE001834 & Dinobryon sociale (ITIS: 1525: WoRMS 157254) &  &  & S0423 & optical microscopy &  &  & PATX & Phytoplankton taxonomic abundance in water bodies & NA & NA\\
\hline
\end{tabular}
\end{table}


## Gebruik van de koppelingstabel

Voor veel combinaties van AQUO (um-aquo) velden zijn in het verleden P01 parameternamen gezocht. Deels staan deze in de mappingP01 tabel die onderhouden wordt door AQUO. Deels staan deze in andere locale bestanden die ad hoc mappings hebben gefaciliteerd (bronnen: RWS, MARIS, Deltares). In dit project hebben we in eerste instantie geprobeerd om AQUO codes te koppelen aan P01 namen. In een tweede stap worden de P01 namen opgesplitst in hun semantische onderdelen, en deze zullen dan gematcht worden met de afzonderlijke AQUO namen in de daarvoor geschikte velden. Hiervoor is het nodig de verschillende "S" velden te koppelen aan AQUO tabellen. De waarden in deze tabellen worden dan gekoppeld met behulp van tabel \@ref(tab:p01s-tabel).

Op 25 mei 2022 zijn de volgende "S" tabellen gevonden

\begin{table}

\caption{(\#tab:unnamed-chunk-2)Beschrijving van tabellen met semantische componenten voor de P01 beschrijvende parameters. Deze versie is op 25 mei 2022 van de [seadata website](https://vocab.seadatanet.org/search) opgehaaald. }
\centering
\begin{tabular}[t]{l|l|l|r|r|l}
\hline
Library & Title & Alt.Title & Version & Members & Modified\\
\hline
S02 & BODC parameter semantic model relationships between what theme and where theme & Where/what relationships & 18 & 58 & 5/18/2022 4:00\\
\hline
S03 & BODC parameter semantic model sample preparation entity descriptions & Sample preparation & 76 & 290 & 5/14/2022 4:00\\
\hline
S04 & BODC parameter semantic model analytical method entity descriptions & Analytical method & 137 & 562 & 4/28/2022 4:00\\
\hline
S05 & BODC parameter semantic model data processing entity descriptions & Data processing & 55 & 242 & 4/28/2022 4:00\\
\hline
S06 & BODC parameter semantic model parameter entity names & Parameter entity names & 118 & 273 & 5/24/2022 4:00\\
\hline
S07 & BODC parameter semantic model parameter statistic & Parameter statistic & 14 & 49 & 4/28/2022 4:00\\
\hline
S11 & BODC parameter semantic model biological entity development stage terms & Biological entity life stage terms & 30 & 97 & 4/28/2022 4:00\\
\hline
S21 & BODC parameter semantic model sphere names & Sphere names & 12 & 22 & 2/6/2015 2:00\\
\hline
S23 & BODC semantic model sphere phase names & Sphere phase names & 7 & 15 & 11/1/2019 2:00\\
\hline
S25 & BODC parameter semantic model biological entity names & Biological entity names & 150 & 8510 & 5/24/2022 4:00\\
\hline
S26 & BODC parameter semantic model matrices & BODC matrices & 35 & 207 & 3/30/2022 4:00\\
\hline
S27 & BODC parameter semantic model chemical substances & BODC substances & 147 & 1962 & 4/7/2022 4:00\\
\hline
\end{tabular}
\end{table}


