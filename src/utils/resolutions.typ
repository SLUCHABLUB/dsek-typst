#import "misc.typ": enhanced_ref, to-text

// a possibly more typsty way of doing resolutions
// start all list items with `att` (or a word of your choice) and it ✨automatically✨ displays a formatted list
// also show rule-compatible!

#let resolutions(enumerate: auto, term: auto, it) = context {
  // TODO: wrap in a figure to make references in feature parity with LaTeX

  // language detection
  let term = if term == auto {
    if text.lang == "sv" {
      "att"
    } else if text.lang == "en" {
      "to"
    } else {
      panic(
        "language `"
          + text.lang
          + "` is not supported automatically for resolutions, set term manually using `term: \"...\"`",
      )
    }
  } else { term }

  let elems = it.children.filter(e => e != [ ])
  let enumerate = if enumerate == auto { elems.len() > 3 } else { enumerate }
  if elems.any(e => not to-text(e).starts-with(term + " ")) { return it }

  let fmt(x) = to-text(x).replace(count: 1, regex(term + " ?"), "")

  let res = counter("resolutions")
  res.update(0)

  // TODO: add spacing above last paragraph above resolutions automatically
  list(
    tight: false,
    marker: {
      res.step()

      let number = if enumerate {
        context align(center, text(fill: gray, size: 0.8em, res.display()))
      }

      box(width: 1em, number)
      strong(term)
    },
    ..elems.map(e => {
      // if there is any formatting (bold, italic, etc), "flatten" only the text until that point so the formatting is kept
      if e.body.has("children") {
        // descriptions are made by creating a sublist
        show list: set text(style: "italic")
        set list(marker: none, spacing: par.spacing)

        let cn = e.body.children

        // edge case if someone starts formatting something immediately after the term
        let from = if cn.first() == [#term] { 2 } else { 1 }

        fmt(cn.first()) + cn.slice(from, cn.len()).join()
      } else {
        fmt(e)
      }
    }),
  )
}

// --- Example ---

#set text(font: "Domitian", number-type: "old-style", lang: "sv")

#show list: resolutions

Här har vi

- en helt vanlig lista
- med helt vanliga punkter
- och helt vanlig formattering

och sedan yrkar vi på

- att ändra formatteringen
- att bolda varje inledande "att"

Vi kan även se

- att vi kan lägga till beskrivningar
  - Beskrivningar ger en möjligheten att ge en utförligare förklaring eller förtydligande
- att satserna numreras om det är 4 eller fler totalt
  - detta sker automatiskt, men man kan även ställa in att det alltid eller aldirg ska ske
- att numreringen börjar om vid en ny lista
- att `formattering` behålls

#set text(lang: "en")

Now we'll switch to English and move

- to show that it can work automatically based on language
- to combine the 2 different variants

// Y hasta en español podemos mostrar

// #att-lista(term: "que", enumerate: true)[
//   - que puedes elegir tu propio palabra para "att"
//   - que también se puede invocar como una función convencional,
//   - que se puede especificar si se desea numerar la lista completa o no.
// ]

och till sist återgår vi till

- en
- helt
- vanlig
- lista
