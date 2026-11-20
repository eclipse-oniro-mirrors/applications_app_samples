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

export default function FlowOperationMatrixPart1Test(): void {
  describe('FlowOperationMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_FOPP1_0100
     * @tc.name      testFlowSequence0001
     * @tc.desc      Verify data source after operations P-P-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0001 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('p2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0200
     * @tc.name      testFlowSequence0002
     * @tc.desc      Verify data source after operations P-P-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0002 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0300
     * @tc.name      testFlowSequence0003
     * @tc.desc      Verify data source after operations P-P-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0003 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0400
     * @tc.name      testFlowSequence0004
     * @tc.desc      Verify data source after operations P-P-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0004 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0500
     * @tc.name      testFlowSequence0005
     * @tc.desc      Verify data source after operations P-P-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0005 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0600
     * @tc.name      testFlowSequence0006
     * @tc.desc      Verify data source after operations P-P-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0006 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0700
     * @tc.name      testFlowSequence0007
     * @tc.desc      Verify data source after operations P-P-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0007 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0800
     * @tc.name      testFlowSequence0008
     * @tc.desc      Verify data source after operations P-P-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0008 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_0900
     * @tc.name      testFlowSequence0009
     * @tc.desc      Verify data source after operations P-P-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0009 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1000
     * @tc.name      testFlowSequence0010
     * @tc.desc      Verify data source after operations P-P-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0010 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1100
     * @tc.name      testFlowSequence0011
     * @tc.desc      Verify data source after operations P-P-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0011 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1200
     * @tc.name      testFlowSequence0012
     * @tc.desc      Verify data source after operations P-P-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0012 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1300
     * @tc.name      testFlowSequence0013
     * @tc.desc      Verify data source after operations P-P-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0013 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1400
     * @tc.name      testFlowSequence0014
     * @tc.desc      Verify data source after operations P-P-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0014 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1500
     * @tc.name      testFlowSequence0015
     * @tc.desc      Verify data source after operations P-P-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0015 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1600
     * @tc.name      testFlowSequence0016
     * @tc.desc      Verify data source after operations P-P-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0016 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0016 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1700
     * @tc.name      testFlowSequence0017
     * @tc.desc      Verify data source after operations P-A0-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0017 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0017 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1800
     * @tc.name      testFlowSequence0018
     * @tc.desc      Verify data source after operations P-A0-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0018 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0018 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_1900
     * @tc.name      testFlowSequence0019
     * @tc.desc      Verify data source after operations P-A0-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0019 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0019 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2000
     * @tc.name      testFlowSequence0020
     * @tc.desc      Verify data source after operations P-A0-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0020 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0020 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2100
     * @tc.name      testFlowSequence0021
     * @tc.desc      Verify data source after operations P-A0-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0021 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0021 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2200
     * @tc.name      testFlowSequence0022
     * @tc.desc      Verify data source after operations P-A0-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0022 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(ds.getData(3).description).assertEqual('p1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0022 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2300
     * @tc.name      testFlowSequence0023
     * @tc.desc      Verify data source after operations P-A0-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0023 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(ds.getData(3).description).assertEqual('p1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0023 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2400
     * @tc.name      testFlowSequence0024
     * @tc.desc      Verify data source after operations P-A0-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0024 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0024 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2500
     * @tc.name      testFlowSequence0025
     * @tc.desc      Verify data source after operations P-A0-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0025 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0025 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2600
     * @tc.name      testFlowSequence0026
     * @tc.desc      Verify data source after operations P-A0-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0026 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0026 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2700
     * @tc.name      testFlowSequence0027
     * @tc.desc      Verify data source after operations P-A0-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0027 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0027 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2800
     * @tc.name      testFlowSequence0028
     * @tc.desc      Verify data source after operations P-A0-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0028 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0028 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_2900
     * @tc.name      testFlowSequence0029
     * @tc.desc      Verify data source after operations P-A0-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0029 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0029 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3000
     * @tc.name      testFlowSequence0030
     * @tc.desc      Verify data source after operations P-A0-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0030 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0030 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3100
     * @tc.name      testFlowSequence0031
     * @tc.desc      Verify data source after operations P-A0-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0031 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0031 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3200
     * @tc.name      testFlowSequence0032
     * @tc.desc      Verify data source after operations P-A0-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0032 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0032 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3300
     * @tc.name      testFlowSequence0033
     * @tc.desc      Verify data source after operations P-A1-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0033 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0033 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3400
     * @tc.name      testFlowSequence0034
     * @tc.desc      Verify data source after operations P-A1-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0034 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0034 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3500
     * @tc.name      testFlowSequence0035
     * @tc.desc      Verify data source after operations P-A1-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0035 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0035 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3600
     * @tc.name      testFlowSequence0036
     * @tc.desc      Verify data source after operations P-A1-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0036 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0036 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3700
     * @tc.name      testFlowSequence0037
     * @tc.desc      Verify data source after operations P-A1-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0037 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0037 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3800
     * @tc.name      testFlowSequence0038
     * @tc.desc      Verify data source after operations P-A1-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0038 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0038 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_3900
     * @tc.name      testFlowSequence0039
     * @tc.desc      Verify data source after operations P-A1-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0039 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p1');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0039 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP1_4000
     * @tc.name      testFlowSequence0040
     * @tc.desc      Verify data source after operations P-A1-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0040 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0040 end');
    })

  })
}
