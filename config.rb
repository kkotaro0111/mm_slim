###
# Page options, layouts, aliases and proxies
###


# set :js_dir, 'js'
# set :css_dir, 'css'
# set :images_dir, 'out_images'

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Set slim-lang output style
Slim::Engine.set_default_options :pretty => true

# Compass options
# # REF: https://gist.github.com/1246187
compass_config do |config|
  config.output_style = :nested
  config.sass_options = { :line_comments => false }
end

activate :external_pipeline,
         name: :webpack,
         command: build? ? "npm run build":"npm run watch",
         source: "./.tmp/"
ignore '_js_dev/*'
# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

set :relative_links, true
activate :relative_assets
# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  set :build_dir, './build'
end
