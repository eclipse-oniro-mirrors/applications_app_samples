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

export default function FlowOperationMatrixPart3Test(): void {
  describe('FlowOperationMatrixPart3', () => {

    /**
     * @tc.number    SUB_HEIF_FOPP3_8100
     * @tc.name      testFlowSequence0081
     * @tc.desc      Verify data source after operations A0-A0-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0081 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0081 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8200
     * @tc.name      testFlowSequence0082
     * @tc.desc      Verify data source after operations A0-A0-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0082 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0082 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8300
     * @tc.name      testFlowSequence0083
     * @tc.desc      Verify data source after operations A0-A0-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0083 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0083 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8400
     * @tc.name      testFlowSequence0084
     * @tc.desc      Verify data source after operations A0-A0-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0084 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0084 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8500
     * @tc.name      testFlowSequence0085
     * @tc.desc      Verify data source after operations A0-A0-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0085 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0085 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8600
     * @tc.name      testFlowSequence0086
     * @tc.desc      Verify data source after operations A0-A0-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0086 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(ds.getData(3).description).assertEqual('a1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0086 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8700
     * @tc.name      testFlowSequence0087
     * @tc.desc      Verify data source after operations A0-A0-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0087 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(ds.getData(3).description).assertEqual('a1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0087 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8800
     * @tc.name      testFlowSequence0088
     * @tc.desc      Verify data source after operations A0-A0-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0088 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0088 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_8900
     * @tc.name      testFlowSequence0089
     * @tc.desc      Verify data source after operations A0-A0-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0089 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0089 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9000
     * @tc.name      testFlowSequence0090
     * @tc.desc      Verify data source after operations A0-A0-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0090 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('a1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0090 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9100
     * @tc.name      testFlowSequence0091
     * @tc.desc      Verify data source after operations A0-A0-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0091 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('a1');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0091 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9200
     * @tc.name      testFlowSequence0092
     * @tc.desc      Verify data source after operations A0-A0-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0092 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0092 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9300
     * @tc.name      testFlowSequence0093
     * @tc.desc      Verify data source after operations A0-A0-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0093 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0093 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9400
     * @tc.name      testFlowSequence0094
     * @tc.desc      Verify data source after operations A0-A0-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0094 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0094 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9500
     * @tc.name      testFlowSequence0095
     * @tc.desc      Verify data source after operations A0-A0-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0095 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0095 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9600
     * @tc.name      testFlowSequence0096
     * @tc.desc      Verify data source after operations A0-A0-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0096 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0096 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9700
     * @tc.name      testFlowSequence0097
     * @tc.desc      Verify data source after operations A0-A1-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0097 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0097 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9800
     * @tc.name      testFlowSequence0098
     * @tc.desc      Verify data source after operations A0-A1-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0098 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0098 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_9900
     * @tc.name      testFlowSequence0099
     * @tc.desc      Verify data source after operations A0-A1-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0099 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0099 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10000
     * @tc.name      testFlowSequence0100
     * @tc.desc      Verify data source after operations A0-A1-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0100 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0100 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10100
     * @tc.name      testFlowSequence0101
     * @tc.desc      Verify data source after operations A0-A1-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0101 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0101 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10200
     * @tc.name      testFlowSequence0102
     * @tc.desc      Verify data source after operations A0-A1-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0102 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0102 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10300
     * @tc.name      testFlowSequence0103
     * @tc.desc      Verify data source after operations A0-A1-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0103 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a1');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0103 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10400
     * @tc.name      testFlowSequence0104
     * @tc.desc      Verify data source after operations A0-A1-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0104 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0104 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10500
     * @tc.name      testFlowSequence0105
     * @tc.desc      Verify data source after operations A0-A1-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0105 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(ds.getData(3).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(3);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0105 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10600
     * @tc.name      testFlowSequence0106
     * @tc.desc      Verify data source after operations A0-A1-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0106 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a1');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0106 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10700
     * @tc.name      testFlowSequence0107
     * @tc.desc      Verify data source after operations A0-A1-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0107 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(4);
      expect(ds.getData(0).description).assertEqual('a1');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(ds.getData(3).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(4);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.addIndexes[3]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0107 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10800
     * @tc.name      testFlowSequence0108
     * @tc.desc      Verify data source after operations A0-A1-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0108 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0108 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_10900
     * @tc.name      testFlowSequence0109
     * @tc.desc      Verify data source after operations A0-A1-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0109 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0109 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11000
     * @tc.name      testFlowSequence0110
     * @tc.desc      Verify data source after operations A0-A1-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0110 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0110 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11100
     * @tc.name      testFlowSequence0111
     * @tc.desc      Verify data source after operations A0-A1-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0111 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0111 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11200
     * @tc.name      testFlowSequence0112
     * @tc.desc      Verify data source after operations A0-A1-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0112 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0112 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11300
     * @tc.name      testFlowSequence0113
     * @tc.desc      Verify data source after operations A0-C-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0113 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0113 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11400
     * @tc.name      testFlowSequence0114
     * @tc.desc      Verify data source after operations A0-C-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0114 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0114 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11500
     * @tc.name      testFlowSequence0115
     * @tc.desc      Verify data source after operations A0-C-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0115 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0115 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11600
     * @tc.name      testFlowSequence0116
     * @tc.desc      Verify data source after operations A0-C-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0116 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0116 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11700
     * @tc.name      testFlowSequence0117
     * @tc.desc      Verify data source after operations A0-C-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0117 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0117 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11800
     * @tc.name      testFlowSequence0118
     * @tc.desc      Verify data source after operations A0-C-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0118 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0118 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_11900
     * @tc.name      testFlowSequence0119
     * @tc.desc      Verify data source after operations A0-C-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0119 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0119 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP3_12000
     * @tc.name      testFlowSequence0120
     * @tc.desc      Verify data source after operations A0-C-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0120 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.addData(0, new ImageInfo(null, 1, 2, 'a1'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0120 end');
    })

  })
}
