


def split_word_into_letter main_word

  letters = main_word.split('')
  splited_words=""
  letters.each_with_index  do |letter,index|
    if (letter == "ा" ||letter ==  "ि" ||letter ==  "ी" ||letter ==  "ु" ||letter ==  "ू" ||letter ==  "े" ||letter ==  "ै" || letter == "ो" ||letter ==  "ौ" ||letter ==  "ँ" ||letter == "ं" )
      splited_words += letter

    elsif (letter == "्" )
      #  this field is intentionally left empty kinabhane feri / lai pani xuttai letter manera dekhauxa but  / lai tala use garisakeko xau so yeslai yettikai rakheko but delete garnu hudaina yo part lai
    else
      #यो block ma क ख ग घ ............. यस्तै word matra aauxa

      #aadha aksharko lagi yeha check garne
      if(letters[index+1] ==  "्")
        #if letters[index] ma क ख ग and letters[index+1]ma ् आयो bhane yo half letter hunxa
        if(letters[index+2] == "र")
          ###if letters[index] ma क ख ग and letters[index+1]ma ् and letter[index+2] ma र  आयो bhane yo क्र ख्र ग्र  hunxa
          splited_words +=  " " + letters[index] + "्र"

          #we've already counted ् and र so we must delete this.
          letters.delete_at(index+1)
          letters.delete_at(index+1)
        elsif (letters[index+2] == "य")
          # if letters[iindex] ma क ख ग and letters[index+1]ma ् and letters[index+2] ma य  आयो bhane yo क्य ख्य ग्य hunxa
          splited_words +=  " " + letters[index] + "्य"

          #we've already counted ् and य so we must delete this.
          letters.delete_at(index+1)
          letters.delete_at(index+1)
        else
          #if letter ma क ख ग and letters[index+1]ma ् आयो bhane yo half letter hunxa
          splited_words +=  letter + "्"

        end
      else
        splited_words += " " + letter
      end
    end
  end
  splited_words
end

puts "कृपया नेपाली भाषामा वाक्य लेख्नुहोस"
word = gets.chomp
#word = "मेरो नाम बिबेक हो।म घर जान्न"
p split_word_into_letter word
