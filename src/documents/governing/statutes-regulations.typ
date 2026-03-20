#import "../document.typ": doc
#import "../../utils/misc.typ": old-terms, to-text, translate
#import "../../utils/resolutions-fmt.typ": resolutions
#import "../../strings.typ": guild

#let terms-fmt(space: (2.5em, 9.5em, 1fr), ts) = table(
  columns: space,
  row-gutter: 0.6em,
  stroke: none,
  ..ts
    .children
    .enumerate(start: 1)
    .map(x => {
      let (n, item) = x
      let prev-heading = {
        let h = counter(heading).get().map(str).join(".")
        if h != "0" [#h.]
      }

      let num = ([§#prev-heading#n],)
      let rest = (
        [
          #set par(justify: false)
          #item.term
        ],
        [
          #show terms: old-terms
          #item.description
        ],
      )
      if space.len() == 3 { num + rest } else { rest }
    })
    .flatten()
)

#let statutes(
  lang: "sv",
  it,
) = {
  let statutes-name = translate("Stadgar", "Statutes")
  let of = translate("för", "of")

  show: doc.with(
    title: [#statutes-name #of #guild.dseklth],
    lang: lang,
    short-title: statutes-name,
  )

  show terms: terms-fmt.with(space: (3.5em, 9.5em, 1fr))

  it
}

#let regulations(
  lang: "sv",
  it,
) = {
  let regulations-name = translate("Reglemente", "Regulations")
  let of = translate("för", "of")

  show: doc.with(
    title: [#regulations-name #of #guild.dseklth],
    lang: lang,
    short-title: regulations-name,
  )

  show list: resolutions.with(enumerate: false)
  show terms: terms-fmt.with(space: (9.5em, 1fr))

  it
}
