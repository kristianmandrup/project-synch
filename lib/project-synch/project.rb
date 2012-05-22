class Project
  attr_reader :structure, :name

  def initialize structure = {}
    @structure = structure
  end

  protected

  attr_writer :structure, :name, :namespaces

  def configure
    structure.each_pair do |key, value|
      case key.to_sym
      when :name
        name = value
      when :meta
        meta = value
      when :namespaces
        
      end
    end
  end

  def build
    Meta.new(meta).build
    build_namespaces value
  end

  def build_namespaces namespace_hash
    namespace_hash.each_pair do |key, value|
      namespaces << Namespace.new(key, value).build
    end
  end

  def namespaces
    @namespaces ||= []
  end

  protected

  def valid_key? key
    valid_keys.include? key.to_s
  end

  def valid_keys
    %w{name meta namespaces}
  end
end