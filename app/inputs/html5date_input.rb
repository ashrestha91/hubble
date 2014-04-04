class Html5dateInput < SimpleForm::Inputs::Base
  def input
    @builder.date_field(attribute_name, input_html_options) + \
    @builder.hidden_field(attribute_name, { :class => attribute_name.to_s + "-alt"}) 
  end
end
