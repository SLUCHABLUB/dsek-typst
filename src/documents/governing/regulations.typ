#import "@preview/datify:1.0.1": custom-date-format
#import "../plain.typ": plain-document, sans-serif, serif
#import "../../graphics.typ": guild_logo
#import "../../utils/misc.typ": to-text, translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../strings.typ": guild

/// Creates the guild regulations (reglemente) document. Apply with `#show: regulations`.
///
/// - Terms blocks (`/ Term: Description`) are formatted as a 2-column table (term, description)
///   without §-numbers (the heading structure provides the section context instead).
/// - Lists where every item starts with `att` are formatted as un-enumerated operative clauses.
/// - Otherwise identical structure to `statutes`.
///
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - body (content): The body of the document.
///
/// -> content
#let regulations(
  lang: "sv",
  date: datetime.today(),
  body,
) = {
  let regulations-name = translate("Reglemente", "Regulations")

  show: plain-document.with(
    title: [#regulations-name #translate("för", "of") #guild.dseklth],
    lang: lang,
    date: date,
    doc-type: regulations-name,
    use-cover-page: true,
  )

  show list: resolutions.with(enumerate: false)
  show terms: terms-fmt.with(columns: (9.5em, 1fr))

  body
}
