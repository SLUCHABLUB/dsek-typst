#import "documents/plain.typ": plain-document
#import "documents/meetings/minutes.typ": minutes
#import "documents/meetings/deliberations.typ": board-response, consideration, motion, proposal
#import "documents/governing/regulations.typ": regulations
#import "documents/governing/statutes.typ": statutes
#import "documents/governing/guideline.typ": guideline
#import "documents/governing/policy.typ": policy
#import "documents/meetings/notice.typ": notice
#import "documents/meetings/agenda.typ": agenda
#import "documents/meetings/nomination.typ": nomination, nominees
#import "documents/other/requirements-profile.typ": requirements-profile

#import "utils/misc.typ": date, diff-added, diff-deleted

#import "strings.typ"
#import "util.typ"

// --- Aliases ---

#let add = diff-added
#let remove = diff-deleted

// --- Swedish Bindings ---

/// Swedish binding to #link(label("documents:document:doc()"))[`plain-document`].
#let dokument = plain-document
#let protokoll = minutes
#let proposition = proposal
#let styrelsens-svar = board-response
#let riktlinje = guideline
#let handling = consideration
#let föredragningslista = agenda
#let kallelse = notice

#let lägg-till = diff-added
#let ta-bort = diff-deleted
