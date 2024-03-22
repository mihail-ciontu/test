import { Image } from 'expo-image';
import { useTranslation } from 'react-i18next';
import { ActivityIndicator, Pressable, ScrollView, View } from 'react-native';
import { useQuery } from '@tanstack/react-query';

import { OrganisationProps } from '@omir-monorepo/common/interfaces/organisation';

import ArrowRightIcon from '@/assets/icons/24x24/arrowRight.svg';
import WarningTriangleIcon from '@/assets/icons/120x120/warningTriangle.svg';
import Button from '@/components/Button';
import Icon from '@/components/Icon';
import Typography from '@/components/Typography';
import { getOrganisationsList } from '@/services/Organisation/Organisation.service';
import { useOrganisationPublicStore } from '@/store/organisation/public/organisationPublic.store';
import { useThemeStore } from '@/store/theme/theme.store';
import { useUserStore } from '@/store/user/user.store';

import { createStyles } from './OrganisationSelectionScreen.styles';

const OrganisationSelectionScreen = () => {
  const { theme } = useThemeStore();
  const { fireOrganisationListener, setOrganisation } = useOrganisationPublicStore();
  const { user, setUser } = useUserStore();
  const styles = createStyles(theme);
  const { t } = useTranslation('login');

  const {
    data: organisations,
    isLoading,
    error,
    refetch,
  } = useQuery({
    queryKey: ['organisationsList'],
    queryFn: getOrganisationsList,
  });

  const handleOrganisationSelect = (organisation: OrganisationProps) => {
    fireOrganisationListener(organisation.id);
    setUser({
      ...user,
      acceptedTerms: true,
    });
    setOrganisation(organisation);
  };

  if (error) {
    return (
      <View style={styles.container}>
        <View style={styles.contentContainer}>
          <Icon color="red60">{WarningTriangleIcon}</Icon>
          <Typography variant="heading2" color="fg.base" textAlign="center">
            {t('organisationList.error.title')}
          </Typography>
          <Typography variant="paragraphMedium" color="fg.muted" textAlign="center">
            {t('organisationList.error.description')}
          </Typography>
        </View>
        <Button handlePress={refetch}>{t('buttons.retry')}</Button>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <View style={styles.textContainer}>
        <Typography variant="heading2" color="fg.base">
          {t('organisationList.title')}
        </Typography>
        <Typography variant="paragraphMedium" color="fg.muted">
          {t('organisationList.description')}
        </Typography>
      </View>
      <ScrollView style={styles.listContainer}>
        {isLoading ? (
          <View style={styles.contentContainer}>
            <ActivityIndicator />
          </View>
        ) : (
          organisations?.map((organisation) => {
            const { id, applicationName, iconUrl } = organisation;

            return (
              <Pressable key={id} onPress={() => handleOrganisationSelect(organisation)}>
                <View style={styles.elementContainer}>
                  <Image source={iconUrl || require('@/assets/images/icon.png')} style={styles.image} />
                  <View>
                    <Typography variant="labelMediumRegular" color="fg.base">
                      {applicationName}
                    </Typography>
                    <Typography variant="labelSmallRegular" color="fg.muted">
                      {`ID: ${id}`}
                    </Typography>
                  </View>
                  <View style={styles.iconContainer}>
                    <Icon color="fg.subtle">{ArrowRightIcon}</Icon>
                  </View>
                </View>
              </Pressable>
            );
          })
        )}
      </ScrollView>
    </View>
  );
};

export default OrganisationSelectionScreen;
