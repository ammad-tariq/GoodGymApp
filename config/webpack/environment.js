const { environment } = require('@rails/webpacker')

// Ensure babel-loader is configured
const babelLoader = environment.loaders.get('babel')
babelLoader.use.find(item => item.loader === 'babel-loader').options = {
  cacheDirectory: true,
  presets: ['@babel/preset-env', '@babel/preset-react'],
  plugins: [
    '@babel/plugin-proposal-class-properties',
    '@babel/plugin-proposal-private-methods',
    '@babel/plugin-proposal-private-property-in-object'
  ]
}

module.exports = environment
