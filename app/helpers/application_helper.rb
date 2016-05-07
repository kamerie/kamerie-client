module ApplicationHelper
  @@map = HashWithIndifferentAccess.new(YAML.load(File.read(File.join(Rails.root, 'lib', 'static_assets.yml'))))

  def stylesheet_cdn_tag(key)
    raise "key does not exist or is empty in lib/static_assets.yml file" if @@map[key].empty?

    @@map[key][:css].each do |file|
      yield stylesheet_link_tag get_filename(file).html_safe
    end
  end

  def javascript_cdn_tag(key)
    raise "key does not exist or is empty in lib/static_assets.yml file" if @@map[key].empty?

    @@map[key][:js].each do |file|
      yield javascript_include_tag get_filename(file).html_safe
    end
  end

  def stylesheet_cdn_tags(key)
    raise "key does not exist or is empty in lib/static_assets.yml file" if @@map[key].empty?

    @@map[key][:css].map{ |file| stylesheet_link_tag get_filename(file) }.join("\n").html_safe
  end

  def javascript_cdn_tags(key)
    raise "key does not exist or is empty in lib/static_assets.yml file" if @@map[key].empty?

    @@map[key][:js].map { |file| javascript_include_tag get_filename(file) }.join("\n").html_safe
  end

  private

  def get_filename(file)
    return file.gsub(/{.+}/, '') unless Rails.env.production?
    file.gsub(/{(.+)}/, '\1')
  end

  def self.oa_auth_path(provider)
    user_omniauth_authorize_path(provider)
  end
end
