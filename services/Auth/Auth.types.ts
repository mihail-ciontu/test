export type EmailLoginProps = {
  email: string;
  password: string;
};

export type MobileLoginProps = {
  mobileNumber: string;
  password: string;
};

export type RequestVerifyCodeProps = {
  email: string;
  phoneNumber: string;
  code: string;
};

export type RequestSetNewPasswordProps = {
  email?: string;
  code: string;
  phoneNumber?: string;
  password: string;
  confirmPassword: string;
};

export type ResponseVerifyResetPasswordCodeProps = {
  type: 'data';
  result: boolean;
};
