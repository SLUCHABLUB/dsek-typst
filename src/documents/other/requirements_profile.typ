#import "../plain.typ": plain-document
#import "../../utils/misc.typ": translate
#import "@preview/datify:1.0.1": custom-date-format
#import "../../strings.typ"
#import "../../utils/assert.typ": required, required-keys

/// Creates a requirements profile (kravprofil) for an elected position. Apply with `#show: req-profile.with(...)`.
///
/// - Body content is shown as a preamble above the requirements table.
/// - Requirements and merits are rendered as a two-column bullet list at the end.
/// - The mandate period defaults to the full calendar year of `year` if not set explicitly.
///
/// === Example
/// ```typst
/// #show: req-profile.with(
///   position: strings.styr.ordf,  // or a plain string: "Vice ordförande"
///   requirements: (
///     "Godkänd i B2",
///   ),
///   merits: (
///     "Erfarenhet av projektledning",
///     "Tidigare ordföranderoll i studentförening",
///   ),
///   // mandate: auto  // jan 1 – dec 31 (default)
/// )
///
/// Ordförande leder sektionens styrelse och representerar sektionen utåt.
/// ```
///
/// - position (str, content): The position title, e.g. `"Vice ordförande"` or `strings.medalj.mdlm`.
/// - requirements (array): Mandatory requirements (strings or content).
/// - merits (array): Meritorious qualifications. Defaults to empty.
/// - mandate (dictionary, auto): Mandate period as `(from: datetime, to: datetime)`.
///   Set to `auto` to use the full calendar year given by `year`. Default `auto`.
/// - year (int): Calendar year used when `mandate: auto`. Defaults to current year.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let req-profile(
  position: none,
  requirements: (),
  merits: (),
  mandate: auto,
  year: datetime.today().year(),
  lang: "sv",
  date: datetime.today(),
  body,
) = {
  required(position, "position", fn: "req-profile", hint: "the position title, e.g. position: \"Vice ordförande\"")
  required(
    requirements,
    "requirements",
    fn: "req-profile",
    hint: "array of requirements, e.g. requirements: (\"Ansvarsfull\", \"Stresshanteringsförmåga\", \"Godkänd i B2an\")",
  )

  let req-profile-name = translate("Kravprofil", "Requirements profile")
  let default-start = datetime(day: 1, month: 1, year: year)
  let default-stop = datetime(day: 31, month: 12, year: year)

  show: plain-document.with(
    title: [#req-profile-name: #position],
    doc-type: req-profile-name,
    lang: lang,
    // meeting: meeting,
    date: date,
  )

  let mandate = if mandate == auto {
    (from: default-start, to: default-stop)
  } else {
    required-keys(
      mandate,
      ("from", "to"),
      fn: "req-profile (mandate)",
      hint: "mandate: (from: date(1, 7, 2026), to: date(31, 6, 2027)), or set mandate: auto for the full calendar year",
    )
    mandate
  }

  let from = context custom-date-format(mandate.from, pattern: "medium", lang: text.lang)
  let to = context custom-date-format(mandate.to, pattern: "medium", lang: text.lang)
  grid(
    columns: 2,
    column-gutter: 1em,
    stroke: none,
    [*#translate("Mandatperiod", "Mandate"):*], [#from -- #to],
  )

  body

  set heading(numbering: none)
  set par(justify: false)
  let requirements = translate([== Krav], [== Requirements])
  let merits = translate([== Meriterande], [== Merits])
  table(
    columns: (1fr, 1fr),
    row-gutter: 0.5em,
    stroke: none,
    requirements, merits,
    [#for r in requirements [- #r]], [#for m in merits [- #m]],
  )
}
