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
    descriptionContainer: {
      gap: theme.spacing[12],
    },
    inputsContainer: {
      gap: theme.spacing[16],
      marginTop: theme.spacing[12],
      flex: 1,
    },
    buttonsContainer: {
      marginTop: theme.spacing[24],
      gap: theme.spacing[8],
    },
    forgotPasswordContainer: {
      padding: theme.spacing[4],
      alignSelf: 'flex-start',
    },
    contactContainer: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'center',
      alignItems: 'center',
      gap: theme.spacing[2],
    },
  });
