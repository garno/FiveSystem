module FiveSystem
  module Helper

    def self.strip_spaces(string) # {{{
      string.gsub! '  ', ' '
      strip_spaces string while string.include? '  '
      string
    end # }}}

  end
end
