#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/signature.typ": author-signatures
#import "../../utils/assert.typ": required

// TODO: refactor? having trouble figuring out a design for this template

/// Renders a position group for use in a nomination document.
///
/// Outputs the position in bold followed by a bullet list of nominees.
///
/// - position (str | content): The position being nominated for.
/// - ..people (str | content): The nominee(s) for this position.
/// -> content
#let nominees(position: none, ..people) = {
  [*#position*]
  for person in people.pos() [- #person]
}

/// Creates a nomination (nominering) document. Apply with `#show: nomination.with(...)`.
///
/// - Use `nominees()` to group candidates by position. Free-form content (headings,
///   paragraphs) can be mixed in between `nominees()` calls.
/// - Author signatures are appended automatically.
///
/// ```typst
/// #show: nomination.with(
///   title: [Nominering till HTM1 2025],
///   meeting: "HTM1",
///   authors: ((name: "Valberedningen", position: valb.mastare),),
/// )
///
/// Valberedningen föreslår följande kandidater till HTM1 2025.
///
/// == Styrelsen
///
/// #nominees(position: styr.ordf, "Truls Teknolog")
/// #nominees(position: styr.vice_ordf, "Trula Teknolog", "Pelle Postlös")  // multiple candidates
///
/// == Informationsutskottet
///
/// #nominees(position: infu.mastare, "Alice Alström")
/// ```
///
/// - title (str | content): Document title, e.g. `[Nominering till HTM1]`.
/// - meeting (str | content): Short meeting identifier, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each dict must have at least the key `name`, optionally `greeting`, `position` and `image`.
/// - lang (str): `"sv"` or `"en"`. Default `"sv"`.
/// - date (datetime): Defaults to today.
/// -> content
#let nomination(
  title: none, // required
  meeting: none, // required
  authors: (), // required
  lang: "sv",
  date: datetime.today(),
  body,
) = {
  required(title, "title", fn: "nomination", hint: "document title, e.g. title: \"Val av Utvecklare\"")
  required(meeting, "meeting", fn: "nomination", hint: "short meeting identifier, e.g. meeting: \"S12\"")
  required(
    authors,
    "authors",
    fn: "nomination",
    hint: "list of author dicts, e.g. authors: ((name: \"Truls Teknolog\"),)",
  )

  let nomination-name = translate("Nominering", "Nomination")

  show: doc.with(
    title: title,
    doc-type: nomination-name,
    lang: lang,
    meeting: meeting,
    date: date,
  )

  body

  author-signatures(authors)
}

