#!/usr/bin/env ruby 2.6.10
require 'json'
require 'set'

if ARGV.size != 2
  puts 'Usage: csv_to_json input_file.csv output_file.json'
  puts 'This script uses the first line of the csv file as the keys for the JSON properties of the objects'
  exit(1)
end

courriels_uniques = Set.new

fichier = File.read(ARGV[0])
donnees = JSON.parse(fichier)
puts "**** Nb de lignes **** :" + donnees.length.to_s

donnees.each do |ligne|
  courriels_uniques << ligne['Courriel']
end
puts "**** Nb de courriels uniques ****:" + courriels_uniques.length.to_s

fichier = File.open(ARGV[1], 'a+')
courriels_uniques.each do |kourriel| 
    fichier << kourriel.to_s.downcase + "\n"
end


