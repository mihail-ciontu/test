import { FormikProps, useFormik } from 'formik';
import { useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Linking, Pressable, View } from 'react-native';
import { useNavigation } from '@react-navigation/native';

import Button from '@/components/Button';
import HorizontalSeparator from '@/components/HorizontalSeparator';
import Input from '@/components/Inputs/Inputs/Input';
import MobileInput from '@/components/Inputs/Inputs/MobileInput';
import Typography from '@/components/Typography';
import { SUPPORT_EMAIL } from '@/constants/common';
import { SCREENS } from '@/constants/screens';
import KeyboardAvoidingViewContainer from '@/containers/KeyboardAvoidingView';
import { useNotification } from '@/hooks/useNotification';
import { NavigationProps } from '@/interfaces/navigation';
import { mobileLogin } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';

import { ADDITIONAL_KEYBOARD_OFFSET, INITIAL_LOGIN_VALUES } from './MobileLoginScreen.constants';
import { createStyles } from './MobileLoginScreen.styles';
import { MobileNumberFormProps } from './MobileLoginScreen.types';
import { mobileNumberLoginValidationSchema } from './MobileLoginScreen.validation';

const MobileLoginScreen = () => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const { t } = useTranslation('login');
  const navigation = useNavigation<NavigationProps>();
  const { showNotification } = useNotification();
  const translatedMobileNumberValidationSchema = mobileNumberLoginValidationSchema(t);
  const [isLoggingIn, setIsLoggingIn] = useState(false);

  const handleLogin = async ({ mobileNumber, password }: MobileNumberFormProps) => {
    setIsLoggingIn(true);
    const response = await mobileLogin({
      mobileNumber,
      password,
    });
    setIsLoggingIn(false);

    if (response.type === 'error') {
      showNotification({ title: response.message, description: t('errors.mobileCredentials'), type: 'error' });
      loginData.setFieldError('mobileNumber', t('errors.mobileCredentials'));
      loginData.setFieldError('password', t('errors.mobileCredentials'));
    }
  };

  const loginData: FormikProps<MobileNumberFormProps> = useFormik({
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
          {t('mobile.description')}
        </Typography>
      </View>
      <View style={styles.inputsContainer}>
        <MobileInput
          name="mobileNumber"
          value={loginData.values.mobileNumber}
          handleChange={loginData.handleChange('mobileNumber')}
          handleBlur={loginData.handleBlur('mobileNumber')}
          label={t('mobile.label')}
          hasError={loginData.touched.mobileNumber && Boolean(loginData.errors.mobileNumber)}
          message={loginData.touched.mobileNumber ? loginData.errors.mobileNumber : ''}
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
          <Pressable onPress={() => navigation.navigate(SCREENS.AUTH.FORGOT_PASSWORD, { type: 'mobile' })}>
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
        <Button handlePress={() => navigation.navigate(SCREENS.AUTH.EMAIL_LOGIN)} variant="text" isDisabled={isLoggingIn}>
          {t('buttons.emailSignIn')}
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

export default MobileLoginScreen;
