import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    cell: {
      width: 48,
      height: 48,
      borderRadius: theme.radiuses[9999],
      borderWidth: 1,
      borderColor: theme.colors['border.subtle'],
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: theme.colors['bg.canvas'],
    },
    focusCell: {
      borderColor: theme.colors.brand100,
    },
    errorCell: {
      borderColor: theme.colors['border.error'],
      backgroundColor: theme.colors['bg.error'],
    },
    disabledCell: {
      borderColor: theme.colors['border.disabled'],
      backgroundColor: theme.colors['bg.disabled'],
    },
  });
