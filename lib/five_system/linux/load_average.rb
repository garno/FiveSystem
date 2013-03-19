module FiveSystem
  module Linux
    module LoadAverage

      def self.get # {{{
        info = FiveSystem::Helper.strip_spaces(%x[cat /proc/loadavg]).split(' ')
        [info[0].to_f, info[1].to_f, info[2].to_f]
      end # }}}

    end
  end
end
