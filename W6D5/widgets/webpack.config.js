const path = require('path');

module.exports = {
  context: __dirname,
  entry: './frontend/widgets.jsx',
  output: {
    path: path.resolve(__dirname),
    filename: './frontend/bundle.js'
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /|.js?$/],
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'es2015']
        }
      }
    ]
  },
  devtool: 'source-maps',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
