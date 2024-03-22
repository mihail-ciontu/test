export type CodeInputProps = {
  value: string;
  handleChange: (value: string) => void;
  length?: number;
  hasError?: boolean;
  isDisabled?: boolean;
  shouldAutoFocus?: boolean;
};
