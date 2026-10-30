import atomicServiceComponentsTest from './AtomicServiceComponents.test';
import constantsAndThemeTest from './ConstantsAndTheme.test';
import demoLogicTest from './DemoLogic.test';
import deviceProfileTest from './DeviceProfile.test';
import downloadFlowTest from './DownloadFlow.test';
import errorUtilTest from './ErrorUtil.test';
import formatUtilTest from './FormatUtil.test';
import logStoreTest from './LogStore.test';

export default function testsuite() {
  atomicServiceComponentsTest();
  demoLogicTest();
  downloadFlowTest();
  deviceProfileTest();
  logStoreTest();
  formatUtilTest();
  errorUtilTest();
  constantsAndThemeTest();
}
