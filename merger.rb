require "combine_pdf"

pdf = CombinePDF.new

Dir.glob("pdfs/*.pdf") {|file|
  puts file
  pdf << CombinePDF.load(file) # one way to combine, very fast.
}

pdf.save "combined.pdf"
