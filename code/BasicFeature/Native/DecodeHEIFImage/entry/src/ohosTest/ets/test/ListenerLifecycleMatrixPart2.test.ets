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

export default function ListenerLifecycleMatrixPart2Test(): void {
  describe('ListenerLifecycleMatrixPart2', () => {

    /**
     * @tc.number    SUB_HEIF_LIFP2_4100
     * @tc.name      testListenerLifecycle0041
     * @tc.desc      Verify listener state after RB-RB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0041 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0041 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4200
     * @tc.name      testListenerLifecycle0042
     * @tc.desc      Verify listener state after RB-RB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0042 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0042 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4300
     * @tc.name      testListenerLifecycle0043
     * @tc.desc      Verify listener state after RB-RB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0043 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0043 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4400
     * @tc.name      testListenerLifecycle0044
     * @tc.desc      Verify listener state after RB-RB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0044 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0044 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4500
     * @tc.name      testListenerLifecycle0045
     * @tc.desc      Verify listener state after RB-UB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0045 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0045 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4600
     * @tc.name      testListenerLifecycle0046
     * @tc.desc      Verify listener state after RB-UB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0046 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0046 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4700
     * @tc.name      testListenerLifecycle0047
     * @tc.desc      Verify listener state after RB-UB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0047 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0047 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4800
     * @tc.name      testListenerLifecycle0048
     * @tc.desc      Verify listener state after RB-UB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0048 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0048 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_4900
     * @tc.name      testListenerLifecycle0049
     * @tc.desc      Verify listener state after UB-RA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0049 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0049 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5000
     * @tc.name      testListenerLifecycle0050
     * @tc.desc      Verify listener state after UB-RA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0050 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0050 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5100
     * @tc.name      testListenerLifecycle0051
     * @tc.desc      Verify listener state after UB-RA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0051 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0051 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5200
     * @tc.name      testListenerLifecycle0052
     * @tc.desc      Verify listener state after UB-RA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0052 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0052 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5300
     * @tc.name      testListenerLifecycle0053
     * @tc.desc      Verify listener state after UB-UA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0053 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0053 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5400
     * @tc.name      testListenerLifecycle0054
     * @tc.desc      Verify listener state after UB-UA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0054 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0054 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5500
     * @tc.name      testListenerLifecycle0055
     * @tc.desc      Verify listener state after UB-UA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0055 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0055 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5600
     * @tc.name      testListenerLifecycle0056
     * @tc.desc      Verify listener state after UB-UA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0056 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0056 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5700
     * @tc.name      testListenerLifecycle0057
     * @tc.desc      Verify listener state after UB-RB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0057 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0057 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5800
     * @tc.name      testListenerLifecycle0058
     * @tc.desc      Verify listener state after UB-RB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0058 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0058 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_5900
     * @tc.name      testListenerLifecycle0059
     * @tc.desc      Verify listener state after UB-RB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0059 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0059 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_6000
     * @tc.name      testListenerLifecycle0060
     * @tc.desc      Verify listener state after UB-RB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0060 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0060 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_6100
     * @tc.name      testListenerLifecycle0061
     * @tc.desc      Verify listener state after UB-UB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0061 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0061 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_6200
     * @tc.name      testListenerLifecycle0062
     * @tc.desc      Verify listener state after UB-UB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0062 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0062 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_6300
     * @tc.name      testListenerLifecycle0063
     * @tc.desc      Verify listener state after UB-UB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0063 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0063 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP2_6400
     * @tc.name      testListenerLifecycle0064
     * @tc.desc      Verify listener state after UB-UB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0064 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0064 end');
    })

  })
}
