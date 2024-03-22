import { KeyboardAvoidingView, Platform, ScrollView } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useHeaderHeight } from '@react-navigation/elements';

import { KeyboardAvoidingViewContainerProps } from './KeyboardAvoidingViewContainer.types';

const KeyboardAvoidingViewContainer = ({
  children,
  style,
  keyboardVerticalOffset = 0,
  additionalKeyboardVerticalOffset = 0,
  withScrollView = false,
}: KeyboardAvoidingViewContainerProps) => {
  const height = useHeaderHeight();
  const insets = useSafeAreaInsets();
  const currentKeyboardVerticalOffset = height + insets.top + insets.bottom + additionalKeyboardVerticalOffset;

  return (
    <KeyboardAvoidingView
      style={style}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      keyboardVerticalOffset={keyboardVerticalOffset || currentKeyboardVerticalOffset}
    >
      {withScrollView ? <ScrollView contentContainerStyle={{ flexGrow: 1 }}>{children}</ScrollView> : children}
    </KeyboardAvoidingView>
  );
};

export default KeyboardAvoidingViewContainer;
