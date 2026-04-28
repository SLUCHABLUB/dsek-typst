#import "deliberation.typ": deliberation

/// #set raw(lang: "typst")
/// Creates a motion document. Apply with `#show: motion.with(...)`.
///
/// === Notes
/// - Author signatures are appended automatically through the `authors` parameter.
/// - Paragraphs ending with "yrka på", "besluta" (sv) or "move", "decide" (en)
///   automatically get extra vertical space before them.
///
/// === Example
/// ```typst
/// #show: motion.with(
///   title: [3.0 flugor i en smäll],
///   meeting: "HTM1",
///   authors: (
///     // position defaults to "Sektionsmedlem" / "Guild member",
///     // message defaults to "Lund, dag som ovan" / "Lund, day as above"
///     (name: "Truls Teknolog", position: aktu.dsportare),
///     (name: "Trula Teknolog", message: "gaming"),
///   ),
/// )
///
/// = Bakgrund
///
/// Geekend är ett väldigt uppskattat event. Senast slog vi rekord med 247
/// sittande. Jag är inte helt säker på hur vi fick plats, men kul var det.
///
/// = Sammanfattning
///
/// Geekend är kul, så vi vill ha mer Geekend
///
/// Aktivitetsutskottet yrkar på // extra space is inserted before this paragraph automatically
/// - att införa ett månadslångt Geekend // becomes: *att* införa...
/// ```
///
/// - title (content): The title of the motion.
/// - meeting (str, content): The meeting for which the motion was written, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each signatory dict must have at least the key `name`, optionally `message`, `position` and `image`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let motion(
  title: none,
  meeting: none,
  authors: (),
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

