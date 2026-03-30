#import "../document.typ": doc
#import "../../utils/misc.typ": old-terms, to-text, translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../strings.typ": guild

#let statutes(lang: "sv", it) = {
  let statutes-name = translate("Stadgar", "Statutes")
  let conj = translate("för", "of")

  show: doc.with(
    title: [#statutes-name #conj #guild.dseklth],
    lang: lang,
    doc-type: statutes-name,
  )

  show terms: terms-fmt.with(columns: (3.5em, 9.5em, 1fr))

  it
}

#let regulations(lang: "sv", it) = {
  let regulations-name = translate("Reglemente", "Regulations")
  let conj = translate("för", "of")

  show: doc.with(
    title: [#regulations-name #conj #guild.dseklth],
    lang: lang,
    doc-type: regulations-name,
  )

  show list: resolutions.with(enumerate: false)
  show terms: terms-fmt.with(columns: (9.5em, 1fr))

  it
}
