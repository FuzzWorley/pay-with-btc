module Manager
  class PaymentRequestsController < Manager::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #

    def create
      resource = resource_class.new(resource_params)
      # need to catch these
      resource.validate! 

      response = BtcpayServerApiService.new(params["payment_request"]).create_payment_request
      # need to catch these
      raise 'response not successful' unless response["id"].present?

      resource = resource_class.new(resource_params.merge!(btcpay_server_id: response["id"]))
      authorize_resource(resource)

      if resource.save
        redirect_to(
          after_resource_created_path(resource),
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }, status: :unprocessable_entity
      end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    def resource_params
      params.require(resource_class.model_name.param_key).
        permit(dashboard.permitted_attributes)
    end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private 

    def after_resource_created_path(requested_resource)
      [namespace, requested_resource]
    end
  end
end
