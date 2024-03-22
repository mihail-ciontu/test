import { FC } from 'react';
import { SvgProps } from 'react-native-svg';

import { UserStatusType } from '@omir-monorepo/common/interfaces/user';

import { ColorName } from '@/theme/colors/colors.types';

export type UserBlockedScreenProps = {
  userStatus: UserStatusType;
};

export type ScreenVariantProps = {
  title: string;
  description: string;
  icon: FC<SvgProps>;
  color: ColorName;
};
