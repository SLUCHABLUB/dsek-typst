#import "../plain.typ": plain-document
#import "../../utils/misc.typ": to-label, ref-id, to-text, translate
#import "../../utils/assert.typ": required
#import "../../utils/minutes-fmt.typ": minutes-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../utils/signature.typ": signature
#import "../../utils/terms-fmt.typ": old-terms
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
            panic(
              "attendance: attendee entry has "
                + str(name-pos.len())
                + " elements, expected at most 2\n  hint: each entry is (name, position) or just a name, e.g. (\"Truls Teknolog\", \"Kårkontakt\") or just \"Truls Teknolog\"",
            )
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
            #heading(name, supplement: position) #label(to-label(name))
          ],
          position,
        )
      })
      .flatten()
  )
}

/// Creates a meeting minutes (protokoll) document. Apply with `#show: minutes.with(...)`.
///
/// - The body uses `/` term syntax where each term is an agenda item title and the
///   description is the item text. Inside an item, term items are formatted normally.
/// - Items are automatically numbered as §1, §2, … and can be cross-referenced with
///   `@item` (resolves to "§N") or `@item[]` (resolves to "§N Item").
/// - Attendees are auto-labelled so they can be referenced with `@name` or `@name[]`
///   (to include position) anywhere in the document.
///
/// === Example:
/// ```typst
/// #show: minutes.with(
///   meeting: "S06",
///   attendance: (
///     ("Truls Teknolog", styr.ordf),
///     ("Trula Teknolog", infu.mastare),
///     "Pelle Postlös", // name only, no position
///   ),
///   chair: [@trulsteknolog],
///   secretary: [@trulateknolog],
///   reviewers: ([@pellepostlös],),
/// )
///
/// / OFMÖ:
///   @trulsteknolog[] förklarade mötet öppnat 12:15. // Ordförande Truls Teknolog förklarade...
///
/// / Tid och sätt:
///   Tid och sätt godkändes.
///
/// / Val av justerare:
///   Mötet beslöt
///   - att välja @pellepostlös till justerare // *att* välja Pelle Postlös till...
///
/// / Information från kollegierna:
///   / InfoK: Ingen ny information. // normal terms
///
/// / Veckans roliga punkt:
///   @trulateknolog drog en ordvits.
///
/// / Uppföljning\: Veckans roliga punkt:
///   @pellepostlös yrkade på
///   - att stryka @veckans-roliga-punkt från protokollet
///   Mötet avslog yrkandet.
/// ```
///
/// - meeting (content): The meeting for which the document was written, e.g. `"HTM1"`.
/// - attendees (array): Attendee list. Each entry is a `name` string/content,
///   or a 2-element `(name, position)` array. Positions can be entered manually or taken
///   from the `strings` module.
/// - chair (str | content): Meeting chair, shown in the signature block.
/// - secretary (str | content): Meeting secretary, shown in the signature block.
/// - reviewers (array): Optional minute reviewers, shown in the signature block.
/// - meeting-type (content): The type of the meeting, e.g. `"Styrelsemöte"` or `"Sektionsmöte"`.
/// - attested (bool): Shows "OJUSTERAT"/"UNATTESTED" watermark when `false`. Default `false`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let minutes(
  meeting: none,
  attendees: (),
  chair: none,
  secretary: none,
  reviewers: (),
  meeting-type: none,
  attested: false,
  lang: "sv",
  date: datetime.today(),
  body,
) = context {
  required(meeting, "meeting", fn: "minutes", hint: "short meeting identifier, e.g. meeting: \"HTM1\"")
  required(
    attendees,
    "attendees",
    fn: "minutes",
    hint: "array of (name, position) pairs, e.g. ((\"Truls Teknolog\", \"Kårkontakt\"),)",
  )
  if type(attendees) != array {
    panic(
      "minutes: `attendees` must be an array, not "
        + type(attendees)
        + "\n  hint: each entry is (name, position) or just a name, e.g. (\"Truls Teknolog\", \"Kårkontakt\") or just \"Truls Teknolog\"",
    )
  }
  required(chair, "chair", fn: "minutes")
  required(secretary, "secretary", fn: "minutes")

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
  show: plain-document.with(
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
