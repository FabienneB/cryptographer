# Encrypt sentances using ROT-13 algorithm
# Using ASCII char
# 65-90 => 'A' - 'Z'
# 97-122 => 'a' - 'z'
class Cryptographer
  def rot_algortithm(string)
    string.each_char.each_with_object('') do |letter, encrypted_string|
      encrypted_string << letter if letter =~ /[^A-Za-z]/
      ascii_index = letter.ord
      case ascii_index
      when 65..77, 97..109
        encrypted_string << (ascii_index + 13).chr
      when 78..90
        new_ascii_index = 77 - (90 - ascii_index)
        encrypted_string << new_ascii_index.chr
      when 110..122
        new_ascii_index = 109 - (122 - ascii_index)
        encrypted_string << new_ascii_index.chr
      end
    end
  end
end
