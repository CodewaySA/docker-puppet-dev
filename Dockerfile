FROM codewaysa/ruby:2.7.1_20201215

LABEL image_name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

RUN apk add --no-cache git=2.26.2-r0 && \
    gem install puppet:6.17.0 puppet-lint:2.4.2 r10k:3.7.0 && \
    rm -rf /var/lib/gems/*/cache
