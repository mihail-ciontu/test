import { getI18n } from 'react-i18next';

import { ORGANISATIONS_TABLE } from '@omir-monorepo/common/constants/tables';
import { OrganisationProps } from '@omir-monorepo/common/interfaces/organisation';

import { supabase } from '@/config/supabase';

import { matchSupabaseError } from '../services.utils';

export const getOrganisationsList = async (): Promise<Array<OrganisationProps>> => {
  const { t } = getI18n();

  const { data, error } = await supabase.from(ORGANISATIONS_TABLE).select('*');

  if (error) {
    throw new Error(matchSupabaseError(error, t('login:errors.fetchOrganisations')));
  }

  return data || ([] as Array<OrganisationProps>);
};
