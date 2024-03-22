import { ReactNode } from 'react';

export type CheckboxProps = {
  isChecked: boolean;
  handleChange: () => void;
  name: string;
  isDisabled?: boolean;
  label?: ReactNode;
};
