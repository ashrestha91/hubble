class Html5dateInput < SimpleForm::Inputs::Base
  def input
    @builder.date_field(attribute_name, input_html_options)
  end
end
