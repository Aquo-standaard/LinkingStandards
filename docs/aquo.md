# AQUO




AQUO is de nederlandse standaard voor watergerelateerde data. Voor uitwisseling van meetgegevens is er het informatiemodel IM-AQUO. Dit model beschrijft voor in situ metingen de "wat" en "hoe". 

## Relevante AQUO vocabulaires (domeintabellen)

De belangrijkste tabellen voor een goede mapping van in situ waarnemingen zijn:

Grootheid of Typering

:   Beschrijving en code van de grootheid (quantitatief) of typering (kwalitatief). Voor elke grootheid is een of meerdere Eenheden beschikbaar in de Eenheid tabel.

Parameter

:   Dit is een samengestelde tabel/veld. In AQUO is dit onderverdeeld in Chemische Stof, Taxonnaam, of 

Hoedanigheid

:   Deze tabel bevat diverse informatie die te maken heeft met bijvoorbeeld monstervoorberking (opgeloste of deeltjesgebonden fractie), grootteklassen, leeftijdsklasse. 

Monstercriterium

:   Deze tabel bevat informatie over overige criteria, bijvoorbeeld in een fractie kleiner dan een bepaalde korrelgrootte. In de datadistributielaag zijn de velden Hoedanigheid en Monstercriterium samengevoegd in een veld (genaamd Hoedanigheid)

Eenheid

:   Gebruikte eenheid. Elke eenheid is gekoppeld aan een of meerdere grootheden.



```
#> # A tibble: 0 x 7
#> # ... with 7 variables: domeintabel <chr>,
#> #   domeintabelsoort <chr>, wijzigingsdatum <date>,
#> #   begin_geldigheid <date>, eind_geldigheid <date>,
#> #   kolommen <list>, guid <chr>
#> # A tibble: 0 x 10
#> # ... with 10 variables: id <dbl>, codes <chr>,
#> #   omschrijving <chr>, begin_geldigheid <date>,
#> #   eind_geldigheid <date>, guid <chr>, dimensie <chr>,
#> #   gerelateerd <chr>, groep <chr>, omrekenfactor <chr>
```


## Gebruik van AQUO in RWS datadistributielaag


