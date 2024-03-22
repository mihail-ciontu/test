export type RadioProps = {
  isChecked: boolean;
  label: string;
  name: string;
  handleChange: () => void;
  isDisabled?: boolean;
};
