import * as WebBrowser from 'expo-web-browser';
import { useTranslation } from 'react-i18next';
import { Pressable, View } from 'react-native';

import Button from '@/components/Button';
import Typography from '@/components/Typography';
import { logout } from '@/services/Auth/Auth.service';
import { useOrganisationPublicStore } from '@/store/organisation/public/organisationPublic.store';
import { useThemeStore } from '@/store/theme/theme.store';
import { useUserStore } from '@/store/user/user.store';

import { createStyles } from './TermsAndPolicyScreen.styles';

const TermsAndPolicy = () => {
  const { theme } = useThemeStore();
  const styles = createStyles(theme);
  const { t } = useTranslation('login');
  const { user, setUser } = useUserStore();
  const { privacyUrl, termsUrl, applicationName } = useOrganisationPublicStore((state) => state.organisation);

  const handleOpenTerms = async () => {
    await WebBrowser.openBrowserAsync(termsUrl);
  };

  const handleOpenPrivacyPolicy = async () => {
    await WebBrowser.openBrowserAsync(privacyUrl);
  };

  return (
    <View style={styles.container}>
      <View style={styles.groupContainer}>
        <Typography variant="heading2" color="fg.base">
          {t('termsAndPrivacy.title', { name: applicationName })}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted">
          {t('termsAndPrivacy.description')}
        </Typography>
      </View>
      <View style={styles.groupContainer}>
        <Pressable onPress={handleOpenTerms} disabled={!termsUrl}>
          <Typography variant="heading3" color="brand100">
            {t('termsAndPrivacy.terms')}
          </Typography>
        </Pressable>
        <Pressable onPress={handleOpenPrivacyPolicy} disabled={!privacyUrl}>
          <Typography variant="heading3" color="brand100">
            {t('termsAndPrivacy.privacy')}
          </Typography>
        </Pressable>
      </View>
      <View style={styles.buttonsContainer}>
        <Button handlePress={() => setUser({ ...user, acceptedTerms: true })}>{t('buttons.agree')}</Button>
        <Button handlePress={logout}>{t('buttons.cancel')}</Button>
      </View>
    </View>
  );
};

export default TermsAndPolicy;
