require(tidyverse)
require(readxl)

#lokaal inlezen
df <- read_excel("C:/projecten/rws/2022/IHM_standaarden/AquoMetaDataLijst_Wstolte.xlsx")

BemonsteringsApparaat <- df %>% distinct(BemonsteringsApparaat.Code, BemonsteringsApparaat.Omschrijving)

BemonsteringsSoort <- df %>% distinct(BemonsteringsSoort.Code, BemonsteringsSoort.Omschrijving)

MeetApparaat <- df %>% distinct(MeetApparaat.Code, MeetApparaat.Omschrijving)

MonsterBewerkingsMethode <- df %>% distinct(MonsterBewerkingsMethode.Code, MonsterBewerkingsMethode.Omschrijving)

PlaatsBepalingsApparaat <- df %>% distinct(PlaatsBepalingsApparaat.Code, PlaatsBepalingsApparaat.Omschrijving)

WaardeBepalingsmethode <- df %>% distinct(WaardeBepalingsmethode.Code, WaardeBepalingsmethode.Omschrijving)

WaardeBepalingstechniek <- df %>% distinct(WaardeBepalingstechniek.Code, WaardeBepalingstechniek.Omschrijving)

WaardeBewerkingsmethode <- df %>% distinct(WaardeBewerkingsmethode.Code, WaardeBewerkingsmethode.Omschrijving)
