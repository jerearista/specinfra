class Specinfra::Command::Eos::Base::Inventory < Specinfra::Command::Base::Inventory
  class << self
    def get_memory
      'bash cat /proc/meminfo'
    end

    def get_cpu
      'bash cat /proc/cpuinfo'
    end

    def get_hostname
      'how hostname | include Hostname'
    end

    def get_domain
      #'bash dnsdomainname'
      raise NotImplementedError.new("#{method} is not implemented in #{command_class}")
    end

    def get_fqdn
      'show hostname | include FQDN'
    end

    def get_filesystem
      'bash df -P'
    end

    def get_kernel
      'bash uname -s -r'
    end

    def get_block_device
      block_device_dirs = '/sys/block/*/{size,removable,device/{model,rev,state,timeout,vendor},queue/rotational}'
      "bash for f in $(ls #{block_device_dirs}); do echo -e \"${f}\t$(cat ${f})\"; done"
    end

    def get_system_product_name
      "show version | include Arista"
    end

  end
end
