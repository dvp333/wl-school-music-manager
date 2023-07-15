const _prefix = 'packages/design_system/assets';

enum ThemeAssets {
  dark('$_prefix/theme_dark.json'),
  light('$_prefix/theme_light.json');

  const ThemeAssets(this.asset);

  final String asset;
}
