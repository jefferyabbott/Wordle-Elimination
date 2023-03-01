require 'net/http'
require 'json'

ranking = Hash.new

# read possible words list into memory
File.readlines("words.txt").each do |word|
    word = word.strip
    if word != ""
        url = "https://api.datamuse.com/words?sp=#{word}&md=f&max=1"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        freq = JSON.parse(response)[0]["score"]
        puts "word: #{word} rank: #{freq}"
        ranking[word] = freq
    end
end

ranking = ranking.sort_by {|k,v| v}

File.open("rankedWords.txt", "w+") do |f|
    ranking.each { |k, v| f.puts(k) }
end
