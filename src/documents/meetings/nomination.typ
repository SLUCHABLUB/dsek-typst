#import "../plain.typ": plain-document
#import "../../utils/misc.typ": translate
#import "../../utils/signature.typ": author-signatures
#import "../../utils/assert.typ": required

// TODO: refactor? having trouble figuring out a design for this template

/// Renders a position group for use in a nomination document.
///
/// Outputs the position in bold followed by a bullet list of nominees.
///
/// - position (content): The position being nominated for.
/// - ..people (content): The nominee(s) for this position.
/// -> content
#let nominees(position: none, ..people) = {
  [*#position*]
  for person in people.pos() [- #person]
}

// TODO: Make title default to auto.

/// Creates a nomination (nominering) document. Apply with `#show: nomination.with(...)`.
///
/// - Use `nominees()` to group candidates by position. Free-form content (headings,
///   paragraphs) can be mixed in between `nominees()` calls.
/// - Author signatures are appended automatically.
///
/// === Example
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
/// - title (content): The title of the document, e.g. `[Nominering till HTM1]`.
/// - meeting (content): The meeting for which the document was written, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each dict must have at least the key `name`, optionally `greeting`, `position` and `image`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let nomination(
  title: none,
  meeting: none,
  authors: (),
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

  show: plain-document.with(
    title: title,
    doc-type: nomination-name,
    lang: lang,
    meeting: meeting,
    date: date,
  )

  body

  author-signatures(authors)
}
