desc "Realiza análise estatística dos dados."
task :analise

desc "Realiza aquisição dos dados."
task :aquisicao

file "Analise/objetivos.pdf" => "Analise/objetivos.R" do |t|
    sh "R --no-save < Analise/objetivos.R"
    mv "Rplots.pdf","#{t.name}"
end


file "Texto/abnt.csl" => [:download_abnt]

desc "Realiza download das normas da abnt"
task :download_abnt do
  system "wget -O Texto/abnt.csl https://raw.githubusercontent.com/citation-style-language/styles/master/associacao-brasileira-de-normas-tecnicas-eceme.csl"
end


desc "Imprime a situação dos livros na planilha filtrados-e-ofuscados.csv"
task :situacao do
  system "./Analise/situacao.R", out:'./Analise/Saida/situacao.markdown'
  system "cat", "./Analise/Saida/situacao.markdown"
end
