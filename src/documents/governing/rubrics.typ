#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/terms-fmt.typ": terms-fmt

// Since these generally are not edited nor written often,
// we think it is fine, or even appropriate,
// for rubrics to be more "function-heavy".
// This way, a more correct way of writing is enforced,
// rather than relying on freehand typing to be consistent.

#let rubric(
  title: none, // required
  summary: [], // required
  purpose: [], // required
  scope: [], // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  doc-type: "",
  it,
) = {
  if title == none { panic("Please provide a title (key: `title`)") }
  if summary == [] { panic("Please provide a summary of this rubric (key: `summary`)") }
  if purpose == [] { panic("Please provide the purpose of this rubric (key: `purpose`)") }
  if scope == [] { panic("Please provide a scope (key: `scope`)") }
  if history == () { panic("Please provide at least one history entry (key: `history`)") }

  show: doc.with(
    title: [#doc-type #translate("för", "for") #title],
    doc-type: doc-type,
    meeting: history.map(x => x.meeting).last(),
    date: date,
    lang: lang,
  )

  [= Formalia]

  [
    // new style?
    #show terms: terms-fmt.with(columns: (9.5em, 1fr))
    / #translate("Sammanfattning", "Summary"): #summary
    / #translate("Syfte", "Purpose"): #purpose
    / #translate("Omfattning", "Scope"): #scope
  ]

  heading(
    numbering: none,
    depth: 2,
    translate("Historik", "History"),
  )

  context table(
    columns: (8em, 1.2fr, 1fr),
    stroke: none,
    table.hline(stroke: 0.4pt, position: bottom),
    table.header(
      [*#translate("Möte", "Meeting")*],
      [*#translate("Ändring", "Modification")*],
      [*#translate("Ansvarig", "Responsible")*],
    ),
    row-gutter: (0.25em, auto),
    ..history
      .map(x => {
        // let meeting = x.at("meeting", default: panic("please provide a meeting"))
        let who = x.at("who", default: "-")
        (
          [
            #x.meeting
          ],
          [
            #set par(justify: false)
            #x.change
          ],
          [
            #set par(justify: false)
            #who
          ],
        )
      })
      .flatten(),
  )

  pagebreak(weak: true)
  it
}

#let policy(
  title: none, // required
  summary: [], // required
  purpose: [], // required
  scope: [], // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  content,
) = {
  show: rubric.with(
    title: title,
    summary: summary,
    purpose: purpose,
    scope: scope,
    history: history,
    date: date,
    lang: lang,
    doc-type: "Policy",
  )
  content
}

#let guideline(
  title: none, // required
  summary: [], // required
  purpose: [], // required
  scope: [], // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  content,
) = {
  show: rubric.with(
    title: title,
    summary: summary,
    purpose: purpose,
    scope: scope,
    history: history,
    date: date,
    lang: lang,
    doc-type: translate("Riktlinje", "Guideline"),
  )
  content
}
