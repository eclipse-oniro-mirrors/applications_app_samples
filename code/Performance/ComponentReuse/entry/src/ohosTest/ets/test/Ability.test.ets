/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { beforeAll, describe, it, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xFF00;
const TAG: string = 'ComponentReuse_Test';
const BUNDLE: string = 'com.example.componentreuse';
const ABILITY: string = 'EntryAbility';

const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver: Driver = Driver.create();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async (done: Function) => {
      const want: Want = {
        bundleName: BUNDLE,
        abilityName: ABILITY
      };
      abilityDelegator.startAbility(want, (err) => {
        if (err) {
          hilog.error(DOMAIN, TAG, '%{public}s', `error: ${JSON.stringify(err)}`);
        } else {
          hilog.info(DOMAIN, TAG, '%{public}s', 'success start ability');
        }
      });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0100
     * @tc.name testComponentReusePage0001
     * @tc.desc Verify entering, swiping and returning the first page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0001 begin: reduce nested levels`);
      await runPageTest(driver, '减少组件复用的嵌套层级');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0001 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0200
     * @tc.name testComponentReusePage0002
     * @tc.desc Verify entering, swiping and returning the second page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0002 begin: reduce nested levels negative`);
      await runPageTest(driver, '减少组件复用的嵌套层级 - 反例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0002 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0300
     * @tc.name testComponentReusePage0003
     * @tc.desc Verify entering, swiping and returning the third page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0003 begin: attribute updater`);
      await runPageTest(driver, '使用AttributeUpdater精准控制组件属性的刷新');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0003 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0400
     * @tc.name testComponentReusePage0004
     * @tc.desc Verify entering, swiping and returning the fourth page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0004 begin: attribute updater negative`);
      await runPageTest(driver, '使用AttributeUpdater精准控制组件属性的刷新 - 反例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0004 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0500
     * @tc.name testComponentReusePage0005
     * @tc.desc Verify entering, swiping and returning the fifth page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0005 begin: link objectlink negative`);
      await runPageTest(driver, '使用@Link/@ObjectLink替代@Prop减少深拷贝 - 反例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0005 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0600
     * @tc.name testComponentReusePage0006
     * @tc.desc Verify entering, swiping and returning the sixth page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0006 begin: aboutToReuse negative`);
      await runPageTest(driver, '避免状态变量在aboutToReuse方法中再进行更新 - 反例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0006 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0700
     * @tc.name testComponentReusePage0007
     * @tc.desc Verify entering, swiping and returning the seventh page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0007 begin: reuse id`);
      await runPageTest(driver, '使用reuseId标记不同结构的组件');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0007 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0800
     * @tc.name testComponentReusePage0008
     * @tc.desc Verify entering, swiping and returning the eighth page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0008 begin: reuse id negative`);
      await runPageTest(driver, '使用reuseId标记不同结构的组件 - 反例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0008 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_0900
     * @tc.name testComponentReusePage0009
     * @tc.desc Verify entering, swiping and returning the ninth page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0009 begin: function param`);
      await runPageTest(driver, '避免使用函数/方法作为复用组件创建时的入参');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0009 end');
      done();
    });

    /**
     * @tc.number SUB_COMPONENT_REUSE_PAGE_1000
     * @tc.name testComponentReusePage0010
     * @tc.desc Verify entering, swiping and returning the tenth page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentReusePage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `testComponentReusePage0010 begin: function param negative`);
      await runPageTest(driver, '避免使用函数/方法作为复用组件创建时的入参 - 反例');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testComponentReusePage0010 end');
      done();
    });
  });
}

async function runPageTest(driver: Driver, pageTitle: string): Promise<void> {
  const button: Component = await driver.findComponent(ON.text(pageTitle));
  await button.click();
  await driver.delayMs(500);
  await driver.swipe(100, 1000, 100, 100);
  await driver.delayMs(700);
  await driver.pressBack();
  await driver.delayMs(500);
}
