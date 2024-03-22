import { View } from 'react-native';

import Button from '@/components/Button';
import Typography from '@/components/Typography';
import { logout } from '@/services/Auth/Auth.service';
import { useThemeStore } from '@/store/theme/theme.store';
import { useUserStore } from '@/store/user/user.store';

import { createStyles } from './HomeScreen.styles';

const HomeScreen = () => {
  const { theme } = useThemeStore();
  const styles = createStyles(theme);
  const { name } = useUserStore((state) => state.user);

  return (
    <View style={styles.container}>
      <Typography variant="heading2" color="grey80">
        Hey {name}! 👋🏻
      </Typography>
      <Button handlePress={logout}>Logout</Button>
    </View>
  );
};

export default HomeScreen;
