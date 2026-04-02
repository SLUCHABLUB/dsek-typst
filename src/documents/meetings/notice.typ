#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/agenda-fmt.typ": agenda-fmt
#import "../../utils/signature.typ": author-signatures
#import "@preview/datify:1.0.1": custom-date-format

#let notice(
  meeting: none, // required
  authors: (), // required
  time: none, // required
  location: none, // required
  adjournment: none, // TODO: implement
  meeting-type: none,
  lang: "sv",
  date: datetime.today(),
  body,
) = {
  if location == none { panic("Please provide a meeting location (key: `location`)") }
  if authors == () { panic("Please provide an author or list of authors (key: `authors`)") }
  if time == none {
    panic("Please provide a meeting datetime using `date(day, month, year, time: (hour, minute))`")
  }

  let notice-name = translate("Kallelse", "Notice")
  let meeting-time = context custom-date-format(time, pattern: "full", lang: text.lang)

  show: doc.with(
    title: [#notice-name #translate("till", "for") #meeting-type #meeting, #meeting-time],
    date: date,
    lang: lang,
    meeting: meeting,
    doc-type: notice-name,
  )

  set document(title: [#notice-name #meeting #time.year()])

  heading(
    numbering: none,
    depth: 2,
    translate("Tid och plats", "Time and location"),
  )
  v(0.5em)

  grid(
    columns: (auto, 1fr),
    stroke: none,
    row-gutter: 1.5em,
    column-gutter: 1em,
    [*#translate("Tid", "Time"):*],
    context [
      #let day = custom-date-format(time, pattern: "full", lang: text.lang)
      #let time = translate(
        time.display("[hour repr:24]:[minute]"),
        time.display("[hour repr:12]:[minute] [period]"),
      )
      #day.replace(regex("^\w"), m => upper(m.text))
      #translate([klockan], [at])
      #time
    ],

    [*#translate("Plats", "Location"):*], location,
  )

  show enum: agenda-fmt.with(make-heading: true)
  body
  author-signatures(authors)
}
