import abilityTest from './Ability.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import dialogModelsTest from './DialogModels.test';
import dialogEventLogMatrixTest from './DialogEventLogMatrix.test';
import dialogModelsMatrixTest from './DialogModelsMatrix.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';
import dialogScenariosTest from './DialogScenarios.test';
import dialogScenariosMatrixTest from './DialogScenariosMatrix.test';

export default function testsuite() {
  abilityTest();
  deviceUtilTest();
  logUtilTest();
  dialogModelsTest();
  dialogEventLogMatrixTest();
  dialogModelsMatrixTest();
  logUtilMatrixTest();
  deviceUtilMatrixTest();
  dialogScenariosTest();
  dialogScenariosMatrixTest();
}
