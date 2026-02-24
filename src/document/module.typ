#import "@preview/datify:1.0.1": custom-date-format
#import "style.typ": *
#import "../graphics.typ": guild_logo
#import "../strings.typ": organisation_name

#let header(short_title, meeting, date) = context pad(
  bottom: header_padding,
  box(
    height: header_height,
    align(
      horizon,
      stack(
        dir: ltr,
        box(width: 18mm)[
          #guild_logo(height: header_height)
        ],
        box(width: 82mm)[
          #show: smallcaps
          #organisation_name \
          #short_title
        ],
        box(width: 60mm)[
          #set align(right)
          #meeting \
          #custom-date-format(date, pattern: "d MMMM y", lang: text.lang)
        ]
      )
    )
  )
)

#let footer() = {
  line(length: 100%)
  set align(center)
  v(-8pt)

  context {
    let current_page = counter(page).get().at(0)
    let last_page = counter(page).final().at(0)
    let location = (page: last_page, x: 0pt, y: 0pt)

    [
      #current_page
      (#link(location)[#text(fill: red, [#last_page])])
    ]
  }
}

#let doc(
  title: none,
  meeting: none,
  short_title: "",
  language: "sv",
  date: datetime.today(),
  content
) = [
  #set document(
    title: title,
    // TODO: Set the authors from the signatures.
    date: date,
  )
  #set text(lang: language)

  #show heading: set text(font: heading_font)
  #show heading: heading_style

  #show heading.where(level: 1): set text(size: heading_level_1_text_size)
  #show heading.where(level: 2): set text(size: heading_level_2_text_size)
  #show heading.where(level: 3): set text(size: heading_level_3_text_size)

  #show par: set text(font: body_font, size: body_text_size)
  #show par: body_style

  #show footnote: set text(font: footnote_font, size: footnote_text_size)
  #show footnote: footnote_style

  #show figure.caption: set text(font: caption_font, size: caption_text_size)
  #show figure.caption: caption_style

  // TODO: justify?
  #set par(spacing: paragraph_spacing)

  #set page(
    header: header(short_title, meeting, date),
    footer: footer(),
    header-ascent: 0%,
    footer-descent: 0%,
    margin: (
      x: horizontal_margin,
      top: top_margin,
      bottom: bottom_margin,
    )
  )

  // TODO: Take and set the "short title".
  // TODO: Style the title.
  // TODO: Style the headers and footers.

  #content
]

// TODO: Cover page function.
// TODO: Agenda function.
// TODO: Attachments.
// TODO: LTH symbols.
