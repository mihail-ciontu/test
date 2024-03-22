import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: theme.spacing[16],
    },
    line: {
      flex: 1,
      height: 1,
      backgroundColor: theme.colors.grey40,
    },
  });
