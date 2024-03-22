import { useMemo } from 'react';
import { View } from 'react-native';

import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './HorizontalSeparator.styles';
import { HorizontalSeparatorProps } from './HorizontalSeparator.types';

const HorizontalSeparator = ({ children }: HorizontalSeparatorProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);

  return (
    <View style={styles.container}>
      <View style={styles.line} />
      {children && (
        <>
          <Typography color="fg.subtle" variant="labelSmallBold">
            {children}
          </Typography>
          <View style={styles.line} />
        </>
      )}
    </View>
  );
};

export default HorizontalSeparator;
