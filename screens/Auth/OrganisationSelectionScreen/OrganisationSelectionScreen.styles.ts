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
    textContainer: {
      gap: theme.spacing[12],
    },
    contentContainer: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      gap: theme.spacing[8],
    },
    listContainer: {
      gap: theme.spacing[12],
    },
    elementContainer: {
      flexDirection: 'row',
      alignItems: 'center',
      paddingVertical: theme.spacing[12],
      gap: theme.spacing[16],
      borderBottomWidth: 1,
      borderColor: theme.colors['bg.muted'],
    },
    image: {
      width: 40,
      height: 40,
      borderRadius: theme.radiuses[4],
    },
    iconContainer: {
      flex: 1,
      alignItems: 'flex-end',
    },
  });
