require 'thor'
require 'active_support'
require 'active_support/core_ext/string'

module PasswordCharacters
  class CLI < Thor
    desc 'inline', 'allows input of the password and indices during invocation'
    options password: :required, indices: :required
    def inline
      puts PasswordCharacters::PasswordAndOrdinals.new(options[:password], character_ordinals_to_integer_array(options[:indices])).characters.join ' '
    end

    no_commands do
      def character_ordinals_to_integer_array(character_ordinals)
        character_ordinals.split(',').map(&:to_i)
      end
    end
  end
end