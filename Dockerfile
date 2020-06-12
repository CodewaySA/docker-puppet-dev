FROM codewaysa/ruby:2.6.6_20200612

LABEL image_name="codewaysa/puppet-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Ruby cri-2.15.6 introduces a regression in r10k
# https://github.com/puppetlabs/r10k/issues/936#issuecomment-498189406
RUN apk add --no-cache git=2.24.3-r0 ruby-etc=2.6.6-r2 ruby-json=2.6.6-r2 && \
    gem install puppet:6.16.0 puppet-lint:2.4.2 cri:'<= 2.15.5' r10k:3.3.0 && \
    rm -rf /var/lib/gems/*/cache
