var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: "./source/_js_dev/entry.js",
  output: {
    path: __dirname,
    filename: "./source/javascripts/application.js"
  },
  resolve: {
    root: [path.join(__dirname, "bower_components")]
  },
  plugins: [
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
    ),
    new webpack.optimize.UglifyJsPlugin()
  ]
};
