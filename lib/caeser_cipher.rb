require 'pry-byebug'

ASCII_UPPER_CASE_LOW = 65
ASCII_UPPER_CASE_HIGH = 90
ASCII_LOWER_CASE_LOW = 97
ASCII_LOWER_CASE_HIGH = 122

def shift_ascii_by_int(arr, int)
  arr.map! do |ascii|
    if ascii + int > 122
      ascii = ASCII_LOWER_CASE_LOW + (ascii + int - ASCII_LOWER_CASE_HIGH) - 1
    elsif ascii < ASCII_LOWER_CASE_LOW && ascii + int > ASCII_UPPER_CASE_HIGH
      ascii = ASCII_UPPER_CASE_LOW + (ascii + int - ASCII_UPPER_CASE_HIGH)
    else ascii + int
    end
  end
end

def caeser_cipher(str, int)
  arr = str.split('').reject { |char| char.eql?(' ') }
  arr.map! { |char| char.ord }
  shift_ascii_by_int(arr, int)
  arr.map! { |shifted_ascii| shifted_ascii.chr }
  arr.join
end

text_prompt = 'Enter text to be ciphered.'
shift_prompt = 'Enter the shift length.'

puts text_prompt
caeser_string = gets.chomp
puts shift_prompt
caeser_shift = gets.chomp.to_i
puts caeser_cipher(caeser_string, caeser_shift)
