#import "deliberation.typ": deliberation
#import "../../../lib/_mod.typ": translate

/// #set raw(lang: "typst")
/// Creates a consideration (handling) document. Apply with `#show: handling.with(...)` or `#show: consideration.with(...)`.
///
/// === Notes
/// - Author signatures are appended automatically through the `authors` parameter.
/// - Paragraphs ending with "yrka på", "besluta" (sv) or "move", "decide" (en)
///   automatically get extra vertical space before them.
///
/// === Example
/// ```typst
/// #show: handling.with(
///   title: [Uppdatering av Riktlinje för marknadsföring och prissättning],
///   meeting: "S23",
///   // position defaults to "Sektionsmedlem" / "Guild member",
///   // message defaults to "Lund, dag som ovan" / "Lund, day as above"
///   authors: (
///      (name: "Truls Teknolog", position: naru.koordinator),
///      (name: "Trula Teknolog", message: "För uppdaterad information"),
///    )
/// )
///
/// Det här är en uråldrig riktlinje vars innehåll inte längre är representativt
/// för vad vi gör på sektionen.
///
/// Jag yrkar på // extra space is inserted before this paragraph automatically
/// - att uppdatera Riktlinjen enligt bilaga // becomes: *att* uppdatera...
/// ```
///
/// - title (content): The title of the consideration.
/// - meeting (str, content): The meeting for which the document was written, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each signatory dict must have at least the key `name`, optionally `message`, `position` and `image`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
///
/// -> content
#let consideration(
  title: none,
  meeting: none,
  authors: (),
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

/// Swedish binding for consideration
#let handling = consideration
