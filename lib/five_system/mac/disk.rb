module FiveSystem
  module Mac

    class Disk

      attr_accessor :path

      # (FiveSystem::Mac::Disk) New disk object
      def self.at(path) # {{{
        t = self.new
        t.at path
        t
      end # }}}

      # (String) Set a new mouting path
      def at(path=nil) # {{{
        path ? (@path = path) : @path
      end # }}}

      # (Array) Disk info [block_size, filesystem, size, used, free, capacity, mounted_at]
      def fetch_info # {{{
        block_size = nil

        %x[df].to_s.split("\n").each_with_index do |disk, i|
          if i == 0 # Header
            block_size = disk.scan( /(\d+)-blocks/).flatten
          else
            info = FiveSystem::Helper.strip_spaces(disk).split(' ')
            return (block_size << info).flatten if info.last == '/'
          end
        end
      end # }}}

      # (Array) Disk usage summary [size, used, free]
      def usage(scale=nil) # {{{
        info = fetch_info
        size = scale_to(info[0], info[2], scale)
        used = scale_to(info[0], info[3], scale)
        free = scale_to(info[0], info[4], scale)

        [size, used, free]
      end # }}}

      # (Integer) Total space
      def size(scale=nil) # {{{
        info = fetch_info
        scale_to(info[0], info[2], scale)
      end # }}}

      # (Integer) Free space
      def free(scale=nil) # {{{
        info = fetch_info
        scale_to(info[0], info[4], scale)
      end # }}}

      # (Integer) Used space
      def used(scale=nil) # {{{
        info = fetch_info
        scale_to(info[0], info[3], scale)
      end # }}}

      # (Integer) Blocs scaled down for human sake
      def scale_to(block_size, size, scale=:block) # {{{
        scaled_size = size.to_i

        ([:block, :kb, :mb, :gb, :tb, :pb, :eb, :zb, :yb].index(scale).to_i).times do |i|
          scaled_size = i == 0 ? (size.to_i / (1024 / block_size.to_i)) : (scaled_size / 1024)
        end

        scaled_size
      end # }}}

    end

  end
end
