class Specinfra::Command::Eos::Base::Interface < Specinfra::Command::Base::Interface
  class << self
    def check_exists(name)
      "show interfaces #{name} status"
    end

    def get_speed_of(name)
      "show interfaces #{name} | awk '/b\s/ {print $2}'"
    end

    def get_mtu_of(name)
      "show interfaces #{name} | awk '/MTU/ {print $3}"
    end

    def check_has_ipv4_address(interface, ip_address)
      ip_address = ip_address.dup
      if ip_address =~ /\/\d+$/
        ip_address << " "
      else
        ip_address << "/"
      end
      ip_address.gsub!(".", "\\.")
      "show ip interface #{interface} brief | grep '#{ip_address}'"
    end

    def check_has_ipv6_address(interface, ip_address)
      ip_address = ip_address.dup
      if ip_address =~ /\/\d+$/
        ip_address << " "
      else
        ip_address << "/"
      end
      ip_address.downcase!
      "show ipv6 interface #{interface} brief | grep '#{ip_address}'"
    end

    def get_ipv4_address(interface)
      #"show ip interface #{interface} brief | include #{interface} | awk '{print $2}'"
      "show ip interface #{interface} brief | awk '/#{interface}/ {print $2}'"
    end

    def get_ipv6_address(interface)
      "show ipv6 interface #{interface} brief | awk '/#{interface}/ {print $2}'"
    end

    def get_link_state(name)
      #"cat /sys/class/net/#{name}/operstate"
      "show interfaces #{name} | awk '/protocol/ {print $7}'"
    end
  end
end
