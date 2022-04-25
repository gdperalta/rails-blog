module ApplicationHelper
  def custom_javascript_packs
    javascript_pack_tag "#{params[:controller]}/#{params[:action]}", 'data-turbolinks-track': 'reload'
  rescue Webpacker::Manifest::MissingEntryError => e
    puts e
  end
end
