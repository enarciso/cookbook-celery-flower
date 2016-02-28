name             'celery-flower'
maintainer       'Eugene Narciso'
maintainer_email 'eugene.narciso@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures celery-flower'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.5'

source_url 'https://github.com/enarciso/cookbook-celery-flower'
issues_url 'https://github.com/enarciso/cookbook-celery-flower/issues'

depends 'runit'
depends 'python'
depends 'build-essential'
depends 'apache2'
#depends 'poise-proxy'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'
