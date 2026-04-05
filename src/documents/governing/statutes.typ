#import "../plain-document.typ": custom-date-format, plain-document, sans-serif, serif
#import "../../utils/misc.typ": to-text, translate
#import "../../graphics.typ": guild_logo
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../strings.typ": guild

/// #set raw(lang: "typst")
/// Creates the guild statutes (stadgar) document. Apply with `#show: stadgar.with(...)` or `#show: statutes.with(...)`.
///
/// === Notes
/// - Terms blocks (`/ Term: Description`) are formatted as a §-numbered 3-column table.
///   - The §-number reflects the current heading section (e.g. §2.3 Rättigheter inside `== Ordinarie medlemmar`).
///
/// === Example
/// ```typst
/// #show: statutes
///
/// = Sektionen
///
/// / Namn:
///   Sektionens namn är D-sektionen.
///
/// / Ändamål:
///   Föreningens ändamål och syfte är att diskutera Policy för val.
/// ```
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
