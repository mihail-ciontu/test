import { StyleSheet } from 'react-native';

import { TYPOGRAPHY_VARIANTS } from '@/constants/typography';
import { ThemeType } from '@/interfaces/common';

import { MOBILE_CODE_WIDTH } from './Input.constants';

export const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      gap: theme.spacing[4],
      width: '100%',
    },
    inputContainer: {
      position: 'relative',
      backgroundColor: theme.colors['bg.subtle'],
      borderRadius: theme.radiuses[8],
      borderColor: theme.colors['border.subtle'],
      borderWidth: 1,
      paddingHorizontal: theme.spacing[16],
      paddingBottom: theme.spacing[8],
      paddingTop: theme.spacing[20],
      flexDirection: 'row',
      alignItems: 'center',
      minHeight: 48,
    },
    inputContainerLeftIcon: {
      paddingLeft: theme.spacing[40],
    },
    inputContainerRightIcon: {
      paddingRight: theme.spacing[40],
    },
    error: {
      borderColor: theme.colors['border.error'],
      backgroundColor: theme.colors['bg.error'],
    },
    input: {
      flex: 1,
      ...TYPOGRAPHY_VARIANTS.labelMediumRegular,
    },
    inputMobileContainer: {
      paddingBottom: 0,
      paddingTop: 0,
      height: 48,
    },
    mobileInput: {
      paddingBottom: theme.spacing[8],
      paddingTop: theme.spacing[20],
    },
    iconRightContainer: {
      position: 'absolute',
      right: theme.spacing[16],
    },
    iconLeftContainer: {
      position: 'absolute',
      left: theme.spacing[16],
    },
    remainingCharacters: {
      display: 'flex',
      alignItems: 'flex-end',
    },
    messageTextMultiline: {
      marginRight: theme.spacing[16],
      maxWidth: '80%',
    },
    messageText: {
      alignItems: 'flex-start',
      flex: 1,
    },
    textAreaMessageContainer: {
      flexDirection: 'row',
      marginHorizontal: theme.spacing[20],
      gap: theme.spacing[16],
    },
    labelContainer: {
      position: 'absolute',
      top: theme.spacing[4],
      left: theme.spacing[16],
      alignSelf: 'flex-start',
    },
    labelMobileContainer: {
      left: MOBILE_CODE_WIDTH + theme.spacing[16],
    },
    countryCodeContainer: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: theme.spacing[4],
      width: MOBILE_CODE_WIDTH,
      height: '100%',
    },
  });
