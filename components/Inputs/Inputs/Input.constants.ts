import { InputTypeMode } from './Input.types';

export const DEFAULT_INPUT_HEIGHT = 40;
export const DEFAULT_TEXT_AREA_HEIGHT = 89;
export const ANIMATION_DURATION = 200;

export const INPUT_MODE: InputTypeMode = {
  text: 'default',
  password: 'default',
  email: 'email-address',
  number: 'numeric',
  tel: 'phone-pad',
};

export const Y_LABEL_ANIMATION = {
  inputRange: [0, 1],
  outputRange: [-2, 9],
};

export const SCALE_MESSAGE_ANIMATION = {
  inputRange: [0, 1],
  outputRange: [1, 1.1],
};

export const MOBILE_CODE_WIDTH = 96;
