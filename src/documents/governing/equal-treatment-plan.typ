#import "../plain-document.typ": plain-document
#import "../../lib/_mod.typ": *

#let equal-treatment-plan(
  committee: none,
  background: none,
  vision: none,
  meeting: none,
  goals: (),
  date: datetime.today(),
  lang: "sv",
  body,
) = {
  let etp = "equal-treatment-plan"
  required(committee, "committee", fn: etp)
  required(background, "background", fn: etp)
  required(vision, "vision", fn: etp)
  required(meeting, "meeting", fn: etp)
  required(goals, "goals", fn: etp)
  for goal in goals {
    required-keys(
      goal,
      ("title", "description", "measures"),
      fn: etp + " (goal entry)",
      allowed: ("title", "description", "measures"),
    )
  }

  let etp-name = translate("Likabehandlingsplan", "Equal Treatment Plan")

  show: plain-document.with(
    title: [#etp-name #committee],
    doc-type: etp-name,
    meeting: meeting,
    date: date,
    lang: lang,
  )

  context [
    = #translate-str("Bakgrund", "Background")
    #background
  ]

  context [
    = Vision
    #vision
  ]

  context [
    = #translate-str("Mål och arbetssätt", "Goals and measures")
    #show terms: terms-fmt.with(columns: (9em, 1fr))
    #for goal in goals [
      == #goal.title
      // / #translate("Beskrivning", "Description"):
      #goal.description
      / #translate("Genomförande", "Measures"): #goal.measures
    ]
  ]

  set heading(offset: 1)

  body
}
