#https://yihui.name/tinytex/
#install.packages('tinytex')

tinytex::install_tinytex()

tinytex:::is_tinytex()

writeLines(c(
   '\\documentclass{article}',
   '\\begin{document}', 'Hello world!', '\\end{document}'
 ), 'test.tex')
tinytex::pdflatex('test.tex')