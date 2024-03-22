import { ButtonColors, Variant } from './Button.types';

export const BUTTON_COLORS: Record<Variant, ButtonColors> = {
  primary: {
    default: 'fg.on-contrast',
    disabled: 'fg.disabled',
  },
  secondary: {
    default: 'brand100',
    disabled: 'fg.disabled',
  },
  link: {
    default: 'brand100',
    disabled: 'fg.disabled',
  },
  text: {
    default: 'grey70',
    disabled: 'fg.disabled',
  },
};
