require(tidyverse)
require(readxl)

path= "aquo2sdn/data/mappings/rwsOverigemapping"
#lokaal inlezen
df <- read_excel("C:/projecten/rws/2022/IHM_standaarden/AquoMetaDataLijst_Wstolte.xlsx")

BemonsteringsApparaat <- df %>% distinct(BemonsteringsApparaat.Code, BemonsteringsApparaat.Omschrijving) %>%
  write_delim(paste(path, 'BemonsteringsApparaat.csv', sep="/"), delim = ";")

BemonsteringsSoort <- df %>% distinct(BemonsteringsSoort.Code, BemonsteringsSoort.Omschrijving) %>%
  write_delim(paste(path, 'BemonsteringsSoort.csv', sep="/"), delim = ";")

MeetApparaat <- df %>% distinct(MeetApparaat.Code, MeetApparaat.Omschrijving) %>%
  write_delim(paste(path, 'MeetApparaat.csv', sep="/"), delim = ";")

MonsterBewerkingsMethode <- df %>% distinct(MonsterBewerkingsMethode.Code, MonsterBewerkingsMethode.Omschrijving) %>%
  write_delim(paste(path, 'MonsterBewerkingsMethode.csv', sep="/"), delim = ";")

PlaatsBepalingsApparaat <- df %>% distinct(PlaatsBepalingsApparaat.Code, PlaatsBepalingsApparaat.Omschrijving) %>%
  write_delim(paste(path, 'PlaatsBepalingsApparaat.csv', sep="/"), delim = ";")

WaardeBepalingsmethode <- df %>% distinct(WaardeBepalingsmethode.Code, WaardeBepalingsmethode.Omschrijving) %>%
  write_delim(paste(path, 'WaardeBepalingsmethode.csv', sep="/"), delim = ";")

WaardeBepalingstechniek <- df %>% distinct(WaardeBepalingstechniek.Code, WaardeBepalingstechniek.Omschrijving) %>%
  write_delim(paste(path, 'WaardeBepalingstechniek.csv', sep="/"), delim = ";")

WaardeBewerkingsmethode <- df %>% distinct(WaardeBewerkingsmethode.Code, WaardeBewerkingsmethode.Omschrijving) %>%
  write_delim(paste(path, 'WaardeBewerkingsmethode.csv', sep="/"), delim = ";")
