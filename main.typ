#import "src/lib.typ": *

#show: doc.with(
  title: "Riktlinje för Grafisk Profil",
  short_title: "riktlinje för grafisk profil",
  meeting: "S24"
)

= Formalia

== Sammanfattning

Riktlinje för grafisk profil beskriver många av sektionens vanligaste förekommande grafiska element samt verktyg som man kan använda för att utforma grafiskt material för D-sektionen.

== Syfte

D-sektionen producerar många olika dokument, affischer, nyhetsbrev och andra former av grafik. Denna riktlinje ämnar att ge vägledning och klarhet för hur sektionens grafiska profil består av, hur den skall användas och vilka verktyg det finns att använda.

Riktlinjen är menat som ett verktyg och som riktlinjer i första hand, det vill säga att om man bryter mot riktlinjen i strävan efter att utforma något som resulterar i något vackrare än det riktlinjen beskriver bör detta inte betraktas som ett riktlinjebrott.

== Omfattning

Riktlinjen omfattar sektionen som helhet, men riktar sig framförallt till utskott och funktionärer som sysslar med grafisk design och som vill ta del av de riktlinjer som presenteras hädanefter.

== Historik

- Skriven av Kaspian Jakobsson, 2021
- Ursprungligen antagen enligt beslut: HTM2 2021.
- Dokumentent omformades från att vara en policy till att bli en riktlinje på VTM-extra 2023.

= Riktlinjer för grafisk utformning

På sektionens nuvarande hemsida finns en grafisk profil beskriven som ligger till grund för denna riktlinje. Dock finns en del nya avsnitt, mycket tack vare inspiration från Teknologkårens grafiska profil#footnote[Riktlinjer för grafisk profil, 2019, Teknologkåren inom TLTH, Google Drive]

Mycket av informationen som presenteras i denna första version kan därmed verka redundant. Detta är dock ett medvetet val, då sektionens nuvarande grafiska profil innehåller mycket av det som en designer kan återkomma till. Såsom sektionens färg, som enligt reglementet beskrivs med hexkoden `#f280a1`, och att detta kan tolkas som Pantone 189 U, 35,3% svart eller som S 1050-R20B .NCS när färg ska blandas. Ett färgprov finnes här: \ dsek.se/aktiva/grafiskprofil/rosa.html

Infocom har färgen ametistlila, som kan beskrivas som `#9966CC`

= D-sektionens sigill, logotyp och mer

I sektionens stadgar, § 1.3, står det att sektionens symbol ser ut enligt nedanstående bild

#align(center, image("graphics/guild/dsek/symbol/symbol_real.svg", width: 12%))

För konsekvensens skull bör inte sigillet förekomma annat än i storlekarna 16 mm och 32 mm eller, om en större storlek skulle behövas, i multipler av dessa storlekar.

Sektionens sigill är annars den logotyp som bör och används i störst utsträckning, och den ser ut såhär:

#align(center, 
  stack(
    dir: ltr, spacing: 10pt,
    image("graphics/guild/dsek/bw.svg", height: 15%),
    image("graphics/guild/dsek/color.svg", height: 15%)
  )
)

Det finns även äldre logotyper och symboler för sektionen bevarade, men dessa bör inte användas utan en särskild åtanke.

#align(center, 
  grid(
    columns: 2, gutter: 10pt,
    image("graphics/guild/datateknik/bw.svg", height: 15%),
    image("graphics/guild/datateknik/color.svg", height: 15%),
    image("graphics/guild/infocom/bw.svg", height: 15%),
    image("graphics/guild/infocom/color.svg", height: 15%)
  )
)

Om man är mer intresserad av logo/sigill/etc finns det på den här länken: \ dsek.se/aktiva/grafiskprofil/logotyp.html

= Typografiska riktlinjer

Majoriteten av allt material som sektionen producerar, om man till exempel ser till utskriven vikt i kilogram, är skrift, ofta i form av dokument (likt detta!). Huruvida detta är att ses som en typografisk utformning är dock upp till betraktaren.

I regel brukar sektionens dokument skrivas med mallar likt den som denna riktlinje är utformad med hjälp utav. Då är det följande typsnitt som används:

#align(center,
  table(
    align: left,
    columns: 2,
    [*Del av dokumentet*], [*Typsnitt och grad*],
    [Brödtext], [Palatino, 11 pt],
    [Fotnoter], [Palatino, 9 pt],
    [Första rubriknivån (x)], [Helvetica fet, 14 pt],
    [Andra rubriknivån (x.y)], [Helvetica fet, 12 pt],
    [Tredje rubriknivån (x.y.z)], [Helvetica fet, 11 pt],
    [Tabell- och figurbeskrivningar (captions)], [Palatino kursiv, 9 pt]
  )
)

== Typst-mallar

= Riktlinjer för grafisk utformning

= Riktlinjer för film och foto

