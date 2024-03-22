import { FormikProps, useFormik } from 'formik';
import { useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Linking, Pressable, View } from 'react-native';
import { useNavigation } from '@react-navigation/native';

import Button from '@/components/Button';
import HorizontalSeparator from '@/components/HorizontalSeparator';
import Input from '@/components/Inputs/Inputs/Input';
import Typography from '@/components/Typography';
import { SUPPORT_EMAIL } from '@/constants/common';
import { SCREENS } from '@/constants/screens';
import KeyboardAvoidingViewContainer from '@/containers/KeyboardAvoidingView';
import { useNotification } from '@/hooks/useNotification';
import { NavigationProps } from '@/interfaces/navigation';
import { emailLogin } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';

import { ADDITIONAL_KEYBOARD_OFFSET, INITIAL_LOGIN_VALUES } from './EmailLoginScreen.constants';
import { createStyles } from './EmailLoginScreen.styles';
import { EmailFormProps } from './EmailLoginScreen.types';
import { emailLoginValidationSchema } from './EmailLoginScreen.validation';

const EmailLoginScreen = () => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const { t } = useTranslation('login');
  const navigation = useNavigation<NavigationProps>();
  const { showNotification } = useNotification();
  const translatedMobileNumberValidationSchema = emailLoginValidationSchema(t);
  const [isLoggingIn, setIsLoggingIn] = useState(false);

  const handleLogin = async ({ email, password }: EmailFormProps) => {
    setIsLoggingIn(true);
    const response = await emailLogin({
      email,
      password,
    });
    setIsLoggingIn(false);

    if (response.type === 'error') {
      showNotification({ title: response.message, description: t('errors.emailCredentials'), type: 'error' });
      loginData.setFieldError('email', t('errors.emailCredentials'));
      loginData.setFieldError('password', t('errors.emailCredentials'));
    }
  };

  const loginData: FormikProps<EmailFormProps> = useFormik({
    initialValues: {
      ...INITIAL_LOGIN_VALUES,
    },
    onSubmit: handleLogin,
    validationSchema: translatedMobileNumberValidationSchema,
  });

  return (
    <KeyboardAvoidingViewContainer style={styles.container} additionalKeyboardVerticalOffset={ADDITIONAL_KEYBOARD_OFFSET} withScrollView>
      <View style={styles.descriptionContainer}>
        <Typography variant="heading1" color="fg.base">
          {t('title')}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted">
          {t('email.description')}
        </Typography>
      </View>
      <View style={styles.inputsContainer}>
        <Input
          name="email"
          value={loginData.values.email}
          handleChange={loginData.handleChange('email')}
          handleBlur={loginData.handleBlur('email')}
          label={t('email.label')}
          type="email"
          hasError={loginData.touched.email && Boolean(loginData.errors.email)}
          message={loginData.touched.email ? loginData.errors.email : ''}
        />
        <Input
          name="password"
          value={loginData.values.password}
          handleChange={loginData.handleChange('password')}
          handleBlur={loginData.handleBlur('password')}
          label={t('password.label')}
          type="password"
          hasError={loginData.touched.password && Boolean(loginData.errors.password)}
          message={loginData.touched.password ? loginData.errors.password : ''}
        />
        <View style={styles.forgotPasswordContainer}>
          <Pressable onPress={() => navigation.navigate(SCREENS.AUTH.FORGOT_PASSWORD, { type: 'email' })}>
            <Typography variant="labelMediumBold" color="fg.subtle">
              {t('buttons.forgotPassword')}
            </Typography>
          </Pressable>
        </View>
      </View>
      <View style={styles.buttonsContainer}>
        <Button
          handlePress={loginData.handleSubmit}
          isLoading={isLoggingIn}
          isDisabled={
            Object.values(loginData.errors || {}).length > 0 ||
            Object.values(loginData.values || {}).some((field) => field === '') ||
            isLoggingIn
          }
        >
          {t('buttons.continue')}
        </Button>
        <Button handlePress={() => navigation.navigate(SCREENS.AUTH.MOBILE_LOGIN)} variant="text" isDisabled={isLoggingIn}>
          {t('buttons.mobileSignIn')}
        </Button>
        <HorizontalSeparator />
        <View style={styles.contactContainer}>
          <Typography variant="paragraphMedium" color="fg.muted" textAlign="center">
            {t('haveIssues')}
          </Typography>
          <Pressable onPress={() => Linking.openURL(`mailto:${SUPPORT_EMAIL}`)}>
            <Typography variant="paragraphMedium" color="brand100" textAlign="center">
              {SUPPORT_EMAIL}
            </Typography>
          </Pressable>
        </View>
      </View>
    </KeyboardAvoidingViewContainer>
  );
};

export default EmailLoginScreen;
