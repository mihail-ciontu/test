import { StyleSheet } from 'react-native';

import { TYPOGRAPHY_VARIANTS } from '@/constants/typography';
import { ThemeType } from '@/interfaces/common';

export const createStyles = (_: ThemeType) => StyleSheet.create(TYPOGRAPHY_VARIANTS);
