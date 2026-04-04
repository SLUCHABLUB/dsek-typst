#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/assert.typ": required, required-keys

// Since these generally are not edited nor written often,
// we think it is fine, or even appropriate,
// for rubrics to be more "function-heavy".
// This way, a more correct way of writing is enforced,
// rather than relying on freehand typing to be consistent.

/// Creates a rubric (guideline/policy/&c.) document.
/// See `guideline` and `policy`.
///
/// - The document begins with a "Formalia" / "Overview" section containing the
///   summary, purpose, scope, and a revision history table.
/// - A page break separates Formalia from the body.
/// - Terms blocks in the body are formatted as a 2-column table (term, description).
///
/// - subject (content): The subject of the rubric, e.g. `"val"` or `"överlämning"`.
/// - summary (content): Description of what this document covers.
/// - purpose (content): Why this document exists.
/// - scope (content): Who or what this document applies to.
/// - history (array): The modification history.
///                    Each entry is a dict with required keys `meeting`, `change`, and `who`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
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
    meeting: history.last().meeting,
    date: date,
    lang: lang,
  )

  [= #translate("Formalia", "Overview")]

  // TODO: This breaks "Policy för styrdokument".
  // <policybrott>
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
  // </policybrott>

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
      .map(edit => {
        (
          [
            #edit.meeting
          ],
          [
            #set par(justify: false)
            #edit.change
          ],
          [
            #set par(justify: false)
            #edit.who
          ],
        )
      })
      .flatten(),
  )

  pagebreak(weak: true)
  body
}
