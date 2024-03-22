import { getI18n } from 'react-i18next';

import { API_USER_ROUTES } from '@omir-monorepo/common/constants/apiRoutes';
import { ErrorProps, VoidProps } from '@omir-monorepo/common/interfaces/services';
import { generateOrganisationPhoneEmail } from '@omir-monorepo/common/utils/organisation';

import axios from '@/config/axios';
import { supabase } from '@/config/supabase';
import { useOrganisationAccessStore } from '@/store/organisation/access/organisationAccess.store';
import { useOrganisationPublicStore } from '@/store/organisation/public/organisationPublic.store';
import { useThemeStore } from '@/store/theme/theme.store';
import { useUserStore } from '@/store/user/user.store';

import { matchApiError, matchSupabaseError } from '../services.utils';

import {
  EmailLoginProps,
  MobileLoginProps,
  RequestSetNewPasswordProps,
  RequestVerifyCodeProps,
  ResponseVerifyResetPasswordCodeProps,
} from './Auth.types';

export const emailLogin = async ({ email, password }: EmailLoginProps): Promise<VoidProps | ErrorProps> => {
  const { t } = getI18n();
  const { error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });

  if (error) {
    return {
      type: 'error',
      message: matchSupabaseError(error, t('login:errors.login')),
    };
  }

  return {
    type: 'void',
  };
};

export const mobileLogin = async ({ mobileNumber, password }: MobileLoginProps): Promise<VoidProps | ErrorProps> => {
  const { t } = getI18n();
  const mobileEmail = generateOrganisationPhoneEmail(mobileNumber);

  if (!mobileEmail) {
    return {
      type: 'error',
      message: t('login:errors.login'),
    };
  }

  const { error } = await supabase.auth.signInWithPassword({
    email: mobileEmail,
    password,
  });

  if (error) {
    return {
      type: 'error',
      message: matchSupabaseError(error, t('login:errors.login')),
    };
  }

  return {
    type: 'void',
  };
};

// TODO: To be updated
export const logout = async () => {
  await supabase.auth.signOut();

  // CLEAN UP USER DATA and ALL STORE DATA

  // USER
  useUserStore.getState().clearUserListener();
  useUserStore.getState().resetUser();

  // THEME
  useThemeStore.getState().setTheme('');

  // ORGANISATION
  useOrganisationPublicStore.getState().clearOrganisationListener();
  useOrganisationPublicStore.getState().resetOrganisation();

  // ORGANISATION ACCESS
  useOrganisationAccessStore.getState().clearOrganisationAccessListener();
  useOrganisationAccessStore.getState().resetOrganisationAccess();
};

export const requestResetEmailPassword = async (email: string): Promise<VoidProps | ErrorProps> => {
  const { t } = getI18n();

  try {
    await axios.post(API_USER_ROUTES.USER_CODE_RESET_PASSWORD, {
      email,
    });

    return {
      type: 'void',
    };
  } catch (error) {
    return {
      type: 'error',
      message: matchApiError(error, t('login:errors.requestResetPassword')),
    };
  }
};
export const requestResetMobilePassword = async (mobileNumber: string): Promise<VoidProps | ErrorProps> => {
  const { t } = getI18n();

  try {
    await axios.post(API_USER_ROUTES.USER_CODE_RESET_PASSWORD, {
      phoneNumber: mobileNumber,
    });

    return {
      type: 'void',
    };
  } catch (error) {
    return {
      type: 'error',
      message: matchApiError(error, t('login:errors.requestResetPassword')),
    };
  }
};

export const verifyResetPasswordCode = async ({
  code,
  email,
  phoneNumber,
}: RequestVerifyCodeProps): Promise<ResponseVerifyResetPasswordCodeProps | ErrorProps> => {
  const { t } = getI18n();

  try {
    const phoneNumberWithoutPlus = phoneNumber?.replace('+', '');
    const response = await axios.get(
      `${API_USER_ROUTES.USER_CODE_RESET_VERIFY}?code=${code}&email=${email}&phoneNumber=${phoneNumberWithoutPlus}`,
    );

    return {
      type: 'data',
      result: response.data.result,
    };
  } catch (error) {
    return {
      type: 'error',
      message: matchApiError(error, t('login:errors.verifyResetPasswordCode')),
    };
  }
};

export const setNewPassword = async ({
  code,
  confirmPassword,
  email,
  password,
  phoneNumber,
}: RequestSetNewPasswordProps): Promise<VoidProps | ErrorProps> => {
  const { t } = getI18n();

  try {
    const phoneNumberWithoutPlus = phoneNumber?.replace('+', '');
    await axios.post(API_USER_ROUTES.USER_CODE_RESET_PASSWORD_CHANGE, {
      password,
      confirmPassword,
      code,
      email,
      phoneNumber: phoneNumberWithoutPlus,
    });

    return {
      type: 'void',
    };
  } catch (error) {
    console.log('err', error);
    return {
      type: 'error',
      message: matchApiError(error, t('login:errors.requestResetPassword')),
    };
  }
};
