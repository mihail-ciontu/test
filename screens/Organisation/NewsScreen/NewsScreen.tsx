import { View } from 'react-native';

import Typography from '@/components/Typography';
import { useThemeStore } from '@/store/theme/theme.store';

import { createStyles } from './NewsScreen.styles';

const NewsScreen = () => {
  const { theme } = useThemeStore();
  const styles = createStyles(theme);

  return (
    <View style={styles.container}>
      <Typography variant="heading2" color="grey80">
        News List here 📰
      </Typography>
    </View>
  );
};

export default NewsScreen;
