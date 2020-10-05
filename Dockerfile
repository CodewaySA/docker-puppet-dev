FROM codewaysa/ruby:2.7.1_20201005

LABEL image_name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Ruby cri-2.15.6 introduces a regression in r10k
# https://github.com/puppetlabs/r10k/issues/936#issuecomment-498189406
RUN apk add --no-cache git=2.26.2-r0 ruby-etc=2.7.1-r3 ruby-json=2.7.1-r3 && \
    gem install puppet:6.17.0 puppet-lint:2.4.2 r10k:3.5.2 && \
    rm -rf /var/lib/gems/*/cache
