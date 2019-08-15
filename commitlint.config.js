module.exports = {
  extends: [
    '@commitlint/config-lerna-scopes',
    '@commitlint/config-conventional',
  ],
  rules: {
    'scope-enum': [0, 'always', ['deps', 'common', 'frontend', 'wordpress']],
  },
}
