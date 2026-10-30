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
  // UI 用例会前台拉起主页面，放在最后执行，避免影响纯逻辑用例
  indexUiTest();
}
