#devtools::install_github("Lucianea/ModeloCertificado")
library(tinytex)
library(ModeloCertificado)
library(knitr)
library(rmarkdown)
library(here)

here("ListaPresenca300818.csv")
#setwd("C:/Users/Steven/Desktop/ModeloCertificadoDado-master")

planilha<-"ListaPresenca300818.csv"
pasta_certificado<-"teste"
modelocertificado<-"certificadomodo3.Rmd"

options(tinytex.verbose = TRUE)
gerar_certificados(planilha,pasta_certificado,modelocertificado)

render("certificadomodo3.Rmd", pdf_document(latex_engine = "lualatex"))


##################################################################################

presenca <- read.csv2(planilha, stringsAsFactors = FALSE, encoding = "UTF-8")


for (i in 1:nrow(presenca)) {
  rmarkdown::render(input = modelocertificado, output_format = "pdf_document", 
                    output_file = paste("Certificado ", presenca$name[i], 
                                        ".pdf", sep = ""), output_dir = pasta_certificado, 
                    encoding = "utf-8")
}



#######################################################################################

#for (i in 1:nrow(presenca)) {
#  print(paste(presenca$email[i], ",", sep = ""))
#}