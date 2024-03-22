import { View } from 'react-native';

import { useThemeStore } from '@/store/theme/theme.store';

import { IconProps } from './Icon.types';

const Icon = ({ children: Icon, color }: IconProps) => {
  const { theme } = useThemeStore();

  return <View>{Icon && <Icon color={color ? theme.colors[color] : theme.colors.brand100} />}</View>;
};

export default Icon;
