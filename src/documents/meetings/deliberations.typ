#import "../document.typ": doc
#import "../../utils/signature.typ": author-signatures
#import "../../utils/misc.typ": labelize, ref-id, to-text, translate

#let deliberation(
  title: none, // required
  meeting: none, // required
  authors: (), // required
  lang: "sv",
  date: datetime.today(),
  doc-type: "",
  body,
) = {
  if title == none { panic("Please provide a meeting title (key: `title`)") }
  if meeting == none { panic("Please provide a meeting name (key: `meeting`)") }
  if authors == () { panic("Please provide an author or list of authors (key: `authors`)") }

  show: doc.with(
    title: [#doc-type: #title],
    meeting: meeting,
    lang: lang,
    date: date,
    doc-type: doc-type,
  )

  set document(author: authors.map(a => a.name))
  show par: it => context {
    let rgx = {
      if text.lang == "sv" {
        "(?i)yrka(.*)(på|beslut(a?))"
      } else if text.lang == "en" {
        "(?i)(move(s?)|decide)"
      } else {
        "a^"
      }
    }
    if to-text(it).ends-with(regex(rgx)) {
      v(1em)
      it
    } else {
      it
    }
  }

  body
  author-signatures(authors)
}

#let motion(
  title: none, // required
  meeting: none, // required
  authors: (), // required?
  lang: "sv",
  date: datetime.today(),
  body,
) = deliberation(
  doc-type: "Motion",
  title: title,
  meeting: meeting,
  authors: authors,
  lang: lang,
  date: date,
  body,
)

#let proposal(
  title: none, // required
  meeting: none, // required
  authors: (), // required?
  lang: "sv",
  date: datetime.today(),
  body,
) = deliberation(
  doc-type: translate("Proposition", "Proposal"),
  title: title,
  meeting: meeting,
  authors: authors,
  lang: lang,
  date: date,
  body,
)

#let board-response(
  title: none, // required
  meeting: none, // required
  authors: (), // required?
  lang: "sv",
  date: datetime.today(),
  body,
) = deliberation(
  doc-type: translate("Styrelsens svar", "Board response"),
  title: title,
  meeting: meeting,
  authors: authors,
  lang: lang,
  date: date,
  body,
)

#let consideration(
  title: none, // required
  meeting: none, // required
  authors: (), // required?
  lang: "sv",
  date: datetime.today(),
  body,
) = deliberation(
  doc-type: translate("Handling", "Consideration"),
  title: title,
  meeting: meeting,
  authors: authors,
  date: date,
  lang: lang,
  body,
)
