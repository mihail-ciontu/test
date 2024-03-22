import { useMemo } from 'react';
import { Text } from 'react-native';

import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './Typography.styles';
import { TypographyProps } from './Typography.types';

const Typography = ({ children, variant, color, textAlign, customColor }: TypographyProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);

  return <Text style={[styles[variant], { color: customColor || theme.colors[color], textAlign }]}>{children}</Text>;
};

export default Typography;
