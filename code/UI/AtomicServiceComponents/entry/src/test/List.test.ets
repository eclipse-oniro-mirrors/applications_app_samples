import demoLogicTest from './DemoLogic.test';
import formatUtilTest from './FormatUtil.test';
import errorUtilTest from './ErrorUtil.test';
import deviceProfileTest from './DeviceProfile.test';
import logStoreTest from './LogStore.test';
import downloadFlowTest from './DownloadFlow.test';
import appConstantsTest from './AppConstants.test';

export default function testsuite() {
  demoLogicTest();
  formatUtilTest();
  errorUtilTest();
  deviceProfileTest();
  logStoreTest();
  downloadFlowTest();
  appConstantsTest();
}
