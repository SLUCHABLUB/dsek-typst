#import "../plain.typ": plain-document
#import "../../utils/misc.typ": translate
#import "../../utils/assert.typ": required
#import "../../utils/agenda-fmt.typ": agenda-fmt
#import "../../utils/signature.typ": author-signatures
#import "@preview/datify:1.0.1": custom-date-format

/// Creates an agenda (föredragningslista) document. Apply with `#show: föredragningslista.with(...)` or `#show: agenda.with(...)`.
///
/// - The body should include a numbered list using bracket syntax: `+ [Action] Item name`.
///   All items must begin with brackets.
///   The action label (e.g. `Beslut`, `Information`) goes inside the brackets.
///   Leave bracket empty for no action (e.g OFMÖ / OFMA).
/// - Links attached to an item are collected into the Annex / Bilaga column and numbered.
///   Referring to the same link more than once gives it the same number.
///
/// === Example
/// ```typst
/// #show: föredragningslista.with(
///   meeting: "HTM1",
///   time: date(15, 3, 2026, time: (17, 15)),
///   authors: ((name: "Truls Teknolog", position: strings.otherpos.talman),),
/// )
///
/// + [] TFMÖ // [] = no action label
/// + [Sång] Sektionshymn
///   - #link("https://dsek.se/hymn")[Text]    // link shown in Annex / Bilaga column with label Text
/// + [Beslut] Val av justerare
/// + [Information] Ekonomisk status
///   - #link("https://dsek.se/rambudget")     // numbered: 1
///   - #link("https://dsek.se/detaljbudget")  // numbered: 2
/// + [Beslut] Motion: Jag tycker sektionen borde ha Financial Times
///   - #link("https://dsek.se/rambudget")     // numbered: 1 (same link)
/// + [] TFMA
/// ```
///
/// - meeting (content): The meeting which the agenda outlines, e.g. `"HTM1"`.
/// - time (datetime): Meeting date and time. Use `date()`, e.g. `date(15, 3, 2025, time: (13, 0))`.
/// - meeting-type (content): The type of the meeting, e.g. `"Styrelsemöte"` or `"Sektionsmöte"`.
/// - authors (array): Optional signatories shown in a signature block.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let agenda(
  meeting: none,
  time: none,
  meeting-type: [],
  authors: (),
  date: datetime.today(),
  lang: "sv",
  body,
) = {
  required(time, "time", fn: "agenda", hint: "use the date() helper, e.g. time: date(15, 3, 2026, time: (12, 15))")
  required(meeting, "meeting", fn: "agenda", hint: "short meeting identifier, e.g. meeting: \"HTM1\"")

  let agenda-name = translate("Föredragningslista", "Agenda")
  let meeting-time = context custom-date-format(time, pattern: "full", lang: text.lang)

  show: plain-document.with(
    title: [#agenda-name #translate("för", "for") #meeting-type #meeting, #meeting-time],
    date: date,
    lang: lang,
    meeting: meeting,
    doc-type: agenda-name,
  )

  show enum: agenda-fmt
  body
  author-signatures(authors)
}
