import axios, { AxiosResponse } from 'axios';

import { supabase } from '@/config/supabase';
import { API_URL } from '@/constants/environmentVariables';

const apiConfig = {
  returnRejectedPromiseOnError: true,
  withCredentials: true,
  timeout: 30000,
  baseURL: API_URL,
  headers: {
    common: {
      'Cache-Control': 'no-cache, no-store, must-revalidate',
      Pragma: 'no-cache',
      'Content-Type': 'application/json',
      Accept: 'application/json',
    },
  },
};

const axiosInstance = axios.create(apiConfig);

axiosInstance.interceptors.request.use(async (param) => {
  const session = await supabase.auth.getSession();
  const token = session.data.session?.access_token;

  if (param.headers) {
    param.headers.Authorization = `Bearer ${token}`;
    return {
      ...param,
    };
  }

  return {
    ...param,
  };
});

axiosInstance.interceptors.response.use((param: AxiosResponse) => ({
  ...param,
}));

export default axiosInstance;
