#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/agenda-fmt.typ": agenda-fmt
#import "../../utils/signature.typ": author-signatures
#import "@preview/datify:1.0.1": custom-date-format

#let agenda(
  date: datetime.today(),
  lang: "sv",
  meeting: none,
  meeting-type: "",
  authors: (),
  time: none,
  it,
) = {
  if time == none {
    panic(
      "Please provide a meeting time (key: `time`)",
    )
  }

  if meeting == none {
    panic("Please provide a meeting name (key: `meeting`)")
  }

  let agenda-name = translate("Föredragningslista", "Agenda")
  show: doc.with(
    title: [
      #agenda-name
      #translate("för", "for")
      #meeting-type
      #meeting,
      #context custom-date-format(time, pattern: "full", lang: text.lang)
    ],
    date: date,
    lang: lang,
    meeting: meeting,
    short-title: agenda-name,
  )

  show enum: agenda-fmt
  it
  author-signatures(authors)
}
