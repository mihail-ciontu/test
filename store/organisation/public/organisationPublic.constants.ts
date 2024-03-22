import { OrganisationProps } from '@omir-monorepo/common/interfaces/organisation';

import theme from '@/theme';

export const DEFAULT_ORGANISATION_DATA: Omit<
  OrganisationProps,
  'resetEmailParam' | 'resetTokenParam' | 'loginParam' | 'passwordParam' | 'optionalQueryLanguage'
> = {
  id: '',
  applicationName: '',
  primaryColor: theme.colors.brand100,
  isActive: false,
  iconUrl: '',
  logoUrl: '',
  createdAt: new Date().toDateString(),
  privacyUrl: '',
  supportEmail: '',
  termsUrl: '',
  manifestIcons: [],
};
