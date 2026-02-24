#let serif = "Domitian"
#let monospace = "DejaVu Sans Mono"
#let sans_serif = "TeX Gyre Heros"

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
