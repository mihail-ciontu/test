import { useEffect, useMemo, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { Animated, Easing, Pressable, Text, TextInput, View } from 'react-native';
import { countryCodes, CountryItem, CountryPicker } from 'react-native-country-codes-picker';

import { NUMBER_REPLACE_REGEX } from '@omir-monorepo/common/constants/regex';

import ArrowDownIcon from '@/assets/icons/16x16/arrowDown.svg';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { useLanguage } from '@/hooks/useLanguage';
import { useThemeStore } from '@/store/theme/theme.store';

import { ANIMATION_DURATION, SCALE_MESSAGE_ANIMATION, Y_LABEL_ANIMATION } from '../Input.constants';
import { createStyles } from '../Input.styles';
import { MobileInputProps } from '../Input.types';

const Input = ({
  value,
  handleChange,
  width,
  handleBlur,
  handleFocus,
  label,
  placeholder = '',
  message = '',
  hasError = false,
  isDisabled,
  isRequired,
}: MobileInputProps) => {
  const { theme } = useThemeStore();
  const { t } = useTranslation('common');
  const { userDeviceLanguage } = useLanguage();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const [isFocused, setIsFocused] = useState(false);
  const [isCountryPickerOpen, setIsCountryPickerOpen] = useState(false);
  const countryLanguage = useMemo(
    () =>
      countryCodes.find((country) => {
        return userDeviceLanguage.includes(country.code);
      }),
    [userDeviceLanguage],
  );

  const [currentCountry, setCurrentCountry] = useState<CountryItem>(countryLanguage || countryCodes[1]);
  const currentValue = useMemo(() => value.split(currentCountry.dial_code)[1], [value, currentCountry]);

  const inputRef = useRef<TextInput>(null);
  const easeInAnimationRef = useRef(new Animated.Value(0)).current;
  const toggleLabelAnimationRef = useRef(new Animated.Value(value ? 0 : 1)).current;

  const handleFocusInput = () => {
    inputRef.current?.focus();
  };

  useEffect(() => {
    easeInAnimation();
  }, [message, hasError]);

  const easeInAnimation = () => {
    easeInAnimationRef.setValue(0);
    Animated.timing(easeInAnimationRef, {
      toValue: 1,
      duration: ANIMATION_DURATION,
      useNativeDriver: true,
      easing: Easing.out(Easing.ease),
    }).start();
  };

  const shrinkLabelAnimation = () => {
    Animated.timing(toggleLabelAnimationRef, {
      toValue: 1,
      duration: ANIMATION_DURATION,
      useNativeDriver: true,
    }).start();
  };

  const growLabelAnimation = () => {
    Animated.timing(toggleLabelAnimationRef, {
      toValue: 0,
      duration: ANIMATION_DURATION,
      useNativeDriver: true,
    }).start();
  };

  useEffect(() => {
    setCurrentCountry(countryLanguage || countryCodes[1]);
  }, [countryLanguage]);

  return (
    <View>
      <Pressable onPress={handleFocusInput} disabled={isDisabled} style={styles.container}>
        <View
          style={[
            styles.inputContainer,
            styles.inputMobileContainer,
            hasError && styles.error,
            isFocused && { borderColor: theme.colors.brand100 },
            {
              backgroundColor: isDisabled ? theme.colors.grey10 : theme.colors.white,
              width: width ?? '100%',
            },
          ]}
        >
          <View style={[styles.labelContainer, styles.labelMobileContainer]}>
            <Animated.Text
              style={{
                transform: [{ translateY: toggleLabelAnimationRef.interpolate(Y_LABEL_ANIMATION) }],
              }}
            >
              <Typography
                color={hasError ? 'fg.error' : 'fg.subtle'}
                variant={isFocused || currentValue ? 'labelExtraSmallRegular' : 'labelMediumRegular'}
              >
                {isRequired ? `${label} *` : label}
              </Typography>
            </Animated.Text>
          </View>
          <Pressable onPress={() => setIsCountryPickerOpen(true)} style={styles.countryCodeContainer}>
            <Text>{currentCountry.flag}</Text>
            <Typography variant="labelMediumRegular" color="fg.base">
              {currentCountry.dial_code}
            </Typography>
            <Icon color="fg.base">{ArrowDownIcon}</Icon>
          </Pressable>
          <TextInput
            ref={inputRef}
            value={currentValue}
            style={[styles.input, styles.mobileInput, { color: isDisabled ? theme.colors.grey30 : theme.colors.grey100 }]}
            onChangeText={(text) => {
              const currentValue = text.replace(NUMBER_REPLACE_REGEX, '');

              if (currentValue.includes(currentCountry.dial_code)) {
                handleChange(currentValue);
                return;
              }

              handleChange(currentCountry.dial_code + currentValue);
            }}
            onBlur={(event) => {
              handleBlur && handleBlur(event);
              setIsFocused(false);

              if (!currentValue) {
                shrinkLabelAnimation();
              }
            }}
            onFocus={(event) => {
              handleFocus && handleFocus(event);
              setIsFocused(true);
              growLabelAnimation();
            }}
            readOnly={isDisabled}
            placeholder={placeholder}
            keyboardType="phone-pad"
          />
        </View>
        <View style={[styles.textAreaMessageContainer, { justifyContent: message ? 'space-between' : 'flex-end' }]}>
          {message && (
            <Animated.View
              style={[styles.messageText, { transform: [{ scale: easeInAnimationRef.interpolate(SCALE_MESSAGE_ANIMATION) }] }]}
            >
              <Typography color={hasError ? 'fg.error' : 'fg.subtle'} variant="paragraphSmall">
                {message}
              </Typography>
            </Animated.View>
          )}
        </View>
        <CountryPicker
          pickerButtonOnPress={(country) => {
            setCurrentCountry(country);
            setIsCountryPickerOpen(false);
          }}
          lang="en"
          inputPlaceholder={t('countryPicker.placeholder')}
          searchMessage={t('countryPicker.noCountryFound')}
          onBackdropPress={() => setIsCountryPickerOpen(false)}
          show={isCountryPickerOpen}
          style={{ modal: { height: '50%' } }}
          enableModalAvoiding
        />
      </Pressable>
    </View>
  );
};

export default Input;
