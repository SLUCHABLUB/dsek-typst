/// Highlights content with a green background to indicate an addition (e.g. in a diff).
///
/// - content (content): The content to highlight.
/// - color (color): Highlight colour. Defaults to `green`.
/// -> content
#let diff-added(content, color: green) = highlight(fill: color, content)

/// Highlights content with a red background to indicate a deletion (e.g. in a diff).
///
/// - content (content): The content to highlight.
/// - color (color): Highlight colour. Defaults to `red`.
/// -> content
#let diff-deleted(content, color: red) = highlight(fill: color, content)

/// Returns Swedish or English content based on the active document language.
///
/// - swedish (content): Shown when `text.lang == "sv"`.
/// - english (content): Shown when `text.lang == "en"`.
///
/// -> content
#let translate(swedish, english) = context {
  let lang = text.lang
  if lang == "sv" {
    swedish
  } else if lang == "en" {
    english
  } else {
    panic("language `" + lang + "` is not supported for name translations")
  }
}

/// Returns Swedish or English string based on the active document language.
///
///  *This needs to be ran in context.*
///
/// - swedish (str): Shown when `text.lang == "sv"`.
/// - english (str): Shown when `text.lang == "en"`.
///
/// -> str
#let translate_str(swedish, english) = {
  let lang = text.lang
  if lang == "sv" {
    swedish
  } else if lang == "en" {
    english
  } else {
    panic("language `" + lang + "` is not supported for name translations")
  }
}

#let latinize(str) = {
  let new = str
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
  for (t, f) in chars {
    new = new.replace(t, f)
  }
  // TODO: Remove other non-ascii characters?
  return new
}

// Should the main separator be `-` to match our style?
/// Converts a name string into a valid Typst label identifier.
///
/// Lowercases, removes accents via `latinize`, and joins on whitespace, dashes,
/// and quote characters. Used to auto-generate `@labels` for attendees and authors.
///
/// - str (str): Input string, typically a person's name.
/// - sep (str): Separator inserted between words. Defaults to `""` (no separator).
/// -> str
#let labelize(str, sep: "") = latinize(lower(str.split(regex("[-`'´\s]")).join(sep)))

#let to-text(c) = {
  if type(c) == str {
    return c
  } else if type(c) == content {
    let f = c.func()
    if f == text {
      return c.text
    } else if f == [ ].func() {
      // TODO: `[ ].func()` is `space`, so all whitespace will convert to `" "`.
      return " "
    } else if f == [\n].func() {
      // TODO: `[\n].func()` is `symbol`, so all symbols will convert to newlines.
      return "\n"
    } else if f == ['].func() {
      return if c.double { "\"" } else { "'" }
    } else if c.has("children") {
      return c.children.map(to-text).join()
    } else if c.has("body") {
      return to-text(c.body)
    } else {
      return ""
    }
  } else {
    // TODO: Use `repr`?
    return ""
  }
}

// TODO: Document this thoroughly.
#let ref-id = (
  "person": 99,
  "minute": 98,
)

/// Custom `@ref` renderer applied automatically by `doc()` via `show ref`.
///
/// Renders person references (depth `ref-id.person`) as "Position Name" links,
/// and minute-item references (depth `ref-id.minute`) as "§N Title" links,
/// both in the body text colour (no pink). Falls back to the default renderer
/// for all other references.
///
/// Not called directly — set via `show ref: enhanced_ref` inside `doc()`.
/// -> content
#let enhanced_ref(it) = {
  let elem = it.element
  show: box
  if elem != none and elem.func() == heading and elem.numbering == none and not elem.outlined {
    if elem.depth == ref-id.person {
      // people
      show link: set text(text.fill)
      link(elem.location(), [
        #{ if it.supplement == [] { elem.supplement } else if it.supplement != auto { it.supplement } }
        #elem.body
      ])
    } else if elem.depth == ref-id.minute {
      // minutes
      show link: set text(text.fill)
      link(elem.location(), [§#elem.supplement #elem.body])
    }
  } else {
    it
  }
}

#let old-terms(t) = {
  set par(hanging-indent: 2em)
  t
    .children
    .map(c => [
      *#c.term*
      #h(0.6em, weak: true)
      #c.description
    ])
    .join(parbreak())
}

/// Constructs a `datetime` from separate components.
///
/// Shorthand for the verbose `datetime(year: ..., month: ..., day: ...)` constructor.
/// Pass to any `time:` or `date:` parameter in this library.
///
/// ```typst
/// date(15, 3, 2025)                  // 15 March 2025 at midnight
/// date(15, 3, 2025, time: (13, 30))  // 15 March 2025 at 13:30
/// ```
///
/// - day (int): Day of the month (1-31).
/// - month (int): Month (1-12).
/// - year (int): Full year, e.g. `2026`.
/// - time (array): Optional `(hour)`, `(hour, minute)`, or `(hour, minute, second)`.
/// -> datetime
#let date(day, month, year, time: none) = {
  let (h, m, s) = if time != none {
    let time = (time,).flatten()
    if time.len() == 3 {
      time
    } else if time.len() == 2 {
      (time.at(0), time.at(1), 0)
    } else if time.len() == 1 {
      (time.at(0), 0, 0)
    }
  } else {
    (0, 0, 0)
  }

  datetime(
    year: year,
    month: month,
    day: day,
    hour: h,
    minute: m,
    second: s,
  )
}
