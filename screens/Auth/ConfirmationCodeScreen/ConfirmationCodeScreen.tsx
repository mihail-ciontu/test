import { useEffect, useLayoutEffect, useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { View } from 'react-native';
import { useNavigation, useRoute } from '@react-navigation/native';

import { RESET_PASSWORD_CODE_LENGTH } from '@omir-monorepo/common/constants/organisation';
import { Nullable } from '@omir-monorepo/common/interfaces/utils';

import Button from '@/components/Button';
import CodeInput from '@/components/Inputs/CodeInput';
import Typography from '@/components/Typography';
import { SCREENS } from '@/constants/screens';
import KeyboardAvoidingView from '@/containers/KeyboardAvoidingView';
import { NavigationProps } from '@/interfaces/navigation';
import { requestResetEmailPassword, requestResetMobilePassword, verifyResetPasswordCode } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';

import { ADDITIONAL_KEYBOARD_OFFSET, COUNTER_TIMEOUT, RESEND_CODE_TIMEOUT } from './ConfirmationCodeScreen.constants';
import { createStyles } from './ConfirmationCodeScreen.styles';
import { ConfirmationCodeScreenParams } from './ConfirmationCodeScreen.types';

const ConfirmationCodeScreen = () => {
  const { t } = useTranslation('login');
  const { theme } = useThemeStore();
  const { params } = useRoute();
  const navigation = useNavigation<NavigationProps>();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const [codeValue, setCodeValue] = useState('');
  const [resendTime, setResendTime] = useState(RESEND_CODE_TIMEOUT);
  const [isCounting, setIsCounting] = useState(true);
  const [isValidating, setIsValidating] = useState(false);
  const [hasError, setHasError] = useState(false);
  const { email, phoneNumber } = params as ConfirmationCodeScreenParams;
  const isEmailRecoveryType = Boolean(email);

  const handleResendCode = async () => {
    setResendTime(RESEND_CODE_TIMEOUT);
    setIsCounting(true);
    await (isEmailRecoveryType ? requestResetEmailPassword(email!) : requestResetMobilePassword(phoneNumber!));
  };

  const handleValidateCode = async () => {
    setHasError(false);
    setIsValidating(true);
    const response = await verifyResetPasswordCode({
      code: codeValue,
      email: email || '',
      phoneNumber: phoneNumber || '',
    });
    setIsValidating(false);

    if (response.type === 'error' || response.result === false) {
      setHasError(true);
      return;
    }

    navigation.navigate(SCREENS.AUTH.NEW_PASSWORD, {
      code: codeValue,
      email: email || '',
      phoneNumber: phoneNumber || '',
    });
  };

  useEffect(() => {
    let intervalId: Nullable<NodeJS.Timeout> = null;

    if (isCounting) {
      setResendTime(RESEND_CODE_TIMEOUT);
      intervalId = setInterval(() => {
        setResendTime((previousCounter) => previousCounter - 1);
      }, COUNTER_TIMEOUT);
    }

    return () => {
      if (intervalId) {
        clearInterval(intervalId);
      }
    };
  }, [isCounting]);

  useEffect(() => {
    if (resendTime <= 0 && isCounting) {
      setIsCounting(false);
    }
  }, [resendTime, isCounting]);

  useLayoutEffect(() => {
    navigation.setOptions({
      headerShown: true,
      headerTitle: isEmailRecoveryType ? t('authenticationCode.emailHeader') : t('authenticationCode.mobileHeader'),
      headerTitleAlign: 'left',
      headerTintColor: theme.colors.brand100,
    });
  }, [navigation]);

  return (
    <KeyboardAvoidingView style={styles.container} additionalKeyboardVerticalOffset={ADDITIONAL_KEYBOARD_OFFSET} withScrollView>
      <View style={styles.contentContainer}>
        <View style={styles.textContainer}>
          <Typography variant="heading2" color="fg.base" textAlign="center">
            {t('authenticationCode.title')}
          </Typography>
          <Typography variant="paragraphMedium" color="fg.base" textAlign="center">
            {t(isEmailRecoveryType ? 'authenticationCode.descriptionEmail' : 'authenticationCode.descriptionMobile', {
              count: RESET_PASSWORD_CODE_LENGTH,
            })}{' '}
            <Typography variant="labelMediumBold" color="fg.base">
              {isEmailRecoveryType ? email : phoneNumber}
            </Typography>
          </Typography>
        </View>
        <View style={styles.codeInputContainer}>
          <CodeInput value={codeValue} handleChange={setCodeValue} shouldAutoFocus />
          {hasError && (
            <Typography color="fg.error" variant="paragraphSmall" textAlign="center">
              {t('authenticationCode.wrongCode')}
            </Typography>
          )}
        </View>
      </View>
      <View style={styles.buttonsContainer}>
        <Button
          handlePress={handleValidateCode}
          isDisabled={codeValue.length < RESET_PASSWORD_CODE_LENGTH || isValidating}
          isLoading={isValidating}
        >
          {t('buttons.continue')}
        </Button>
        <Button handlePress={handleResendCode} isDisabled={isCounting || resendTime > 0 || isValidating}>
          {t(isCounting ? 'buttons.resendCodeIn' : 'buttons.resendCode', { time: resendTime })}
        </Button>
      </View>
    </KeyboardAvoidingView>
  );
};

export default ConfirmationCodeScreen;
