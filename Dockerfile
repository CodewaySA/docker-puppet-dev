FROM codewaysa/ruby:2.5.9_20220610

LABEL image-name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# PE 2019.8.11 LTS includes Puppet agent 6.27.1 but it is a PE-only version, so we stick with 6.27.0
# PE 2019.8.11 LTS includes facter:3.14.23 but it isn't available on rubygems,
#                 so we stick with any newer version that is available
# redcarpet is needed to run "puppet strings" but is not explicitly depended upon
RUN apk add --no-cache git=2.22.5-r0 && \
    apk add --no-cache --virtual .build-dependencies gcc=8.3.0-r0 make=4.2.1-r2 musl-dev=1.1.22-r4 ruby-dev=2.5.9-r0 ruby-rdoc==2.5.9-r0 && \
    gem install hiera:3.9.0 r10k:3.14.0 puppet:6.27.0 bolt:3.22.1 puppet-lint:2.5.2 puppet-strings:2.9.0 redcarpet:3.5.1 && \
    apk del .build-dependencies && \
    rm -rf /root/.gem/specs /var/lib/gems/*/cache
