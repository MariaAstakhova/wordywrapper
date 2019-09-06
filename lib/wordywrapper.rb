require "wordywrapper/version"

module Wordywrapper
    def self.wrap(string, column)
        return "" if string.nil? || string.empty?
        return string if string.length <= column

        space_index = string[0...column].index(" ") || column
        wrapped = string[0...space_index] + "\n"
        remainder = string[space_index..-1]

        unless remainder.nil?
            remainder = remainder.strip 
        end 

        (wrapped + wrap(remainder, column)).strip

    end
end
