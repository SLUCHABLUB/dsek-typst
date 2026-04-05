#import "@preview/datify:1.0.1": custom-date-format
#import "../graphics.typ": guild_logo
#import "../strings.typ": guild
#import "../utils/resolutions-fmt.typ": resolutions
#import "../utils/misc.typ": enhanced-ref, translate

//   ▄▄▄▄ ▄▄▄▄▄▄ ▄▄ ▄▄ ▄▄    ▄▄ ▄▄  ▄▄  ▄▄▄▄
//  ███▄▄   ██   ▀███▀ ██    ██ ███▄██ ██ ▄▄
//  ▄▄██▀   ██     █   ██▄▄▄ ██ ██ ▀██ ▀███▀

#let serif = "Domitian"
#let sans-serif = "TeX Gyre Heros"

#let page-content-width = 160mm
#let page-content-height = 230mm

#let a4-width = 21cm
#let a4-height = calc.sqrt(2) * a4-width

#let header-height = 16mm
#let header-padding = 15mm

#let horizontal-margin = (a4-width - page-content-width) / 2

// TODO: Investigate how this works in the current LaTeX templates.
#let top-margin-excluding-header = 15mm
// In typst, headers are put in the margin.
#let top-margin = top-margin-excluding-header + header-height + header-padding
#let bottom-margin = a4-height - top-margin - page-content-height

//  ▄▄ ▄▄ ▄▄▄▄▄ ▄▄    ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄   ▄▄▄▄
//  ██▄██ ██▄▄  ██    ██▄█▀ ██▄▄  ██▄█▄ ███▄▄
//  ██ ██ ██▄▄▄ ██▄▄▄ ██    ██▄▄▄ ██ ██ ▄▄██▀

#let header(doc-type, meeting, date) = context pad(
  bottom: header-padding,
  box(height: header-height)[
    #set align(horizon)
    #set text(size: 10pt)
    #stack(
      dir: ltr,
      box(width: 18mm)[
        #guild_logo(height: header-height)
      ],
      box(width: 82mm)[
        #show: smallcaps
        #text(size: 11pt, guild.dseklth) \
        #doc-type
      ],
      box(width: 60mm)[
        #set align(right)
        #meeting \
        #custom-date-format(date, pattern: "long", lang: text.lang)
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


/// Creates a cover page.
///
/// - title (content): The title of the document.
/// - date (datetime): The date at which the document was written.
///
/// -> content
#let cover-page(title, date) = page[
  // might as well make it fancy, yknow
  #place(top + left)[
    #guild_logo(height: 10em, colour: true)
  ]
  #place(horizon, dy: -15em)[
    #set text(weight: "bold", font: "TeX Gyre Heros", number-type: "lining")
    #text(size: 2em, title) \

    #text(size: 1.5em, guild.dseklth)
  ]
  #place(dy: -2em, bottom, text(size: 13pt, weight: "bold", font: serif)[
    #translate("Organisationsnummer", "Company registration number"): 845003-2878
  ])
  #place(bottom, text(size: 13pt, font: serif)[
    #context custom-date-format(date, pattern: "long", lang: text.lang)
  ])
]

/// An alias to the builtin `title` function to not be shadowed by the parameter in @@doc().
#let _title = title

//  ▄▄▄▄▄▄ ▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄  ▄▄     ▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄
//    ██   ██▄▄  ██▀▄▀██ ██▄█▀ ██    ██▀██  ██   ██▄▄
//    ██   ██▄▄▄ ██   ██ ██    ██▄▄▄ ██▀██  ██   ██▄▄▄

/// Base document wrapper that applies the guild document styling.
///
/// All document-type functions in this library apply `doc` internally.
/// Use this directly (via `plain-document` in `lib.typ`) only when no
/// specialised document type fits.
///
/// Sets up page geometry, header/footer, fonts (Domitian serif body, TeX Gyre
/// Heros sans-serif headings), heading numbering, link colours, and the
/// resolution list formatter. Renders `title` as a styled document title above
/// the content.
///
/// - title (str, content): The title of the document.
/// - meeting (str, content): The meeting for which the document was written, e.g. `"HTM1"`.
/// - doc-type (str): Document "type" label, shown in the page header.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - use-cover-page (boolean): Whether to display the document title on a separate cover page instead of as a non-numbered heading
/// - body (content): The body of the document.
///
/// -> content
#let plain-document(
  title: none,
  meeting: none,
  doc-type: "",
  lang: "sv",
  date: datetime.today(),
  use-cover-page: false,
  body,
) = context {
  set document(
    title: title,
    date: date,
  )

  show _title: set text(
    font: sans-serif,
    weight: "bold",
    size: 15pt,
    number-type: "lining",
  )

  // TODO: Investigate spacing between numbering and heading text as well as heading text and paragraph.
  show heading: set text(font: sans-serif, weight: "bold", number-type: "lining")

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
  show ref: enhanced-ref

  // TODO: Pick and set a monospace font for code-esque excerpts.
  set text(lang: lang, font: serif, size: 11pt, number-type: "old-style")

  set par(
    spacing: 1.2em,
    leading: 0.55em,
    justify: true,
  )

  if use-cover-page {
    cover-page(title, date)
  }

  set page(
    header: header(doc-type, meeting, date),
    footer: footer(),
    header-ascent: 0%,
    footer-descent: 0%,
    margin: (x: horizontal-margin, top: top-margin, bottom: bottom-margin),
  )

  set list(spacing: par.spacing)

  if not use-cover-page {
    _title()
    v(1em)
  }
  body
}

// TODO: Add a way to add attachments. (Maybe stale now due to agenda-fmt)
