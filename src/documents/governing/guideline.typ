#import "govdoc.typ": govdoc
#import "../../utils/misc.typ": translate

/// Creates a guideline (riktlinje) document. Apply with `#show: riktlinje.with(...)` or `#show: guideline.with(...)`.
///
/// A guideline provides recommended practice without being as binding as a policy.
/// Same structure as `policy`: Formalia section, page break, then body.
///
/// - subject (str): The subject of the guideline, e.g. `"Grafisk design"` or `"Överlämning"`.
/// - summary (content): A description of what this document covers.
/// - purpose (content): Why this document exists.
/// - scope (content): Who or what this document applies to.
/// - history (array): Modification history. Each entry is a dict with required keys
///   `meeting`, `change`, and `who`.
/// - date (datetime): The date at which the document was written.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - body (content): The body of the document.
///
/// -> content
#let guideline(
  subject: none,
  summary: none,
  purpose: none,
  scope: none,
  history: (),
  date: datetime.today(),
  lang: "sv",
  body,
) = govdoc(
  subject: subject,
  summary: summary,
  purpose: purpose,
  scope: scope,
  history: history,
  date: date,
  lang: lang,
  doc-type: translate("Riktlinje", "Guideline"),
  body,
)
