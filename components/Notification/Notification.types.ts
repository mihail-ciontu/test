export type NotificationProps = {
  type?: 'success' | 'error';
  position?: 'top' | 'bottom';
  visibilityTime?: number;
  topOffset?: number;
  bottomOffset?: number;
  handlePress?: () => void;
  handleHide?: () => void;
  handleShow?: () => void;
};
