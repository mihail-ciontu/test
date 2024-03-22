import { create } from 'zustand';

import theme from '@/theme';
import { ColorType } from '@/theme/colors/colors.types';
import { generateThemeColors } from '@/utils/theme';

import { ThemeStoreProps } from './theme.types';

export const useThemeStore = create<ThemeStoreProps>((set) => ({
  theme,
  setTheme: (primaryColor?: string) => {
    const generatedThemeColor = generateThemeColors(primaryColor || theme.colors.brand100) as unknown as ColorType;

    set({ theme: { ...theme, colors: { ...theme.colors, ...generatedThemeColor } } });
  },
}));
