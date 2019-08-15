module.exports = {
  presets: [
    [
      '@babel/preset-env',
      {
        targets: {
          node: 'current',
        },
      },
    ],
    'next/babel',
    '@zeit/next-typescript/babel',
  ],
  babelrcRoots: ['.', './frontend/common/*', './scripts/*'],
}
