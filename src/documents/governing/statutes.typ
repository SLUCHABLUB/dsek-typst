#import "../plain-document.typ": custom-date-format, plain-document, sans-serif, serif
#import "../../utils/misc.typ": to-text, translate
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

  // TODO: Should we set the meeting? Practice seems to be to set it to the meeting of last change.
  // Probably yes, but then ideally we'd need a way to also automatically get the last meeting
  // For other governing documents that's easy since an array of history entries is already required
  // But doing it for Regulations feels very tedious unless we also introduce the history array here
  show: plain-document.with(
    title: [#statutes-name #translate("för", "of") #guild.dseklth],
    lang: lang,
    date: date,
    doc-type: statutes-name,
    use-cover-page: true,
  )

  show terms: terms-fmt.with(columns: (3.5em, 9.5em, 1fr))

  body
}
