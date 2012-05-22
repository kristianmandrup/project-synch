class Namespace
  attr_reader :name, :namespace

  def initialize hash
    @namespace = hash
  end

  def configure
    namespace.each_pair do |key, value|
      raise "Bad meta key: #{key}" unless valid_key? key
      meth_names = ["#{key}=", "#{key}_hash="]
      meth_names.each do |meth_name|
        send(meth_name, value) if respond_to? meth_name
      end
    end
  end

  def build
    build_pages
    build_layouts
    build_overlays
    build_mails
    self
  end

  def pages
    @pages ||= []
  end

  def layouts
    @pages ||= []
  end

  def overlays
    @overlays ||= []
  end

  def mails
    @mails ||= []
  end

  protected

  attr_reader :pages_hash, :layouts_hash, :overlays_hash, :mails_hash, 

  def build_pages
    return if blank? pages_hash
    pages_hash.each_pair do |key, value|
      pages << Page.new(key, value).build
    end    
  end

  def build_layouts 
    return if blank? layouts_hash
    layouts_hash.each_pair do |key, value|
      layouts << Layout.new(key, value).build
    end
  end

  def build_overlays 
    return if blank? overlays_hash
    overlays_hash.each_pair do |key, value|
      overlays << Overlay.new(key, value).build
    end
  end

  def build_mails
    return if blank? mails_hash
    mails_hash.each_pair do |key, value|
      mails << Mail.new(key, value).build
    end
  end

  def blank? hash
    !hash || hash.empty?
  end

end