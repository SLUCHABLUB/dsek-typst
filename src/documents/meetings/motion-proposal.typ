#import "../document.typ": doc
#import "../../utils/signature.typ": signature
#import "../../utils/misc.typ": translate

#let common(
  title: none,
  meeting: none,
  language: "sv",
  date: datetime.today(),
  authors: (),
  doctype: "",
  content
) = {
  show: doc.with(
    title: [#doctype: #title],
    meeting: meeting,
    language: language,
    date: date,
    short_title: doctype,
  )

  set document(author: authors.map(a => a.name))

  content
  v(1.5em)
  table(
    stroke: none,
    columns: 3, // TODO: calculate based on longest width
    row-gutter: 2em,
    ..authors.map(author => {
      signature(
        author.at("greeting", default: translate("Lund, dag som ovan", "Lund, day as above")),
        author.name,
        author.at("position", default: translate("Sektionsmedlem", "Guild member")),
        image: author.at("image", default: none),
      )
    })
  )
}

#let motion = common.with(doctype: "Motion")
#let proposal = common.with(doctype: translate("Proposition", "Proposal"))
#let board-response = common.with(doctype: translate("Styrelsens svar", "Board response"))