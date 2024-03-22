import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      backgroundColor: theme.colors['bg.canvas'],
      paddingHorizontal: theme.spacing[16],
      paddingTop: theme.spacing[20],
      flex: 1,
    },
    logoContainer: {
      width: '100%',
      alignItems: 'center',
      justifyContent: 'center',
      flex: 1,
    },
    logoImage: {
      width: 240,
      height: 60,
    },
    buttonsContainer: {
      width: '100%',
      gap: theme.spacing[10],
      marginTop: theme.spacing[20],
    },
  });
