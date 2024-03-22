const { createMetroConfiguration } = require('expo-yarn-workspaces');

module.exports = (() => {
  // eslint-disable-next-line no-undef
  const config = createMetroConfiguration(__dirname);

  const { transformer, resolver } = config;

  config.transformer = {
    ...transformer,
    babelTransformerPath: require.resolve('react-native-svg-transformer'),
  };
  config.resolver = {
    ...resolver,
    assetExts: resolver.assetExts.filter((ext) => ext !== 'svg'),
    sourceExts: [...resolver.sourceExts, 'svg'],
  };

  return config;
})();
