#!/usr/bin/env Rscript

# Como selecionar os livros para os experimentos.
# O que desejamos realizar: Selecionar 40 livros aleatoriamente válidos.
# Os livros selecionados serão registrados no arquivo "Analise/Dados/amostra-selecionada.csv"

arquivos = read.csv("Analise/Dados/filtrados-e-ofuscados.csv")
livros_nao_ordenados = subset(arquivos, Situação=="Selecionado para o Corpus")

# Ordenados por curso e categoria (disciplina)
livros = livros_nao_ordenados[order(livros_nao_ordenados$Curso,livros_nao_ordenados$Categoria),]

amostra <- livros[sample(1:nrow(livros), 40,   replace=FALSE),]
write.csv(amostra, file = "./Analise/Dados/amostra-selecionada.csv")

