#import "../document.typ": doc
#import "../../utils/misc.typ": old-terms, to-text, translate
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
  body
) = {
  let statutes-name = translate("Stadgar", "Statutes")

  // TODO: Expose the date parameter.
  // TODO: Should we set the meeting? Practice seems to be to set it to the meeting of last change.
  show: doc.with(
    title: [#statutes-name #translate("för", "of") #guild.dseklth],
    lang: lang,
    doc-type: statutes-name,
  )

  show terms: terms-fmt.with(columns: (3.5em, 9.5em, 1fr))

  body
}

// TODO: Should we force a cover page here?
//       The regulation have a cover page currently.
//       A: yes

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
#let regulations(lang: "sv", body) = {
  let regulations-name = translate("Reglemente", "Regulations")

  show: doc.with(
    title: [#regulations-name #translate("för", "of") #guild.dseklth],
    lang: lang,
    doc-type: regulations-name,
  )

  show list: resolutions.with(enumerate: false)
  show terms: terms-fmt.with(columns: (9.5em, 1fr))

  body
}
