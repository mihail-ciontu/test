import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      backgroundColor: theme.colors['bg.canvas'],
      paddingHorizontal: theme.spacing[16],
      paddingTop: theme.spacing[20],
      gap: theme.spacing[32],
      flex: 1,
    },
    contentContainer: {
      gap: theme.spacing[32],
      flex: 1,
    },
    textContainer: {
      gap: theme.spacing[16],
    },
    buttonsContainer: {
      marginTop: theme.spacing[24],
      gap: theme.spacing[8],
    },
    codeInputContainer: {
      gap: theme.spacing[16],
    },
    headerTitleContainer: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'flex-end',
      marginRight: theme.spacing[16],
    },
  });
