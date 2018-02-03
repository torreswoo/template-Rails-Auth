# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( lib/mustache.js lib/select2.js lib/select2.css )
Rails.application.config.assets.precompile += %w( permission_policy.js )
Rails.application.config.assets.precompile += %w( login.scss permission_policy.scss)
# Rails.application.config.assets.precompile += %w( odometer-theme-*.css noty.css select2.css)
