const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'] // Popper を指定
  })
)

const fileLoader = environment.loaders.get('file')
fileLoader.use = [
  {
    loader: 'file-loader',
    options: {
      name: '[name].[hash].[ext]',  // ハッシュ付きのファイル名を生成
      outputPath: 'images/',        // 出力先を 'public/packs/images/' に指定
      publicPath: '/packs/images/', // Webpackのpublicパスを '/packs/images/' に指定
    },
  }
]

module.exports = environment
