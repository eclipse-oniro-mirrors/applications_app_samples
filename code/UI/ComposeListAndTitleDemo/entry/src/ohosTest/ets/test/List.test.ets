/**
 * 文件：entry/src/ohosTest/ets/test/List.test.ets
 * 套件：testsuite（测试入口）
 * 内容：注册并依次执行全部测试套件，共 4 套件 54 条用例
 * - abilityTest：框架连通性（1）
 * - deviceUtilTest：设备形态与断点（9）
 * - logUtilTest：日志格式与级别过滤（9）
 * - listModelsTest：ContactStore/ListConfigFactory（35）
 * 运行：aa test -b com.samples.composelistandtitledemo -m entry_test -s unittest OpenHarmonyTestRunner
 */
import abilityTest from './Ability.test';
import deviceUtilTest from './DeviceUtil.test';
import logUtilTest from './LogUtil.test';
import listModelsTest from './ListModels.test';

export default function testsuite() {
  abilityTest();
  deviceUtilTest();
  logUtilTest();
  listModelsTest();
}
