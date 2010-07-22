module FraudGuardian
  extend self

  GATEWAY = 'moderngigabyte.net'

  def get_fraud_report(opts = {})
    raise ArgumentError, "Invalid arguments" unless opts.keys == required_options
    http = Net::HTTP.new(GATEWAY, 80)
    http.use_ssl = false
    data = http.get(prep_query(opts), nil)
    resp = parse_raw_fraud_report(data.body)
  end

private

  def required_options
    [:ip, :city, :domain, :state, :zipcode].freeze
  end

  def prep_query(opts = {})
    config = YAML.load_file(File.join(RAILS_ROOT, 'config', 'fraud_guardian.yml'))
    query = '/members/_remote_api.php?' << {
      'country' => 'USA',
      'i'       => opts[:ip],
      'city'    => opts[:city],
      'domain'  => opts[:domain],
      'region'  => opts[:state],
      'postal'  => opts[:zipcode]
    }.merge(config).map { |key, val| "#{key}=#{val}" }.join('&')
  end

  def parse_raw_fraud_report(data = nil)
    resp   = param_template
    fields = data.to_s.split(';')
    if fields.size > 1
      fields.each do |field|
        key, val = field.split('=')
        key = case key
          when 'ipISP'     then 'IP ISP'
          when 'ipMatch'   then 'IP Match'
          when 'ipORG'     then 'IP ORG'
          when 'ipCountry' then 'IP Country'
          else                  key.titleize
        end
        resp[key] = val
      end
      resp
    else
      data
    end
  end

  def param_template
    {
      "IP Country"          => "",
      "Distance To Billing" => "",
      "Score Proxy"         => "",
      "IP ORG"              => "",
      "Free Mail"           => "",
      "Score Spam"          => "",
      "IP Match"            => "",
      "Bin Match"           => "",
      "High Risk Country"   => "",
      "Anon Proxy"          => "",
      "Bin Error"           => "",
      "Bin Name"            => "",
      "Score"               => "",
      "Bin Country"         => "",
      "IP ISP"              => "",
      "Error"               => ""
    }
  end
end
