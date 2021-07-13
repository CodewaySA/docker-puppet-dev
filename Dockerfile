FROM codewaysa/ruby:2.7.3_20210713

LABEL image-name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# PE 2019.8.7 LTS includes facter:3.14.18 but it isn't available on rubygems,
#                 so we stick with any available newer version
# redcarpet is needed to run "puppet strings" but is not explicitly depended upon
RUN apk add --no-cache git=2.32.0-r0 && \
    apk add --no-cache --virtual .build-dependencies gcc=10.3.1_git20210424-r2 make=4.3-r0 musl-dev=1.2.2-r3 ruby-dev=2.7.3-r1 && \
    gem install hiera:3.7.0 r10k:3.9.2 puppet:6.23.0 puppet-lint:2.4.2 puppet-strings:2.7.0 redcarpet:3.5.1 && \
    apk del .build-dependencies && \
    rm -rf /root/.gem/specs /var/lib/gems/*/cache
