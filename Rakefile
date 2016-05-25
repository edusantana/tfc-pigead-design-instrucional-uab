desc "Realiza análise estatística dos dados."
task :analise

desc "Realiza aquisição dos dados."
task :aquisicao

desc "Instala dependencias"
task :dependencias => ["Texto/abnt.csl"] do
	sh "R --no-save < Analise/dependencias.R"
end



file "Analise/objetivos.R"

file "Analise/objetivos.pdf" => "Analise/objetivos.R" do |t|
    rm_rf "Rplots.pdf"
    sh "R --no-save < Analise/objetivos.R"
    mv "Rplots.pdf","#{t.name}"
end



file "Texto/abnt.csl" => [:download_abnt]

desc "Realiza download das normas da abnt"
task :download_abnt do
  system "wget -O Texto/abnt.csl https://raw.githubusercontent.com/citation-style-language/styles/master/associacao-brasileira-de-normas-tecnicas-eceme.csl"
end

directory 'saida'

desc "Imprime a situação dos livros na planilha filtrados-e-ofuscados.csv"
task :situacao => :saida do
  system "./Analise/situacao.R", out:'./Analise/Saida/situacao.markdown'
  system "cat", "./Analise/Saida/situacao.markdown"
end

file "Analise/Dados/filtrados-e-ofuscados.csv"

desc "Seleciona amostra"
task :amostra => "Analise/Dados/filtrados-e-ofuscados.csv" do
	sh "R --no-save < Analise/seleciona-amostra.R"
end


task :analise => [ :situacao]

task :default => [:analise]