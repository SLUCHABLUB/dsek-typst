#import "../document.typ": doc
#import "statutes-regulations.typ": terms-fmt
#import "../../utils/misc.typ": translate

// since these generally arent edited/written as often i think its
// fine--or even good--for them to be more function-heavy, rather
// than everything just working through magic syntax. this way it
// forces a more correct way of doing things rather than relying on
// freehand typing to be consistent

#let gov-doc(
  title: none,
  date: datetime.today(),
  lang: "sv",
  doctype: "",
  summary: [],
  purpose: [],
  scope: [],
  history: (),
  it,
) = {
  let poss = translate("för", "for")

  show: doc.with(
    title: [#doctype #poss #title],
    short-title: doctype,
    meeting: history.map(x => x.meeting).last(),
    lang: lang,
  )

  [= Formalia]

  [
    // new style?
    #show terms: terms-fmt.with(space: (9.5em, 1fr))
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

#let policy = gov-doc.with(doctype: "Policy")
#let guideline = gov-doc.with(
  doctype: translate(
    "Riktlinje",
    "Guideline",
  ),
)
