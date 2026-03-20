#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "@preview/datify:1.0.1": custom-date-format
#import "../../strings.typ"

#let req-profile(
  position: none,
  lang: "sv",
  year: datetime.today().year(),
  mandate: (:),
  required: (),
  meriting: (),
  it,
) = {
  let req-profile-name = translate("Kravprofil", "Requirements profile")
  let default-start = datetime(day: 1, month: 1, year: year)
  let default-stop = datetime(day: 31, month: 12, year: year)

  show: doc.with(
    title: [#req-profile-name: #position],
    short-title: req-profile-name,
    lang: lang,
    // meeting: meeting,
    date: year,
  )

  let mandate = if mandate.len() == 0 {
    (from: default-start, to: default-stop)
  } else if mandate.keys().sorted() != ("from", "to") {
    panic("Please provide mandate as a dictionary `(from: date, to: date)` or leave empty to use default calendar year")
  } else {
    mandate
  }

  let from = context custom-date-format(mandate.from, pattern: "medium", lang: text.lang)
  let to = context custom-date-format(mandate.to, pattern: "medium", lang: text.lang)
  grid(
    columns: 2,
    column-gutter: 1em,
    stroke: none,
    [*#translate("Mandatperiod", "Mandate"):*], [#from -- #to],
  )

  it

  set heading(numbering: none)
  set par(justify: false)
  let reqs = translate([== Krav], [== Requirements])
  let mers = translate([== Meriterande], [== Merits])
  table(
    columns: (1fr, 1fr),
    row-gutter: 0.5em,
    stroke: none,
    [#reqs], [#mers],
    [#for r in required [- #r]], [#for m in meriting [- #m]],
  )
}

