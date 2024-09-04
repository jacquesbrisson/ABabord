require 'set'
require 'csv'

set_abonnes = Set.new
set_infolettre = Set.new
set_dons = Set.new
set_overlap_abonnes_dons = Set.new
set_overlap_abonnes_infolettre = Set.new
set_overlap_infolettre_dons = Set.new


lines = CSV.open('./Courriels_Abonnements.txt').readlines
data_a = lines.map do |values|
  courriel = values[0]
  set_abonnes << courriel
end

lines = CSV.open('./Courriels_Infolettre.txt').readlines
data_i = lines.map do |values|
  courriel = values[0]
  set_infolettre << courriel
end

lines = CSV.open('./Courriels_Dons.txt').readlines
data_d = lines.map do |values|
  courriel = values[0]
  set_dons << courriel
end

set_overlap_abonnes_dons = set_abonnes.intersection(set_dons)

set_overlap_abonnes_infolettre = set_abonnes.intersection(set_infolettre)

set_overlap_infolettre_dons = set_infolettre.intersection(set_dons)

puts "-----------------------------"
puts "Nombre d abonnés    : " + set_abonnes.length.to_s
puts "Nombre d infolettre : " + set_infolettre.length.to_s
puts "Nombre de dons.     : " + set_dons.length.to_s
puts "-----------------------------"
puts "Nombre d abonnés ABB qui ont fait des dons        : " + set_overlap_abonnes_dons.length.to_s
puts "Nombre d abonnés ABB qui recoivent infolettre     : " + set_overlap_abonnes_infolettre.length.to_s
puts "Nombre d abonnés infolettre qui ont fait des dons : " + set_overlap_infolettre_dons.length.to_s
puts "-----------------------------"
