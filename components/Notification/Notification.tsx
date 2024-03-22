import { useMemo } from 'react';
import { Platform } from 'react-native';
import Toast, { BaseToast, BaseToastProps, ErrorToast } from 'react-native-toast-message';

import { useThemeStore } from '@/store/theme/theme.store';

import { ANDROID_TOP_OFFSET, IOS_TOP_OFFSET, VISIBILITY_TIME } from './Notification.constants';
import { createStyles } from './Notification.styles';
import { NotificationProps } from './Notification.types';

const Notification = ({
  type = 'success',
  visibilityTime = VISIBILITY_TIME,
  position = 'top',
  topOffset = Platform.OS === 'ios' ? IOS_TOP_OFFSET : ANDROID_TOP_OFFSET,
  bottomOffset = 0,
  handleShow,
  handleHide,
  handlePress,
}: NotificationProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);

  const notificationConfig = useMemo(() => {
    return {
      success: (props: BaseToastProps) => {
        return (
          <BaseToast
            {...props}
            contentContainerStyle={styles.contentContainer}
            style={[styles.container, styles.success]}
            text1Style={styles.title}
            text2Style={styles.description}
          />
        );
      },
      error: (props: BaseToastProps) => {
        return (
          <ErrorToast
            {...props}
            contentContainerStyle={styles.contentContainer}
            style={[styles.container, styles.error]}
            text1Style={styles.title}
            text2Style={styles.description}
          />
        );
      },
    };
  }, [theme]);

  return (
    <Toast
      type={type}
      position={position}
      visibilityTime={visibilityTime}
      topOffset={topOffset}
      bottomOffset={bottomOffset}
      onShow={handleShow}
      onHide={handleHide}
      onPress={handlePress}
      config={notificationConfig}
    />
  );
};

export default Notification;
