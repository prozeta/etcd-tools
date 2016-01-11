Gem::Specification.new do |s|
  s.name                  = 'etcd-tools'
  s.version               = '0.2.0'
  s.date                  = '2015-12-11'
  s.summary               = "ETCD tools"
  s.description           = "A set of handful daemons and command-line utils for ETCD (is part of PortAuthority)"
  s.authors               = ["Radek 'blufor' Slavicinsky"]
  s.email                 = 'radek.slavicinsky@gmail.com'
  s.files                 = Dir['lib/**/*.rb']
  s.executables           = Dir['bin/*'].map(){ |f| f.split('/').last }
  s.homepage              = 'https://github.com/blufor/etcd-tools'
  s.license               = 'GPLv2'
  s.required_ruby_version = '>= 1.9'
  s.add_runtime_dependency 'etcd', '~> 0.3', '>= 0.3.0'
  s.add_runtime_dependency 'net-ping', '~> 1.7', '>= 1.7.8'
end
