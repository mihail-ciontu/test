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
    groupContainer: {
      gap: theme.spacing[12],
    },
    buttonsContainer: {
      marginTop: theme.spacing[24],
      gap: theme.spacing[8],
      flex: 1,
      justifyContent: 'flex-end',
    },
  });
