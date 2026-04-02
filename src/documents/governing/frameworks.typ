#import "../document.typ": doc
#import "../../utils/misc.typ": old-terms, to-text, translate
#import "../../utils/terms-fmt.typ": terms-fmt
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../strings.typ": guild

#let statutes(lang: "sv", body) = {
  let statutes-name = translate("Stadgar", "Statutes")

  show: doc.with(
    title: [#statutes-name #translate("för", "of") #guild.dseklth],
    lang: lang,
    doc-type: statutes-name,
  )

  show terms: terms-fmt.with(columns: (3.5em, 9.5em, 1fr))

  body
}

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
