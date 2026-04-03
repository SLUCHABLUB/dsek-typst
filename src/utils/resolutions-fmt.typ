#import "misc.typ": enhanced_ref, to-text

/// Formats a bullet list as operative clauses ("att"-lista / "to"-list).
///
/// Applied automatically to all lists inside `doc()` via `show list: resolutions`,
/// so it rarely needs to be called directly. A list is only reformatted when
/// *every* item begins with the resolution term; otherwise the list is rendered
/// unchanged, so regular bullet lists are unaffected.
///
/// Sub-items (created with a nested numbered list `+`) are rendered in italics
/// as an elaboration of the clause above them.
///
/// - enumerate (bool | auto): Number each clause. `auto` enumerates when there
///   are more than 3 items.
/// - term (str | auto): Resolution keyword. `auto` detects from document language:
///   `"att"` for Swedish, `"to"` for English. Panics for other languages if left `auto`.
/// -> content
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
        // descriptions are made by creating a numbered numbered sublist
        set list(marker: ([–], [•], [‣]))
        show enum: it => {
          set text(style: "italic")
          set list(marker: none)
          parbreak()
          it.children.map(x => list.item(x.body)).join(parbreak())
          parbreak()
        }
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
