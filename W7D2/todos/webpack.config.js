const path = require('path');

module.exports = {
  entry: './frontend/todo_redux.jsx',
  output: {
    filename: './app/assets/javascripts/bundle.js',
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
  // scripts: {
  //   'postinstall': 'webpack',
  //   'webpack': 'webpack --watch'
  // }
};
