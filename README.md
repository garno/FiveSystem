# FiveSystem
Unix toolbox for system information written in Ruby.

* Load Average
* Hostname
* Uptime (Mac only)
* Disk Usage (Mac only)
* Process: Launch date, CPU & memory usage

### What's up with that name?

Yup, its lame but this library is an expirement so.. no fancy name needed.

*Again, this is an expirement, it should not be used in production.*

## Usage

#### Load Average

    FiveSystem::LoadAverage.get # => [0.32, 0.40, 0.28]

#### Hostname

    FiveSystem::Hostname.get # => "fivecandles-lb-1"

#### Uptime

    FiveSystem::Uptime.days        # => 34
    FiveSystem::Uptime.hours       # => 831
    FiveSystem::Uptime.minutes     # => 49879
    FiveSystem::Uptime.seconds     # => 2992727
    FiveSystem::Uptime.last_reboot # => Sun, 26 Feb 2012 12:19:50 +0000

#### Disk usage

    FCSystem::Disk.at('/').size # => 423903064
    FCSystem::Disk.at('/').used # => 373156760
    FCSystem::Disk.at('/').free # => 50234304

Convert to human readable number using the `number_to_human_size` method available in [ActionView](http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_human_size).
