require "combine_pdf"
require 'docx'




Dir.glob("*.docx") {|file|
  # do something with the file here
  puts file
  Docx::Document.open(file)
  tmp = file + '.pdf'
  # Converts document.docx to my_document_as.pdf
  # This requires that the soffice binary is present in your PATH.

}



pdf = CombinePDF.new

Dir.glob("*.pdf") {|file|
  # do something with the file here
  puts file
  pdf << CombinePDF.load(file) # one way to combine, very fast.
}

# Dir.foreach('') do |item|
#   next if item == '.' or item == '..'
#   puts item
#   # pdf << CombinePDF.load(item) # one way to combine, very fast.
# end

pdf.save "combined.pdf"
