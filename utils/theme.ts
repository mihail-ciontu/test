import adjustColor from 'tinycolor2';

import { ColorName, ColorType } from '@omir-monorepo/common/interfaces/colors';

import { THEME_COLORS } from '@/constants/common';

export const adjustBrightness = (hex: string, percent: number) => {
  return adjustColor(hex).lighten(percent).toString();
};

export const adjustDarkness = (hex: string, percent: number) => {
  return adjustColor(hex).darken(percent).toString();
};

export const createColor = (percentage: number, type: 'lighter' | 'darker', color: string) => {
  return type === 'lighter' ? adjustBrightness(color, percentage) : adjustDarkness(color, percentage);
};

export const generateThemeColors = (primaryColor: string): Partial<Record<ColorName, ColorType>> => {
  return THEME_COLORS.reduce((acc, { percentage, type, name }) => {
    return { ...acc, [name]: createColor(percentage, type, primaryColor) };
  }, {});
};
