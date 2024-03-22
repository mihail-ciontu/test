import theme from '@/theme';

export type ThemeType = typeof theme;

export type ThemeColorPercentageProps = {
  percentage: number;
  type: 'lighter' | 'darker';
  name: string;
};
