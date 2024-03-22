import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      alignItems: 'center',
      justifyContent: 'center',
      borderRadius: theme.radiuses[4],
      backgroundColor: theme.colors.brand100,
    },
    fallback: {
      width: '100%',
      height: '100%',
      alignItems: 'center',
      justifyContent: 'center',
    },
  });
