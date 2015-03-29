Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "588609301404-9g9sg2ps92qp5hedgmfprljelbi2a1ju.apps.googleusercontent.com", "_uCoVViT-lw76ylxY8Bb0gUm",
           {
               :name => "google",
               :scope => "email, profile, plus.me, http://gdata.youtube.com",
               :prompt => "select_account",
               :image_aspect_ratio => "square",
               :image_size => 50
           }
end