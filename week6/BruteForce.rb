#!/usr/bin/ruby
# a_abel_launch.sh - Launch script for the Assignment two main script for unit CYB6004.
# Author: Andrew Abel
# Date: 21/August/2021

# Script Purpose: This script is a modification to the dictionary attack script to use a brute force attack. 

require 'digest'

password = 'blah'
encrypted_password = Digest::SHA2.hexdigest 'blah'
puts "the encrypted password is: #{encrypted_password}"

alpha_numberic_values = ('a'..'z').to_a + ('0'..'9').to_a

alpha_numberic_values.repeated_permutation(4).to_a.each do |value|
  stringified_value = value.join
  puts "Trying password #{stringified_value}: #{Digest::SHA256.hexdigest(stringified_value)}"
  encrypted_value = Digest::SHA256.hexdigest(stringified_value)
  if encrypted_value == encrypted_password
    puts("Password has been cracked! It was #{stringified_value}")
    return
  end
end