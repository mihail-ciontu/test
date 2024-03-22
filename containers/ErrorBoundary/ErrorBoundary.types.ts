import { TFunction } from 'i18next';
import { ReactNode } from 'react';

export type ErrorBoundaryProps = {
  children: ReactNode;
  t: TFunction;
};

export type ErrorBoundaryState = {
  hasError: boolean;
};
