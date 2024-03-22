import { useMemo } from 'react';
import { Pressable, View } from 'react-native';

import CheckboxIcon from '@/assets/icons/custom/checkbox.svg';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './Checkbox.styles';
import { CheckboxProps } from './Checkbox.types';

const Checkbox = ({ isChecked, handleChange, name, isDisabled = false, label = '' }: CheckboxProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);

  return (
    <Pressable
      disabled={isDisabled}
      onPress={handleChange}
      style={({ pressed }) => [styles.container, { opacity: pressed ? 0.5 : 1 }]}
      id={name}
    >
      <View style={[styles.checkboxContainer, isChecked && styles.checkboxChecked, isDisabled && styles.checkboxDisabled]}>
        <Icon color={isDisabled && !isChecked ? 'grey30' : 'white'}>{CheckboxIcon}</Icon>
      </View>
      {label && (
        <Typography variant="labelMediumRegular" color="grey80">
          {label}
        </Typography>
      )}
    </Pressable>
  );
};

export default Checkbox;
