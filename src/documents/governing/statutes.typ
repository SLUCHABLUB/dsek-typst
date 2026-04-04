#import "../document.typ": custom-date-format, doc, sans-serif, serif
#import "../../utils/misc.typ": to-text, translate
#import "../../utils/cover-page.typ": cover-page
#import "../../graphics.typ": guild_logo
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../strings.typ": guild

/// Creates the guild statutes (stadgar) document. Apply with `#show: statutes.with(...)`.
///
/// - Terms blocks (`/ Term: Description`) are formatted as a §-numbered 3-column table.
///   The §-number reflects the current heading section (e.g. §2.3 inside `== 2 Organ`).
/// - Nested terms in a description cell use `old-terms` style (bold term, hanging indent).
/// - Standard heading numbering (`= 1`, `== 1.1`) creates the section structure.
///
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - body (content): The body of the document.
///
/// -> content
#let statutes(
  lang: "sv",
  date: datetime.today(),
  body,
) = {
  let statutes-name = translate("Stadgar", "Statutes")

  cover-page(statutes-name, lang, date)

  // TODO: Should we set the meeting? Practice seems to be to set it to the meeting of last change.
  show: doc.with(
    title: [#statutes-name #translate("för", "of") #guild.dseklth],
    lang: lang,
    date: date,
    doc-type: statutes-name,
  )

  show terms: terms-fmt.with(columns: (3.5em, 9.5em, 1fr))

  body
}
