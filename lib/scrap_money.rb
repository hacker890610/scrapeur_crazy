require 'nokogiri'
require 'open-uri'

# 
url = 'https://coinmarketcap.com/all/views/all/'


doc = Nokogiri::HTML(URI.open(url))

def symboles 
crypto_name = @doc.xpath('//td[contains(@class, "by__symbol")]')
crypto_nom = []
  crypto_name.each do |name|
      crypto_name<<name.text #la tu met tes nom que tu converti en texte avec le .text dans ton array
  end
    return crypto_prix
end

def prix  #LA tu fais la meme qu'au dessus mais avec les prix 
  crypto_price = @page.xpath('//td[contains(@class, "by__price")]')
  crypto_prix= []
  value_path.each do |price|
    crypto_value_array << price.text
  end
  return crypto_prix
end

def crypto_final
  Hash_final = Hash[symboles.zip(prix)] #tu fusionne les deux dans une array
  puts "#{Hash_final}"
end