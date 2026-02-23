#let translated(swedish, english) = context {
  let language = text.lang

  if language == "sv" {
    swedish
  } else if language == "en" {
    english
  } else {
    panic("language `" + language + "` is not supported")
  }
}

// Strings used by the templates.

#let organisation_name = translated("D-sektionen inom TLTH", "The D-guild within TLTH")

// Hard to spell strings.

#let honours_committee = translated(
  "Medaljelelekommittén", "The Honours Committee"
)
#let honours_committee_member = translated(
  "Medaljelelekommittémedlem", "Member of the Honours Committee",
)

// Strings containing "Ø".

#let head_of_introductions_committee = translated(
  "Øverphøs", "Head of Introductions Committee"
)
#let head_of_introduction_coordinators = translated(
  "Øverpeppare", "Head of Introduction Coordinators"
)

// Swedish bindings.

#let medaljelelekommittén = honours_committee
#let medaljelelekommittémedlem = honours_committee_member

#let medaljkommittén = honours_committee
#let medaljkommittémedlem = honours_committee_member

#let överphös = head_of_introductions_committee
#let överpeppare = head_of_introduction_coordinators

// Swedish bindings without diacritics.

#let medaljelelekommitten = honours_committee
#let medaljelelekommittemedlem = honours_committee_member

#let medaljkommitten = honours_committee
#let medaljkommittemedlem = honours_committee_member

#let overphos = head_of_introductions_committee
#let overpeppare = head_of_introduction_coordinators
