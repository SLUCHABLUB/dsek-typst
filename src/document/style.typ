// These are taken from the guidelines.

#let heading_level_1_text_size = 14pt
#let heading_level_2_text_size = 12pt
#let heading_level_3_text_size = 11pt

#let body_text_size = 11pt
#let caption_text_size = 9pt
#let footnote_text_size = 9pt

#let no_style = content => content

#let heading_style = strong
#let body_style = no_style
#let caption_style = emph
#let footnote_style = no_style

// TODO: Use the actual fonts.
#let serif = "Libertinus Serif"
#let sans_serif = "DejaVu Sans Mono"

#let heading_font = sans_serif
#let body_font = serif
#let caption_font = serif
#let footnote_font = serif

// These are copied from the LaTeX templates.
#let paragraph_spacing = 3mm

#let page_content_width = 160mm
#let page_content_height = 230mm

#let a4_width = 21cm
#let a4_height = calc.sqrt(2) * a4_width

#let header_height = 16mm
#let header_padding = 15mm

#let horizontal_margin = (a4_width - page_content_width) / 2

// TODO: Investigate how this works in the current LaTeX templates.
#let top_margin_excluding_header = 15mm
// In typst, headers are put in the margin.
#let top_margin = top_margin_excluding_header + header_height + header_padding

#let bottom_margin = a4_height - top_margin - page_content_height
