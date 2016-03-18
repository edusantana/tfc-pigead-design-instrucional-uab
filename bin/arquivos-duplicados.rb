#!/usr/bin/env ruby

#
# Busca por arquivos duplicados no diretório atual, imprimindo os nomes dos
# arquivos duplicados, e ao final o total de dúplicas encontradas.
#

require 'digest'

arquivos = {}
duplicados = 0

Dir.foreach(Dir.getwd) do |filename|
  next if filename == '.' or filename == '..' or Dir.exist?(filename)
  # do work on real items
  md5 = Digest::MD5.new
  md5.update File.read filename

  if arquivos.has_key?(md5.hexdigest) then
    puts "Duplicados: [#{filename}] e [#{arquivos[md5.hexdigest]}]"
    duplicados = duplicados+1
  else
    arquivos[md5.hexdigest] = filename
  end
end

puts "Arquivos duplicados: #{duplicados}"
