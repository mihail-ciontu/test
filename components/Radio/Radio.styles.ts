import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      flexDirection: 'row',
      justifyContent: 'center',
      alignItems: 'center',
      gap: theme.spacing[6],
    },
    radioContainer: {
      height: 22,
      width: 22,
      borderRadius: theme.radiuses[16],
      borderWidth: 1,
      borderColor: theme.colors.grey40,
      alignItems: 'center',
      justifyContent: 'center',
    },
    checkedBigContainer: {
      height: 16,
      width: 16,
      borderRadius: theme.radiuses[8],
      backgroundColor: theme.colors.brand120,
      alignItems: 'center',
      justifyContent: 'center',
    },
    checkedSmallContainer: {
      backgroundColor: theme.colors.white,
      width: 5,
      height: 5,
      borderRadius: theme.radiuses[4],
    },
  });
