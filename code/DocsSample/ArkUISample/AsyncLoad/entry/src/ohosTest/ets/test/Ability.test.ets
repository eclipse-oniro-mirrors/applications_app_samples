import { describe, it, expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import { abilityDelegatorRegistry } from '@ohos.app.ability/abilityDelegatorRegistry';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;
const TAG = '[Sample_AsyncLoad]'
const DOMAIN = 0xF811
const BUNDLE = 'AsyncLoad'

export default function abilityTest() {

  describe('AsyncLoadTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      let driver = Driver.create();
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number UiTest_001
     * @tc.name asyncLoadBasic
     * @tc.desc 测试基础异步加载场景
     * @tc.level: Level 1
     */
    it('asyncLoadBasic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: asyncLoadBasic begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AsyncLoadBasic' });
      await driver.delayMs(2000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name asyncLoadPlaceholder
     * @tc.desc 测试占位组件场景
     * @tc.level: Level 1
     */
    it('asyncLoadPlaceholder', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: asyncLoadPlaceholder begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AsyncLoadPlaceholder' });
      await driver.delayMs(2000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name asyncLoadTimeout
     * @tc.desc 测试超时策略场景
     * @tc.level: Level 1
     */
    it('asyncLoadTimeout', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: asyncLoadTimeout begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AsyncLoadTimeout' });
      await driver.delayMs(2000);
      done();
    });
  });
}