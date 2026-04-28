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

#let add = diff-added
#let remove = diff-deleted
