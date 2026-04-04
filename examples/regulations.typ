#import "../src/lib.typ": *
#import "../src/strings.typ": *

#let copies = (
  "infu": infu,
  "skattm": skattm,
  "srd": srd,
  "cafe": cafe,
  "naru": naru,
  "km": km,
  "aktu": aktu,
  "nollu": nollu,
  "sexm": sexm,
  "medalj": medalj,
  "triv": triv,
  "fram": fram,
  "tackm": tackm,
  "cpu": cpu,
)

#for name in copies.keys() {
  _ = copies.at(name).remove("name")
}

#let positions(pos) = {
  for p in copies.at(pos).values() [- #p]
}

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

== #infu.name

/ Åligganden:
  Det åligger #infu.name
  - att utge sektionens medier
  - att ansvara för sektionens anslagstavlor
  - att sända kopior av sektionens publikationer till lämpliga instanser, t.ex övriga sektioner
  - att upprätthålla sektionens arkiv

/ Funktionärer:
  #infu.name består av #positions("infu")

/ Sammansättning:
  #infu.name har undergrupperna
  - Redaktionen
  - D-shopen

=== #infu.mastare

#infu.mastare ansvarar för sektionens informationsspridning samt att upprätthålla kommunikation mellan styrelsen och sektionen. #infu.mastare leder även #infu.name.

/ Åligganden:
  Det åligger #infu.mastare
  - att leda #infu.name
  - att vara ansvarig utgivare för sektionens medier
  - att hålla sektionens anslagstavlor och informationsskärmar i god ordning
  - att publicera mötesprotokoll på WWW
  - att upprätthålla god kommunikation mellan styrelsen och sektionens medlemmar
  - att kontinuerligt rapportera vad som händer på sektionen via sektionens informationskanaler

=== #infu.vice_mastare
=== #infu.artist
=== #infu.fotograf
=== #infu.filmare
=== #infu.arkivarie
=== #infu.redaktor
=== #infu.journalist
=== #infu.influencer
=== #infu.shopaholic
=== #infu.skald
=== #infu.markv

== #skattm.name

/ Funktionärer:
  #skattm.name består av #positions("skattm")

=== #skattm.mastare
=== #skattm.vice_mastare
=== #skattm.fm

== #srd.name

/ Funktionärer:
  #srd.name består av #positions("srd")

=== #srd.ordf
=== #srd.vice_ordf
=== !!!övriga tbd!!!

== #cafe.name

/ Funktionärer:
  #cafe.name består av #positions("cafe")

=== #cafe.mastare
=== #cafe.vice_mastare
=== #cafe.dagsansv
=== #cafe.inventarieansv
=== #cafe.brunchm
=== #cafe.bakis
=== #cafe.stekare

== #naru.name

/ Funktionärer:
  #naru.name består av #positions("naru")

=== #naru.mastare
=== #naru.vice_mastare
=== #naru.koordinator
=== #naru.alumniansv
=== #naru.aulmnimdlm

== #km.name

/ Funktionärer:
  #km.name består av #positions("km")

=== #km.mastare
=== #km.vice_mastare
=== #km.ljudoljus
=== #km.bilansv
=== #km.tradgm

== #aktu.name

/ Funktionärer:
  #aktu.name består av #positions("aktu")

=== #aktu.mastare
=== #aktu.vice_mastare
=== #aktu.idrottsfm
=== #aktu.coach
=== #aktu.dsportare
=== #aktu.lanpartyansv
=== #aktu.nojesfm
=== #aktu.dischoansv
=== #aktu.lanpartyansv
=== #aktu.semester
=== #aktu.karnevalsansv

== #nollu.name

/ Funktionärer:
  #nollu.name består av #positions("nollu")

=== #nollu.oph
=== #nollu.stab
=== #nollu.opepp
=== #nollu.pepp
=== #nollu.phadder
=== #nollu.pluggphadder

== #sexm.name

/ Funktionärer:
  #sexm.name består av #positions("sexm")

=== #sexm.mastare
=== #sexm.vice_mastare
=== #sexm.pubm
=== #sexm.vpubm
=== #sexm.barm
=== #sexm.vbarm
=== #sexm.hovm
=== #sexm.sangfm
=== #sexm.kokm
=== #sexm.vkokm
=== #sexm.prefm
=== #sexm.olfm
=== #sexm.vinfm
=== #sexm.tappad
=== #sexm.sektkock

== #cpu.name

/ Funktionärer:
  #cpu.name består av #positions("cpu")

=== #cpu.mastare
=== #cpu.vice_mastare
=== #cpu.dwwwansv
=== #cpu.root
=== #cpu.utvecklare

== #medalj.name

/ Funktionärer:
  #medalj.name består av #positions("medalj")

=== #medalj.mastare
=== #medalj.mdlm

== #triv.name

/ Funktionärer:
  #triv.name består av #positions("triv")

=== #triv.mastare
=== #triv.likbehombud
=== #triv.skyddsombud
=== #triv.varldsm

== #fram.name

/ Funktionärer:
  #fram.name består av #positions("fram")

=== #fram.ordf
=== #fram.ledamot

== #tackm.name

/ Funktionärer:
  #tackm.name består av #positions("tackm")

=== #tackm.mastare
=== #tackm.mdlm

= Medaljer och utmärkelser
