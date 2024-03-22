import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      backgroundColor: theme.colors['bg.canvas'],
      paddingHorizontal: theme.spacing[16],
      paddingTop: theme.spacing[20],
      gap: theme.spacing[24],
      flex: 1,
    },
  });