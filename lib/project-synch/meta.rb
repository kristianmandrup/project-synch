class Meta
  attr_reader :meta, :formbuilder, :view_markup, :css_style

  def initialize meta
    @meta = meta
  end

  def build
    meta.each_pair do |key, value|
      raise "Bad meta key: #{key}" unless valid_key? key
      send("#{key}=", value)
    end
  end

  protected

  attr_writer :meta, :formbuilder, :view_markup, :css_style

  def valid_key? key
    valid_keys.include? key.to_s
  end

  def valid_keys
    %w{formbuilder view_markup css_style}
  end
end