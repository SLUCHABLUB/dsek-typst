#import "documents/document.typ": doc as plain-document
#import "documents/meetings/minutes.typ": minutes
#import "documents/meetings/deliberations.typ": board-response, consideration, motion, proposal
#import "documents/governing/statutes-regulations.typ": regulations, statutes
#import "documents/governing/guideline-policy.typ": guideline, policy
#import "documents/meetings/notice.typ": notice
#import "documents/meetings/agenda.typ": agenda
#import "documents/other/requirements_profile.typ": req-profile

#import "utils/misc.typ": date, diff-added, diff-removed

#import "strings.typ"
#import "util.typ"

// swedish bindings
#let dokument = plain-document
#let protokoll = minutes
#let proposition = proposal
#let styrelsens-svar = board-response
#let riktlinje = guideline
#let handling = consideration
#let föredragningslista = agenda
#let kallelse = notice

#let lägg-till = diff-added
#let ta-bort = diff-removed

