module NestedForm
  class Builder < ActionView::Helpers::FormBuilder
    def link_to_add(name, association)
      @fields ||= {}
      @template.after_nested_form do
        model_object = object.class.reflect_on_association(association).klass.new
        div = @template.content_tag(:div, :id => "#{association}_fields_blueprint", :style => "display: none") do
          fields_for(association, model_object, :child_index => "new_#{association}", &@fields[association]).html_safe
        end
        @template.concat(div)
      end
      @template.link_to(name, "javascript:void(0)", :class => "add_nested_fields", "data-association" => association)
    end

    def link_to_remove(name)
      hidden_field(:_destroy) + @template.link_to(name, "javascript:void(0)", :class => "remove_nested_fields")
    end

    def fields_for_with_nested_attributes(association, args, block)
      @fields ||= {}
      @fields[association] = block
      super
    end


    def fields_for_nested_model(name, association, args, block)
      div = @template.content_tag(:div, :class => "fields") do
        super
      end
      @template.concat(div)
    end
  end
end
