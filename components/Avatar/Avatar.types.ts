import { Nullable } from '@omir-monorepo/common/interfaces/utils';

import { TypographyType } from '@/interfaces/typography';

export type AvatarProps = {
  name: Nullable<string>;
  imageLink?: Nullable<string>;
  alt?: string;
  isRound?: boolean;
  width?: number;
  height?: number;
  textVariant?: TypographyType;
};
