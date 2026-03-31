#import "@preview/datify:1.0.1": custom-date-format
#import "../graphics.typ": guild_logo
#import "../strings.typ": guild
#import "../utils/resolutions-fmt.typ": resolutions
#import "../utils/misc.typ": enhanced_ref

//   ▄▄▄▄ ▄▄▄▄▄▄ ▄▄ ▄▄ ▄▄    ▄▄ ▄▄  ▄▄  ▄▄▄▄
//  ███▄▄   ██   ▀███▀ ██    ██ ███▄██ ██ ▄▄
//  ▄▄██▀   ██     █   ██▄▄▄ ██ ██ ▀██ ▀███▀

#let serif = "Domitian"
#let sans_serif = "TeX Gyre Heros"

// These are copied from the LaTeX templates.
// #let paragraph_spacing = 3mm
// #let paragraph_leading = 0.55em

#let page_content_width = 160mm
#let page_content_height = 230mm

#let a4_width = 21cm
#let a4_height = calc.sqrt(2) * a4_width

#let header_height = 16mm
#let header_padding = 15mm

#let horizontal_margin = (a4_width - page_content_width) / 2

// TODO: Investigate how this works in the current LaTeX templates.
#let top_margin_excluding_header = 15mm
// In typst, headers are put in the margin.
#let top_margin = top_margin_excluding_header + header_height + header_padding
#let bottom_margin = a4_height - top_margin - page_content_height

//  ▄▄ ▄▄ ▄▄▄▄▄ ▄▄    ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ▄▄▄▄
//  ██▄██ ██▄▄  ██    ██▄█▀ ██▄▄  ██▄█▄ ███▄▄
//  ██ ██ ██▄▄▄ ██▄▄▄ ██    ██▄▄▄ ██ ██ ▄▄██▀

#let header(doc-type, meeting, date) = context pad(
  bottom: header_padding,
  box(height: header_height)[
    #set align(horizon)
    #set text(size: 10pt)
    #stack(
      dir: ltr,
      box(width: 18mm)[
        #guild_logo(height: header_height)
      ],
      box(width: 82mm)[
        #show: smallcaps
        #text(size: 11pt, guild.dseklth) \
        #doc-type
      ],
      box(width: 60mm)[
        #set align(right)
        #meeting \
        // #custom-date-format(date, pattern: "d MMMM y", lang: text.lang)
        #if type(date) == int { date } else {
          custom-date-format(date, pattern: "long", lang: text.lang)
        }
      ],
    )
  ],
)

#let footer() = context {
  set align(center)
  set text(number-type: "lining")

  let current_page = counter(page).get().at(0)
  let last = counter(page).final().at(0)
  let last_page = link(
    (page: last, x: 0mm, y: 0mm),
    text(fill: red, str(last)),
  )

  v(2em)
  line(length: 100%, stroke: 0.4pt)
  v(-1em)
  [#current_page (#last_page)]
}

#let document_title = title

//  ▄▄▄▄▄▄ ▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄  ▄▄     ▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄
//    ██   ██▄▄  ██▀▄▀██ ██▄█▀ ██    ██▀██  ██   ██▄▄
//    ██   ██▄▄▄ ██   ██ ██    ██▄▄▄ ██▀██  ██   ██▄▄▄

#let doc(
  title: none,
  meeting: none,
  doc-type: "",
  lang: "sv",
  date: datetime.today(),
  content,
) = context {
  set document(
    title: title,
    // TODO: Set the authors from the signatures.
    date: date,
  )

  show document_title: set text(
    font: sans_serif,
    weight: "bold",
    size: 15pt,
    number-type: "lining",
  )

  // TODO: Investigate spacing between numbering and heading text as well as heading text and paragraph.
  show heading: set text(font: sans_serif, weight: "bold", number-type: "lining")

  set heading(numbering: "1.1  ")
  show heading.where(level: 1): set text(size: 14pt)
  show heading.where(level: 2): set text(size: 12pt)
  show heading.where(level: 3): set text(size: 11pt)

  // somewhere between old and new spacing, guesstimated
  show heading: set block(above: 2em, below: 1em)

  show footnote: set text(font: serif, size: 9pt)

  show figure.caption: set text(font: serif, size: 9pt, style: "italic")

  show link: set text(rgb("#EA028C"))

  set quote(block: true, quotes: true)
  show quote: set par(justify: false)

  show list: resolutions
  show ref: enhanced_ref

  // TODO: Pick and set a monospace font for code-esque excerpts.
  set text(lang: lang, font: serif, size: 11pt, number-type: "old-style")

  set par(
    spacing: 1.2em,
    leading: 0.55em,
    justify: true,
  )

  set page(
    header: header(doc-type, meeting, date),
    footer: footer(),
    header-ascent: 0%,
    footer-descent: 0%,
    margin: (x: horizontal_margin, top: top_margin, bottom: bottom_margin),
  )

  set list(spacing: par.spacing)

  document_title()
  v(1em)
  content
}

// TODO: Add a cover page function.
// TODO: Add a way to add attachments.
// TODO: Fix colours (råsa links, footnotes).
