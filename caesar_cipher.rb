require 'sinatra'
#require 'sinatra/reloader'


get '/' do
    shift = params['shift'].to_i
    string = params['str']
    encrypted = caesar_cipher(string, shift)
    erb :index, :locals => {:encrypted_text => encrypted}
end

def caesar_cipher(sentence, shift)
    return '' if sentence.nil?
    lower_alphabets = 'abcdefghijklmnopqrstuvwxyz'
    upper_alphabets = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    encrypted = ''
    sentence.each_char do |char|
        if lower_alphabets.include?(char)
            char_index = (lower_alphabets.index(char) + shift) % 26
            encrypted += lower_alphabets[char_index]
        elsif upper_alphabets.include?(char)
            char_index = (upper_alphabets.index(char) + shift) % 26
            encrypted += upper_alphabets[char_index]
        else
            encrypted += char
        end
    end
    return encrypted
end