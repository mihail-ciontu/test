import { StyleSheet } from 'react-native';

import { TYPOGRAPHY_VARIANTS } from '@/constants/typography';
import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      gap: theme.spacing[4],
      width: '100%',
    },
    inputContainer: {
      backgroundColor: theme.colors.white,
      borderRadius: theme.radiuses[8],
      borderColor: theme.colors.grey20,
      borderWidth: 1,
      paddingHorizontal: theme.spacing[12],
      paddingVertical: theme.spacing[4],
      flexDirection: 'row',
      alignItems: 'center',
      height: 40,
      justifyContent: 'space-between',
    },
    input: {
      alignItems: 'center',
      paddingRight: theme.spacing[24],
      ...TYPOGRAPHY_VARIANTS.labelMediumBold,
    },
    iconContainer: {
      position: 'absolute',
      right: theme.spacing[6],
    },
    messageText: {
      alignItems: 'flex-start',
      marginHorizontal: theme.spacing[16],
      gap: theme.spacing[16],
    },
    androidContainer: {
      paddingVertical: 0,
    },
  });
