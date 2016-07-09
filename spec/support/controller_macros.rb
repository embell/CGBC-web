module ControllerMacros
  def login_with_permissions(permissions)
    before (:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create!({email: "test@example.com",
                           password: "password",
                           password_confirmation: "password",
                           permissions: permissions})
      sign_in user
    end
  end
end
