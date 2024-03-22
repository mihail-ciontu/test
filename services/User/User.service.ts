import { API_USER_ROUTES } from '@omir-monorepo/common/constants/apiRoutes';

import axios from '@/config/axios';

export const updateUserLastLogin = async (userId: string): Promise<void> => {
  try {
    await axios.post(API_USER_ROUTES.USER_UPDATE_LAST_LOGIN, { userId });
  } catch (error) {
    console.error(error);
  }
};

export const updateUserActiveStatus = async (userId: string): Promise<void> => {
  try {
    await axios.post(API_USER_ROUTES.USER_UPDATE_STATUS, {
      status: 'active',
      userId,
    });
  } catch (error) {
    console.error(error);
  }
};
