import { FormikProps, useFormik } from 'formik';
import { useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { View } from 'react-native';
import { useNavigation, useRoute } from '@react-navigation/native';

import Button from '@/components/Button';
import Input from '@/components/Inputs/Inputs/Input';
import MobileInput from '@/components/Inputs/Inputs/MobileInput';
import Typography from '@/components/Typography';
import { SCREENS } from '@/constants/screens';
import KeyboardAvoidingView from '@/containers/KeyboardAvoidingView';
import { useNotification } from '@/hooks/useNotification';
import { NavigationProps } from '@/interfaces/navigation';
import { requestResetEmailPassword, requestResetMobilePassword } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';

import {
  ADDITIONAL_KEYBOARD_OFFSET,
  INITIAL_RESET_EMAIL_FORM_VALUES,
  INITIAL_RESET_MOBILE_NUMBER_FORM_VALUES,
} from './ForgotPasswordScreen.constants';
import { createStyles } from './ForgotPasswordScreen.styles';
import { EmailFormProps, MobileNumberFormProps, ParamsType } from './ForgotPasswordScreen.types';
import { emailValidationSchema, mobileNumberValidationSchema } from './ForgotPasswordScreen.validation';

const ForgotPassword = () => {
  const { params } = useRoute();
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const navigation = useNavigation<NavigationProps>();
  const { showNotification } = useNotification();
  const { t } = useTranslation('login');
  const [isLoading, setIsLoading] = useState(false);
  const isEmailRecoveryType = useMemo(() => (params as ParamsType)?.type === 'email', [params]);
  const translatedValidationSchema = isEmailRecoveryType ? emailValidationSchema(t) : mobileNumberValidationSchema(t);

  const handleEmailPasswordReset = async (values: EmailFormProps) => {
    setIsLoading(true);
    const response = await requestResetEmailPassword(values.email);
    setIsLoading(false);

    if (response.type === 'error') {
      showNotification({ title: response.message, type: 'error' });
      emailFormData.setFieldError('email', response.message);
      emailFormData.setFieldError('password', response.message);
      return;
    }

    navigation.navigate(SCREENS.AUTH.CONFIRMATION_CODE, {
      email: values.email,
    });
  };

  const handleMobileNumberPasswordReset = async (values: MobileNumberFormProps) => {
    setIsLoading(true);
    const response = await requestResetMobilePassword(values.mobileNumber);
    setIsLoading(false);

    if (response.type === 'error') {
      showNotification({ title: response.message, type: 'error' });
      emailFormData.setFieldError('mobileNumber', response.message);
      emailFormData.setFieldError('password', response.message);
      return;
    }

    navigation.navigate(SCREENS.AUTH.CONFIRMATION_CODE, {
      phoneNumber: values.mobileNumber,
    });
  };

  const emailFormData: FormikProps<EmailFormProps> = useFormik({
    initialValues: INITIAL_RESET_EMAIL_FORM_VALUES,
    onSubmit: handleEmailPasswordReset,
    validationSchema: translatedValidationSchema,
  });

  const mobileNumberFormData: FormikProps<MobileNumberFormProps> = useFormik({
    initialValues: INITIAL_RESET_MOBILE_NUMBER_FORM_VALUES,
    onSubmit: handleMobileNumberPasswordReset,
    validationSchema: translatedValidationSchema,
  });

  const currentFormData = isEmailRecoveryType ? emailFormData : mobileNumberFormData;

  return (
    <KeyboardAvoidingView style={styles.container} additionalKeyboardVerticalOffset={ADDITIONAL_KEYBOARD_OFFSET} withScrollView>
      <View style={styles.descriptionContainer}>
        <Typography variant="heading1" color="fg.base">
          {t('passwordRecovery.title')}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted">
          {t(`passwordRecovery.${isEmailRecoveryType ? 'enterEmail' : 'enterMobileNumber'}`)}
        </Typography>
      </View>
      <View style={styles.inputsContainer}>
        {isEmailRecoveryType ? (
          <Input
            name="email"
            value={emailFormData.values.email}
            handleChange={emailFormData.handleChange('email')}
            handleBlur={emailFormData.handleBlur('email')}
            label={t('email.label')}
            type="email"
            hasError={emailFormData.touched.email && Boolean(emailFormData.errors.email)}
            message={emailFormData.touched.email ? emailFormData.errors.email : ''}
          />
        ) : (
          <MobileInput
            name="mobileNumber"
            value={mobileNumberFormData.values.mobileNumber}
            handleChange={mobileNumberFormData.handleChange('mobileNumber')}
            handleBlur={mobileNumberFormData.handleBlur('mobileNumber')}
            label={t('mobile.label')}
            hasError={mobileNumberFormData.touched.mobileNumber && Boolean(mobileNumberFormData.errors.mobileNumber)}
            message={mobileNumberFormData.touched.mobileNumber ? mobileNumberFormData.errors.mobileNumber : ''}
          />
        )}
        <Typography variant="paragraphExtraSmall" color="fg.subtle">
          {isEmailRecoveryType ? t('passwordRecovery.emailInfo') : t('passwordRecovery.mobileInfo')}
        </Typography>
      </View>
      <View style={styles.buttonsContainer}>
        <Button
          handlePress={isEmailRecoveryType ? emailFormData.handleSubmit : mobileNumberFormData.handleSubmit}
          isLoading={isLoading}
          isDisabled={
            isLoading ||
            Object.values(currentFormData.errors || {}).length > 0 ||
            Object.values(currentFormData.values || {}).some((field) => field === '')
          }
        >
          {t('buttons.continue')}
        </Button>
        <Button handlePress={() => navigation.goBack()} isDisabled={isLoading} variant="text">
          {t(`buttons.${isEmailRecoveryType ? 'emailSignIn' : 'mobileSignIn'}`)}
        </Button>
      </View>
    </KeyboardAvoidingView>
  );
};

export default ForgotPassword;
