import { Image } from 'expo-image';
import { useMemo } from 'react';
import { View } from 'react-native';

import { getInitials } from '@omir-monorepo/common/utils/text';

import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './Avatar.styles';
import { AvatarProps } from './Avatar.types';

const Avatar = ({ imageLink, name, isRound = false, width = 32, height = 32, textVariant = 'labelMediumRegular' }: AvatarProps) => {
  const { theme } = useThemeStore();
  const styles = useMemo(() => createStyles(theme), [theme]);
  const commonStyle = { width, height, borderRadius: isRound ? width / 2 : theme.radiuses[4] };

  return (
    <View style={[styles.container, commonStyle]}>
      {imageLink ? (
        <Image source={imageLink} style={commonStyle} />
      ) : (
        name && (
          <View style={styles.fallback}>
            <Typography variant={textVariant} color="white">
              {getInitials(name)}
            </Typography>
          </View>
        )
      )}
    </View>
  );
};

export default Avatar;
