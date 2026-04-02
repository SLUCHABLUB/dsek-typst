#import "../document.typ": doc
#import "../../utils/misc.typ": labelize, old-terms, ref-id, to-text, translate
#import "../../utils/minutes-fmt.typ": minutes-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../utils/signature.typ": signature
#import "../../strings.typ"
#import "@preview/datify:1.0.1": custom-date-format

#let attendance(..names) = {
  grid(
    columns: 3,
    row-gutter: 0.55em,
    column-gutter: 1em,
    stroke: none,
    ..names
      .pos()
      .enumerate()
      .map(xi => {
        let (i, name-pos) = xi
        let (name, position) = if type(name-pos) == array {
          if name-pos.len() > 2 {
            panic("Expected 2 arguments, got " + str(name-pos.len()))
          }
          name-pos
        } else {
          (name-pos, none)
        }

        (
          if i == 0 [*#translate("Närvaro", "Attendance"):*],
          context [
            // q) why headings?
            // a) you can pass along hidden data with supplement
            // meaning you can access mandates directly from the reference :)
            // also you can make it behave exactly like text
            #show heading: set text(font: text.font, weight: text.weight, size: text.size)
            #set heading(depth: ref-id.person, numbering: none, outlined: false)
            #heading(name, supplement: position) #label(labelize(name))
          ],
          position,
        )
      })
      .flatten()
  )
}

#let minutes(
  meeting: none, // required
  attendees: (), // required
  chair: none, // required
  secretary: none, // required
  reviewers: (),
  meeting-type: none,
  attested: false,
  lang: "sv",
  date: datetime.today(),
  body,
) = context {
  if meeting == none { panic("Please provide a meeting name (key: `meeting`)") }
  if attendees == () or type(attendees) != array { panic("Please provide a list of attendees (key: `attendees`)") }
  if chair == none or secretary == none {
    panic("Please provide a meeting chair and secretary (keys: `chair`, `secretary`)")
  }

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
  let minutes-name = translate("Protokoll", "Meeting minutes")
  let meeting-time = custom-date-format(date, pattern: "long", lang: lang)

  show terms: minutes-fmt
  show: doc.with(
    title: [#minutes-name #translate("för", "of") #meeting-type #meeting, #meeting-time],
    doc-type: minutes-name,
    meeting: meeting,
    lang: lang,
    date: date,
  )

  set document(title: [#minutes-name #meeting], author: to-text(secretary))

  attendance(..attendees)
  v(2em)
  body
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
