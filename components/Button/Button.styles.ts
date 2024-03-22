import { StyleSheet } from 'react-native';

import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      gap: theme.spacing[8],
      display: 'flex',
      backgroundColor: theme.colors.brand100,
      flexDirection: 'row',
      alignItems: 'center',
      borderColor: theme.colors.brand100,
      color: theme.colors.white,
      borderRadius: theme.radiuses[8],
      justifyContent: 'center',
    },
    rounded: {
      borderRadius: theme.radiuses[9999],
    },
    small: {
      gap: theme.spacing[6],
      height: 26,
      paddingHorizontal: theme.spacing[6],
      borderRadius: theme.radiuses[8],
    },
    medium: {
      height: 40,
      paddingVertical: theme.spacing[4],
      paddingHorizontal: theme.spacing[10],
      borderRadius: theme.radiuses[8],
    },
    large: {
      height: 48,
      paddingVertical: theme.spacing[8],
      paddingHorizontal: theme.spacing[12],
      borderRadius: theme.radiuses[8],
    },
    primary: {
      borderWidth: 1,
    },
    secondary: {
      backgroundColor: theme.colors.white,
      borderWidth: 1,
    },
    link: {
      backgroundColor: theme.colors.transparent,
    },
    text: {
      backgroundColor: theme.colors.transparent,
    },
    disabled: {
      backgroundColor: theme.colors.grey30,
      borderColor: theme.colors.grey30,
    },
    disabledText: {
      backgroundColor: theme.colors.transparent,
      borderColor: theme.colors.transparent,
    },
  });
