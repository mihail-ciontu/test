/* eslint-disable @typescript-eslint/ban-types */
import { BottomTabNavigationProp } from '@react-navigation/bottom-tabs';
import { NavigationProp } from '@react-navigation/native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';

import { SCREENS } from '@/constants/screens';

type StackParamList = {
  Login: {};
  ForgotPassword: {};
  ConfirmationCode: {
    email: string;
    phoneNumber: string;
  };
};

type RootBottomParamList = {
  News: {};
};

/**
 * TODO: Add the correct types for the navigation props
 * https://stackoverflow.com/questions/68667766/react-native-typescript-string-is-not-assignable-to-parameter-of-type-never
 */
export type NavigationProps = NavigationProp<any>;
