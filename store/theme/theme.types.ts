import { ThemeType } from '@/interfaces/common';

export interface ThemeStoreProps {
  theme: ThemeType;
  setTheme: (primaryColor?: string) => void;
}
