import { create } from 'zustand';

import { ADMIN_ORGANISATION_ROLE_ACCESS_DATA, DEFAULT_ORGANISATION_ROLE_ACCESS_DATA } from '@omir-monorepo/common/constants/organisation';
import { RoleAccessesType } from '@omir-monorepo/common/interfaces/roleAccess';

import { supabase } from '@/config/supabase';
import { useUserStore } from '@/store/user/user.store';

import { OrganisationAccessStoreProps } from './organisationAccess.types';

export const useOrganisationAccessStore = create<OrganisationAccessStoreProps>((set, get) => ({
  isLoadingOrganisationAccessData: true,
  organisationAccess: DEFAULT_ORGANISATION_ROLE_ACCESS_DATA,
  setOrganisationAccess: (organisationAccess) => set({ organisationAccess }),
  unsubscribeOrganisationAccess: null,
  setUnsubscribeOrganisationAccess: (unsubscribeOrganisationAccess) => set({ unsubscribeOrganisationAccess }),
  fireOrganisationAccessListener: (roleId: number) => {
    const { id: userId, applicationRole, organisationId } = useUserStore.getState().user;
    const { unsubscribeOrganisationAccess } = get();

    if (applicationRole === 'admin') {
      set({ organisationAccess: { ...ADMIN_ORGANISATION_ROLE_ACCESS_DATA } });
    }

    if (!userId || !applicationRole || !organisationId || Boolean(unsubscribeOrganisationAccess) || !roleId) {
      return;
    }

    const unsubscribeAccessRulesData = supabase
      .channel('realtime access rules data')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'roles',
          filter: `id=eq.${roleId}`,
        },
        (payload) => {
          console.log('ROLE ACCESS REALTIME PAYLOAD', payload);
          set({ organisationAccess: { ...(payload.new as RoleAccessesType) } });
        },
      )
      .subscribe();

    set({
      unsubscribeOrganisationAccess: () => supabase.removeChannel(unsubscribeAccessRulesData),
    });
  },
  clearOrganisationAccessListener: () => {
    const { unsubscribeOrganisationAccess } = get();

    if (unsubscribeOrganisationAccess) {
      unsubscribeOrganisationAccess();
      set({
        unsubscribeOrganisationAccess: null,
        organisationAccess: DEFAULT_ORGANISATION_ROLE_ACCESS_DATA,
      });
    }
  },
  resetOrganisationAccess: () => {
    set({ organisationAccess: DEFAULT_ORGANISATION_ROLE_ACCESS_DATA });
  },
}));
