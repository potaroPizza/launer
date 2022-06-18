const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
    entry: {
      'js/app': ['./src/main/npm/js/app.js'],
      'css/app': ['./src/main/npm/sass/app.scss'],
    },
    output: {
      path: path.resolve(__dirname, 'src/main/webapp/'),
      publicPath: '/',
    },
    plugins: [
      // 컴파일 + 번들링 CSS 파일이 저장될 경로와 이름 지정
      new MiniCssExtractPlugin({ filename: 'css/app.css' })
    ],
    module: {
        rules: [
            {
                // this is so that we can compile any React,
                // ES6 and above into normal ES5 syntax
                test: /\.(js|jsx)$/,
                // we do not want anything from node_modules to be compiled
                exclude: /node_modules/,
                use: ['babel-loader']
            },
            {
                test: /\.(css|scss)$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader", // translates CSS into CommonJS
                    "sass-loader" // compiles Sass to CSS, using Node Sass by default
                ]
            }
        ]
    }
}