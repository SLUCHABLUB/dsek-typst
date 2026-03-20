#import "../src/lib.typ": *
#import strings: infu, km

#show: motion.with(
  title: [2.0 flugor i en smäll],
  meeting: "HTM1",
  authors: (
    (name: "Dag Hemberg", position: infu.mastare, message: "Lund, Dag som jag"),
    (name: "Philip Nielsen", position: km.mastare),
    (name: "Daniel Adu-Gyan", position: "DWWW-ansvarig"),
    (name: "Esbjörn Stenberg", position: "root"),
    (name: "Anahita Chavan", position: infu.vice_mastare),
    (name: "Hampus Edén"),
  ),
)

#quote(
  "Vi har en radikal hypotes att folk på data gillar programmering",
  attribution: "Daniel Adu-Gyan",
)

= Programmering på sektionen idag

Ett av målen som ofta diskuterats på sektionen är hur man kan få fler studenter att engagera sig i sektionens verksamhet. I stadgarna kan man läsa följande: “Föreningens ändamål och syfte är att verka för sammanhållningen mellan sina medlemmar, [...] att tillvarata deras gemensamma intressen”. Mot denna bakgrund tycks det rimligt att fundera över vilka gemensamma intressen sektionens medlemmar har, samt vilka av dessa intressen som idag tillvaratas. Utan tvekan finns det ett stort gemensamt intresse för programmering och teknik bland sektionens medlemmar -- det är ju just detta intresse som har lett till att vi börjar studera på våra program och i förlängningen att vi blivit medlemmar i D-sektionen. Idag har sektionen framförallt två olika underutskott som håller på med programmering: DWWW och rootmästeriet. Utöver D-sektionen finns även CTF-laget och Code\@LTH som är fristående organisationer.

DWWW är ett underutskott inom Informationsutskottet och leds av DWWW-ansvarig. DWWW ansvarar för utveckling av 1) dsek.se (och nolla.nu) och 2) sektionens app, som arbetas med under kodstugor som sker parallellt med InfU-kvällar. DWWW-ansvarig agerar projektledare och delegerar uppgifter till DWWW-medlemmar, och utför mycket av det dagliga arbete som faller på underutskottet. Uppgifterna kommer dels inifrån utskottet men även från kontakt med andra utskott på sektionen.

Rootmästeriet är ett underutskott inom Källarmästeriet och leds av root. Rootmästeriet ansvarar för sektionens digitala infrastruktur, det vill säga servrar och mejl- och accessystem, men även skärmar i iDét, “mojtar”/småelektronik, och annat angränsande, t.ex. arkadmaskinen Sparky. Rootmästeriet har ingen direkt koppling till Källarmästeriet utöver att bedriva sin verksamhet vid samma tillfällen som Källarmästeriet.

= Varför är den nuvarande situationen ett problem?

För någon på sektionen som är sugen på att engagera sig inom programmering rent allmänt är inget av de nuvarande alternativen helt klockrent. Om du väljer att engagera dig i DWWW så håller du bara på med webbprogrammering och apputveckling. Om du väljer att engagera dig i rootmästeriet så involverar programmering oftast bash- och python-skript. Det finns antagligen många som är intresserade av båda ansvarsområdena, men som inte orkar eller hinner vara med i båda utskotten samtidigt. Även om man “håller sig” till ett av utskotten så kan det vara svårt att faktiskt engagera sig; rootmästeriet har just nu ingen icke-valberedd funktionärspost, vilket kan leda till att det är svårt att spontanengagera sig i utskottet. Tröskeln för att söka till sudo kan desutom kännas högre för att det uppfattas som att man redan måste ha mycket förkunskaper och tidigare erfarenheter, samt att det kan vara svårt att bilda sig en uppfattning om vad en sudo sysslar med.

Uppdelningen tillför också friktion i samarbetet mellan underutskotten. DWWW och root har i många avseenden överlappande ansvarsområden -- DWWW tillhandahåller ofta gränssnitten som resten av sektionen använder för att interagera med våra system, medan root underhåller den underliggande infrastrukturen. Trots detta har de två underutskotten idag minimalt samar- bete. Även om ett fåtal medlemmar är med i båda underutskotten sker det idag inga regelbund- na möten mellan DWWW och rootmästeriet. Det sker ingen långsiktig gemensam planering på hur sektionens infrastruktur bör se ut och utvecklas. Den enda regelbundna kommunikationen mellan de två utskotten är att några av våra respektive system ibland går sönder och vi är i akut behov av någon lösning.

Det finns också projekt som inte ingår i varken DWWW eller rootmästeriet. Det tidigare nämn- da CTF-laget är ett bra exempel på detta. Även hobbyprojekt som att t.ex göra game-jams, skapa en 3D-rendering av gamla iDét, tävlingsprogrammera eller dylikt, har ingen tydlig plats. Aktivitetsutskottet har redan för fullt upp med dess nuvarande bredd av evenemang för att kunna arrangera regelbundna aktiviteter för de medlemmar som genast fattade intresse för CTF-laget när det nyligen startade. I många avseenden är Aktivitetsutskottet dessutom en gemenskap för medlemmar med andra intressen. Vi bör självklart inte heller vara beroende av en annan förening (t.ex Code\@LTH) för att uppnå våra egna mål som sektion.

= Vad vill vi göra åt saken?

Vi vill skapa ett nytt utskott som jobbar med programmering och teknik i alla dess former. Utskottet skulle dels ta över de ansvarsområden som DWWW och rootmästeriet har idag, men skulle framförallt vara platsen man naturligt kan vända sig till om man tycker programmering och/eller teknik är roligt och är något man vill syssla med även utanför plugget. Vi föreslår: *Programmästeriet*.

Programmästeriet skulle bli sitt eget utskott, och inte ligga under InfU/Källarmästeriet/AktU/ något annat. Posterna DWWW-ansvarig, DWWW-medlem och Webmaster i InfU, samt root, vice root och sudo i Källarmästeriet, tas bort och ersätts av motsvarande (ungefär) poster i det nya utskottet. Likt de flesta andra utskotten på sektionen anser vi att utskottet ska ha en mästare (*Programmästare*) och en vice (*Vice Programmästare*). Mästaren sitter inte i styrelsen (i alla fall till en början - mer om detta under stycke 5.3). Mästaren och vicen leder utskottet tillsammans, men för att undvika att vice-posten inte får ett riktigt syfte förutom att bistå mästaren så har denne även ett extra ansvar för de som vill engagera sig i utskottet genom diverse hobbyprojekt.

Under Programmästare och Vice Programmästare och har vi *Webbmästare* och *Systemmästare*, båda kärnposter som mer eller mindre flyttas direkt över från DWWW-ansvarig i InfU respektive root i Källarmästeriet. Under sig har båda en pool av folk med mer flytande ansvarsområden -- *Utvecklare* -- motsvarande en kombination av de DWWW-medlemmar och sudos med lite mer kompetens inom sina områden, som kan och är villiga att lära ut och lära upp, och som har tillgång till de mer känsliga systemen. Slutligen har vi *Funktionärer inom Programmästeriet*, som helt enkelt är de som vill lära sig om webbutveckling, servrar eller bara vill programmera något kul för sektionen. Förslagsvis kan dessa väljas in likt Källar- eller InfU- funkisar idag, det vill säga att om man dyker upp på sammankomster och är engagerad så kan man bli invald.

= Varför är Programmästeriet en bra lösning?

Införandet av Programmästeriet hade inneburit att programmerings- och teknikintresserade hade haft ett tydligt ställe att vända sig till på sektionen, och att sektionen i och med detta fångar in lite mer av den nisch människor som kanske inte hade varit särskilt engagerade annars. Allt från deltagande i programmeringstävlingar och CTF-lag till game jams och hackathons hade passat in perfekt under utskottet. Även om man endast skulle vara intresserad av exempelvis webbutveckling så är det bara att hoppa in och jobba med det, om det är det man känner för.

Det skulle också bli lättare att veta som icke-utskottsmedlem vart man ska vända sig när det gäller IT-frågor eller om det är en metaforisk brand som måste släckas, då det inte längre är rootmästeriet eller DWWW eller Webmastern som fixar något, utan man hjälps åt inom Pro- grammästeriet. DWWW ställer höga krav på rootmästeriet i nuläget, samtidigt som rootmäste- riet har mycket annat att stå i. Att slå ihop dem skulle förhoppningsvis medföra att samarbetet flyter på bättre, särskilt om det inte finns en specifik uppdelning mellan DWWW-medlemmar och sudos.

Med uppdelandet av sudos + DWWW-medlemmar i Utvecklare och Funktionärer hoppas vi också dels göra det mer lättillgängligt att bara dyka upp och vara med utan några krav på kom- petens, och dels göra det lättare att dela upp access i heltäckande access bakom valberedda krav på kompetens (Utvecklare) och access på projektbasis (Funktionärer inom Programmästeriet), vilket minskar säkerhetsriskerna.

= Frekvent förväntade frågor

== Finns det personer som vill söka de här posterna?

Vi tror absolut det. Idag är vi 9 DWWW-medlemmar och 9 sudos, vilket motsvarar 18 utvecklare i det nya Programmästeriet. Tillsammans med utskottsledare och vice kan vi uppskatta utskottets storlek till 20 medlemmar, vilket är större än de flesta utskott och kommer att vara ungefär lika stort som nya Källarmästeriet och Informationsutskottet.

== Vad händer med Informationsutskottet och Källarmästeriet om DWWW och rootmästeriet försvinner från respektive utskott?

InfU är egentligen inte mer beroende av hemsidan/DWWW än vad andra utskott är, och DWWW jobbar redan väldigt självständigt under InfU-kvällar. Dessutom har InfU redan många andra funktionärer och många andra ansvarsområden -- README, foto, film, grafik och arkivet -- och kan fortsätta fokusera på dem även om DWWW försvinner.

Även Källarmästeriet har de senaste åren arbetat för att expandera utskottet, så att de inte är beroende av rootmästeriet. I nuläget fungerar det likt InfU och DWWW, där de båda utskotten inte är direkt beroende av varandra när det kommer till att utföra sina åligganden, utan endast ekonomiskt. Försvinner rootmästeriet kommer Källarmästeriet att pågå som vanligt, dock i något mindre utsträckning, men annars kommer samma arbete att utföras.

== Programmästeriet skulle enligt motionen sköta och ansvara för en stor del av sektionens infrastruktur -- något som är väsentligt för samtliga övriga utskott -- och dessutom hantera och ansvara för hårdvara som kan vara ganska dyr. Borde inte Programmästare då vara en styrelsepost med tanke på ansvaret som posten medför?

Detta är något vi funderade på väldigt mycket under skrivandet av motionen. Vi gjorde bedömningen att det kan nog bli för mycket att dels lära sig leda ett helt nytt utskott samtidigt som man lär sig vara med i styrelsen och allt vad det innebär, även om Programmästarens roll onekligen kommer att vara väldigt viktig för sektionen.

Vi ser gärna att det sker en kontinuerlig utvärdering huruvida det fungerar att inte ha med Programmästaren i styrelsen och även göra bedömningen om man vill “uppgradera” posten i framtiden. Vi har ju valt att i motionen förutom Programmästare även ha en Vice Programmästare, vilket förhoppningsvis skulle underlätta ifall det beslutet skulle fattas i framtiden.

Under tiden har vi i våra förändringsförslag i styrdokumenten lagt till att Programmästaren bör bli ständigt adjungerad på styrelsemöten, och ha som ett av Programmästarens åligganden att kontinuerligt föra dialog med styrelsen om sektionens behov med avseende på digital infrastruktur.

== Om Programmästare inte ska vara en styrelsepost, behövs det då en Vice?

Som tidigare nämnt så hoppas vi att redan ha en Vice Programmästare skulle underlätta i en eventuell övergång till att utskottet ligger under styrelsen i framtiden. “Under tiden” har vi även lagt in att Vice Programmästare har som åliggande att vara ansvarig för de projekt som inte faller direkt under Systemmästaren eller Webbmästaren, vilket automatiskt delegerar ett ansvarsområde bort från utskottsordförande. I och med att utskottet skulle vara helt nytt tror vi också att ha någon som en nyinvald utskottsordförande att bolla idéer med och delegera uppgifter till hade varit gynnsamt. Det blir dessutom enkelt för andra att veta vem man ska gå till inom utskottet ifall Programmästaren är frånvarande.

== Just nu är det väldigt få tjejer som är engagerade i DWWW och rootmästeriet. Finns det en risk att Programmästeriet blir “för grabbigt”?

Historiskt sett har väldigt få tjejer engagerat sig i rootmästeriet och DWWW jämfört med resten av sektionen. Källarmästeriet och rootmästeriet har från vissa håll uppfattats som en ganska sluten kompisgrupp som är svår att gå med i, inte minst för att man bara kan väljas in som sudo en gång om året. Trots att DWWW har haft fördelen av att tillhöra InfU som har en något mer jämlik könsbalans så är det för närvarande inga tjejer som är DWWW-medlemmar.

Detta hoppas vi kunna motverka genom att fokusera mycket på marknadsföring och öppenhet. Syftet med hela motionen är ju egentligen att skapa en plats på sektionen där alla som har ett intresse för teknik och programmering kan känna sig välkomna och att det är lätt att hänga på, och bara att ha en gemensam utskottsledare som kan skapa och dra i event som är öpp- na för alla, och även marknadsföra det på det sättet, tror vi hjälper något enormt. Ytterligare en fördel med att ha utskottsledare och vice utöver endast root/Systemmästare och DWWW-ansvarig/Webbmästare blir då också att ledningen kan ha tydliga åligganden att marknadsföra utskottet utåt och jobba med inkluderingsfrågor. Idag har root och DWWW-ansvarig inte tid att jobba både med marknadsföringsfrågor och att driva sitt ansvarsområde, och Källarmästare och Informationsansvarig är inte tillräckligt insatta i rootmästeriet eller DWWW för att marknadsföra åt dem.

= Slutsats

D-sektionen behöver ett utskott för programmering och teknik. Vi behöver bli bättre på att engagera fler medlemmar i sektionens verksamhet och skapa ett nytt forum för de som inte är intresserade av sektionens övriga verksamhet. Införandet av Programmästeriet är inte bara ett naturligt steg för att möta detta intresse utan också ett sätt att stärka sammanhållningen mellan DWWW och rootmästeriet.

#v(1em)
Flugornas projektgrupp yrkar på

- att ändra i stadgarna enligt bifogat dokument
  - lägger till Programmästeriet

- att ändra i reglementet enligt bifogat dokument
  - lägger till posterna för Programmästeriet, tar bort poster i Informationsutskottet och Källarmästeriet, lägger till att Programmästare väljs på Valmötet samt att Programmästare är ständigt adjungerad på styrelsemöten

- att ändra i Policy för Val enligt bifogat dokument
  - lägger till Programmästare, Vice Programmästare, Systemmästare och Webbmästare som kärn- poster och att de bör väljas in innan verksamshetsårets start

- att ändra i Policy för Tackverksamhet enligt bifogat dokument
  - lägger till Programmästare, Vice Programmästare, Systemmästare och Webbmästare som tröjposter

- att vid bifallen motion lägga till en punkt till Beslutsuppföljningen, “Utvärdera hur samarbetet mellan Styrelsen och Programmästeriet har fungerat” med Styrelsen 2025 som ansvarig, till VTM 2025

- att vid bifallen motion lägga till en punkt till Beslutsuppföljningen, “Utvärdera huruvida Programmästeriet bör ligga under Styrelsen” med Styrelsen 2025 som ansvarig till HTM1 2025

- att vid bifallen motion utlysa val för Programmästare snarast möjligt

#pagebreak()

