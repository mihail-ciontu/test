import { OrganisationProps } from '@omir-monorepo/common/interfaces/organisation';

export interface OrganisationStoreProps {
  organisation: Omit<OrganisationProps, 'resetEmailParam' | 'resetTokenParam' | 'loginParam' | 'passwordParam' | 'optionalQueryLanguage'>;
  setOrganisation: (organisation: OrganisationProps) => void;
  unsubscribeOrganisation: (() => void) | null;
  setUnsubscribeOrganisation: (unsubscribe: () => void) => void;
  fireOrganisationListener: (id?: string) => void;
  resetOrganisation: () => void;
  clearOrganisationListener: () => void;
}
