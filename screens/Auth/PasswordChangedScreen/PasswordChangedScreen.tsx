import { useTranslation } from 'react-i18next';
import { Linking, Pressable, View } from 'react-native';
import { useNavigation } from '@react-navigation/native';

import PasswordChangedIcon from '@/assets/icons/120x120/squareCheck.svg';
import Button from '@/components/Button';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { SUPPORT_EMAIL } from '@/constants/common';
import { SCREENS } from '@/constants/screens';
import { NavigationProps } from '@/interfaces/navigation';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './PasswordChangedScreen.styles';

const PasswordChangedScreen = () => {
  const { theme } = useThemeStore();
  const styles = createStyles(theme);
  const { t } = useTranslation('login');
  const navigation = useNavigation<NavigationProps>();

  return (
    <View style={styles.container}>
      <View style={styles.groupContainer}>
        <Icon color="brand100">{PasswordChangedIcon}</Icon>
        <Typography variant="heading1" color="fg.base" textAlign="center">
          {t('passwordChanged.title')}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted" textAlign="center">
          {t('passwordChanged.description')}
        </Typography>
      </View>
      <Button handlePress={() => navigation.navigate(SCREENS.AUTH.LOGIN)}>{t('buttons.backToSignIn')}</Button>
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

export default PasswordChangedScreen;
