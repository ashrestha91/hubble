class Html5timeInput < SimpleForm::Inputs::Base
  def input
    @builder.time_field(attribute_name, input_html_options)
  end
end
