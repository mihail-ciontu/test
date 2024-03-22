import { ReactNode } from 'react';

export type ShadowProps = {
  children: ReactNode;
  type?: 'low' | 'medium' | 'high';
};
