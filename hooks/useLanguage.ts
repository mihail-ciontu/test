import { useEffect, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { NativeModules } from 'react-native';

import { Language } from '@omir-monorepo/common/interfaces/language';

const getDeviceSupportedLanguage = (language = ''): Language => {
  if (language.toLowerCase().includes('en')) {
    return 'en';
  }

  if (language.toLowerCase().includes('ru')) {
    return 'ru';
  }

  if (language.toLowerCase().includes('kz')) {
    return 'kaz';
  }

  return 'en';
};

const getUserDeviceLanguage = (language = ''): string => {
  return language;
};

export const useLanguage = () => {
  const { i18n } = useTranslation();
  const [userDeviceSupportedLanguage, setUserDeviceSupportedLanguage] = useState<Language>('en');
  const [userDeviceLanguage, setUserDeviceLanguage] = useState('');

  const changeLanguage = (language: Language) => {
    i18n.changeLanguage(language);
  };

  useEffect(() => {
    const iOSLocale = NativeModules?.SettingsManager?.settings?.AppleLocale || NativeModules?.SettingsManager?.settings?.AppleLocales?.[0];
    const androidLocale = NativeModules?.I18nManager?.localeIdentifier;

    const deviceSupportedLanguage = getDeviceSupportedLanguage(iOSLocale || androidLocale);
    const userDeviceLanguage = getUserDeviceLanguage(iOSLocale || androidLocale);

    setUserDeviceSupportedLanguage(deviceSupportedLanguage);
    setUserDeviceLanguage(userDeviceLanguage);
  }, []);

  return {
    changeLanguage,
    currentLanguage: i18n.language as Language,
    userDeviceSupportedLanguage,
    userDeviceLanguage,
  };
};
