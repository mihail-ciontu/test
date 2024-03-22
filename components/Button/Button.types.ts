import { ElementType, ReactNode } from 'react';

import { ColorName } from '@/theme/colors/colors.types';

export type Variant = 'primary' | 'secondary' | 'link' | 'text';
type Size = 'large' | 'medium' | 'small';
type Width = '100%' | number;

export type ButtonProps = {
  children?: ReactNode;
  handlePress: () => void;
  isDisabled?: boolean;
  isLoading?: boolean;
  size?: Size;
  variant?: Variant;
  id?: string;
  width?: Width;
  isRounded?: boolean;
  leftIcon?: ElementType;
  rightIcon?: ElementType;
};

export type ButtonColors = {
  default: ColorName;
  disabled: ColorName;
};
