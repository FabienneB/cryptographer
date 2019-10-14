# Encrypt sentances using ROT-number algorithm
# Using ASCII char
# 65-90 => 'A' - 'Z'
# 97-122 => 'a' - 'z'
class Cryptographer
  def rot_algortithm(string, number)
    string.each_char.each_with_object('') do |letter, encrypted_string|
      encrypted_string << letter if letter =~ /[^A-Za-z]/
      ascii_index = letter.ord
      case ascii_index
      when 65..(90 - number), 97..(122 - number)
        encrypted_string << (ascii_index + number).chr
      when (91 - number)..90
        new_ascii_index = (64 + number) - (90 - ascii_index)
        encrypted_string << new_ascii_index.chr
      when (123 - number)..122
        new_ascii_index = (96 + number) - (122 - ascii_index)
        encrypted_string << new_ascii_index.chr
      end
    end
  end
end
