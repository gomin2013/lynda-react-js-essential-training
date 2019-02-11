var path = require("path");

module.exports = {
  mode: "development",
  entry: "./src/index.coffee",
  output: {
    path: path.resolve(__dirname, "dist/assets"),
    publicPath: "/assets/",
    filename: "bundle.js"
  },
  devServer: {
    inline: true,
    contentBase: "./dist",
    port: 3000,
    https: true,
    headers: {
      'Access-Control-Allow-Origin': '*'
    }
  },
  module: {
    rules: [{
      test: /\.coffee$/,
      use: [
        {
          loader: 'coffee-loader',
          options: {
            transpile: {
              presets: ["latest", "react", "stage-0"]
            }
          }
        }
      ]
    },{
      test: /\.css$/,
      use: ['style-loader', 'css-loader', 'postcss-loader']
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }]
  }
};
