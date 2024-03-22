import { useMemo } from 'react';
import { View } from 'react-native';
import { CodeField, Cursor, RenderCellOptions, useBlurOnFulfill, useClearByFocusCell } from 'react-native-confirmation-code-field';

import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { DEFAULT_CODE_LENGTH } from './CodeInput.constants';
import { createStyles } from './CodeInput.styles';
import { CodeInputProps } from './CodeInput.types';

const CodeInput = ({
  value,
  handleChange,
  hasError = false,
  isDisabled = false,
  shouldAutoFocus = false,
  length = DEFAULT_CODE_LENGTH,
}: CodeInputProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const codeInputRef = useBlurOnFulfill({ value, cellCount: length });
  const [props, getCellOnLayoutHandler] = useClearByFocusCell({
    value,
    setValue: handleChange,
  });
  const stateColor = isDisabled ? 'fg.disabled' : 'fg.error';

  const Cell = ({ index, symbol, isFocused }: RenderCellOptions) => {
    return (
      <View
        key={index}
        style={[styles.cell, isFocused && styles.focusCell, hasError && styles.errorCell, isDisabled && styles.disabledCell]}
        onLayout={getCellOnLayoutHandler(index)}
      >
        <Typography variant="labelLargeRegular" color={hasError || isDisabled ? stateColor : 'fg.base'}>
          {(symbol ? '•' : '') || (isFocused ? <Cursor /> : null)}
        </Typography>
      </View>
    );
  };

  return (
    <CodeField
      ref={codeInputRef}
      value={value}
      onChangeText={!isDisabled ? handleChange : undefined}
      cellCount={length}
      keyboardType="number-pad"
      textContentType="oneTimeCode"
      renderCell={Cell}
      autoFocus={!isDisabled && shouldAutoFocus}
      editable={!isDisabled}
      focusable={!isDisabled}
      {...props}
    />
  );
};

export default CodeInput;
