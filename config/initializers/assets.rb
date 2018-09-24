# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( common/common.css )
Rails.application.config.assets.precompile += %w( template/template.css )
Rails.application.config.assets.precompile += %w( dashboard/dashboard.css )
Rails.application.config.assets.precompile += %w( top/top.css )
Rails.application.config.assets.precompile += %w( register/register.css )
Rails.application.config.assets.precompile += %w( register/registerComp.css )
Rails.application.config.assets.precompile += %w( authentication/authentication.css )
Rails.application.config.assets.precompile += %w( receipt/receipt.css )
Rails.application.config.assets.precompile += %w( receipt/create.css )
Rails.application.config.assets.precompile += %w( receipt/patch.css )
Rails.application.config.assets.precompile += %w( family/family.css )
Rails.application.config.assets.precompile += %w( family/patch.css )
Rails.application.config.assets.precompile += %w( resetPassword/resetPassword.css )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
