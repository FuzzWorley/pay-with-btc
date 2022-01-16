module RailsAdmin
  module Config
    module Actions
      class Save < RailsAdmin::Config::Actions::Base

        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :route_fragment do
          'save'
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :authorization_key do
          :post
        end

        register_instance_option :visible? do
          bindings[:object].class.base_class.name == 'PaymentRequest'
        end

        register_instance_option :controller do
          Proc.new do
            if request.get? # save
              debugger
              # respond_to do |format|
              #   format.html { render @action.template_name }
              #   format.js   { render @action.template_name, :layout => false }
              # end

            elsif request.save? # DESTROY
              debugger
              # redirect_path = nil
              # @auditing_adapter && @auditing_adapter.save_object(@object, @abstract_model, _current_user)
              # if @object.class.base_class.name == 'User'
              #   @object.to_destroy!
              #   flash[:success] = t("admin.flash.user_destroy_successful", :name => @model_config.label)
              #   redirect_path = index_path
              # else
              #   if @object.destroy
              #     flash[:success] = t("admin.flash.successful", :name => @model_config.label, :action => t("admin.actions.save.done"))
              #     redirect_path = index_path
              #   else
              #     flash[:error] = t("admin.flash.error", :name => @model_config.label, :action => t("admin.actions.save.done"))
              #     redirect_path = back_or_index
              #   end
              # end

              # redirect_to redirect_path

            end
          end
        end

        register_instance_option :link_icon do
          'icon-remove'
        end
      end
    end
  end
end