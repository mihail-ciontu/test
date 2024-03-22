import { useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { User } from '@supabase/supabase-js';

import { USERS_TABLE } from '@omir-monorepo/common/constants/tables';
import { OrganisationProps } from '@omir-monorepo/common/interfaces/organisation';
import { RoleAccessesType } from '@omir-monorepo/common/interfaces/roleAccess';
import { UserProfileProps, UserProps, UserStatusType, UserStructureProps } from '@omir-monorepo/common/interfaces/user';

import { supabase } from '@/config/supabase';
import { useNotification } from '@/hooks/useNotification';
import { logout } from '@/services/Auth/Auth.service';
import { updateUserActiveStatus, updateUserLastLogin } from '@/services/User/User.service';
import { useOrganisationAccessStore } from '@/store/organisation/access/organisationAccess.store';
import { useOrganisationPublicStore } from '@/store/organisation/public/organisationPublic.store';
import { useUserStore } from '@/store/user/user.store';

import { AuthCenterProps } from './AuthCenter.types';

const AuthCenter = ({ children }: AuthCenterProps) => {
  const { t } = useTranslation('errors');
  const { setUser, sessionUser, fireUserListener } = useUserStore();
  const { setOrganisationAccess, fireOrganisationAccessListener } = useOrganisationAccessStore();
  const { setOrganisation, fireOrganisationListener } = useOrganisationPublicStore();
  const { showNotification } = useNotification();

  const handleApplicationAdminUpdate = async (userData: UserProps) => {
    const { error, data } = await supabase.from(USERS_TABLE).select('*, userProfile:userProfiles (*)').eq('id', userData.id).single();

    if (error || !data) {
      logout();
      showNotification({ title: t('common.fetchUserData'), type: 'error' });
      return;
    }

    const { userProfile, ...user } = data;

    const currentUserProfile = userProfile as UserProfileProps;

    setUser({
      ...user,
      ...currentUserProfile,
      id: userData.id,
    });

    fireUserListener();
    fireOrganisationAccessListener(0);
  };

  const handleApplicationUserUpdate = async (userData: UserProps) => {
    const { error, data } = await supabase
      .from(USERS_TABLE)
      .select(
        `
      *, 
      organisation:organisations (*), 
      userStructure:userStructures (*),
      userProfile:userProfiles (*),
      role:roles (*)
    `,
      )
      .eq('id', userData.id)
      .single();

    if (error || !data) {
      logout();
      showNotification({ title: t('common.fetchUserData'), type: 'error' });
      return;
    }

    const { role, organisation, userStructure, userProfile, ...user } = data;

    if (!role || !userProfile || !userStructure || !organisation) {
      logout();
      showNotification({ title: t('common.fetchUserData'), type: 'error' });
      return;
    }

    const currentUserOrganisation = organisation as OrganisationProps;
    const currentUserStructure = userStructure as UserStructureProps;
    const currentUserProfile = userProfile as UserProfileProps;
    const currentUserAccess = role as RoleAccessesType;

    setUser({
      ...user,
      ...currentUserProfile,
      userStructure: currentUserStructure,
      role: role?.name,
      id: userData.id,
      organisationId: organisation?.id,
    });

    setOrganisation({
      ...currentUserOrganisation,
    });

    setOrganisationAccess({
      ...currentUserAccess,
    });

    fireOrganisationListener();
    fireUserListener();
    fireOrganisationAccessListener(role.id);
  };

  const handleUserUpdate = async (user: User) => {
    const { id: userId } = user;
    const { data: userData, error: userError } = await supabase.from(USERS_TABLE).select('*').eq('id', userId).single();

    if (userError || !userData) {
      logout();
      showNotification({ title: t('common.fetchUserData'), type: 'error' });
      return;
    }

    const { applicationRole, status } = userData as UserProps;

    updateUserLanguageAndStatus(userId, status, applicationRole === 'admin');

    if (applicationRole === 'admin') {
      handleApplicationAdminUpdate(userData);
      return;
    }

    if (applicationRole === 'user') {
      handleApplicationUserUpdate(userData);
      return;
    }

    logout();
    showNotification({ title: t('common.fetchUserData'), type: 'error' });
  };

  const handleUnauthenticatedUserUpdate = () => {
    logout();
  };

  const updateUserLanguageAndStatus = async (userId: string, status: UserStatusType, isAdmin: boolean): Promise<void> => {
    await updateUserLastLogin(userId);

    if (!isAdmin && (status === 'invited' || status === 'created')) {
      await updateUserActiveStatus(userId);
    }
  };

  useEffect(() => {
    if (sessionUser) {
      handleUserUpdate(sessionUser);
      return;
    }

    handleUnauthenticatedUserUpdate();
  }, [sessionUser]);

  return children;
};

export default AuthCenter;
