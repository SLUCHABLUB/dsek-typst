#import "misc.typ": enhanced_ref, latinize, translate

// TODO: style correctly
// TODO: better error handling for args
#let attendance(..names) = {
  grid(
    columns: 3,
    row-gutter: 0.55em,
    column-gutter: 1em,
    stroke: none,
    ..names.pos().enumerate().map(xi => {
      let (i, name-pos) = xi
      let (name, position) = if type(name-pos) == array { 
        if name-pos.len() > 2 { 
          panic("Expected 2 arguments, got " + str(name-pos.len())) 
        }
        name-pos 
      } else { 
        (name-pos, none)
      }
      
      let lbl = latinize(lower(name.split(regex("[-`'´\s]")).join("")))
      
      (
        if i == 0 [*#translate("Närvaro", "Attendance"):*],
        context [
          // q) why headings?
          // a) you can pass along hidden data with supplement
          // MEANING you can access mandates directly from the reference :)
          // also you can make it behave exactly like text
          #show heading: set text(font: text.font, weight: text.weight, size: text.size)
          #set heading(depth: 99, numbering: none, outlined: false)
          #heading(name, supplement: position) #label(lbl)
        ],
        position
      )
    }).flatten()
  )
}


#show ref: enhanced_ref

// --- Example ---

#set text(font: "Domitian", lang: "en")
#set heading(numbering: "1.1")

= hej

#attendance(
  ("Dag Hemberg", "Revisor"),
  "Daniel Adu-Gyan",
  "Nelli Skogman",
  "Fróði Karlsson",
)

#v(20pt)

@frodikarlsson yrkade på att @daghemberg skulle sluta prokrastinera >:(

== tjenare