class ImagePreviewInput < SimpleForm::Inputs::FileInput
  def input
    # :preview_version is a custom attribute from :input_html hash, so you can pick custom sizes
    version = input_html_options.delete(:preview_version)
    out = '' # the output string we're going to build
    # check if there's an uploaded file (eg: edit mode or form not saved)
    if object.send("#{attribute_name}?")
      # append preview image to output
      out << template.image_tag(object.send(attribute_name).tap {|o| break o.send(version) if version}.send('url'))
      out << @builder.check_box("remove_#{attribute_name}").html_safe
      out << @builder.label("remove_#{attribute_name}", t('delete this image')).html_safe
    end
    # allow multiple submissions without losing the tmp version
    out << @builder.hidden_field("#{attribute_name}_cache").html_safe
    # append file input. it will work accordingly with your simple_form wrappers
    (out << @builder.file_field(attribute_name, input_html_options)).html_safe
  end
end
