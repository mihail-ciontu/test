import { TFunction } from 'i18next';
import { object, Schema, string } from 'yup';

import { EmailFormProps } from './EmailLoginScreen.types';

export const emailLoginValidationSchema = (t: TFunction): Schema<EmailFormProps> =>
  object().shape({
    email: string().required(t('email.input.required')).email(t('email.input.valid')),
    password: string().required(t('password.input.required')),
  });
