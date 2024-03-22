import { Image } from 'expo-image';
import { useMemo } from 'react';
import { useTranslation } from 'react-i18next';
import { View } from 'react-native';
import { useNavigation } from '@react-navigation/native';

import Button from '@/components/Button';
import HorizontalSeparator from '@/components/HorizontalSeparator';
import { SCREENS } from '@/constants/screens';
import { NavigationProps } from '@/interfaces/navigation';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './LoginScreen.styles';

const LoginScreen = () => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const { t } = useTranslation('login');
  const navigation = useNavigation<NavigationProps>();

  return (
    <View style={styles.container}>
      <View style={styles.logoContainer}>
        <Image source={require('@/assets/images/logo.png')} style={styles.logoImage} />
      </View>
      <HorizontalSeparator>{t('signInContinue')}</HorizontalSeparator>
      <View style={styles.buttonsContainer}>
        <Button handlePress={() => navigation.navigate(SCREENS.AUTH.MOBILE_LOGIN)}>{t('buttons.mobileSignIn')}</Button>
        <Button handlePress={() => navigation.navigate(SCREENS.AUTH.EMAIL_LOGIN)}>{t('buttons.emailSignIn')}</Button>
      </View>
    </View>
  );
};

export default LoginScreen;
