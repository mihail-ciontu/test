import { useMemo } from 'react';
import { ActivityIndicator, Pressable, View } from 'react-native';

import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { BUTTON_COLORS } from './Button.constants';
import { createStyles } from './Button.styles';
import { ButtonProps } from './Button.types';

const Button = ({
  children,
  handlePress,
  id,
  leftIcon,
  rightIcon,
  size = 'large',
  variant = 'primary',
  isDisabled = false,
  isRounded = false,
  isLoading = false,
  width = '100%',
}: ButtonProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const buttonTextColor = BUTTON_COLORS[variant][isDisabled ? 'disabled' : 'default'];

  return (
    <Pressable
      id={id}
      onPress={handlePress}
      disabled={isDisabled}
      style={({ pressed }) => [
        {
          opacity: pressed ? 0.5 : 1,
        },
      ]}
    >
      <View
        style={[styles.container, isDisabled && styles.disabled, isRounded && styles.rounded, styles[variant], styles[size], { width }]}
      >
        {leftIcon && <Icon color={buttonTextColor}>{leftIcon}</Icon>}
        {isLoading ? (
          <ActivityIndicator color={theme.colors.grey40} />
        ) : (
          children && (
            <Typography variant="labelMediumBold" color={buttonTextColor}>
              {children}
            </Typography>
          )
        )}
        {rightIcon && <Icon color={buttonTextColor}>{rightIcon}</Icon>}
      </View>
    </Pressable>
  );
};

export default Button;
