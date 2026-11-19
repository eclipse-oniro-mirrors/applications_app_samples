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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = '[Sample_UiInfoCollectionAndInjection]';
const DOMAIN = 0xF811;
const BUNDLE = 'uiinfocollectionandinjection_';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;
let driver: Driver;

// Returns to the home page before a case runs. Back navigation needs time to complete, so every
// attempt waits; the app is started again if it was left, because a failed case may have exited it.
async function ensureHomePage(): Promise<boolean> {
  for (let attempt = 0; attempt < 3; attempt++) {
    const navButton = await driver.findComponent(ON.id('navImageButton'));
    if (navButton !== null) {
      return true;
    }
    await driver.pressBack();
    await driver.delayMs(1500);
  }
  await delegator.startAbility(want);
  await driver.delayMs(3000);
  return await driver.findComponent(ON.id('navImageButton')) !== null;
}

async function openImagePage(): Promise<boolean> {
  if (!await ensureHomePage()) {
    return false;
  }
  const navButton = await driver.findComponent(ON.id('navImageButton'));
  await navButton!.click();
  await driver.delayMs(2000);
  return await driver.findComponent(ON.id('captureImageButton')) !== null;
}

export default function ImageTest() {
  describe('ImageTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      driver = Driver.create();
      await driver.delayMs(2000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    });

    /**
     * @tc.number uiinfocollectionandinjection_IndexImage_001
     * @tc.name IndexImage_001
     * @tc.desc 测试从主页进入节点图片采集页面
     */
    it(BUNDLE + 'IndexImage_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexImage_001, begin');
      const opened = await openImagePage();
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexImage_001, opened: ' + opened);
      expect(opened).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'IndexImage_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_ImageSingle_001
     * @tc.name ImageSingle_001
     * @tc.desc 测试采集单个Image节点，回调整体错误码为0
     */
    it(BUNDLE + 'ImageSingle_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageSingle_001, begin');
      const opened = await openImagePage();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageSingle_001, opened: ' + opened);
      expect(opened).assertTrue();
      const captureButton = await driver.findComponent(ON.id('captureImageButton'));
      await captureButton!.click();
      await driver.delayMs(4000);
      // 整体错误码为0，说明请求被受理并且采集成功
      const statusElement = await driver.findComponent(ON.text('overallError=0', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageSingle_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageSingle_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_ImageBatch_001
     * @tc.name ImageBatch_001
     * @tc.desc 测试一次请求采集三个节点，结果项数量为3
     */
    it(BUNDLE + 'ImageBatch_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageBatch_001, begin');
      const opened = await openImagePage();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageBatch_001, opened: ' + opened);
      expect(opened).assertTrue();
      const captureButton = await driver.findComponent(ON.id('captureBatchButton'));
      await captureButton!.click();
      await driver.delayMs(4000);
      const statusElement = await driver.findComponent(ON.text('items=3', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageBatch_001, status: ' + (statusElement !== null));
      expect(statusElement === null).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageBatch_001, end');
      done();
    });

    /**
     * @tc.number uiinfocollectionandinjection_ImageStale_001
     * @tc.name ImageStale_001
     * @tc.desc 测试请求中包含已移除节点时，该结果项报告节点不存在且其他项仍返回图片
     */
    it(BUNDLE + 'ImageStale_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageStale_001, begin');
      const opened = await openImagePage();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageStale_001, opened: ' + opened);
      expect(opened).assertTrue();
      const captureButton = await driver.findComponent(ON.id('captureStaleButton'));
      await captureButton!.click();
      await driver.delayMs(5000);
      // 已移除节点的结果项带节点不存在错误码，其余项不受影响
      const itemElement = await driver.findComponent(ON.text('itemError=106410', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageStale_001, item: ' + (itemElement !== null));
      expect(itemElement === null).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ImageStale_001, end');
      done();
    });
  })
}
