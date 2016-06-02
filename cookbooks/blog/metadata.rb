name 'blog'
maintainer 'Bill ONeill'
maintainer_email 'woneill@pobox.com'
license 'all_rights'
description 'Installs/Configures blog'
long_description 'Installs/Configures blog'
version '0.1.0'
# rubocop:disable Metrics/LineLength
issues_url 'https://github.com/woneill/ops-exercise/issues' if respond_to?(:issues_url)
source_url 'https://github.com/woneill/ops-exercise' if respond_to?(:source_url)

depends 'webserver', '~> 0.1.0'
depends 'wordpress', '~> 3.0.0'
