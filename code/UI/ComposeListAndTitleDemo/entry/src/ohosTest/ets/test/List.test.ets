

import abilityTest from './Ability.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import listModelsTest from './ListModels.test';
import contactStoreMatrixTest from './ContactStoreMatrix.test';
import listConfigFactoryMatrixTest from './ListConfigFactoryMatrix.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';

export default function testsuite() {
  abilityTest();
  deviceUtilTest();
  logUtilTest();
  listModelsTest();
  contactStoreMatrixTest();
  listConfigFactoryMatrixTest();
  logUtilMatrixTest();
  deviceUtilMatrixTest();
}
