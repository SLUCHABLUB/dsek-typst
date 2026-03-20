#import "../document.typ": doc
#import "../../utils/signature.typ": author-signatures
#import "../../utils/misc.typ": labelize, ref-id, to-text, translate

#let common(
  title: none,
  meeting: none,
  lang: "sv",
  date: datetime.today(),
  authors: (),
  doctype: "",
  content,
) = {
  show: doc.with(
    title: [#doctype: #title],
    meeting: meeting,
    lang: lang,
    date: date,
    short-title: doctype,
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

  let default_greeting = translate("Lund, dag som ovan", "Lund, day as above")
  let default_position = translate("Sektionsmedlem", "Guild member")

  content
  author-signatures(authors)
}

#let motion = common.with(
  doctype: "Motion",
)

#let proposal = common.with(
  doctype: translate(
    "Proposition",
    "Proposal",
  ),
)

#let board-response = common.with(
  doctype: translate(
    "Styrelsens svar",
    "Board response",
  ),
)

#let consideration = common.with(
  doctype: translate(
    "Handling",
    "Consideration",
  ),
)

