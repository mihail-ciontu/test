import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator, NativeStackNavigationOptions } from '@react-navigation/native-stack';

import { SCREENS } from '@/constants/screens';
import ConfirmationCodeScreen from '@/screens/Auth/ConfirmationCodeScreen';
import ForgotPassword from '@/screens/Auth/ForgotPasswordScreen';
import LoginScreen from '@/screens/Auth/LoginScreen';
import EmailLoginScreen from '@/screens/Auth/LoginScreen/EmailLoginScreen';
import MobileLoginScreen from '@/screens/Auth/LoginScreen/MobileLoginScreen';
import NewPasswordScreen from '@/screens/Auth/NewPasswordScreen';
import OrganisationSelectionScreen from '@/screens/Auth/OrganisationSelectionScreen';
import PasswordChangedScreen from '@/screens/Auth/PasswordChangedScreen';
import TermsAndPolicyScreen from '@/screens/Auth/TermsAndPolicyScreen';
import UserBlockedScreen from '@/screens/Auth/UserBlockedScreen';
import HomeScreen from '@/screens/Organisation/HomeScreen';
import NewsScreen from '@/screens/Organisation/NewsScreen';
import { useOrganisationPublicStore } from '@/store/organisation/public/organisationPublic.store';
import { useThemeStore } from '@/store/theme/theme.store';
import { useUserStore } from '@/store/user/user.store';

import { AUTH_NO_HEADER_NAVIGATION_OPTIONS, NON_AUTH_NAVIGATION_OPTIONS } from './Navigation.constants';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

const Navigation = () => {
  const { theme } = useThemeStore();
  const { sessionUser, user } = useUserStore();
  const { id: organisationId, termsUrl } = useOrganisationPublicStore((state) => state.organisation);

  const isApplicationAdmin = user.applicationRole === 'admin';
  const hasTermsAndPolicies = Boolean(termsUrl);
  const isBlocked = user.status === 'blocked' || user.status === 'created' || user.status === 'nonEmployee';

  if (isBlocked && Boolean(organisationId) && !isApplicationAdmin) {
    return (
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen
            name={SCREENS.AUTH.USER_BLOCKED}
            component={UserBlockedScreen}
            options={AUTH_NO_HEADER_NAVIGATION_OPTIONS}
            initialParams={{ userStatus: user.status }}
          />
        </Stack.Navigator>
      </NavigationContainer>
    );
  }

  if (sessionUser && isApplicationAdmin && !organisationId) {
    return (
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen
            name={SCREENS.AUTH.ORGANISATION_SELECTION}
            component={OrganisationSelectionScreen}
            options={AUTH_NO_HEADER_NAVIGATION_OPTIONS}
          />
        </Stack.Navigator>
      </NavigationContainer>
    );
  }

  if (sessionUser && !isApplicationAdmin && !user.acceptedTerms && hasTermsAndPolicies) {
    return (
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen
            name={SCREENS.AUTH.TERMS_AND_CONDITIONS}
            component={TermsAndPolicyScreen}
            options={AUTH_NO_HEADER_NAVIGATION_OPTIONS}
          />
        </Stack.Navigator>
      </NavigationContainer>
    );
  }

  if (sessionUser && user.acceptedTerms) {
    return (
      <NavigationContainer>
        <Tab.Navigator>
          <Tab.Screen name={SCREENS.ORGANISATION.HOME} component={HomeScreen} />
          <Tab.Screen name={SCREENS.ORGANISATION.NEWS} component={NewsScreen} />
        </Tab.Navigator>
      </NavigationContainer>
    );
  }

  const noHeaderOptions: NativeStackNavigationOptions = {
    ...AUTH_NO_HEADER_NAVIGATION_OPTIONS,
    headerTintColor: theme.colors['fg.base'],
  };

  const options: NativeStackNavigationOptions = {
    ...NON_AUTH_NAVIGATION_OPTIONS,
    headerTintColor: theme.colors['fg.base'],
  };

  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name={SCREENS.AUTH.LOGIN} component={LoginScreen} options={noHeaderOptions} />
        <Stack.Screen name={SCREENS.AUTH.EMAIL_LOGIN} component={EmailLoginScreen} options={options} />
        <Stack.Screen name={SCREENS.AUTH.MOBILE_LOGIN} component={MobileLoginScreen} options={options} />
        <Stack.Screen name={SCREENS.AUTH.FORGOT_PASSWORD} component={ForgotPassword} options={options} />
        <Stack.Screen name={SCREENS.AUTH.CONFIRMATION_CODE} component={ConfirmationCodeScreen} options={options} />
        <Stack.Screen name={SCREENS.AUTH.NEW_PASSWORD} component={NewPasswordScreen} options={options} />
        <Stack.Screen name={SCREENS.AUTH.PASSWORD_CHANGED} component={PasswordChangedScreen} options={noHeaderOptions} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default Navigation;
