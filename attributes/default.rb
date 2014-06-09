default['celery-flower']['user'] = 'www-data'
default['celery-flower']['group'] = 'www-data'
default['celery-flower']['version'] = '0.7.0'

# Make virtualenv path unique if installing multiple instance
# such as the name of the rabbitmq vhosts
# eg; '/opt/celery_flower_testing'
default['celery-flower']['virtualenv'] = '/opt/celery_flower'

# Override log file if multiple instance are created
# eg; /var/log/celery-flower/celery-flower_5555.log
default['celery-flower']['log_path'] = '/var/log/celery-flower/celery-flower.log'

# Note: This feture not included in this version
default['celery-flower']['basic_auth'] = nil
default['celery-flower']['auth'] = nil

default['celery-flower']['listen_address'] = '0.0.0.0'
default['celery-flower']['listen_port'] = '5555'

# Set 'ssl' to true to enable
default['celery-flower']['ssl']['enable'] = nil
default['celery-flower']['ssl']['cert'] = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
default['celery-flower']['ssl']['key'] = '/etc/ssl/private/ssl-cert-snakeoil.key'

default['celery-flower']['basic_auth'] = nil
default['celery-flower']['auth'] = nil

# --broker attributes
default['celery-flower']['broker']['protocol'] = 'amqp'
default['celery-flower']['broker']['host'] = 'localhost'
default['celery-flower']['broker']['username'] = 'guest'
default['celery-flower']['broker']['password'] = 'guest'
default['celery-flower']['broker']['port'] = 5672
default['celery-flower']['broker']['vhost'] = '/'

# --broker_api attributes
# To enable to it to true
default['celery-flower']['broker_api']['enable'] = nil
default['celery-flower']['broker_api']['protocol'] = 'http'
default['celery-flower']['broker_api']['port'] = 15672
