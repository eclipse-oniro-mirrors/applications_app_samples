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

export default function FlowOperationMatrixPart4Test(): void {
  describe('FlowOperationMatrixPart4', () => {

    /**
     * @tc.number    SUB_HEIF_FOPP4_12100
     * @tc.name      testFlowSequence0121
     * @tc.desc      Verify data source after operations A0-C-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0121 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('b3');
      expect(ds.getData(1).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0121 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12200
     * @tc.name      testFlowSequence0122
     * @tc.desc      Verify data source after operations A0-C-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0122 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0122 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12300
     * @tc.name      testFlowSequence0123
     * @tc.desc      Verify data source after operations A0-C-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0123 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('b3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0123 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12400
     * @tc.name      testFlowSequence0124
     * @tc.desc      Verify data source after operations A0-C-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0124 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0124 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12500
     * @tc.name      testFlowSequence0125
     * @tc.desc      Verify data source after operations A0-C-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0125 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0125 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12600
     * @tc.name      testFlowSequence0126
     * @tc.desc      Verify data source after operations A0-C-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0126 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0126 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12700
     * @tc.name      testFlowSequence0127
     * @tc.desc      Verify data source after operations A0-C-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0127 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0127 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12800
     * @tc.name      testFlowSequence0128
     * @tc.desc      Verify data source after operations A0-C-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0128 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0128 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_12900
     * @tc.name      testFlowSequence0129
     * @tc.desc      Verify data source after operations A1-P-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0129 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('b1');
      expect(ds.getData(1).description).assertEqual('p2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0129 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13000
     * @tc.name      testFlowSequence0130
     * @tc.desc      Verify data source after operations A1-P-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0130 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('b1');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0130 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13100
     * @tc.name      testFlowSequence0131
     * @tc.desc      Verify data source after operations A1-P-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0131 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('b1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0131 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13200
     * @tc.name      testFlowSequence0132
     * @tc.desc      Verify data source after operations A1-P-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0132 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0132 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13300
     * @tc.name      testFlowSequence0133
     * @tc.desc      Verify data source after operations A1-P-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0133 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b1');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0133 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13400
     * @tc.name      testFlowSequence0134
     * @tc.desc      Verify data source after operations A1-P-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0134 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('b1');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0134 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13500
     * @tc.name      testFlowSequence0135
     * @tc.desc      Verify data source after operations A1-P-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0135 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b1');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0135 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13600
     * @tc.name      testFlowSequence0136
     * @tc.desc      Verify data source after operations A1-P-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0136 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0136 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13700
     * @tc.name      testFlowSequence0137
     * @tc.desc      Verify data source after operations A1-P-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0137 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('b1');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0137 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13800
     * @tc.name      testFlowSequence0138
     * @tc.desc      Verify data source after operations A1-P-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0138 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('b1');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0138 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_13900
     * @tc.name      testFlowSequence0139
     * @tc.desc      Verify data source after operations A1-P-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0139 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('b1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0139 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14000
     * @tc.name      testFlowSequence0140
     * @tc.desc      Verify data source after operations A1-P-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0140 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0140 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14100
     * @tc.name      testFlowSequence0141
     * @tc.desc      Verify data source after operations A1-P-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0141 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0141 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14200
     * @tc.name      testFlowSequence0142
     * @tc.desc      Verify data source after operations A1-P-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0142 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0142 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14300
     * @tc.name      testFlowSequence0143
     * @tc.desc      Verify data source after operations A1-P-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0143 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0143 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14400
     * @tc.name      testFlowSequence0144
     * @tc.desc      Verify data source after operations A1-P-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0144 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0144 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14500
     * @tc.name      testFlowSequence0145
     * @tc.desc      Verify data source after operations A1-A0-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0145 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b1');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0145 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14600
     * @tc.name      testFlowSequence0146
     * @tc.desc      Verify data source after operations A1-A0-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0146 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('b1');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0146 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14700
     * @tc.name      testFlowSequence0147
     * @tc.desc      Verify data source after operations A1-A0-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0147 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b1');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0147 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14800
     * @tc.name      testFlowSequence0148
     * @tc.desc      Verify data source after operations A1-A0-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0148 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0148 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_14900
     * @tc.name      testFlowSequence0149
     * @tc.desc      Verify data source after operations A1-A0-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0149 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('b1');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0149 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15000
     * @tc.name      testFlowSequence0150
     * @tc.desc      Verify data source after operations A1-A0-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0150 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(ds.getData(3).description).assertEqual('b1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0150 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15100
     * @tc.name      testFlowSequence0151
     * @tc.desc      Verify data source after operations A1-A0-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0151 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(ds.getData(3).description).assertEqual('b1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0151 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15200
     * @tc.name      testFlowSequence0152
     * @tc.desc      Verify data source after operations A1-A0-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0152 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0152 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15300
     * @tc.name      testFlowSequence0153
     * @tc.desc      Verify data source after operations A1-A0-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0153 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('b1');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0153 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15400
     * @tc.name      testFlowSequence0154
     * @tc.desc      Verify data source after operations A1-A0-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0154 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('b1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0154 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15500
     * @tc.name      testFlowSequence0155
     * @tc.desc      Verify data source after operations A1-A0-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0155 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('b1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0155 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15600
     * @tc.name      testFlowSequence0156
     * @tc.desc      Verify data source after operations A1-A0-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0156 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0156 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15700
     * @tc.name      testFlowSequence0157
     * @tc.desc      Verify data source after operations A1-A0-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0157 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0157 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15800
     * @tc.name      testFlowSequence0158
     * @tc.desc      Verify data source after operations A1-A0-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0158 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0158 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_15900
     * @tc.name      testFlowSequence0159
     * @tc.desc      Verify data source after operations A1-A0-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0159 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0159 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP4_16000
     * @tc.name      testFlowSequence0160
     * @tc.desc      Verify data source after operations A1-A0-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0160 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(1, new ImageInfo(null, 1, 2, 'b1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0160 end');
    })

  })
}
