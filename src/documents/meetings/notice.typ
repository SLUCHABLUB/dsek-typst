#import "../plain.typ": plain-document
#import "../../utils/misc.typ": translate
#import "../../utils/assert.typ": required
#import "../../utils/agenda-fmt.typ": agenda-fmt
#import "../../utils/signature.typ": author-signatures
#import "@preview/datify:1.0.1": custom-date-format

/// Creates a meeting notice/summons (kallelse) document. Apply with `#show: kallelse.with(...)` or `#show: notice.with(...)`.
///
/// - A "Tid och plats" / "Time and location" block is automatically prepended to the body.
/// - The body should include either (for Sektionsmöten / Guild Assemblies) free-form text or
///   (SRD and Board meetings) a numbered list using bracket syntax: `+ [Action] Item name`.
///   All items must begin with brackets.
///   The action label (e.g. `Beslut`, `Information`) goes inside the brackets.
///   Leave bracket empty for no action (e.g OFMÖ / OFMA).
/// - Time is displayed in 24-hour format (Swedish) or 12-hour with am/pm (English).
///
/// === Example
/// ```typst
/// #show: kallelse.with(
///   meeting: "SRD02",
///   time: date(15, 3, 2025, time: (13, 0)),
///   location: [E:A, LTH],
///   authors: (
///     // position defaults to "Sektionsmedlem" / "Guild member",
///     // message defaults to "Lund, dag som ovan" / "Lund, day as above"
///     (name: "Truls Teknolog", position: styr.ordf),
///   ),
/// )
///
/// + [] TFMÖ // [] = no action label
/// + [Sång] Sektionshymn
///   - #link("https://dsek.se/hymn")[Text]    // link shown in Bilaga / Annex column with label Text
/// + [Beslut] Val av justerare
/// + [Information] Ekonomisk status
///   - #link("https://dsek.se/rambudget")     // numbered: 1
///   - #link("https://dsek.se/detaljbudget")  // numbered: 2
/// + [Beslut] Motion: Jag tycker sektionen borde ha Financial Times
///   - #link("https://dsek.se/rambudget")     // numbered: 1 (same link)
/// + [] TFMA
/// ```
///
/// - meeting (content): The meeting for which the document was written, e.g. `"HTM1"`.
/// - authors (array): Signatories. Each dict must have at least the key `name`, optionally `message`, `position` and `image`.
/// - time (datetime): Meeting date and time. Use `date()`, e.g. `date(15, 3, 2025, time: (13, 0))`.
/// - location (str | content): Meeting venue, e.g. `[E:1124]`.
/// - adjournment (datetime): Optional planned adjournment time, shown in the time/location block.
/// - meeting-type (content): The type of the meeting, e.g. `"Styrelsemöte"` or `"Sektionsmöte"`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let notice(
  meeting: none,
  authors: (),
  time: none,
  location: none,
  adjournment: none,
  meeting-type: none,
  lang: "sv",
  date: datetime.today(),
  body,
) = {
  required(location, "location", fn: "notice", hint: "meeting venue, e.g. location: [E:1124]")
  required(authors, "authors", fn: "notice", hint: "list of author dicts, e.g. authors: ((name: \"Truls Teknolog\"),)")
  required(time, "time", fn: "notice", hint: "use the date() helper, e.g. time: date(15, 3, 2026, time: (12, 15))")

  let notice-name = translate("Kallelse", "Notice")
  let meeting-time = context custom-date-format(time, pattern: "full", lang: text.lang)

  show: plain-document.with(
    title: [#notice-name #translate("till", "for") #meeting-type #meeting, #meeting-time],
    date: date,
    lang: lang,
    meeting: meeting,
    doc-type: notice-name,
  )

  set document(title: [#notice-name #meeting #time.year()])

  heading(
    numbering: none,
    depth: 2,
    translate("Tid och plats", "Time and location"),
  )
  v(0.5em)

  let date-fmt(time) = context [
    #let day = custom-date-format(time, pattern: "full", lang: text.lang)
    #let time = translate(
      time.display("[hour repr:24]:[minute]"),
      time.display("[hour repr:12]:[minute] [period]"),
    )
    #day.replace(regex("^\w"), m => upper(m.text))
    #translate([klockan], [at])
    #time
  ]

  let time-and-date = (
    [*#translate("Tid", "Time"):*],
    date-fmt(time),
    [*#translate("Plats", "Location"):*],
    location,
  )

  if adjournment != none {
    time-and-date.push([*#translate("Ajourneringsdag", "Adjournment day")*:])
    time-and-date.push(if type(adjournment) == datetime {
      date-fmt(adjournment)
    } else [
      #adjournment
    ])
  }

  grid(
    columns: (auto, 1fr),
    stroke: none,
    row-gutter: 1em,
    column-gutter: 1em,
    ..time-and-date
  )

  show enum: agenda-fmt.with(make-heading: true)
  body
  author-signatures(authors)
}
