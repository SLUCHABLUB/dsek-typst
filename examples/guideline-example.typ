#import "../src/lib.typ": *
#import "@preview/metalogo:1.2.0": LaTeX

// TODO: Update the contents of the guideline.

// TODO: Use the guideline function.
#show: doc.with(
  title: "Riktlinje för grafisk profil",
  // TODO: Bör denna bara vara "Riktlinje"?
  short_title: "Riktlinje för grafisk profil",
  // TODO: Denna bör nog sättas till mötet för sista ändring.
  meeting: "Riktlinje"
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

Skriven av Kaspian Jakobsson, 2021

Ursprungligen antagen enligt beslut: HTM2 2021.

// Sic.
Dokumentent omformades från att vara en policy till att bli en riktlinje på VTM-extra 2023.

= Riktlinjer för grafisk utformning

På sektionens nuvarande hemsida finns en grafisk profil beskriven som ligger till grund för denna riktlinje. Dock finns en del nya avsnitt, mycket tack vare inspiration från Teknologkårens grafiska profil#footnote(link("https://drive.google.com/file/d/1EFdTyU6aXKSBEj4cqcDsR325LMzTP_um/view")[Riktlinjer för grafisk profil, 2019, Teknologkåren inom TLTH, Google Drive]).

Mycket av informationen som presenteras i denna första version kan därmed verka redundant. Detta är dock ett medvetet val, då sektionens nuvarande grafiska profil innehåller mycket av det som en designer kan återkomma till. Såsom sektionens färg, som enligt reglementet beskrivs med hexkoden `#f280a1`, och att detta kan tolkas som Pantone 189 U, 35,3% svart eller som S 1050-R20B .NCS när färg ska blandas. Ett färgprov finnes här: \
dsek.se/aktiva/grafiskprofil/rosa.html

Infocom har färgen ametistlila, som kan beskrivas som `#9966CC`

= D-sektionens sigill, logotyp och mer

// TODO: Bör vara §1.4.
I sektionens stadgar, §1.3, står det att sektionens symbol ser ut enligt nedanstående bild:

#figure(guild_symbol(height: 32mm))

För konsekvensens skull bör inte sigillet förekomma annat än i storlekarna 16 mm och 32 mm eller, om en större storlek skulle behövas, i multipler av dessa storlekar.

Sektionens sigill är annars den logotyp som bör och används i störst utsträckning, och den ser ut såhär:
#figure[
  #guild_logo(height: 32mm)
  #guild_logo(height: 32mm, colour: true)
]

Det finns även äldre logotyper och symboler för sektionen bevarade, men dessa bör inte användas utan en särskild åtanke.

// TODO: Är dessa rätt?
#figure[
  #data_logga(height: 32mm)
  #data_logga(height: 32mm, colour: true) \
  #info_com_logga(height: 32mm)
  #info_com_logga(height: 32mm, colour: true) \
]

// Länken är död i det riktiga dokumentet.
Om man är mer intresserad av logo/sigill/etc finns det på den här länken: \
#link("https://www.dsek.se/aktiva/grafiskprofil/logotyp.php")[dsek.se/aktiva/grafiskprofil/logotyp.php]

= Typografiska riktlinjer

Majoriteten av allt material som sektionen producerar, om man till exempel ser till utskriven vikt i kilogram, är skrift, ofta i form av dokument (likt detta!). Huruvida detta är att ses som en typografisk utformning är dock upp till betraktaren.

I regel brukar sektionens dokument skrivas med mallar likt den som denna riktlinje är utformad med hjälp utav. Då är det följande typsnitt som används:

// TODO: Should we match the hline stroke width to latex?
#show table.cell: set align(left)
#set table.hline(stroke: 0.4pt)
#figure(table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header[*Del av dokumentet*][*Typsnitt och grad*],
  table.hline(),
  [Brödtext], [Palatino, 11 pt],
  [Fotnoter], [#text(size: 9pt)[Palatino], 9 pt],
  [Första rubriknivån (x)], [#text(font: sans_serif, weight: "bold", size: 14pt)[Helvetica fet], 14 pt],
  [Andra rubriknivån (x.y)], [#text(font: sans_serif, weight: "bold", size: 12pt)[Helvetica fet], 12 pt],
  [Tredje rubriknivån (x.y.z)], [#text(font: sans_serif, weight: "bold")[Helvetica fet], 11 pt],
  [Tabell- och figurbeskrivningar (captions)], [#text(style: "italic", size: 9pt)[Palatino kursiv], 9 pt],
  table.hline()
))

== #(LaTeX)-mallar

Sektionen har historiskt sett varit duktiga på att använda typsättningssystemet #LaTeX, och därmed finns det både dokumentklasser och funktioner som både är väldokumenterade och välfungerande.

All källkod och dokumentmallar och så vidare finns sparat på sektionens GitHub, som ni hittar här:
#link("https://github.com/Dsek-LTH/dsek-latex")[github.com/Dsek-LTH/dsek-latex]

= Riktlinjer för grafisk formgivning

Sektionens tryckmaterial bör vara:

- informativ
- tydlig
// Sic.
- ögonfallande

= Riktlinjer för film och foto

Sektionens fotografier och filmer bör vara:

- Välexponerade
- Integritetsbevarande
- Dokumenterande av stämning likväl situation
