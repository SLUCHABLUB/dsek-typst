#import "../src/lib.typ": regulations, translate-str

#let names = (
  styr: [Styrelsen],
  aktu: [Aktivitets-?utskottet],
  infu: [Informations-?utskottet],
  cafe: [Café-?mästeriet],
  skattm: [Skatt-?mästeriet],
  fram: [Framtids-?utskottet],
  km: [Källar-?mästeriet],
  nollu: [Nollnings-?utskottet],
  naru: [Näringslivs-?utskottet],
  sexm: [Sex-?mästeriet],
  srd: [Studie-?rådet],
  cpu: [Central-?process-?utskottet],
  medalj: [Medeljelele-?kommitén],
  valb: [Val-?beredningen],
  tackm: [Tack-?mästeriet],
  triv: [Trivsel-?rådet],
  guild: (
    dsek: [D-sektionen],
    dseklth: [D-sektionen inom TLTH],
    data: [Data-?teknik],
    infocom: [Informations- och kommunikations-?teknik],
    vrar: [Virtuell verk-?lighet och förstärkt verk-?lighet],
  ),
)

#let pos = (
  styr: (
    ordf: [Ordförande],
    sordf: [Sektions-?ordförande],
    vice_ordf: [Vice ordförande],
    vice_sordf: [Vice sektions-?ordförande],
  ),
  aktu: (
    mastare: [Aktivitets-?ansvarig],
    vice_mastare: [Vice Aktivitets-?ansvarig],
    dischoansv: [UtEDischo-?ansvarig],
    idrottsfm: [Idrotts-?förman],
    dsportare: [D-sportare],
    karnevalsansv: [Karnevals-?ansvarig],
    lanpartyansv: [LAN-party-?ansvarig],
    semester: [Semester-?firare],
    tandemgen: [Tandem-?general],
    nojesfm: [Nöjes-?förman],
    coach: [Coach],
  ),
  infu: (
    mastare: [Informations-?ansvarig],
    vice_mastare: [Vice Informations-?ansvarig],
    fotograf: [Fotograf],
    filmare: [Filmare],
    arkivarie: [Arkivarie],
    artist: [Artist],
    influencer: [Influencer],
    journalist: [Journalist],
    redaktor: [Redaktör],
    shopaholic: [Shopaholic],
    skald: [Skald],
    markv: [Märkvärdig],
  ),
  cafe: (
    mastare: [Café-?mästare],
    vice_mastare: [Vice café-?mästare],
    dagsansv: [Dags-?ansvarig],
    inventarieansv: [Inventarie-?ansvarig],
    stekare: [Stekare],
    brunchm: [Brunch-?mästare],
    bakis: [Bakis],
  ),
  skattm: (
    mastare: [Skatt-?mästare],
    vice_mastare: [Vice Skatt-?mästare],
    fm: [Skatt-?förman],
  ),
  fram: (
    ordf: [Framtids-?ordförande],
    ledamot: [Framtids-?ledamot],
  ),
  km: (
    mastare: [Källar-?mästare],
    vice_mastare: [Vice källar-?mästare],
    bilansv: [Bil-?ansvarig],
    ljudoljus: [Ljud- och ljus-?ansvarig],
    tradgm: [Trädgårds-?mästare],
  ),
  nollu: (
    oph: [Øver-?phøs],
    stab: [Stabs-?medlem],
    opepp: [Øver-?peppare],
    pepp: [Peppare],
    phadder: [Phadder],
    pluggphadder: [Plugg-?phadder],
  ),
  naru: (
    mastare: [Näringslivs-?ansvarig],
    vice_mastare: [Vice näringslivs-?ansvarig],
    alumniansv: [Alumni-?grupps-?ansvarig],
    aulmnimdlm: [Alumni-?grupps-?medlem],
    koordinator: [Näringslivs-?koordinator],
  ),
  sexm: (
    mastare: [Sex-?mästare],
    vice_mastare: [Vice sex-?mästare],
    barm: [Bar-?mästare],
    vbarm: [Vice bar-?mästare],
    pubm: [Pub-?mästare],
    vpubm: [Vice pub-?mästare],
    hovm: [Hov-?mästare],
    sangfm: [Sång-?förman],
    kokm: [Köks-?mästare],
    vkokm: [Vice köks-?mästare],
    prefm: [Preferens-?mästare],
    olfm: [Öl-?förman],
    vinfm: [Vin-?förman],
    tappad: [TappaD],
    sektkock: [Sektions-?kock],
  ),
  srd: (
    ordf: [Studie-?råds-?ordförande],
    vice_ordf: [Vice studie-?råds-?ordförande],
    sekr: [Studie-?råds-?sekreterare],
    progledrep: [Program-?lednings-?representant],
    instledrep: [Institutions-?lednings-?representant],
    husrep: [Hus-?representant],
    arskursrep: [Års-?kurs-?representant],
  ),
  cpu: (
    mastare: [Process-?mästare],
    vice_mastare: [Vice Process-?mästare],
    dwwwansv: [DWWW-ansvarig],
    root: [root],
    utvecklare: [Utvecklare],
  ),
  medalj: (
    mastare: [Øver-?marskalk],
    mdlm: [Medaljelele-?kommité-?medlem],
  ),
  valb: (
    ordf: [Val-?beredningens ordförande],
    rep: [Val-?berednings-?representant],
  ),
  tackm: (
    mastare: [Tack-?mästare],
    mdlm: [Tack-?mästerist],
  ),
  triv: (
    mastare: [Trivsel-?mästare],
    likbehombud: [Lika-?behandlings-?ombud],
    skyddsombud: [Skydds-?ombud],
    varldsm: [Världs-?mästare],
  ),
  other: (
    inspektor: [Inspektor],
    revisor: [Revisor],
    talman: [Talman],
    jublegeneral: [Jubileums-?general],
  ),
)

#let fmtpos(name) = for (_, values) in pos.at(name) [- #values]

#show: regulations

= Teknologia

/ Råsa: En lämplig tolkning av råsa är _Pepto-Bismol_.

/ Rosa Pantern: Med Rosa Pantern åsyftas den drink som skapas med mjölk, grenadin och sockerlag.

/ Råsa Digitalis: Råsa, fast digitaliskt.

= Hedersomnämnande

= Strategiska mål och verksamhetsplan

= Policyer

= Sektionsmöte

= Valberedningen

= Styrelsen

= Utskott och funktionärer

#context [== #names.infu]

/ Åligganden:
  Det åligger #names.infu
  - att utge sektionens medier
  - att ansvara för sektionens anslagstavlor
  - att sända kopior av sektionens publikationer till lämpliga instanser, t.ex övriga sektioner
  - att upprätthålla sektionens arkiv

/ Funktionärer:
  #names.infu består av #context fmtpos("infu")

/ Sammansättning:
  #names.infu har undergrupperna
  - Redaktionen
  - D-shopen

=== #pos.infu.mastare

#pos.infu.mastare ansvarar för sektionens informationsspridning samt att upprätthålla kommunikation mellan styrelsen och sektionen. #pos.infu.mastare leder även #names.infu.

/ Åligganden:
  Det åligger #pos.infu.mastare
  - att leda #names.infu
  - att vara ansvarig utgivare för sektionens medier
  - att hålla sektionens anslagstavlor och informationsskärmar i god ordning
  - att publicera mötesprotokoll på WWW
  - att upprätthålla god kommunikation mellan styrelsen och sektionens medlemmar
  - att kontinuerligt rapportera vad som händer på sektionen via sektionens informationskanaler

=== #pos.infu.vice_mastare
=== #pos.infu.artist
=== #pos.infu.fotograf
=== #pos.infu.filmare
=== #pos.infu.arkivarie
=== #pos.infu.redaktor
=== #pos.infu.journalist
=== #pos.infu.influencer
=== #pos.infu.shopaholic
=== #pos.infu.skald
=== #pos.infu.markv

== #names.skattm

/ Funktionärer:
  #names.skattm består av #context fmtpos("skattm")

=== #pos.skattm.mastare
=== #pos.skattm.vice_mastare
=== #pos.skattm.fm

== #names.srd

/ Funktionärer:
  #names.srd består av #context fmtpos("srd")

=== #pos.srd.ordf
=== #pos.srd.vice_ordf
=== !!!övriga tbd!!!

== #names.cafe

/ Funktionärer:
  #names.cafe består av #context fmtpos("cafe")

=== #pos.cafe.mastare
=== #pos.cafe.vice_mastare
=== #pos.cafe.dagsansv
=== #pos.cafe.inventarieansv
=== #pos.cafe.brunchm
=== #pos.cafe.bakis
=== #pos.cafe.stekare

== #names.naru

/ Funktionärer:
  #names.naru består av #context fmtpos("naru")

=== #pos.naru.mastare
=== #pos.naru.vice_mastare
=== #pos.naru.koordinator
=== #pos.naru.alumniansv
=== #pos.naru.aulmnimdlm

== #names.km

/ Funktionärer:
  #names.km består av #context fmtpos("km")

=== #pos.km.mastare
=== #pos.km.vice_mastare
=== #pos.km.ljudoljus
=== #pos.km.bilansv
=== #pos.km.tradgm

== #names.aktu

/ Funktionärer:
  #names.aktu består av #context fmtpos("aktu")

=== #pos.aktu.mastare
=== #pos.aktu.vice_mastare
=== #pos.aktu.idrottsfm
=== #pos.aktu.coach
=== #pos.aktu.dsportare
=== #pos.aktu.lanpartyansv
=== #pos.aktu.nojesfm
=== #pos.aktu.dischoansv
=== #pos.aktu.lanpartyansv
=== #pos.aktu.semester
=== #pos.aktu.karnevalsansv

== #names.nollu

/ Funktionärer:
  #names.nollu består av #context fmtpos("nollu")

=== #pos.nollu.oph
=== #pos.nollu.stab
=== #pos.nollu.opepp
=== #pos.nollu.pepp
=== #pos.nollu.phadder
=== #pos.nollu.pluggphadder

== #names.sexm

/ Funktionärer:
  #names.sexm består av #context fmtpos("sexm")

=== #pos.sexm.mastare
=== #pos.sexm.vice_mastare
=== #pos.sexm.pubm
=== #pos.sexm.vpubm
=== #pos.sexm.barm
=== #pos.sexm.vbarm
=== #pos.sexm.hovm
=== #pos.sexm.sangfm
=== #pos.sexm.kokm
=== #pos.sexm.vkokm
=== #pos.sexm.prefm
=== #pos.sexm.olfm
=== #pos.sexm.vinfm
=== #pos.sexm.tappad
=== #pos.sexm.sektkock

== #names.cpu

/ Funktionärer:
  #names.cpu består av #context fmtpos("cpu")

=== #pos.cpu.mastare
=== #pos.cpu.vice_mastare
=== #pos.cpu.dwwwansv
=== #pos.cpu.root
=== #pos.cpu.utvecklare

== #names.medalj

/ Funktionärer:
  #names.medalj består av #context fmtpos("medalj")

=== #pos.medalj.mastare
=== #pos.medalj.mdlm

== #names.triv

/ Funktionärer:
  #names.triv består av #context fmtpos("triv")

=== #pos.triv.mastare
=== #pos.triv.likbehombud
=== #pos.triv.skyddsombud
=== #pos.triv.varldsm

== #names.fram

/ Funktionärer:
  #names.fram består av #context fmtpos("fram")

=== #pos.fram.ordf
=== #pos.fram.ledamot

== #names.tackm

/ Funktionärer:
  #names.tackm består av #context fmtpos("tackm")

=== #pos.tackm.mastare
=== #pos.tackm.mdlm

= Medaljer och utmärkelser
