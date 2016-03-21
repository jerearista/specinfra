class Specinfra::Command::Eos::Base::Package < Specinfra::Command::Linux::Base::Package
  class << self
    def check_is_installed(package, version=nil)
      #cmd = "show extensions | json"
      #extensions = JSON.parse(cmd)
      #if extensions['extensions'].key?("#{escape(package)}")
      #  if extensions['extensions'][escape(package)]['status'] == 'Installed'
      #    extensions['extensions'][escape(package)]
      cmd = "show extensions | awk '/#{escape(package)}/ {print $4}"
      if version
        cmd = "#{cmd} | #{escape(version)}"
      end
      cmd
    end

    def get_version(package, opts=nil)
      #"rpm -q --qf '%{VERSION}-%{RELEASE}' #{package}"
      #"show extensions | include #{escape(package)}"
      "show extension | awk '/#{escape(package)}/ {print $2}'"
    end

    def install(package, version=nil, option='')
      #if option
      #if version
      #  full_package = "#{package}-#{version}"
      #else
      #  full_package = package
      #end
      "extension #{package} #{option}"
    end

    def remove(package, option='')
      "no extension #{package}"
    end
  end
end









