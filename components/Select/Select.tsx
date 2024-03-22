import React, { useEffect, useMemo, useRef } from 'react';
import { Animated, Easing, Platform, Pressable, View } from 'react-native';
import SelectComponent from 'react-native-picker-select';

import ArrowDownIcon from '@/assets/icons/24x24/arrowDown.svg';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './Select.styles';
import { SelectProps } from './Select.types';

const Select = ({
  selectedOption,
  handleChange,
  options,
  name,
  placeholder,
  label,
  isDisabled,
  width,
  message,
  hasError = false,
  isRequired = false,
}: SelectProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const selectRef = useRef<SelectComponent>(null);
  const easeInAnimationRef = useRef(new Animated.Value(0)).current;
  const isAndroid = useMemo(() => Platform.OS === 'android', []);
  const option = selectedOption || options[0];

  const easeInAnimation = () => {
    easeInAnimationRef.setValue(0);
    Animated.timing(easeInAnimationRef, {
      toValue: 1,
      duration: 200,
      useNativeDriver: true,
      easing: Easing.out(Easing.ease),
    }).start();
  };

  useEffect(() => {
    easeInAnimation();
  }, [message, hasError]);

  return (
    <View id={name} style={[styles.container]}>
      {label && (
        <Typography color="grey80" variant="labelMediumRegular">
          {isRequired ? `${label} *` : label}
        </Typography>
      )}
      <Pressable
        disabled={isDisabled}
        onPress={() => selectRef.current?.togglePicker()}
        style={[
          styles.inputContainer,
          {
            backgroundColor: isDisabled ? theme.colors.grey10 : theme.colors.white,
            borderColor: hasError ? theme.colors.red70 : theme.colors.grey20,
            width: width ?? '100%',
          },
          isAndroid && styles.androidContainer,
        ]}
      >
        <SelectComponent
          ref={selectRef}
          style={{
            inputIOS: [styles.input, { color: isDisabled ? theme.colors.grey30 : theme.colors.grey100 }],
            inputAndroid: [styles.input, { color: isDisabled ? theme.colors.grey30 : theme.colors.grey100 }],
          }}
          items={options}
          value={option.value}
          onValueChange={handleChange}
          placeholder={placeholder}
          disabled={isDisabled}
          useNativeAndroidPickerStyle={false}
          fixAndroidTouchableBug
        />
        <View style={styles.iconContainer}>
          <Icon color="grey70">{ArrowDownIcon}</Icon>
        </View>
      </Pressable>
      <Animated.View
        style={[
          styles.messageText,
          {
            transform: [
              {
                scale: easeInAnimationRef.interpolate({
                  inputRange: [0, 1],
                  outputRange: [1, 1.1],
                }),
              },
            ],
          },
        ]}
      >
        <Typography color={hasError ? 'red70' : 'grey70'} variant="labelMediumRegular">
          {message}
        </Typography>
      </Animated.View>
    </View>
  );
};

export default Select;
