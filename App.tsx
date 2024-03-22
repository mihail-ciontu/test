import { useFonts } from 'expo-font';
import * as SplashScreen from 'expo-splash-screen';
import { StatusBar } from 'expo-status-bar';
import { useCallback, useEffect, useState } from 'react';
import { useTranslation } from 'react-i18next';
import { AppState, Platform, SafeAreaView, StatusBar as StatusBarNative, StyleSheet } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { AuthChangeEvent, Session } from '@supabase/supabase-js';
import { createAsyncStoragePersister } from '@tanstack/query-async-storage-persister';
import { QueryClient } from '@tanstack/react-query';
import { PersistQueryClientProvider } from '@tanstack/react-query-persist-client';

import Notification from '@/components/Notification';
import { supabase } from '@/config/supabase';
import AuthCenter from '@/containers/AuthCenter';
import Navigation from '@/containers/Navigation';
import { useOrganisationPublicStore } from '@/store/organisation/public/organisationPublic.store';
import { useThemeStore } from '@/store/theme/theme.store';
import { useUserStore } from '@/store/user/user.store';

import '@/config/translations';

import { useLanguage } from './hooks/useLanguage';
import { ThemeType } from './interfaces/common';

SplashScreen.preventAutoHideAsync();

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      gcTime: Infinity,
    },
  },
});

export const asyncStoragePersister = createAsyncStoragePersister({
  storage: AsyncStorage,
});

export default function App() {
  const [isApplicationReady, setIsApplicationReady] = useState(false);
  const [isUserInitialized, setIsUserInitialized] = useState(false);
  const { changeLanguage } = useLanguage();
  const { ready: isTranslationReady } = useTranslation();
  const { setSessionUser, user } = useUserStore();
  const { theme, setTheme } = useThemeStore();
  const { primaryColor } = useOrganisationPublicStore((state) => state.organisation);
  const styles = createStyles(theme);

  const [fontsLoaded] = useFonts({
    'Roboto-Regular': require('./assets/fonts/Roboto-Regular.ttf'),
    'Roboto-Medium': require('./assets/fonts/Roboto-Medium.ttf'),
    'Roboto-Bold': require('./assets/fonts/Roboto-Bold.ttf'),
    'RobotoCondensed-Regular': require('./assets/fonts/RobotoCondensed-Regular.ttf'),
    'RobotoCondensed-Medium': require('./assets/fonts/RobotoCondensed-Medium.ttf'),
    'RobotoCondensed-Bold': require('./assets/fonts/RobotoCondensed-Bold.ttf'),
  });

  const onLayoutRootView = useCallback(async () => {
    if (isApplicationReady) {
      await SplashScreen.hideAsync();
    }
  }, [isApplicationReady]);

  const onAuthStateChange = () => {
    return supabase.auth.onAuthStateChange((_: AuthChangeEvent, session: Session | null) => {
      setSessionUser(session?.user || null);
      setIsUserInitialized(true);
    });
  };

  const onForegroundAppStateChange = () => {
    return AppState.addEventListener('change', (nextAppState) => {
      if (nextAppState === 'active') {
        supabase.auth.startAutoRefresh();
        return;
      }

      supabase.auth.stopAutoRefresh();
    });
  };

  useEffect(() => {
    const { data: authListener } = onAuthStateChange();
    const foregroundStateListener = onForegroundAppStateChange();

    return () => {
      authListener.subscription.unsubscribe();
      foregroundStateListener.remove();
    };
  }, []);

  useEffect(() => {
    if (fontsLoaded && isTranslationReady && isUserInitialized) {
      setIsApplicationReady(true);
    }
  }, [fontsLoaded, isTranslationReady, isUserInitialized]);

  useEffect(() => {
    setTheme(primaryColor);
  }, [primaryColor]);

  useEffect(() => {
    const userLanguage = user.language || 'en';
    changeLanguage(userLanguage);
  }, [user.language]);

  if (!isApplicationReady) {
    return null;
  }

  return (
    <SafeAreaView style={styles.container} onLayout={onLayoutRootView}>
      <StatusBar style="dark" />
      <PersistQueryClientProvider client={queryClient} persistOptions={{ persister: asyncStoragePersister }}>
        <AuthCenter>
          <Navigation />
        </AuthCenter>
      </PersistQueryClientProvider>
      <Notification />
    </SafeAreaView>
  );
}

const createStyles = (theme: ThemeType) =>
  StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: theme.colors['bg.canvas'],
      paddingVertical: Platform.OS === 'android' ? StatusBarNative.currentHeight : 0,
    },
  });
