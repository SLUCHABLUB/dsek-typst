#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/assert.typ": required, required-keys

// Since these generally are not edited nor written often,
// we think it is fine, or even appropriate,
// for rubrics to be more "function-heavy".
// This way, a more correct way of writing is enforced,
// rather than relying on freehand typing to be consistent.

#let govdoc(
  subject: none, // required
  summary: none, // required
  purpose: none, // required
  scope: none, // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  doc-type: "",
  body,
) = {
  required(subject, "subject", fn: "policy/guideline")
  required(summary, "summary", fn: "policy/guideline")
  required(purpose, "purpose", fn: "policy/guideline")
  required(scope, "scope", fn: "policy/guideline")
  required(
    history,
    "history",
    fn: "policy/guideline",
    hint: "array of (meeting: ..., change: ..., who: ...) dicts, e.g. ((meeting: \"HTM1\", change: \"Uppdaterad enligt proposition\", who: \"Styrelsen genom Truls Teknolog och Trula Teknolog\"),)",
  )
  for entry in history {
    required-keys(
      entry,
      ("meeting", "change", "who"),
      fn: "policy/guideline (history entry)",
      hint: "(meeting: \"HTM1\", change: \"Uppdaterad enligt proposition\", who: \"Styrelsen genom Truls Teknolog och Trula Teknolog\")",
    )
  }

  show: doc.with(
    title: [#doc-type #translate("för", "for") #subject],
    doc-type: doc-type,
    meeting: history.map(x => x.meeting).last(),
    date: date,
    lang: lang,
  )

  [= #translate("Formalia", "Overview")]

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
    translate("Historik", "Revisions"),
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
  body
}
