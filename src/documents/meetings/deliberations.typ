#import "../plain-document.typ": plain-document
#import "../../utils/signature.typ": author-signatures
#import "../../utils/misc.typ": ref-id, to-label, to-text, translate
#import "../../utils/assert.typ": required

#let deliberation(
  title: none, // required
  meeting: none, // required
  authors: (), // required
  lang: "sv",
  date: datetime.today(),
  doc-type: "",
  body,
) = {
  required(title, "title", fn: "deliberation", hint: "document title, e.g. title: \"Skattmästaren till verkligheten\"")
  required(meeting, "meeting", fn: "deliberation", hint: "meeting identifier, e.g. meeting: \"HTM1\"")
  required(
    authors,
    "authors",
    fn: "deliberation",
    hint: "list of author dicts, e.g. authors: ((name: \"Truls Teknolog\", position: \"Funktionär inom Informationsutskottet\", message: \"Lund, dag som ovan\"),)",
  )

  show: plain-document.with(
    title: [#doc-type: #title],
    meeting: meeting,
    lang: lang,
    date: date,
    doc-type: doc-type,
  )

  set document(author: authors.map(a => a.name))
  show par: it => context {
    let pattern = regex(
      if text.lang == "sv" {
        "(?i)yrka(.*)(på|beslut(a?))"
      } else if text.lang == "en" {
        "(?i)(move(s?)|decide)"
      } else {
        "a^"
      }
    )
    if to-text(it).ends-with(pattern) {
      v(1em)
      it
    } else {
      it
    }
  }

  body
  author-signatures(authors)
}

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

/// #set raw(lang: "typst")
/// Creates a board response (styrelsens svar) document. Apply with `#show: styrelsens-svar.with(...)` or `#show: board-response.with(...)`.
///
/// === Notes
/// - Author signatures are appended automatically through the `authors` parameter.
/// - Paragraphs ending with "yrka på", "besluta" (sv) or "move", "decide" (en)
///   automatically get extra vertical space before them.
///
/// === Example
/// ```typst
/// #show: styrelsens-svar.with(
///   title: [3.0 flugor i en smäll],
///   meeting: "HTM1",
///   // position defaults to "Sektionsmedlem" / "Guild member",
///   // message defaults to "Lund, dag som ovan" / "Lund, day as above"
///   authors: (
///      (name: "Truls Teknolog", position: strings.styr.ordf),
///      (name: "Trula Teknolog", message: "För styrelsen"),
///    )
/// )
///
/// #emoji.thumb.up
///
/// Styrelsen yrkar på // extra space is inserted before this paragraph automatically
/// - att bifalla motionen i sin helhet // becomes: *att* bifalla...
/// ```
///
/// - title (content): The title of the motion being responded to.
/// - meeting (str, content): The meeting for which the motion and response were written, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each signatory dict must have at least the key `name`, optionally `message`, `position` and `image`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
///
/// -> content
#let board-response(
  title: none,
  meeting: none,
  authors: (),
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
