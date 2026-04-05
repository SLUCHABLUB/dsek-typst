#import "governing-document.typ": governing-document
#import "../../utils/misc.typ": translate
#import "../../utils/assert.typ": required

/// Creates a policy document. Apply with `#show: policy.with(...)`.
///
/// - The document begins with a "Formalia" / "Overview" section containing the
///   summary, purpose, scope, and a revision history table.
/// - A page break separates Formalia from the body.
/// - Terms blocks in the body are formatted as a 2-column table (term, description).
///
/// - subject (content): The subject of the policy, e.g. `"Val"` or `"Tackverksamhet"`.
/// - summary (content): Description of what this document covers.
/// - purpose (content): Why this document exists.
/// - scope (content): Who or what this document applies to.
/// - history (array): Modification history.
///                    Each entry is a dict with required keys `meeting`, `change`, and `who`.
/// - lang (str): The language of the document (same format as `text.lang`).
///               Only "sv" and "en" are supported.
/// - date (datetime): The date at which the document was written.
/// - body (content): The body of the document.
///
/// -> content
#let policy(
  subject: none,
  summary: none,
  purpose: none,
  scope: none,
  history: (),
  date: datetime.today(),
  lang: "sv",
  body,
) = {
  required(subject, "subject", fn: "policy")
  let policy-name = "Policy"

  governing-document(
    title: [#policy-name #translate("för", "for") #subject],
    summary: summary,
    purpose: purpose,
    scope: scope,
    history: history,
    date: date,
    lang: lang,
    doc-type: policy-name,
    body,
  )
}
