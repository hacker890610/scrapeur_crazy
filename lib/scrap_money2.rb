require 'nokogiri'
require 'open-uri'

# Spécifiez l'URL de la page web (CoinMarketCap)
url = 'https://coinmarketcap.com/all/views/all/'
# Chargez la page web en utilisant Nokogiri
doc = Nokogiri::HTML(URI.open(url))

# Initialiser l'array vide pour stocker les données
crypto_array = []

# Utiliser XPath pour cibler les éléments du tableau
crypto_rows = doc.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr')

# Limiter aux 20 premières lignes
crypto_rows.take(20).each do |row|
  currency_name = row.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').text.strip
  currency_value = row.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]').text.strip

  # Ajouter le nom et la valeur dans un hash
  crypto_hash = { name: currency_name, value: currency_value }

  # Ajouter le hash à l'array
  crypto_array << crypto_hash
end

# Afficher l'array résultant
puts crypto_array