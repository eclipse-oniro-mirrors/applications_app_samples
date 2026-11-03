import abilityTest from './Ability.test';
import matrix2dTest from './Matrix2D.test';
import pixelMapUtilTest from './PixelMapUtil.test';
import canvasScenesTest from './CanvasScenes.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import colorUtilTest from './ColorUtil.test';
import geometryUtilTest from './GeometryUtil.test';
import perfTimerTest from './PerfTimer.test';
import sceneRegistryTest from './SceneRegistry.test';
import colorUtilMatrixTest from './ColorUtilMatrix.test';
import geometryUtilMatrixTest from './GeometryUtilMatrix.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import perfTimerMatrixTest from './PerfTimerMatrix.test';
import pixelMapUtilMatrixTest from './PixelMapUtilMatrix.test';
import sceneRegistryMatrixTest from './SceneRegistryMatrix.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';
import canvasScenesMatrixTest from './CanvasScenesMatrix.test';
import indexUiTest from './IndexUi.test';

export default function testsuite() {
  abilityTest();
  matrix2dTest();
  pixelMapUtilTest();
  canvasScenesTest();
  deviceUtilTest();
  logUtilTest();
  colorUtilTest();
  geometryUtilTest();
  perfTimerTest();
  sceneRegistryTest();
  // 矩阵套件：在基线用例之上补齐输入/边界组合
  colorUtilMatrixTest();
  geometryUtilMatrixTest();
  logUtilMatrixTest();
  perfTimerMatrixTest();
  pixelMapUtilMatrixTest();
  sceneRegistryMatrixTest();
  deviceUtilMatrixTest();
  canvasScenesMatrixTest();
  // UI 用例会前台拉起主页面，放在最后执行，避免影响纯逻辑用例
  indexUiTest();
}
