#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/agenda-fmt.typ": agenda-fmt
#import "../../utils/signature.typ": author-signatures
#import "@preview/datify:1.0.1": custom-date-format

#let agenda(
  meeting: none, // required
  time: none, // required
  meeting-type: [],
  authors: (),
  date: datetime.today(),
  lang: "sv",
  it,
) = {
  if time == none { panic("Please provide a meeting time (key: `time`)") }
  if meeting == none { panic("Please provide a meeting name (key: `meeting`)") }

  let agenda-name = translate("Föredragningslista", "Agenda")
  let meeting-time = context custom-date-format(time, pattern: "full", lang: text.lang)

  show: doc.with(
    title: [#agenda-name #translate("för", "for") #meeting-type #meeting, #meeting-time],
    date: date,
    lang: lang,
    meeting: meeting,
    doc-type: agenda-name,
  )

  show enum: agenda-fmt
  it
  author-signatures(authors)
}
