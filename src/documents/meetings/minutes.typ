#import "../document.typ": doc
#import "../../utils/misc.typ": translate
#import "../../utils/minutes-fmt.typ": minutes-fmt
#import "../../utils/resolutions.typ": resolutions
#import "../../utils/attendance.typ": attendance
#import "../../utils/signature.typ": signature
#import "../../strings.typ"

#let minutes(
  meeting: none,
  meeting_type: none,
  language: "sv",
  date: datetime.today(),
  attendees: (),
  chair: none,
  secretary: none,
  reviewers: (),
  attested: false,
  it,
) = context {
  let watermark = if not attested {
    set align(center + horizon)
    show rotate: set block(width: 150%)
    rotate(-45deg, text(
      size: 100pt,
      fill: luma(95%),
      weight: "bold",
      translate("OJUSTERAT", "UNATTESTED"),
    ))
  }

  set page(background: watermark)

  let reviewers = if type(reviewers) == array { reviewers } else { (reviewers,) }
  let protocol_name = translate("Protokoll", "Meeting minutes")

  show: doc.with(
    title: [
      #protocol_name
      #translate("för", "for")
      #meeting_type
      #{
        if meeting not in (none, "") { meeting } else {
          translate("[möte saknas]", "[meeting name missing]")
        }
      }
      ,
      #date.display()
    ],
    short_title: protocol_name,
    meeting: meeting,
    language: language,
    date: date,
  )

  show terms: minutes-fmt

  attendance(..attendees)
  v(2em)
  it
  v(1em)

  table(
    stroke: none,
    columns: 4,
    row-gutter: 2em,
    signature(
      translate("Vid protokollet", "Recorded by"),
      secretary,
      translate("Mötessekreterare", "Meeting secretary"),
    ),
    signature(
      translate("Vid mötet", "Presided by"),
      chair,
      translate("Mötesordförande", "Meeting chair"),
    ),
    ..reviewers.map(reviewer => context {
      signature(
        translate("Justeras", "Attested by"),
        reviewer,
        translate("Justerare", "Minute reviewer"),
      )
    }),
  )
}

