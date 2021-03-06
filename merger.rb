require "combine_pdf"

pdf = CombinePDF.new

Dir.glob("pdfs/*.pdf") {|file|
  puts file
  pdf << CombinePDF.load(file) # one way to combine, very fast.
}

file_name = "merged_pdfs/combined.pdf"
if File.exist?(file_name)
  i=1
  file_name = 'merged_pdfs/combined' + i.to_s + '.pdf'
  until !(File.exist?(file_name))
    i+=1
    file_name = 'merged_pdfs/combined' + i.to_s + '.pdf'
  end
  pdf.save file_name
else
  pdf.save file_name
end
