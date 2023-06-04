# パスワード可視化の実装準備

# class Users::SessionsController < Devise::SessionsController
#   def create
#     self.resource = warden.authenticate!(auth_options)
#     set_flash_message!(:notice, :signed_in)
#     sign_in(resource_name, resource)

#     if params[:user][:password_visible] == "1"
#       bypass_sign_in(resource, scope: resource_name)
#       flash.now[:notice] = "パスワードを表示中です"
#     end

#     yield resource if block_given?
#     respond_with resource, location: after_sign_in_path_for(resource)
#   end
# end
