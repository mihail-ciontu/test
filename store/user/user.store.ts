import { create } from 'zustand';

import { ROLES_TABLE } from '@omir-monorepo/common/constants/tables';
import { UserProfileProps, UserStructureProps } from '@omir-monorepo/common/interfaces/user';

import { supabase } from '@/config/supabase';

import { FunctionUserProps, UserRealtimeProfileProps, UserStoreProps } from './user.types';

export const DEFAULT_USER_DATA: FunctionUserProps = {
  createdAt: '',
  organisation: '',
  name: '',
  role: '',
  applicationRole: 'user',
  email: '',
  workingEmail: '',
  organisationId: '',
  photoUrl: '',
  smallPhotoUrl: '',
  id: '',
  mobileNumber: '',
  workingMobileNumber: '',
  birthDay: '',
  bloodType: '',
  employmentType: '',
  userStructure: {
    branch: '',
    subBranch: '',
    group: '',
    company: '',
    department: '',
    division: '',
  },
  anthropometryClothesSize: '',
  anthropometryHeadSize: '',
  anthropometryHeight: '',
  anthropometryShoeSize: '',
  city: '',
  country: '',
  homeAddress: '',
  jobTitle: '',
  employmentDate: '',
  introduction: '',
  language: 'en',
  lastLogin: undefined,
  idNumber: '',
  sex: '',
  status: 'created',
  loginMethod: 'none',
  profileRating: 0,
  isPushNotificationAllowed: undefined,
  pushNotificationTokenId: undefined,
  acceptedTerms: false,
};

const getUserRole = async (roleId: number) => {
  if (!roleId) {
    return '';
  }

  const { data: userRoleData } = await supabase.from(ROLES_TABLE).select('name').eq('id', roleId).single();

  return userRoleData?.name || '';
};

export const useUserStore = create<UserStoreProps>((set, get) => ({
  sessionUser: null,
  setSessionUser: (sessionUser) => set({ sessionUser }),
  user: DEFAULT_USER_DATA,
  setUser: (user) => set({ user }),
  resetUser: () => {
    set({ user: DEFAULT_USER_DATA });
    get().clearUserListener();
  },
  unsubscribeUser: null,
  setUnsubscribeUser: (unsubscribeUser) => set({ unsubscribeUser }),
  fireUserListener: async () => {
    const { unsubscribeUser, user } = get();

    if (unsubscribeUser || !user.id) {
      return;
    }

    const unsubscribeUserData = supabase
      .channel('realtime user data')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'users',
          filter: `id=eq.${user.id}`,
        },
        async (payload) => {
          console.log('USER REALTIME PAYLOAD', payload);
          const payloadData = payload.new as UserRealtimeProfileProps;
          const userRole = await getUserRole(payloadData.role);
          const { user } = get();
          set({ user: { ...user, ...payloadData, role: userRole } });
        },
      )
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'userProfiles',
          filter: `id=eq.${user.id}`,
        },
        async (payload) => {
          console.log('USER PROFILE REALTIME PAYLOAD', payload);
          const payloadData = payload.new as UserProfileProps;
          const { user } = get();
          set({ user: { ...user, ...payloadData } });
        },
      )
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'userStructures',
          filter: `id=eq.${user.id}`,
        },
        async (payload) => {
          console.log('USER STRUCTURE REALTIME PAYLOAD', payload);
          const payloadData = payload.new as UserStructureProps;
          const { user } = get();
          set({ user: { ...user, userStructure: payloadData } });
        },
      )
      .subscribe();

    set({
      unsubscribeUser: () => supabase.removeChannel(unsubscribeUserData),
    });
  },
  clearUserListener: () => {
    const { unsubscribeUser } = get();

    if (unsubscribeUser) {
      unsubscribeUser();
      set({ unsubscribeUser: null, user: DEFAULT_USER_DATA });
    }
  },
}));
