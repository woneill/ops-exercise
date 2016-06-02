name 'webserver'
maintainer 'Bill ONeill'
maintainer_email 'woneill@pobox.com'
license 'all_rights'
description 'Installs/Configures webserver'
long_description 'Installs/Configures webserver'
version '0.1.0'
# rubocop:disable Metrics/LineLength
issues_url 'https://github.com/woneill/ops-exercise/issues' if respond_to?(:issues_url)
source_url 'https://github.com/woneill/ops-exercise' if respond_to?(:source_url)

depends 'nginx', '~> 2.7.6'
depends 'hhvm',  '~> 0.6.0'
