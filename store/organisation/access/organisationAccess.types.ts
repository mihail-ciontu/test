import { RoleAccessesType } from '@omir-monorepo/common/interfaces/roleAccess';

export interface OrganisationAccessStoreProps {
  organisationAccess: RoleAccessesType;
  setOrganisationAccess: (accessRules: RoleAccessesType) => void;
  unsubscribeOrganisationAccess: (() => void) | null;
  setUnsubscribeOrganisationAccess: (unsubscribe: () => void) => void;
  fireOrganisationAccessListener: (roleId: number) => void;
  clearOrganisationAccessListener: () => void;
  resetOrganisationAccess: () => void;
}
