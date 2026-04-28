#import "deliberation.typ": deliberation
#import "../../../lib/_mod.typ": translate

/// #set raw(lang: "typst")
/// Creates a proposal (proposition) document. Apply with `#show: proposition.with(...)` or `#show: proposal.with(...)`.
///
/// === Notes
/// - Author signatures are appended automatically through the `authors` parameter.
/// - Paragraphs ending with "yrka på", "besluta" (sv) or "move", "decide" (en)
///   automatically get extra vertical space before them.
///
/// === Example
/// ```typst
/// #show: proposition.with(
///   title: [Budgetrevidering],
///   meeting: "VTM-Extra",
///   authors: (
///     // position defaults to "Sektionsmedlem" / "Guild member",
///     // message defaults to "Lund, dag som ovan" / "Lund, day as above"
///     (name: "Truls Teknolog", position: styr.ordf),
///     (name: "Trula Teknolog", message: "För styrelsen"),
///   ),
/// )
///
/// = Bakgrund
///
/// vi är broke :(
///
/// = Förslag
///
/// Styrelsen yrkar på // extra space is inserted before this paragraph automatically
/// - att avskaffa sektionen // becomes: *att* avskaffa...
/// ```
///
/// - title (content): The title of the proposal.
/// - meeting (str, content): The meeting for which the proposal was written, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each signatory dict must have at least the key `name`, optionally `message`, `position` and `image`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
///
/// -> content
#let proposal(
  title: none,
  meeting: none,
  authors: (),
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

/// Swedish binding for proposal
#let proposition = proposal
