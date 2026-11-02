
import abilityTest from './Ability.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import chipModelsTest from './ChipModels.test';
import tagStoreMatrixTest from './TagStoreMatrix.test';
import counterLogicMatrixTest from './CounterLogicMatrix.test';
import chipConfigFactoryMatrixTest from './ChipConfigFactoryMatrix.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';

export default function testsuite() {
  abilityTest();
  deviceUtilTest();
  logUtilTest();
  chipModelsTest();
  tagStoreMatrixTest();
  counterLogicMatrixTest();
  chipConfigFactoryMatrixTest();
  logUtilMatrixTest();
  deviceUtilMatrixTest();
}
