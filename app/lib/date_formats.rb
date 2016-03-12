module DateFormats
  DATE_FORMATS = [
    {
      :name          => 'USA (mm/dd/year)',
      :ruby_string   => '%m/%d/%Y',
      :moment_string => 'MM/DD/YYYY',
    },
    {
      :name          => 'International (dd/mm/year)',
      :ruby_string   => '%d/%m/%Y',
      :moment_string => 'DD/MM/YYYY',
    },
    {
      :name          => 'ISO 8601 (year/mm/dd)',
      :ruby_string   => '%Y/%m/%d',
      :moment_string => 'YYYY/MM/DD',
    },
    {
      :name          => 'Long Name (example: Dec 31, 1999)',
      :ruby_string   => '%b %d, %Y',
      :moment_string => 'MMM D, YYYY',
    },
  ].freeze

  def self.find_by_ruby_string(string)
    DATE_FORMATS.find { |df| df.fetch(:ruby_string) == string }
  end
end
