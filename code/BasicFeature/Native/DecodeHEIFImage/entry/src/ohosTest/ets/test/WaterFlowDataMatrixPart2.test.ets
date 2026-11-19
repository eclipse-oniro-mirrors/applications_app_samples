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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ImageInfo, WaterFlowDataSource } from 'decodeheifimage/src/main/ets/model/WaterFlowData';
import { RecordingListener } from './shared/HeifTestSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_DecodeHEIF]';

export default function WaterFlowDataMatrixPart2Test(): void {
  describe('WaterFlowDataMatrixPart2', () => {

    /**
     * @tc.number    SUB_HEIF_WFDP2_3100
     * @tc.name      testRemoveOneOfTwo0031
     * @tc.desc      Verify removing one listener leaves the other active.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRemoveOneOfTwo0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRemoveOneOfTwo0031 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const first: RecordingListener = new RecordingListener();
      const second: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(first);
      ds.registerDataChangeListener(second);
      ds.unregisterDataChangeListener(first);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      expect(first.addIndexes.length).assertEqual(0);
      expect(second.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRemoveOneOfTwo0031 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3200
     * @tc.name      testReRegister0032
     * @tc.desc      Verify a listener can be registered again after removal.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReRegister0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReRegister0032 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.unregisterDataChangeListener(listener);
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 1, 'a'));
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReRegister0032 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3300
     * @tc.name      testNotifyAddDirect0033
     * @tc.desc      Verify notifyDataAdd forwards the explicit index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNotifyAddDirect0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAddDirect0033 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(5);
      expect(listener.addIndexes[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAddDirect0033 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3400
     * @tc.name      testNotifyChangeDirect0034
     * @tc.desc      Verify notifyDataChange forwards the explicit index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNotifyChangeDirect0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChangeDirect0034 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(2);
      expect(listener.changeIndexes[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChangeDirect0034 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3500
     * @tc.name      testNotifyDeleteDirect0035
     * @tc.desc      Verify notifyDataDelete forwards the explicit index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNotifyDeleteDirect0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDeleteDirect0035 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(3);
      expect(listener.deleteIndexes[0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDeleteDirect0035 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3600
     * @tc.name      testNotifyMoveDirect0036
     * @tc.desc      Verify notifyDataMove forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNotifyMoveDirect0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMoveDirect0036 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(1, 4);
      expect(listener.moveFrom[0]).assertEqual(1);
      expect(listener.moveTo[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMoveDirect0036 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3700
     * @tc.name      testNotifyReloadTwice0037
     * @tc.desc      Verify two reload notifications are counted separately.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyReloadTwice0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReloadTwice0037 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataReload();
      ds.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReloadTwice0037 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3800
     * @tc.name      testNotifyWithoutListener0038
     * @tc.desc      Verify notifying without listeners does not throw.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyWithoutListener0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyWithoutListener0038 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      let threw: boolean = false;
      try {
        ds.notifyDataAdd(0);
        ds.notifyDataChange(0);
        ds.notifyDataDelete(0);
        ds.notifyDataMove(0, 1);
        ds.notifyDataReload();
      } catch (err) {
        threw = true;
      }
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyWithoutListener0038 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_3900
     * @tc.name      testNotifyAddLargeIndex0039
     * @tc.desc      Verify notifyDataAdd forwards a large index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAddLargeIndex0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAddLargeIndex0039 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(99);
      expect(listener.addIndexes[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAddLargeIndex0039 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_4000
     * @tc.name      testNotifyChangeLargeIndex0040
     * @tc.desc      Verify notifyDataChange forwards a large index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChangeLargeIndex0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChangeLargeIndex0040 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(99);
      expect(listener.changeIndexes[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChangeLargeIndex0040 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_4100
     * @tc.name      testNotifyDeleteLargeIndex0041
     * @tc.desc      Verify notifyDataDelete forwards a large index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDeleteLargeIndex0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDeleteLargeIndex0041 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(99);
      expect(listener.deleteIndexes[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDeleteLargeIndex0041 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_4200
     * @tc.name      testNotifyMoveReverse0042
     * @tc.desc      Verify notifyDataMove keeps reversed positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMoveReverse0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMoveReverse0042 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(9, 0);
      expect(listener.moveFrom[0]).assertEqual(9);
      expect(listener.moveTo[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMoveReverse0042 end');
    })

    /**
     * @tc.number    SUB_HEIF_WFDP2_4300
     * @tc.name      testNotifyMultipleEvents0043
     * @tc.desc      Verify several notification kinds accumulate on one listener.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMultipleEvents0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMultipleEvents0043 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(1);
      ds.notifyDataChange(2);
      ds.notifyDataDelete(3);
      ds.notifyDataMove(4, 5);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.moveFrom.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMultipleEvents0043 end');
    })

  })
}
