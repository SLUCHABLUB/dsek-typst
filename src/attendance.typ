// TODO: style correctly
// TODO: better error handling for args
#let attendance(..names) = {
  [*Närvaro*]
  parbreak()
  names.pos().map(name => {
    let position = none
    if type(name) == array {
      position = name.at(1)
      name = name.at(0)
    }

    let chars = (
     ("á", "a"), 
     ("à", "a"), 
     ("ó", "o"), 
     ("ò", "o"), 
     ("ú", "u"),
     ("ù", "u"),
     ("ü", "u"),
     ("é", "e"), 
     ("è", "e"), 
     ("ë", "e"),
     ("í", "i"), 
     ("ì", "i"), 
     ("ý", "y"),
     ("ỳ", "y"),
     ("ð", "d"),
     ("þ", "th"),
     ("æ", "ae"),
     ("ø", "ö"),
     ("ç", "c"),
     ("ć", "c"),
     ("ñ", "n"),
     ("ß", "ss"),
    )
    let lbl = lower(name.split(regex("[-`'´\s]")).join(""))
    for (f, t) in chars {
      lbl = lbl.replace(f, t)
    }
    
    box(width: 50%)[
      #context box[
        #show heading: set text(weight: text.weight, size: text.size)
        #set heading(depth: 99, numbering: none, outlined: false)
        #heading(name) #label(lbl)
      ]
      #h(1fr)
      #box[#position]
    ]
  }).join("\n")
}

#show ref: it => {
  let elem = it.element
  if elem.func() == heading and elem.depth == 99 and not elem.outlined {
    link(it.location(), elem.body)
  } else {
    it
  }
}

// --- Example ---

#set text(font: "Domitian", lang: "sv")

#attendance(
  ("Dag Hemberg", "Revisor"),
  "Daniel Adu-Gyan",
  "Nelli Skogman",
  "Fróði Karlsson",
)

#v(20pt)

@frodikarlsson yrkade på att @daghemberg skulle sluta prokrastinera >:(
