import { TFunction } from 'i18next';
import { object, ref, Schema, string } from 'yup';

import { PASSWORD_REGEX } from '@omir-monorepo/common/constants/regex';

import { NewPasswordFormProps } from './NewPasswordScreen.types';

export const newPasswordValidationSchema = (t: TFunction): Schema<NewPasswordFormProps> =>
  object().shape({
    password: string()
      .required(t('password.input.required'))
      .test('password', t('password.input.valid'), (value) => PASSWORD_REGEX.test(value)),
    confirmPassword: string()
      .required(t('confirmPassword.input.required'))
      .oneOf([ref('password')], t('confirmPassword.input.match')),
  });
