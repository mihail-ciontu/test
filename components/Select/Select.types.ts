export type SelectOptionProps = {
  value: string;
  label: string;
  isDisabled?: boolean;
};

export type SelectProps = {
  options: SelectOptionProps[];
  name: string;
  handleChange: (value: string) => void;
  label?: string;
  selectedOption?: SelectOptionProps;
  placeholder?: string;
  isDisabled?: boolean;
  width?: number;
  message?: string;
  hasError?: boolean;
  isRequired?: boolean;
};
