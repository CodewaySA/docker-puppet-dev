FROM codewaysa/ruby:2.7.1_20201215

LABEL image_name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# redcarpet is needed to run "puppet strings" but is not explicitly depended upon
RUN apk add --no-cache git=2.26.2-r0 && \
    apk add --no-cache --virtual .build-dependencies gcc=9.3.0-r2 make=4.3-r0 musl-dev=1.1.24-r10 ruby-dev=2.7.1-r3 && \
    gem install puppet:7.0.0 puppet-lint:2.4.2 puppet-strings:2.5.0 r10k:3.7.0 redcarpet:3.5.0 && \
    apk del .build-dependencies && \
    rm -rf /root/.gem/specs /var/lib/gems/*/cache
