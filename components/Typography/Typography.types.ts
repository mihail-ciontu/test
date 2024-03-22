import { ReactNode } from 'react';

import { TypographyType } from '@/interfaces/typography';
import { ColorName } from '@/theme/colors/colors.types';

export type TypographyProps = {
  children: ReactNode;
  variant: TypographyType;
  color: ColorName;
  customColor?: string;
  textAlign?: 'auto' | 'center' | 'left' | 'right';
};
