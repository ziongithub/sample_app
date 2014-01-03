# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
     # Use the existing token.
     file.read(token_file).chomp
  else
     # Generate a new token and store it in token_file.
     token = SecureRandom.hex(64)
     File.write(token_file, token)
     token
  end
end

SampleApp::Application.config.secret_key_base = secure_token 


#SampleApp::Application.config.secret_key_base = 'ed22221b79288d8538ad0d9d8f8121b792a70b7f949ccfdc55ea47e8bfbbc101fd5d03895bcff9bf13a7c7daec4b700855f52307f6ddb0d9aa19d66e536a70d7'
