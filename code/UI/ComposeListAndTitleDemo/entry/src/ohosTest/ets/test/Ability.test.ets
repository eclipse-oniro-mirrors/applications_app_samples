
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_ABILITY_0100
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
