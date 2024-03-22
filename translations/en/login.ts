export default {
  title: 'Sign in',
  signInContinue: 'Continue by signing in',
  haveIssues: 'If you have login issues, please reach out to',
  buttons: {
    mobileSignIn: 'Sign in with mobile number',
    emailSignIn: 'Sign in with email',
    continue: 'Continue',
    forgotPassword: 'Forgot password?',
    agree: 'Agree & Get Started',
    cancel: 'Cancel',
    confirm: 'Confirm',
    backToSignIn: 'Back to Sign in',
    resendCode: 'Resend code',
    resendCodeIn: 'Resend code in {{time}}s',
    retry: 'Retry',
    logout: 'Logout',
  },
  email: {
    description: 'Enter your email and password',
    label: 'Email',
    input: {
      required: 'Email is required',
      valid: 'Email is invalid',
    },
  },
  password: {
    label: 'Password',
    input: {
      required: 'Password is required',
      valid: 'Password should contain 8-50 characters, one digit, one big letter, one small letter',
    },
  },
  confirmPassword: {
    label: 'Confirm password',
    input: {
      required: 'Confirm password is required',
      match: 'Passwords do not match',
    },
  },
  mobile: {
    description: 'Enter your mobile number and password',
    label: 'Mobile number',
    searchPlaceholder: 'Search for your mobile number country',
    input: {
      required: 'Mobile number is required',
      valid: 'Mobile number is invalid',
    },
  },
  termsAndPrivacy: {
    title: 'Review & Agree with {{name}} Terms of Service & Privacy Policy',
    description: 'In order to use the app, you need to review and agree with the Terms of Service & Privacy Policy',
    terms: 'Terms of Service',
    privacy: 'Privacy Policy',
  },
  passwordRecovery: {
    title: 'Password Recovery',
    enterEmail: 'Enter your email address',
    enterMobileNumber: 'Enter your mobile number',
    emailInfo: 'If your email address is confirmed, you will receive an email with a code to reset your password',
    mobileInfo: 'If your mobile number is confirmed, you will receive a text code to reset your password',
    enterPassword: 'Please enter your new password twice to set a new password for your account',
  },
  passwordChanged: {
    title: 'Password successfully changed',
    description: 'Now that you have successfully changed your password, you can go back and sign in into your account',
  },
  authenticationCode: {
    title: 'Enter authentication code',
    descriptionEmail: 'Enter the {{count}}-digit that we have sent via email',
    descriptionMobile: 'Enter the {{count}}-digit that we have sent via the phone number',
    wrongCode: 'The code you entered is incorrect or expired. Please try again.',
    emailHeader: 'Change email',
    mobileHeader: 'Change mobile number',
  },
  organisationList: {
    title: 'Organisations List',
    description: 'Select the organisation you want to see',
    error: {
      title: 'Organizations Fetch Error',
      description: "We apologize, but we're currently experiencing difficulties retrieving the list of organisations.",
    },
  },
  userBlocked: {
    blocked: {
      title: 'Access Blocked',
      description: 'Your account has been blocked. Please contact the support team for further assistance.',
    },
    created: {
      title: 'Verification Required',
      description: 'Your account has not been verified yet. Please contact the support team for further assistance.',
    },
    nonEmployee: {
      title: 'Non Employee',
      description: 'You are not an employee of the organisation anymore. Please contact the support team for further assistance.',
    },
  },
  errors: {
    requestResetPassword: 'An error occurred while trying to reset your password. Please try again later.',
    verifyResetPasswordCode: 'An error occurred while trying to verify your reset password code. Please try again later.',
    setNewPassword: 'An error occurred while trying to set your new password. Please try again later.',
    login: 'An error occurred while trying to sign in. Please try again later.',
    mobileCredentials: 'Mobile number or password are incorrect',
    emailCredentials: 'Email or password are incorrect',
    fetchOrganisations: 'An error occurred while trying to fetch organisations. Please try again later.',
  },
};
