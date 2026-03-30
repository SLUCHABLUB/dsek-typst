#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/signature.typ": author-signatures

#let nominees(position: none, ..people) = {
  [*#position*]
  for person in people.pos() [- #person]
}

#let nomination(
  title: none, // required
  meeting: none, // required
  // nominees: (), // required
  authors: (), // required
  lang: "sv",
  date: datetime.today(),
  it,
) = {
  if meeting == none { panic("Please provide a meeting name (key: `meeting`)") }
  if authors == () { panic("Please provide an author or list of authors (key: `authors`)") }

  // if type(nominees) not in (array, dictionary) or nominees.len() == 0 {
  //   panic("Please provide a list of nominees (key: `nominees`)")
  // }

  let nomination-name = translate("Nominering", "Nomination")

  show: doc.with(
    title: title,
    doc-type: nomination-name,
    lang: lang,
    meeting: meeting,
    date: date,
  )

  it

  author-signatures(authors)
}

