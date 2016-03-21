class Specinfra::Helper::DetectOs::Eos < Specinfra::Helper::DetectOs
  def detect
    # Arista Networks EOS
    if run_command('show version | include EOS|Software').success?
      line = run_command('show version | include EOS|Software|Architecture').stdout
      if line =~ /version: (\d[\d.]*[A-Z]*)/
        release = $1
      end
      if line =~ /Architecture:\s+(.+)$/
        arch = $1
      end
      { :family => 'eos', :release => release, :arch => arch }
    end
  end
end
