import Toast from 'react-native-toast-message';

type NotificationProps = {
  title: string;
  description?: string;
  type?: 'success' | 'error';
};

export const useNotification = () => {
  const showNotification = ({ title, description, type }: NotificationProps) => {
    Toast.show({
      type,
      text1: title,
      text2: description,
    });
  };

  return {
    showNotification,
  };
};
