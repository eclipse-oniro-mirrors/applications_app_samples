/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SceneModuleInfo } from 'searchcomponent/src/main/ets/components/model/SceneModuleInfo';
import { waterFlowData } from 'searchcomponent/src/main/ets/components/data/WaterFlowData';

const DOMAIN: number = 0xF814;
const TAG: string = 'WaterFlowDataCoreTest';
const VALID_CATEGORIES: string[] = ['UI布局', '动效', '三方库', 'Native', '性能示例', '其他'];

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function waterFlowDataCoreTest(): void {
  describe('WaterFlowDataCoreTest', () => {
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0101
     * @tc.name      testWaterFlowCore0101
     * @tc.desc      Verify the sample list is non empty with 158 entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0101 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waterFlowData.length > 0=${waterFlowData.length > 0}`);
      expect(waterFlowData.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual waterFlowData.length=${waterFlowData.length}, expected=158`);
      expect(waterFlowData.length).assertEqual(158);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Array.isArray(waterFlowData)=${Array.isArray(waterFlowData)}`);
      expect(Array.isArray(waterFlowData)).assertTrue();
      log('testWaterFlowCore0101 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0102
     * @tc.name      testWaterFlowCore0102
     * @tc.desc      Verify every entry is a SceneModuleInfo instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0102 begin');
      for (const item of waterFlowData) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item instanceof SceneModuleInfo}`);
        expect(item instanceof SceneModuleInfo).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${waterFlowData[0] instanceof SceneModuleInfo}`);
      expect(waterFlowData[0] instanceof SceneModuleInfo).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waterFlowData[waterFlowData.length - 1] instanceof SceneMo...`);
      expect(waterFlowData[waterFlowData.length - 1] instanceof SceneModuleInfo).assertTrue();
      log('testWaterFlowCore0102 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0103
     * @tc.name      testWaterFlowCore0103
     * @tc.desc      Verify serial numbers are unique across all entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0103 begin');
      const seen: Set<number> = new Set<number>();
      for (const item of waterFlowData) {
        seen.add(item.serialNumber);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual seen.size=${seen.size}, expected=waterFlowData.length`);
      expect(seen.size).assertEqual(waterFlowData.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse waterFlowData[0].serialNumber === waterFlowData[1].serial...`);
      expect(waterFlowData[0].serialNumber === waterFlowData[1].serialNumber).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse waterFlowData[1].serialNumber === waterFlowData[2].serial...`);
      expect(waterFlowData[1].serialNumber === waterFlowData[2].serialNumber).assertFalse();
      log('testWaterFlowCore0103 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0104
     * @tc.name      testWaterFlowCore0104
     * @tc.desc      Verify all serial numbers are positive integers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0104 begin');
      for (const item of waterFlowData) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item.serialNumber > 0 && Math.floor(item.serialNumber) =...`);
        expect(item.serialNumber > 0 && Math.floor(item.serialNumber) === item.serialNumber).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof waterFlowData[0].serialNumber}`);
      expect(typeof waterFlowData[0].serialNumber).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${waterFlowData[0].serialNumber > 0}`);
      expect(waterFlowData[0].serialNumber > 0).assertTrue();
      log('testWaterFlowCore0104 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0105
     * @tc.name      testWaterFlowCore0105
     * @tc.desc      Verify every entry keeps a non empty string name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0105 begin');
      for (const item of waterFlowData) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue typeof item.name === 'string' && item.name.length > 0`);
        expect(typeof item.name === 'string' && item.name.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof waterFlowData[0].name=${typeof waterFlowData[0].name}`);
      expect(typeof waterFlowData[0].name).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${waterFlowData[0].name.length > 0}`);
      expect(waterFlowData[0].name.length > 0).assertTrue();
      log('testWaterFlowCore0105 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0106
     * @tc.name      testWaterFlowCore0106
     * @tc.desc      Verify every appUri keeps the module/page route format.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0106 begin');
      for (const item of waterFlowData) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item.appUri.includes('/') && item.appUri.length > 1`);
        expect(item.appUri.includes('/') && item.appUri.length > 1).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${waterFlowData[0].appUri.includes('/')}`);
      expect(waterFlowData[0].appUri.includes('/')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waterFlowData[waterFlowData.length - 1].appUri.includes('/')`);
      expect(waterFlowData[waterFlowData.length - 1].appUri.includes('/')).assertTrue();
      log('testWaterFlowCore0106 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0107
     * @tc.name      testWaterFlowCore0107
     * @tc.desc      Verify categories stay inside the six fixed groups.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0107 begin');
      for (const item of waterFlowData) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${VALID_CATEGORIES.includes(item.category)}`);
        expect(VALID_CATEGORIES.includes(item.category)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual VALID_CATEGORIES.length=${VALID_CATEGORIES.length}`);
      expect(VALID_CATEGORIES.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof waterFlowData[0].category}`);
      expect(typeof waterFlowData[0].category).assertEqual('string');
      log('testWaterFlowCore0107 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0108
     * @tc.name      testWaterFlowCore0108
     * @tc.desc      Verify the first entry is the MpChart three party sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0108 begin');
      const first: SceneModuleInfo = waterFlowData[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.name=${first.name}, expected='MpChart图表实现案例'`);
      expect(first.name).assertEqual('MpChart图表实现案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.serialNumber=${first.serialNumber}, expected=4`);
      expect(first.serialNumber).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.category=${first.category}, expected='三方库'`);
      expect(first.category).assertEqual('三方库');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.appUri=${first.appUri}`);
      expect(first.appUri).assertEqual('barchart/BarChartPage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.ratingNumber=${first.ratingNumber}, expected=1`);
      expect(first.ratingNumber).assertEqual(1);
      log('testWaterFlowCore0108 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0109
     * @tc.name      testWaterFlowCore0109
     * @tc.desc      Verify the last entry is the smart fill sample at 179.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0109 begin');
      const last: SceneModuleInfo = waterFlowData[waterFlowData.length - 1];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.name=${last.name}, expected='智能填充案例'`);
      expect(last.name).assertEqual('智能填充案例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.serialNumber=${last.serialNumber}, expected=179`);
      expect(last.serialNumber).assertEqual(179);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.category=${last.category}, expected='其他'`);
      expect(last.category).assertEqual('其他');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.appUri=${last.appUri}`);
      expect(last.appUri).assertEqual('smartfill/SmartFillComponent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.ratingNumber=${last.ratingNumber}, expected=2`);
      expect(last.ratingNumber).assertEqual(2);
      log('testWaterFlowCore0109 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0110
     * @tc.name      testWaterFlowCore0110
     * @tc.desc      Verify rating numbers stay inside the one to five star range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0110 begin');
      for (const item of waterFlowData) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${item.ratingNumber >= 1 && item.ratingNumber <= 5}`);
        expect(item.ratingNumber >= 1 && item.ratingNumber <= 5).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${waterFlowData[0].ratingNumber >= 1}`);
      expect(waterFlowData[0].ratingNumber >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waterFlowData[waterFlowData.length - 1].ratingNumber <= 5`);
      expect(waterFlowData[waterFlowData.length - 1].ratingNumber <= 5).assertTrue();
      log('testWaterFlowCore0110 end');
    })

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_DATACORE_0112
     * @tc.name      testWaterFlowCore0112
     * @tc.desc      Verify the performance group holds five known samples.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWaterFlowCore0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWaterFlowCore0112 begin');
      const perfItems: SceneModuleInfo[] = waterFlowData.filter((item: SceneModuleInfo) =>
        item.category === '性能示例');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual perfItems.length=${perfItems.length}, expected=5`);
      expect(perfItems.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual perfItems.filter((item: SceneModuleInfo) => i..., expected=1`);
      expect(perfItems.filter((item: SceneModuleInfo) => item.name === '使用ArkUI的FrameNode扩展实现动态布局类框架')
        .length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual perfItems.filter((item: SceneModuleInfo) => i..., expected=1`);
      expect(perfItems.filter((item: SceneModuleInfo) => item.name === '全局自定义组件复用实现案例')
        .length).assertEqual(1);
      log('testWaterFlowCore0112 end');
    })
  })
}
