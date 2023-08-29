Rails.application.routes.draw do
  get "/all", controller: "products", action: "display_all_method"
  get "/panettone", controller: "products", action: "panettone_method"
  get "/figgy-pudding", controller: "products", action: "figgy_pudding_method"
end
