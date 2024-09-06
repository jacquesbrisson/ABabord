require 'set'
require 'csv'

set_abonnes = Set.new
set_infolettre = Set.new
set_dons = Set.new

nb_abonnes_in_dons = 0
nb_abonnes_ont_infolettre = 0
nb_infolettre_in_dons = 0

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

set_abonnes.each do |element|
  if set_dons.include?(element) 
    nb_abonnes_in_dons += 1
  end
end

set_abonnes.each do |element|
  if set_infolettre.include?(element) 
    nb_abonnes_ont_infolettre += 1
  end
end

set_infolettre.each do |element|
  if set_dons.include?(element) 
    nb_infolettre_in_dons += 1
  end
end

puts "-----------------------------"
puts "Nombre d abonnés    : " + set_abonnes.length.to_s
puts "Nombre d infolettre : " + set_infolettre.length.to_s
puts "Nombre de dons.     : " + set_dons.length.to_s
puts "-----------------------------"
puts "Nombre d abonnés ABB qui ont fait des dons        : " + nb_abonnes_in_dons.to_s
puts "Nombre d abonnés ABB qui recoivent infolettre     : " + nb_abonnes_ont_infolettre.to_s
puts "Nombre d abonnés infolettre qui ont fait des dons : " + nb_infolettre_in_dons.to_s
puts "-----------------------------"
