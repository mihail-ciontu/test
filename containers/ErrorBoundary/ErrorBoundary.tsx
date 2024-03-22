import { Component, ErrorInfo } from 'react';
import { Text, View } from 'react-native';

import { createStyles } from './ErrorBoundary.styles';
// import { withTranslation } from 'next-i18next';
// import Button from '@/components/Buttons/Button';
// import PageStatus from '@/components/PageStatus';
// import ErrorIcon from '@/assets/icons/144x144/error.svg';
import { ErrorBoundaryProps, ErrorBoundaryState } from './ErrorBoundary.types';

class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  public constructor(props: ErrorBoundaryProps) {
    super(props);
    this.state = {
      hasError: false,
    };
  }

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo) {
    console.error(error);
    console.error(errorInfo);
  }

  render() {
    const { hasError } = this.state;
    const { children } = this.props;
    const { t } = this.props;

    if (hasError) {
      return (
        // <Styles.Container>
        //   <PageStatus title={t('title')} description={t('description')} icon={ErrorIcon}>
        //     <Button variant="link" handleClick={this.handleReloadPage}>
        //       {t('reloadButton')}
        //     </Button>
        //   </PageStatus>
        // </Styles.Container>
        <View>
          <Text>Error</Text>
        </View>
      );
    }

    return children;
  }
}

// export default withTranslation('common', { keyPrefix: 'customPages.error' })(ErrorBoundary);
export default ErrorBoundary;
