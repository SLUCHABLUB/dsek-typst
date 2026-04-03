#import "misc.typ": enhanced_ref, to-text, translate

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
/// - enumerate (bool, auto): Whether to number each clause.
///                           `auto` enumerates when there are more than 3 items.
/// - term (str, auto): The resolution keyword.
///                     `auto` detects it from document language (`"att"` for Swedish, `"to"` for English).
///
/// -> content
#let resolutions(enumerate: auto, term: auto, unstyled) = context {
  // Copy the parameters into the context.
  let enumerate = enumerate
  let term = term

  // TODO: Elaborate?
  // TODO: wrap in a figure to make references in feature parity with LaTeX

  if term == auto {
    term = translate("att", "to")
  }

  let elements = unstyled.children.filter(e => e != [ ])

  if enumerate == auto {
    enumerate = elements.len() > 3
  }

  if elements.any(e => not to-text(e).starts-with(term + " ")) { return unstyled }

  let fmt(x) = to-text(x).replace(count: 1, regex(term + " ?"), "")

  let clause_counter = counter("resolutions")
  clause_counter.update(0)

  list(
    tight: false,
    marker: {
      clause_counter.step()

      let number = if enumerate {
        align(center, text(fill: gray, size: 0.8em, clause_counter.display()))
      }

      box(width: 1em, number)
      strong(term)
    },
    ..elements.map(element => {
      // If there is any formatting (bold, italic, etc), "flatten" only the text until that point so the formatting is kept.
      if element.body.has("children") {
        // TODO: Why set this here? Emulating 2 levels of indentation?
        set list(marker: ([–], [•], [‣]))

        // Descriptions are made by creating a numbered numbered sublist.
        show enum: sublist => {
          set text(style: "italic")
          set list(marker: none)
          parbreak()
          sublist.children.map(child => list.item(child.body)).join(parbreak())
          parbreak()
        }

        let children = element.body.children

        // Edge case if someone starts formatting something immediately after the term.
        let from = if children.first() == [#term] { 2 } else { 1 }

        fmt(children.first()) + children.slice(from, children.len()).join()
      } else {
        fmt(element)
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
- och helt vanlig formatering

och sedan yrkar vi på

- att ändra formateringen
- att bold:a varje inledande "att"

Vi kan även se

- att vi kan lägga till beskrivningar
  + Beskrivningar ger en möjligheten att ge en utförligare förklaring eller förtydligande
- att satserna numreras om det är 4 eller fler totalt
  + detta sker automatiskt, men man kan även ställa in att det alltid eller aldrig ska ske
- att numreringen börjar om vid en ny lista
- att `formattering` behålls

#set text(lang: "en")

Now we'll switch to English and move

- to show that it can work automatically based on language
- to combine the 2 different variants

#set text(lang: "sv")

och till sist återgår vi till

- en
- helt
- vanlig
- lista

// TODO:
där återstår:

- _att hantera fullständigt formaterade satser_
  + Troligtvis genom att hantera att `element.body.has("body")`
