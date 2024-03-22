import { ElementType } from 'react';
import { NativeSyntheticEvent, TextInputFocusEventData } from 'react-native';

import { ColorName } from '@/theme/colors/colors.types';

export type InputMode = 'default' | 'number-pad' | 'decimal-pad' | 'numeric' | 'email-address' | 'phone-pad' | 'url' | undefined;
export type InputType = 'text' | 'number' | 'email' | 'password' | 'tel';
export type InputTypeMode = Record<InputType, InputMode>;

export type InputProps = {
  value: string;
  name: string;
  handleChange: (value: string) => void;
  label: string;
  handleBlur?: (event: NativeSyntheticEvent<TextInputFocusEventData>) => void;
  handleFocus?: (event: NativeSyntheticEvent<TextInputFocusEventData>) => void;
  type?: InputType;
  message?: string;
  hasError?: boolean;
  placeholder?: string;
  width?: number;
  leftIcon?: ElementType;
  leftIconColor?: ColorName;
  rightIcon?: ElementType;
  rightIconColor?: ColorName;
  isDisabled?: boolean;
  maxLength?: number;
  isRequired?: boolean;
  shouldAutoCapitalize?: boolean;
  isMultiline?: boolean;
  shouldDisplayRemainingCharacters?: boolean;
  // android only property
  numberOfLines?: number;
};

export type MobileInputProps = Omit<
  InputProps,
  | 'type'
  | 'leftIcon'
  | 'leftIconColor'
  | 'rightIcon'
  | 'rightIconColor'
  | 'maxLength'
  | 'shouldAutoCapitalize'
  | 'isMultiline'
  | 'shouldDisplayRemainingCharacters'
  | 'numberOfLines'
>;
