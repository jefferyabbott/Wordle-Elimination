# setup placeholder variables
words = []
index0 = ''
index1 = ''
index2 = ''
index3 = ''
index4 = ''
lettersInWord = []
lettersNotInWord = []
notInIndex0 = []
notInIndex1 = []
notInIndex2 = []
notInIndex3 = []
notInIndex4 = []

# read possible words list into memory
File.readlines("rankedWords.txt").each do |word|
    if word != ""
        words.push(word)
    end
end

def getConfirmedLetter(position, indexVar) 
    if indexVar == ''
        puts "position #{position}:"
        temp = gets
        if temp.chomp != ''
            return temp.chomp
        end
    else 
        puts "position #{position} is #{indexVar}"
    end
    return indexVar
end

def getLetterInWrongPosition(position, indexArray, lettersInWord) 
    puts "not in position #{position}: "
    temp = gets
    if temp.chomp != ''
        indexArray.push(temp.chomp)
        lettersInWord.push(temp.chomp)
    end
end

def checkIfWordIsValid(position, word, indexChar, valid)
    if indexChar != '' && valid
        if word[position] != indexChar
            return false
        end
    end
    return true
end

# play the game, maximum of 6 tries
6.times do

    # confirmed letters in each position
    puts "Letters in word: "
    index0 = getConfirmedLetter(0, index0)
    index1 = getConfirmedLetter(1, index1)
    index2 = getConfirmedLetter(2, index2)
    index3 = getConfirmedLetter(3, index3)
    index4 = getConfirmedLetter(4, index4)

    # confirmed letters in word, but not in position
    getLetterInWrongPosition(0, notInIndex0, lettersInWord)
    getLetterInWrongPosition(1, notInIndex1, lettersInWord)
    getLetterInWrongPosition(2, notInIndex2, lettersInWord)
    getLetterInWrongPosition(3, notInIndex3, lettersInWord)
    getLetterInWrongPosition(4, notInIndex4, lettersInWord)

    # confirmed letters not in word
    puts "Letters NOT in word: "
    lettersNot = gets

    lettersNot.chomp.split('').each do |letter|
        lettersNotInWord.push(letter)
    end

    # find remaining words
    remainingWords = []

    words.each do |word|
        valid = true

        if checkIfWordIsValid(0, word, index0, valid) == false
            valid = false
        end

        if checkIfWordIsValid(1, word, index1, valid) == false
            valid = false
        end

        if checkIfWordIsValid(2, word, index2, valid) == false
            valid = false
        end


        if checkIfWordIsValid(3, word, index3, valid) == false
            valid = false
        end

        if checkIfWordIsValid(4, word, index4, valid) == false
            valid = false
        end

        lettersInWord.each do |letter|
            if valid 
                valid = word.include? "#{letter}"
            end    
        end

        lettersNotInWord.each do |letter|
            if valid
                if word.include? "#{letter}"
                    valid = false
                end
            end
        end

        if notInIndex0.include? word[0]
            valid = false
        end

        if notInIndex1.include? word[1]
            valid = false
        end

        if notInIndex2.include? word[2]
            valid = false
        end

        if notInIndex3.include? word[3]
            valid = false
        end

        if notInIndex4.include? word[4]
            valid = false
        end

        if valid == true
            remainingWords.push(word)
        end
    end

    words = remainingWords
    
    # show possible words remaining
    puts "--------------------------------------"
    puts "#{words.length} possible words"
    puts words
    puts "--------------------------------------"
end