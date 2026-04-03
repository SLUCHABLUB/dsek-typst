#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/assert.typ": required, required-keys

// Since these generally are not edited nor written often,
// we think it is fine, or even appropriate,
// for rubrics to be more "function-heavy".
// This way, a more correct way of writing is enforced,
// rather than relying on freehand typing to be consistent.

#let rubric(
  title: none, // required
  summary: none, // required
  purpose: none, // required
  scope: none, // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  doc-type: "",
  body,
) = {
  required(title, "title", fn: "policy/guideline")
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
    title: [#doc-type #translate("för", "for") #title],
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

/// Creates a policy document. Apply with `#show: policy.with(...)`.
///
/// - The document begins with a "Formalia" / "Overview" section containing the
///   summary, purpose, scope, and a revision history table.
/// - A page break separates Formalia from the body.
/// - Terms blocks in the body are formatted as a 2-column table (term, description).
///
/// - title (str | content): Document subject, e.g. `"Val"` or `"Tackverksamhet"`.
/// - summary (str | content): Description of what this document covers.
/// - purpose (str | content): Why this document exists.
/// - scope (str | content): Who or what this document applies to.
/// - history (array): Modification history. Each entry is a dict with required keys
///   `meeting`, `change`, and `who`.
/// - lang (str): `"sv"` or `"en"`. Default `"sv"`.
/// - date (datetime): Document date shown in the header. Defaults to today.
/// -> content
#let policy(
  title: none, // required
  summary: [], // required
  purpose: [], // required
  scope: [], // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  body,
) = rubric(
  title: title,
  summary: summary,
  purpose: purpose,
  scope: scope,
  history: history,
  date: date,
  lang: lang,
  doc-type: "Policy",
  body,
)

/// Creates a guideline (riktlinje) document. Apply with `#show: riktlinje.with(...)` or `#show: guideline.with(...)`.
///
/// A riktlinje provides recommended practice without being as binding as a `policy`.
/// Same structure as `policy`: Formalia section, page break, then body.
///
/// - title (str | content): Document subject, e.g. `"Grafisk design"` or `"Överlämning"`.
/// - summary (str | content): Description of what this document covers.
/// - purpose (str | content): Why this document exists.
/// - scope (str | content): Who or what this document applies to.
/// - history (array): Modification history. Each entry is a dict with required keys
///   `meeting`, `change`, and `who`.
/// - lang (str): `"sv"` or `"en"`. Default `"sv"`.
/// - date (datetime): Document date shown in the header. Defaults to today.
/// -> content
#let guideline(
  title: none, // required
  summary: [], // required
  purpose: [], // required
  scope: [], // required
  history: (), // required
  date: datetime.today(),
  lang: "sv",
  body,
) = rubric(
  title: title,
  summary: summary,
  purpose: purpose,
  scope: scope,
  history: history,
  date: date,
  lang: lang,
  doc-type: translate("Riktlinje", "Guideline"),
  body,
)
