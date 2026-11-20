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
import { getTasks, executeTasks } from 'decodeheifimage/src/main/ets/model/Taskpool';
import { RecordingListener } from './shared/HeifTestSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_DecodeHEIF]';

export default function NotifyMatrixPart1Test(): void {
  describe('NotifyMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_NTFP1_0100
     * @tc.name      testNotifyAdd0001
     * @tc.desc      Verify notifyDataAdd(-1) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0001 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(-1);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0200
     * @tc.name      testNotifyAdd0002
     * @tc.desc      Verify notifyDataAdd(0) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0002 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(0);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0300
     * @tc.name      testNotifyAdd0003
     * @tc.desc      Verify notifyDataAdd(1) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0003 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(1);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0400
     * @tc.name      testNotifyAdd0004
     * @tc.desc      Verify notifyDataAdd(2) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0004 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(2);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0500
     * @tc.name      testNotifyAdd0005
     * @tc.desc      Verify notifyDataAdd(5) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0005 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(5);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0600
     * @tc.name      testNotifyAdd0006
     * @tc.desc      Verify notifyDataAdd(9) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0006 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(9);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0700
     * @tc.name      testNotifyAdd0007
     * @tc.desc      Verify notifyDataAdd(99) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0007 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(99);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0800
     * @tc.name      testNotifyAdd0008
     * @tc.desc      Verify notifyDataAdd(1000) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyAdd0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0008 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataAdd(1000);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyAdd0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_0900
     * @tc.name      testNotifyChange0009
     * @tc.desc      Verify notifyDataChange(-1) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0009 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(-1);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1000
     * @tc.name      testNotifyChange0010
     * @tc.desc      Verify notifyDataChange(0) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0010 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(0);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1100
     * @tc.name      testNotifyChange0011
     * @tc.desc      Verify notifyDataChange(1) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0011 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(1);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1200
     * @tc.name      testNotifyChange0012
     * @tc.desc      Verify notifyDataChange(2) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0012 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(2);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1300
     * @tc.name      testNotifyChange0013
     * @tc.desc      Verify notifyDataChange(5) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0013 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(5);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1400
     * @tc.name      testNotifyChange0014
     * @tc.desc      Verify notifyDataChange(9) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0014 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(9);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1500
     * @tc.name      testNotifyChange0015
     * @tc.desc      Verify notifyDataChange(99) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0015 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(99);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1600
     * @tc.name      testNotifyChange0016
     * @tc.desc      Verify notifyDataChange(1000) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyChange0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0016 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataChange(1000);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyChange0016 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1700
     * @tc.name      testNotifyDelete0017
     * @tc.desc      Verify notifyDataDelete(-1) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0017 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(-1);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0017 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1800
     * @tc.name      testNotifyDelete0018
     * @tc.desc      Verify notifyDataDelete(0) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0018 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(0);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0018 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_1900
     * @tc.name      testNotifyDelete0019
     * @tc.desc      Verify notifyDataDelete(1) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0019 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(1);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0019 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2000
     * @tc.name      testNotifyDelete0020
     * @tc.desc      Verify notifyDataDelete(2) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0020 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(2);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0020 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2100
     * @tc.name      testNotifyDelete0021
     * @tc.desc      Verify notifyDataDelete(5) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0021 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(5);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0021 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2200
     * @tc.name      testNotifyDelete0022
     * @tc.desc      Verify notifyDataDelete(9) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0022 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(9);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0022 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2300
     * @tc.name      testNotifyDelete0023
     * @tc.desc      Verify notifyDataDelete(99) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0023 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(99);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0023 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2400
     * @tc.name      testNotifyDelete0024
     * @tc.desc      Verify notifyDataDelete(1000) forwards the index.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyDelete0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0024 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataDelete(1000);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyDelete0024 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2500
     * @tc.name      testNotifyReload0025
     * @tc.desc      Verify notifyDataReload called 4 times is counted.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyReload0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReload0025 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      expect(listener.reloadCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReload0025 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2600
     * @tc.name      testNotifyReload0026
     * @tc.desc      Verify notifyDataReload called 5 times is counted.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyReload0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReload0026 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      expect(listener.reloadCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReload0026 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2700
     * @tc.name      testNotifyReload0027
     * @tc.desc      Verify notifyDataReload called 6 times is counted.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyReload0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReload0027 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      ds.notifyDataReload();
      expect(listener.reloadCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyReload0027 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2800
     * @tc.name      testNotifyMove0028
     * @tc.desc      Verify notifyDataMove(0, 0) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0028 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(0, 0);
      expect(listener.moveFrom[0]).assertEqual(0);
      expect(listener.moveTo[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0028 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_2900
     * @tc.name      testNotifyMove0029
     * @tc.desc      Verify notifyDataMove(0, 1) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0029 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(0, 1);
      expect(listener.moveFrom[0]).assertEqual(0);
      expect(listener.moveTo[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0029 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_3000
     * @tc.name      testNotifyMove0030
     * @tc.desc      Verify notifyDataMove(1, 0) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0030 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(1, 0);
      expect(listener.moveFrom[0]).assertEqual(1);
      expect(listener.moveTo[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0030 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_3100
     * @tc.name      testNotifyMove0031
     * @tc.desc      Verify notifyDataMove(5, 9) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0031 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(5, 9);
      expect(listener.moveFrom[0]).assertEqual(5);
      expect(listener.moveTo[0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0031 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_3200
     * @tc.name      testNotifyMove0032
     * @tc.desc      Verify notifyDataMove(9, 1) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0032 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(9, 1);
      expect(listener.moveFrom[0]).assertEqual(9);
      expect(listener.moveTo[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0032 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_3300
     * @tc.name      testNotifyMove0033
     * @tc.desc      Verify notifyDataMove(-1, 5) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0033 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(-1, 5);
      expect(listener.moveFrom[0]).assertEqual(-1);
      expect(listener.moveTo[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0033 end');
    })

    /**
     * @tc.number    SUB_HEIF_NTFP1_3400
     * @tc.name      testNotifyMove0034
     * @tc.desc      Verify notifyDataMove(100, 0) forwards both positions.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNotifyMove0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0034 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.notifyDataMove(100, 0);
      expect(listener.moveFrom[0]).assertEqual(100);
      expect(listener.moveTo[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotifyMove0034 end');
    })

  })
}
