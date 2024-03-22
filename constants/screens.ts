const AUTH = {
  LOGIN: 'Login',
  EMAIL_LOGIN: 'EmailLogin',
  MOBILE_LOGIN: 'MobileLogin',
  FORGOT_PASSWORD: 'ForgotPassword',
  TERMS_AND_CONDITIONS: 'TermsAndConditions',
  ORGANISATION_SELECTION: 'OrganisationSelection',
  CONFIRMATION_CODE: 'ConfirmationCode',
  NEW_PASSWORD: 'NewPassword',
  PASSWORD_CHANGED: 'PasswordChangedScreen',
  USER_BLOCKED: 'UserBlocked',
};

const ORGANISATION = {
  HOME: 'Home',
  NEWS: 'News',
};

const USER = {
  SETTINGS: 'UserSettings',
};

export const SCREENS = {
  AUTH,
  ORGANISATION,
  USER,
} as const;
