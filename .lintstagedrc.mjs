export default {
  '*.{ts,tsx}': 'eslint .',
  '*.{js,jsx,ts,tsx,css,html,md,json}': 'prettier --write --ignore-path .gitignore',
};
