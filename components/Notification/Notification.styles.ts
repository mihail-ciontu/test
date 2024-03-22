import { StyleSheet } from 'react-native';

import { TYPOGRAPHY_VARIANTS } from '@/constants/typography';
import { ThemeType } from '@/interfaces/common';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      width: '90%',
      borderLeftWidth: 0,
      paddingHorizontal: theme.spacing[16],
      paddingVertical: theme.spacing[12],
      marginHorizontal: 0,
    },
    contentContainer: {
      paddingHorizontal: 0,
    },
    success: {
      backgroundColor: theme.colors['bg.success-contrast'],
    },
    error: {
      backgroundColor: theme.colors['bg.danger-tertiary'],
    },
    title: {
      color: theme.colors['fg.on-contrast'],
      ...TYPOGRAPHY_VARIANTS.paragraphMedium,
    },
    description: {
      color: theme.colors['fg.on-contrast'],
      ...TYPOGRAPHY_VARIANTS.paragraphSmall,
    },
  });
