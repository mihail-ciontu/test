import { Shadow as ShadowComponent } from 'react-native-shadow-2';

import { ShadowProps } from './Shadow.types';

const Shadow = ({ children, type = 'low' }: ShadowProps) => {
  // TODO: adjust shadows with design system
  return <ShadowComponent>{children}</ShadowComponent>;
};

export default Shadow;
