module FiveSystem
  module Mac

    module Uptime

      attr_accessor :last_reboot

      # (Integer) Number of seconds since last reboot
      def self.seconds # {{{
        (Time.now.to_i - self.last_reboot.to_time.to_i)
      end # }}}

      # (Integer) Number of minutes since last reboot
      def self.minutes # {{{
        seconds / 60
      end # }}}

      # (Integer) Number of hours since last reboot
      def self.hours # {{{
        minutes / 60
      end # }}}

      # (Integer) Number of days since last reboot
      def self.days # {{{
        hours / 24
      end # }}}

      # (DateTime) System last reboot date
      def self.last_reboot # {{{
        @last_reboot ||= DateTime.parse(%x[sysctl kern.boottime].to_s.gsub("\n", '').split('}').last[1..-1]).to_time
      end # }}}

    end

  end
end
