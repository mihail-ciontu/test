import { getI18n } from 'react-i18next';

import { ApiErrorProps, PossibleSupabaseErrorProps } from '@omir-monorepo/common/interfaces/services';

export const matchApiError = (error: unknown, defaultMessage: string) => {
  const messageKey = (error as ApiErrorProps)?.response?.data?.messageKey || '';
  const i18n = getI18n();

  const matchedError = i18n.exists(`errors:api.${messageKey}`);

  if (matchedError) {
    const translatedMessage = i18n.t(`errors:api.${messageKey}`);
    return translatedMessage;
  }

  return defaultMessage;
};

export const matchSupabaseError = (error: unknown, defaultMessage: string) => {
  const message = (error as PossibleSupabaseErrorProps)?.message || '';
  const i18n = getI18n();

  const matchedKeyError = i18n.exists(`errors:supabase.${message}`);

  if (matchedKeyError) {
    const translatedMessage = i18n.t(`errors:supabase.${message}`);
    return translatedMessage;
  }

  return defaultMessage;
};
