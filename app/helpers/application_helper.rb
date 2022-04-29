module ApplicationHelper
  def custom_javascript_packs
    javascript_pack_tag "#{params[:controller]}/#{params[:action]}", 'data-turbolinks-track': 'reload'
  rescue Webpacker::Manifest::MissingEntryError => e
    puts e
  end

  def link_to_add_fields(ads, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    # id = "#{ads.name} #{ads.id}"
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder, ads: ads)
    end
    link_to(ads.name.capitalize, '#', class: 'add-fields btn btn-outline-primary col-auto me-3',
                                      data: { id: id, adsvalue: ads.id, fields: fields.gsub("\n", '') })
  end
end
