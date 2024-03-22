import { UserStatusType } from '@omir-monorepo/common/interfaces/user';

import SquareCancelIcon from '@/assets/icons/120x120//squareCancel.svg';
import LockIcon from '@/assets/icons/120x120/lock.svg';
import WarningTriangleIcon from '@/assets/icons/120x120/warningTriangle.svg';

import { ScreenVariantProps } from './UserBlockedScreen.types';

export const SCREEN_VARIANTS: Partial<Record<UserStatusType, ScreenVariantProps>> = {
  blocked: {
    title: 'userBlocked.blocked.title',
    description: 'userBlocked.blocked.description',
    icon: LockIcon,
    color: 'red60',
  },
  created: {
    title: 'userBlocked.created.title',
    description: 'userBlocked.created.description',
    icon: WarningTriangleIcon,
    color: 'yellow40',
  },
  nonEmployee: {
    title: 'userBlocked.nonEmployee.title',
    description: 'userBlocked.nonEmployee.description',
    icon: SquareCancelIcon,
    color: 'red60',
  },
};
