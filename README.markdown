# Rails Fraud Guardian Plugin

This plugin provides methods for working with [FraudGuardian](http://www.modernbill.com/products/fraudguardian/).

## Installation

    script/plugin install git://github.com/itspriddle/fraud_guardian.git
    rake fraud_guardian:setup
    $EDITOR config/fraud_guardian.yml

## Usage

    FraudGuardian.get_fraud_report(
      :ip      => '127.0.0.1',
      :state   => 'NY',
      :zipcode => '12065',
      :city    => 'Clifton Park',
      :domain  => 'nevercraft.net'
    )

## LICENSE

See LICENSE
