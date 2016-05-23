#!/usr/bin/env Rscript

#cat("Situação dos livros na planilha filtrados-e-ofuscados.csv:")
filtrados_e_ofuscados = read.csv("Analise/Dados/filtrados-e-ofuscados.csv")
#table(filtrados_e_ofuscados["Situação"])

library(knitr)
situacao = setNames(data.frame(table(filtrados_e_ofuscados["Situação"])), c("Situação dos arquivos", "Quantidade"))
kable(situacao, format = "markdown")

kable(prop.table(situacao$Quantidade), format = "markdown")


tbl <- table(situacao$Quantidade)
cbind(situacao,prop.table(tbl))

kable(tbl, format = "markdown")
