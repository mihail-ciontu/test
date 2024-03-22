import { FormikProps, useFormik } from 'formik';
import { useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Linking, Pressable, View } from 'react-native';
import { useNavigation, useRoute } from '@react-navigation/native';

import Button from '@/components/Button';
import HorizontalSeparator from '@/components/HorizontalSeparator';
import Input from '@/components/Inputs/Inputs/Input';
import Typography from '@/components/Typography';
import { SUPPORT_EMAIL } from '@/constants/common';
import { SCREENS } from '@/constants/screens';
import KeyboardAvoidingViewContainer from '@/containers/KeyboardAvoidingView';
import { useNotification } from '@/hooks/useNotification';
import { NavigationProps } from '@/interfaces/navigation';
import { setNewPassword } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';

import { ADDITIONAL_KEYBOARD_OFFSET, INITIAL_NEW_PASSWORD_VALUES } from './NewPasswordScreen.constants';
import { createStyles } from './NewPasswordScreen.styles';
import { NewPasswordFormProps, NewPasswordScreenProps } from './NewPasswordScreen.types';
import { newPasswordValidationSchema } from './NewPasswordScreen.validation';

const NewPasswordScreen = () => {
  const { t } = useTranslation('login');
  const { theme } = useThemeStore();
  const { params } = useRoute();
  const navigation = useNavigation<NavigationProps>();
  const { showNotification } = useNotification();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const [isChangingPassword, setIsChangingPassword] = useState(false);
  const translatedNewPasswordValidationSchema = newPasswordValidationSchema(t);
  const { email, phoneNumber, code } = params as NewPasswordScreenProps;

  const handleChangePassword = async (values: NewPasswordFormProps) => {
    setIsChangingPassword(true);
    const response = await setNewPassword({
      code,
      email,
      phoneNumber,
      password: values.password,
      confirmPassword: values.confirmPassword,
    });
    setIsChangingPassword(false);

    if (response.type === 'error') {
      showNotification({ title: response.message, type: 'error' });
      newPasswordData.setFieldError('password', response.message);
      newPasswordData.setFieldError('confirmPassword', response.message);
    }

    navigation.navigate(SCREENS.AUTH.PASSWORD_CHANGED);
  };

  const newPasswordData: FormikProps<NewPasswordFormProps> = useFormik({
    initialValues: {
      ...INITIAL_NEW_PASSWORD_VALUES,
    },
    onSubmit: handleChangePassword,
    validationSchema: translatedNewPasswordValidationSchema,
  });

  return (
    <KeyboardAvoidingViewContainer style={styles.container} additionalKeyboardVerticalOffset={ADDITIONAL_KEYBOARD_OFFSET} withScrollView>
      <View style={styles.textContainer}>
        <Typography variant="heading1" color="fg.base">
          {t('passwordRecovery.title')}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted">
          {t('passwordRecovery.enterPassword')}
        </Typography>
      </View>
      <View style={styles.inputsContainer}>
        <Input
          value={newPasswordData.values.password}
          handleChange={newPasswordData.handleChange('password')}
          handleBlur={newPasswordData.handleBlur('password')}
          name="password"
          type="password"
          label={t('password.label')}
          hasError={newPasswordData.touched.password && Boolean(newPasswordData.errors.password)}
          message={newPasswordData.touched.password ? newPasswordData.errors.password : ''}
        />
        <Input
          value={newPasswordData.values.confirmPassword}
          handleChange={newPasswordData.handleChange('confirmPassword')}
          handleBlur={newPasswordData.handleBlur('confirmPassword')}
          name="confirmPassword"
          type="password"
          label={t('confirmPassword.label')}
          hasError={newPasswordData.touched.confirmPassword && Boolean(newPasswordData.errors.confirmPassword)}
          message={newPasswordData.touched.confirmPassword ? newPasswordData.errors.confirmPassword : ''}
        />
      </View>
      <View style={styles.buttonsContainer}>
        <Button handlePress={newPasswordData.handleSubmit} isDisabled={isChangingPassword} isLoading={isChangingPassword}>
          {t('buttons.confirm')}
        </Button>
        <Button handlePress={() => navigation.navigate(SCREENS.AUTH.EMAIL_LOGIN)} variant="text">
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

export default NewPasswordScreen;
