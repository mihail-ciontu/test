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
    textContainer: {
      gap: theme.spacing[16],
    },
    buttonsContainer: {
      marginTop: theme.spacing[24],
      gap: theme.spacing[8],
    },
    inputsContainer: {
      gap: theme.spacing[16],
      marginTop: theme.spacing[12],
      flex: 1,
    },
    contactContainer: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'center',
      alignItems: 'center',
      gap: theme.spacing[2],
    },
  });
