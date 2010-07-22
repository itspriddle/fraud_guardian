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

    Copyright (c) 2010 Joshua Priddle <itspriddle@nevercraft.net>

    Permission  is  hereby granted, free of charge, to any person ob-
    taining a copy of  this  software  and  associated  documentation
    files  (the "Software"), to deal in the Software without restric-
    tion, including without limitation the rights to use, copy, modi-
    fy, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is  fur-
    nished to do so, subject to the following conditions:

    The  above  copyright  notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF  ANY  KIND,
    EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
    OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE  AND  NONIN-
    FRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER  IN  AN
    ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN  THE
    SOFTWARE.
