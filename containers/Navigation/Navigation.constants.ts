import { NativeStackNavigationOptions } from '@react-navigation/native-stack';

const ANIMATION_DURATION = 300;

export const AUTH_NO_HEADER_NAVIGATION_OPTIONS: NativeStackNavigationOptions = {
  headerShown: false,
  animation: 'simple_push',
  animationDuration: ANIMATION_DURATION,
  gestureEnabled: false,
  headerBackTitleVisible: false,
};

export const NON_AUTH_NAVIGATION_OPTIONS: NativeStackNavigationOptions = {
  headerTitle: '',
  headerShadowVisible: false,
  gestureEnabled: false,
  animation: 'simple_push',
  animationDuration: ANIMATION_DURATION,
  headerBackTitleVisible: false,
};
