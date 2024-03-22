import { create } from 'zustand';

import { ORGANISATIONS_TABLE } from '@omir-monorepo/common/constants/tables';
import { OrganisationProps } from '@omir-monorepo/common/interfaces/organisation';

import { supabase } from '@/config/supabase';
import { useUserStore } from '@/store/user/user.store';

import { DEFAULT_ORGANISATION_DATA } from './organisationPublic.constants';
import { OrganisationStoreProps } from './organisationPublic.types';

export const useOrganisationPublicStore = create<OrganisationStoreProps>((set, get) => ({
  isLoadingOrganisationPublicData: true,
  organisation: DEFAULT_ORGANISATION_DATA,
  setOrganisation: (organisation) => set({ organisation }),
  unsubscribeOrganisation: null,
  setUnsubscribeOrganisation: (unsubscribeOrganisation) => set({ unsubscribeOrganisation }),
  fireOrganisationListener: (queryOrganisationId) => {
    const { id: userId, applicationRole, organisationId } = useUserStore.getState().user;
    const { unsubscribeOrganisation } = get();
    const currentOrganisationId = applicationRole === 'admin' ? queryOrganisationId : organisationId;

    if (!userId || !applicationRole || !currentOrganisationId || Boolean(unsubscribeOrganisation)) {
      return;
    }

    const unsubscribeOrganisationData = supabase
      .channel('realtime organisation data')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: ORGANISATIONS_TABLE,
          filter: `id=eq.${currentOrganisationId}`,
        },
        (payload) => {
          console.log('ORGANISATION REALTIME PAYLOAD', payload);
          set({ organisation: payload.new as OrganisationProps });
        },
      )
      .subscribe();

    set({
      unsubscribeOrganisation: () => supabase.removeChannel(unsubscribeOrganisationData),
    });
  },
  clearOrganisationListener: () => {
    const { unsubscribeOrganisation } = get();

    if (unsubscribeOrganisation) {
      unsubscribeOrganisation();
      set({
        unsubscribeOrganisation: null,
        organisation: DEFAULT_ORGANISATION_DATA,
      });
    }
  },
  resetOrganisation: () => {
    set({ organisation: DEFAULT_ORGANISATION_DATA });
  },
}));
