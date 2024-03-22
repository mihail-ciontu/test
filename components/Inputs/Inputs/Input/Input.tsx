import { useEffect, useMemo, useRef, useState } from 'react';
import { Animated, Easing, Pressable, TextInput, View } from 'react-native';

import EyeHideIcon from '@/assets/icons/24x24/eyeHide.svg';
import EyeShowIcon from '@/assets/icons/24x24/eyeShow.svg';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { DEFAULT_INPUT_HEIGHT, DEFAULT_TEXT_AREA_HEIGHT, INPUT_MODE, SCALE_MESSAGE_ANIMATION, Y_LABEL_ANIMATION } from '../Input.constants';
import { createStyles } from '../Input.styles';
import { InputProps } from '../Input.types';

const Input = ({
  value,
  handleChange,
  type = 'text',
  width,
  handleBlur,
  handleFocus,
  label,
  placeholder = '',
  message = '',
  hasError = false,
  leftIcon,
  leftIconColor = 'grey60',
  rightIcon,
  rightIconColor,
  isDisabled,
  maxLength,
  isRequired,
  shouldAutoCapitalize = false,
  isMultiline = false,
  numberOfLines = 1,
  shouldDisplayRemainingCharacters = false,
}: InputProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const [isTextVisible, setIsTextVisible] = useState(type !== 'password');
  const [isFocused, setIsFocused] = useState(false);

  const inputRef = useRef<TextInput>(null);
  const easeInAnimationRef = useRef(new Animated.Value(0)).current;
  const toggleLabelAnimationRef = useRef(new Animated.Value(value ? 0 : 1)).current;
  const passwordIcon = isTextVisible ? EyeShowIcon : EyeHideIcon;

  const handlePasswordVisibilityToggle = () => setIsTextVisible((previousState) => !previousState);

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
      duration: 200,
      useNativeDriver: true,
      easing: Easing.out(Easing.ease),
    }).start();
  };

  const shrinkLabelAnimation = () => {
    Animated.timing(toggleLabelAnimationRef, {
      toValue: 1,
      duration: 200,
      useNativeDriver: true,
    }).start();
  };

  const growLabelAnimation = () => {
    Animated.timing(toggleLabelAnimationRef, {
      toValue: 0,
      duration: 200,
      useNativeDriver: true,
    }).start();
  };

  return (
    <View>
      <Pressable onPress={handleFocusInput} disabled={isDisabled} style={styles.container}>
        <View
          style={[
            styles.inputContainer,
            hasError && styles.error,
            isFocused && { borderColor: theme.colors.brand100 },
            {
              backgroundColor: isDisabled ? theme.colors.grey10 : theme.colors.white,
              width: width ?? '100%',
              height: isMultiline ? DEFAULT_TEXT_AREA_HEIGHT : DEFAULT_INPUT_HEIGHT,
              alignItems: isMultiline ? 'flex-start' : 'center',
            },
          ]}
        >
          <View style={styles.labelContainer}>
            <Animated.Text
              style={{
                transform: [{ translateY: toggleLabelAnimationRef.interpolate(Y_LABEL_ANIMATION) }],
              }}
            >
              <Typography
                color={hasError ? 'fg.error' : 'fg.subtle'}
                variant={isFocused || value ? 'labelExtraSmallRegular' : 'labelMediumRegular'}
              >
                {isRequired ? `${label} *` : label}
              </Typography>
            </Animated.Text>
          </View>
          {Boolean(leftIcon) && (
            <View style={styles.iconLeftContainer}>
              <Icon color={leftIconColor}>{leftIcon}</Icon>
            </View>
          )}
          <TextInput
            ref={inputRef}
            value={value}
            style={[
              styles.input,
              Boolean(leftIcon) && styles.inputContainerLeftIcon,
              Boolean(rightIcon || type === 'password') && styles.inputContainerRightIcon,
              { color: isDisabled ? theme.colors.grey30 : theme.colors.grey100 },
            ]}
            onChangeText={handleChange}
            onBlur={(event) => {
              handleBlur && handleBlur(event);
              setIsFocused(false);

              if (!value) {
                shrinkLabelAnimation();
              }
            }}
            onFocus={(event) => {
              handleFocus && handleFocus(event);
              setIsFocused(true);
              growLabelAnimation();
            }}
            maxLength={maxLength}
            readOnly={isDisabled}
            placeholder={placeholder}
            secureTextEntry={type === 'password' && !isTextVisible}
            keyboardType={type ? INPUT_MODE[type] : 'default'}
            autoCapitalize={!shouldAutoCapitalize ? 'none' : undefined}
            multiline={isMultiline}
            numberOfLines={numberOfLines}
          />
          {Boolean(type === 'password' || rightIcon) && (
            <View style={styles.iconRightContainer}>
              <Pressable onPress={type === 'password' ? handlePasswordVisibilityToggle : handleFocusInput}>
                <Icon color={type === 'password' ? 'fg.subtle' : rightIconColor}>{type === 'password' ? passwordIcon : rightIcon}</Icon>
              </Pressable>
            </View>
          )}
        </View>
        <View style={[styles.textAreaMessageContainer, { justifyContent: message ? 'space-between' : 'flex-end' }]}>
          {message && (
            <Animated.View
              style={[
                isMultiline && styles.messageTextMultiline,
                styles.messageText,
                { transform: [{ scale: easeInAnimationRef.interpolate(SCALE_MESSAGE_ANIMATION) }] },
              ]}
            >
              <Typography color={hasError ? 'fg.error' : 'fg.subtle'} variant="paragraphSmall">
                {message}
              </Typography>
            </Animated.View>
          )}
          {Boolean(shouldDisplayRemainingCharacters && maxLength) && (
            <View style={styles.remainingCharacters}>
              <Typography color={hasError ? 'fg.error' : 'fg.subtle'} variant="paragraphSmall">
                {value.length}/{maxLength}
              </Typography>
            </View>
          )}
        </View>
      </Pressable>
    </View>
  );
};

export default Input;
