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

export default function FlowOperationMatrixPart2Test(): void {
  describe('FlowOperationMatrixPart2', () => {

    /**
     * @tc.number    SUB_HEIF_FOPP2_4100
     * @tc.name      testFlowSequence0041
     * @tc.desc      Verify data source after operations P-A1-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0041 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0041 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4200
     * @tc.name      testFlowSequence0042
     * @tc.desc      Verify data source after operations P-A1-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0042 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('p1');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0042 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4300
     * @tc.name      testFlowSequence0043
     * @tc.desc      Verify data source after operations P-A1-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0043 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('p1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0043 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4400
     * @tc.name      testFlowSequence0044
     * @tc.desc      Verify data source after operations P-A1-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0044 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0044 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4500
     * @tc.name      testFlowSequence0045
     * @tc.desc      Verify data source after operations P-A1-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0045 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0045 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4600
     * @tc.name      testFlowSequence0046
     * @tc.desc      Verify data source after operations P-A1-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0046 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0046 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4700
     * @tc.name      testFlowSequence0047
     * @tc.desc      Verify data source after operations P-A1-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0047 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0047 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4800
     * @tc.name      testFlowSequence0048
     * @tc.desc      Verify data source after operations P-A1-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0048 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0048 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_4900
     * @tc.name      testFlowSequence0049
     * @tc.desc      Verify data source after operations P-C-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0049 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('p3');
      expect(ds.getData(1).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0049 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5000
     * @tc.name      testFlowSequence0050
     * @tc.desc      Verify data source after operations P-C-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0050 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0050 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5100
     * @tc.name      testFlowSequence0051
     * @tc.desc      Verify data source after operations P-C-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0051 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('p3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0051 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5200
     * @tc.name      testFlowSequence0052
     * @tc.desc      Verify data source after operations P-C-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0052 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0052 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5300
     * @tc.name      testFlowSequence0053
     * @tc.desc      Verify data source after operations P-C-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0053 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0053 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5400
     * @tc.name      testFlowSequence0054
     * @tc.desc      Verify data source after operations P-C-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0054 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0054 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5500
     * @tc.name      testFlowSequence0055
     * @tc.desc      Verify data source after operations P-C-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0055 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0055 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5600
     * @tc.name      testFlowSequence0056
     * @tc.desc      Verify data source after operations P-C-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0056 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0056 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5700
     * @tc.name      testFlowSequence0057
     * @tc.desc      Verify data source after operations P-C-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0057 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0057 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5800
     * @tc.name      testFlowSequence0058
     * @tc.desc      Verify data source after operations P-C-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0058 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0058 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_5900
     * @tc.name      testFlowSequence0059
     * @tc.desc      Verify data source after operations P-C-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0059 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0059 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6000
     * @tc.name      testFlowSequence0060
     * @tc.desc      Verify data source after operations P-C-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0060 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0060 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6100
     * @tc.name      testFlowSequence0061
     * @tc.desc      Verify data source after operations P-C-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0061 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0061 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6200
     * @tc.name      testFlowSequence0062
     * @tc.desc      Verify data source after operations P-C-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0062 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0062 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6300
     * @tc.name      testFlowSequence0063
     * @tc.desc      Verify data source after operations P-C-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0063 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0063 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6400
     * @tc.name      testFlowSequence0064
     * @tc.desc      Verify data source after operations P-C-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0064 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.pushData(new ImageInfo(null, 1, 2, 'p1'));
      ds.clearData();
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0064 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6500
     * @tc.name      testFlowSequence0065
     * @tc.desc      Verify data source after operations A0-P-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0065 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('p2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0065 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6600
     * @tc.name      testFlowSequence0066
     * @tc.desc      Verify data source after operations A0-P-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0066 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0066 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6700
     * @tc.name      testFlowSequence0067
     * @tc.desc      Verify data source after operations A0-P-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0067 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0067 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6800
     * @tc.name      testFlowSequence0068
     * @tc.desc      Verify data source after operations A0-P-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0068 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0068 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_6900
     * @tc.name      testFlowSequence0069
     * @tc.desc      Verify data source after operations A0-P-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0069 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0069 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7000
     * @tc.name      testFlowSequence0070
     * @tc.desc      Verify data source after operations A0-P-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0070 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0070 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7100
     * @tc.name      testFlowSequence0071
     * @tc.desc      Verify data source after operations A0-P-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0071 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0071 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7200
     * @tc.name      testFlowSequence0072
     * @tc.desc      Verify data source after operations A0-P-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0072 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0072 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7300
     * @tc.name      testFlowSequence0073
     * @tc.desc      Verify data source after operations A0-P-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0073 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0073 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7400
     * @tc.name      testFlowSequence0074
     * @tc.desc      Verify data source after operations A0-P-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0074 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0074 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7500
     * @tc.name      testFlowSequence0075
     * @tc.desc      Verify data source after operations A0-P-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0075 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('p2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0075 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7600
     * @tc.name      testFlowSequence0076
     * @tc.desc      Verify data source after operations A0-P-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0076 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0076 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7700
     * @tc.name      testFlowSequence0077
     * @tc.desc      Verify data source after operations A0-P-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0077 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0077 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7800
     * @tc.name      testFlowSequence0078
     * @tc.desc      Verify data source after operations A0-P-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0078 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0078 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_7900
     * @tc.name      testFlowSequence0079
     * @tc.desc      Verify data source after operations A0-P-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0079 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0079 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP2_8000
     * @tc.name      testFlowSequence0080
     * @tc.desc      Verify data source after operations A0-P-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0080 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0080 end');
    })

  })
}
