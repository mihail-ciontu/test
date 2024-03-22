import { useMemo } from 'react';
import { Pressable, View } from 'react-native';

import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './Radio.styles';
import { RadioProps } from './Radio.types';

const Radio = ({ isChecked, label, name, handleChange, isDisabled }: RadioProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);

  return (
    <Pressable id={name} onPress={handleChange} disabled={isDisabled} style={styles.container}>
      <View style={[styles.radioContainer, { borderColor: !isChecked || isDisabled ? theme.colors.grey40 : theme.colors.brand100 }]}>
        {isChecked ? (
          <View style={[styles.checkedBigContainer, { backgroundColor: isDisabled ? theme.colors.grey30 : theme.colors.brand100 }]}>
            <View style={styles.checkedSmallContainer} />
          </View>
        ) : null}
      </View>
      <Typography variant="labelMediumRegular" color="grey80">
        {label}
      </Typography>
    </Pressable>
  );
};

export default Radio;
