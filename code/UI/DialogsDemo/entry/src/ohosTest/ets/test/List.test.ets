import abilityTest from './Ability.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import dialogModelsTest from './DialogModels.test';

export default function testsuite() {
  abilityTest();
  deviceUtilTest();
  logUtilTest();
  dialogModelsTest();
}
