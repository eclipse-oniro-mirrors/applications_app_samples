
/**
 * 文件：entry/src/ohosTest/ets/test/Ability.test.ets
 * 套件：ActsAbilityTest（1 条用例）
 * 内容：测试框架连通性占位用例（Hypium 断言与 OpenHarmonyTestRunner 可正常执行）
 * 运行：aa test -b com.samples.chipandcounterdemo -m entry_test -s unittest OpenHarmonyTestRunner
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_ABILITY_0100
     * @tc.name assertContain
     * @tc.desc Verify the Hypium assertion framework is reachable on device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('assertContain', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'abc';
      let b = 'b';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })
  })
}
