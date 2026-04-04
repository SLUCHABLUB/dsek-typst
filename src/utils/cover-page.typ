#import "../strings.typ": guild
#import "../utils/misc.typ": translate
#import "../graphics.typ": guild_logo
#import "../documents/plain.typ": sans-serif, serif
#import "@preview/datify:1.0.1": custom-date-format

// might as well make it fancy, yknow

/// Creates a cover page. Used for Statutes and Regulations.
///
/// - subject (content): The subject of the document.
/// - lang (str): The language of the page (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// -> content
#let cover-page(subject, lang, date) = page[
  #set text(lang: lang)
  #set page()
  #place(top + left)[
    #guild_logo(height: 50mm, colour: true)
  ]
  #place(horizon, dy: -12em)[
    #set text(weight: "bold", font: "TeX Gyre Heros")
    #text(size: 35pt, subject) \

    #text(size: 25pt, guild.dseklth)
  ]
  #place(dy: -2em, bottom, text(size: 13pt, weight: "bold", font: serif)[
    #translate("Organisationsnummer", "Company registration number"): 845003-2878
  ])
  #place(bottom, text(size: 13pt, font: serif)[
    #custom-date-format(date, pattern: "long", lang: lang)
  ])
]
