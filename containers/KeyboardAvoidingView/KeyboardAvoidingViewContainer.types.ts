import { ReactNode } from 'react';
import { StyleProp, ViewStyle } from 'react-native';

export type KeyboardAvoidingViewContainerProps = {
  children: ReactNode;
  keyboardVerticalOffset?: number;
  additionalKeyboardVerticalOffset?: number;
  style?: StyleProp<ViewStyle>;
  withScrollView?: boolean;
};
