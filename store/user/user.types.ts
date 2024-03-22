import { User } from '@supabase/supabase-js';

import { UserAllProps, UserStructureProps } from '@omir-monorepo/common/interfaces/user';
import { Nullable } from '@omir-monorepo/common/interfaces/utils';

export interface FunctionUserProps extends UserAllProps {
  organisationId: string;
  userStructure: UserStructureProps;
  acceptedTerms: boolean;
}

export type UserStoreProps = {
  sessionUser: Nullable<User>;
  setSessionUser: (user: Nullable<User>) => void;
  user: FunctionUserProps;
  setUser: (user: FunctionUserProps) => void;
  resetUser: () => void;
  unsubscribeUser: (() => void) | null;
  setUnsubscribeUser: (unsubscribe: () => void) => void;
  fireUserListener: () => Promise<void>;
  clearUserListener: () => void;
};

export type UserRealtimeProfileProps = {
  role: number;
};
