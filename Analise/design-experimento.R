#!/usr/bin/env Rscript

# Como selecionar os livros para os experimentos.
# O que desejamos realizar:
# - selecionar 40 amostras baseadas nas frequências das disciplinas e instituições.
# Para cada par Instituição/Curso
# Selecionar livros a partir da proporção de disciplinas e cursos.

arquivos = read.csv("Analise/Dados/filtrados-e-ofuscados.csv")
livros_nao_ordenados = subset(arquivos, Situação=="Selecionado para o Corpus")

# Ordenados por curso e categoria (disciplina)
livros = livros_nao_ordenados[order(livros_nao_ordenados$Curso,livros_nao_ordenados$Categoria),]
