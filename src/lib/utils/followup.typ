#import "../misc/assertions.typ": required-keys

#let followup(decisions) = {
  required-keys(decisions, ("taken", "decision", "responsible", "reported"), "followup")
  table(
    stroke: none,
    columns: 4,

  )
}

#let uppföljningslista = followup
