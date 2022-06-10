FROM codewaysa/ruby:2.7.6_20220610

LABEL image-name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# redcarpet is needed to run "puppet strings" but is not explicitly depended upon
RUN apk add --no-cache git=2.32.2-r0 && \
    apk add --no-cache --virtual .build-dependencies gcc=10.3.1_git20210424-r2 make=4.3-r0 musl-dev=1.2.2-r3 ruby-dev=2.7.6-r0 && \
    gem install facter:4.2.8 hiera:3.9.0 r10k:3.14.0 puppet:7.16.0 bolt:3.22.1 puppet-lint:2.5.2 puppet-strings:2.9.0 redcarpet:3.5.1 && \
    apk del .build-dependencies && \
    rm -rf /root/.gem/specs /var/lib/gems/*/cache
