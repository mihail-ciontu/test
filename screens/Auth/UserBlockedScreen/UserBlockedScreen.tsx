import { useTranslation } from 'react-i18next';
import { Linking, Pressable, View } from 'react-native';
import { useRoute } from '@react-navigation/native';

import Button from '@/components/Button';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { SUPPORT_EMAIL } from '@/constants/common';
import { logout } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';

import { SCREEN_VARIANTS } from './UserBlockedScreen.constants';
import { createStyles } from './UserBlockedScreen.styles';
import { UserBlockedScreenProps } from './UserBlockedScreen.types';

const UserBlockedScreen = () => {
  const { params } = useRoute();
  const { t } = useTranslation('login');
  const { theme } = useThemeStore();
  const styles = createStyles(theme);
  const { userStatus } = params as UserBlockedScreenProps;
  const currentScreenVariant = SCREEN_VARIANTS[userStatus];

  return (
    <View style={styles.container}>
      <View style={styles.contentContainer}>
        <Icon color={currentScreenVariant?.color}>{currentScreenVariant?.icon}</Icon>
        <Typography variant="heading2" color="fg.base" textAlign="center">
          {t(currentScreenVariant?.title || '')}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted" textAlign="center">
          {t(currentScreenVariant?.description || '')}
        </Typography>
      </View>
      <Button handlePress={logout}>{t('buttons.logout')}</Button>
      <View style={styles.contactContainer}>
        <Typography variant="paragraphMedium" color="fg.muted" textAlign="center">
          {t('haveIssues')}
        </Typography>
        <Pressable onPress={() => Linking.openURL(`mailto:${SUPPORT_EMAIL}`)}>
          <Typography variant="paragraphMedium" color="brand100" textAlign="center">
            {SUPPORT_EMAIL}
          </Typography>
        </Pressable>
      </View>
    </View>
  );
};

export default UserBlockedScreen;
