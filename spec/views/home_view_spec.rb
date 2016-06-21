require 'rails_helper'

RSpec.describe "pages/home view", type: :view do
  it "renders home page without error" do
    render template: "pages/home", layout: "layouts/application"
    expect(view).to render_template("pages/home")
  end
end
