import { TFunction } from 'i18next';
import { object, Schema, string } from 'yup';

import { MIN_MOBILE_NUMBER_LENGTH } from '@omir-monorepo/common/constants/organisation';
import { PHONE_NUMBER_REGEX } from '@omir-monorepo/common/constants/regex';

import { MobileNumberFormProps } from './MobileLoginScreen.types';

export const mobileNumberLoginValidationSchema = (t: TFunction): Schema<MobileNumberFormProps> =>
  object().shape({
    mobileNumber: string()
      .required(t('mobile.input.required'))
      .test('mobileNumber', (value, { createError, path }) => {
        if (!PHONE_NUMBER_REGEX.test(value) || value.length < MIN_MOBILE_NUMBER_LENGTH) {
          return createError({
            path,
            message: t('mobile.input.valid'),
          });
        }

        return true;
      }),
    password: string().required(t('password.input.required')),
  });
