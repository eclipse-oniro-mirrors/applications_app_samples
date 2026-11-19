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

export default function FlowOperationMatrixPart6Test(): void {
  describe('FlowOperationMatrixPart6', () => {

    /**
     * @tc.number    SUB_HEIF_FOPP6_20100
     * @tc.name      testFlowSequence0201
     * @tc.desc      Verify data source after operations C-P-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0201 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('p2');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0201 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20200
     * @tc.name      testFlowSequence0202
     * @tc.desc      Verify data source after operations C-P-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0202 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('p2');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0202 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20300
     * @tc.name      testFlowSequence0203
     * @tc.desc      Verify data source after operations C-P-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0203 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('p2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0203 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20400
     * @tc.name      testFlowSequence0204
     * @tc.desc      Verify data source after operations C-P-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0204 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0204 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20500
     * @tc.name      testFlowSequence0205
     * @tc.desc      Verify data source after operations C-P-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0205 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0205 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20600
     * @tc.name      testFlowSequence0206
     * @tc.desc      Verify data source after operations C-P-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0206 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0206 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20700
     * @tc.name      testFlowSequence0207
     * @tc.desc      Verify data source after operations C-P-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0207 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0207 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20800
     * @tc.name      testFlowSequence0208
     * @tc.desc      Verify data source after operations C-P-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0208 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.pushData(new ImageInfo(null, 2, 4, 'p2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0208 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_20900
     * @tc.name      testFlowSequence0209
     * @tc.desc      Verify data source after operations C-A0-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0209 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('p3');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0209 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21000
     * @tc.name      testFlowSequence0210
     * @tc.desc      Verify data source after operations C-A0-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0210 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0210 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21100
     * @tc.name      testFlowSequence0211
     * @tc.desc      Verify data source after operations C-A0-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0211 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0211 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21200
     * @tc.name      testFlowSequence0212
     * @tc.desc      Verify data source after operations C-A0-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0212 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0212 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21300
     * @tc.name      testFlowSequence0213
     * @tc.desc      Verify data source after operations C-A0-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0213 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0213 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21400
     * @tc.name      testFlowSequence0214
     * @tc.desc      Verify data source after operations C-A0-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0214 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0214 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21500
     * @tc.name      testFlowSequence0215
     * @tc.desc      Verify data source after operations C-A0-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0215 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('a2');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0215 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21600
     * @tc.name      testFlowSequence0216
     * @tc.desc      Verify data source after operations C-A0-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0216 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0216 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21700
     * @tc.name      testFlowSequence0217
     * @tc.desc      Verify data source after operations C-A0-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0217 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0217 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21800
     * @tc.name      testFlowSequence0218
     * @tc.desc      Verify data source after operations C-A0-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0218 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a2');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0218 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_21900
     * @tc.name      testFlowSequence0219
     * @tc.desc      Verify data source after operations C-A0-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0219 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0219 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22000
     * @tc.name      testFlowSequence0220
     * @tc.desc      Verify data source after operations C-A0-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0220 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0220 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22100
     * @tc.name      testFlowSequence0221
     * @tc.desc      Verify data source after operations C-A0-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0221 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0221 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22200
     * @tc.name      testFlowSequence0222
     * @tc.desc      Verify data source after operations C-A0-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0222 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0222 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22300
     * @tc.name      testFlowSequence0223
     * @tc.desc      Verify data source after operations C-A0-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0223 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0223 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22400
     * @tc.name      testFlowSequence0224
     * @tc.desc      Verify data source after operations C-A0-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0224 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 2, 4, 'a2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0224 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22500
     * @tc.name      testFlowSequence0225
     * @tc.desc      Verify data source after operations C-A1-P-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0225 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('b2');
      expect(ds.getData(1).description).assertEqual('p3');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0225 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22600
     * @tc.name      testFlowSequence0226
     * @tc.desc      Verify data source after operations C-A1-P-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0226 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('b2');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0226 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22700
     * @tc.name      testFlowSequence0227
     * @tc.desc      Verify data source after operations C-A1-P-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0227 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('b2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('p3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0227 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22800
     * @tc.name      testFlowSequence0228
     * @tc.desc      Verify data source after operations C-A1-P-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0228 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.pushData(new ImageInfo(null, 3, 6, 'p3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0228 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_22900
     * @tc.name      testFlowSequence0229
     * @tc.desc      Verify data source after operations C-A1-A0-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0229 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b2');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0229 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23000
     * @tc.name      testFlowSequence0230
     * @tc.desc      Verify data source after operations C-A1-A0-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0230 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('a3');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0230 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23100
     * @tc.name      testFlowSequence0231
     * @tc.desc      Verify data source after operations C-A1-A0-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0231 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a3');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b2');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0231 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23200
     * @tc.name      testFlowSequence0232
     * @tc.desc      Verify data source after operations C-A1-A0-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0232 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(0, new ImageInfo(null, 3, 6, 'a3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0232 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23300
     * @tc.name      testFlowSequence0233
     * @tc.desc      Verify data source after operations C-A1-A1-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0233 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('b2');
      expect(ds.getData(1).description).assertEqual('b3');
      expect(ds.getData(2).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(2);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0233 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23400
     * @tc.name      testFlowSequence0234
     * @tc.desc      Verify data source after operations C-A1-A1-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0234 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(ds.getData(1).description).assertEqual('b2');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0234 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23500
     * @tc.name      testFlowSequence0235
     * @tc.desc      Verify data source after operations C-A1-A1-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0235 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(3);
      expect(ds.getData(0).description).assertEqual('b2');
      expect(ds.getData(1).description).assertEqual('b4');
      expect(ds.getData(2).description).assertEqual('b3');
      expect(listener.addIndexes.length).assertEqual(3);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.addIndexes[2]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0235 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23600
     * @tc.name      testFlowSequence0236
     * @tc.desc      Verify data source after operations C-A1-A1-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0236 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.addData(1, new ImageInfo(null, 3, 6, 'b3'));
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0236 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23700
     * @tc.name      testFlowSequence0237
     * @tc.desc      Verify data source after operations C-A1-C-P has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0237 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.pushData(new ImageInfo(null, 4, 8, 'p4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('p4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0237 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23800
     * @tc.name      testFlowSequence0238
     * @tc.desc      Verify data source after operations C-A1-C-A0 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0238 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.addData(0, new ImageInfo(null, 4, 8, 'a4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('a4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0238 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_23900
     * @tc.name      testFlowSequence0239
     * @tc.desc      Verify data source after operations C-A1-C-A1 has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0239 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 4, 8, 'b4'));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0).description).assertEqual('b4');
      expect(listener.addIndexes.length).assertEqual(2);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.addIndexes[1]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0239 end');
    })

    /**
     * @tc.number    SUB_HEIF_FOPP6_24000
     * @tc.name      testFlowSequence0240
     * @tc.desc      Verify data source after operations C-A1-C-C has the expected order and notifications.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlowSequence0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0240 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const listener: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(listener);
      ds.clearData();
      ds.addData(1, new ImageInfo(null, 2, 4, 'b2'));
      ds.clearData();
      ds.clearData();
      expect(ds.totalCount()).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(listener.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlowSequence0240 end');
    })

  })
}
