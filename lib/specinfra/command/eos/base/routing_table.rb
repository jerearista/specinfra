class Specinfra::Command::Eos::Base::RoutingTable < Specinfra::Command::Base::RoutingTable
  class << self
    def check_has_entry(destination)
      "show ip route | include #{destination}"
    end

    alias :get_entry :check_has_entry
  end
end
