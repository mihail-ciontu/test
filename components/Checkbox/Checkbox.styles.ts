import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      flexDirection: 'row',
      gap: theme.spacing[8],
      alignItems: 'center',
    },
    checkboxContainer: {
      backgroundColor: theme.colors.white,
      borderWidth: 1,
      borderColor: theme.colors.grey40,
      width: 20,
      height: 20,
      borderRadius: theme.radiuses[4],
      justifyContent: 'center',
      alignItems: 'center',
    },
    checkboxChecked: {
      backgroundColor: theme.colors.brand100,
      borderColor: theme.colors.brand100,
    },
    checkboxDisabled: {
      backgroundColor: theme.colors.grey30,
      borderColor: theme.colors.grey30,
    },
  });
