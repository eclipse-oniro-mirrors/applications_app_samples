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

export default function ListenerLifecycleMatrixPart1Test(): void {
  describe('ListenerLifecycleMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_LIFP1_0100
     * @tc.name      testListenerLifecycle0001
     * @tc.desc      Verify listener state after RA-RA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0001 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0200
     * @tc.name      testListenerLifecycle0002
     * @tc.desc      Verify listener state after RA-RA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0002 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0300
     * @tc.name      testListenerLifecycle0003
     * @tc.desc      Verify listener state after RA-RA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0003 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0400
     * @tc.name      testListenerLifecycle0004
     * @tc.desc      Verify listener state after RA-RA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0004 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0500
     * @tc.name      testListenerLifecycle0005
     * @tc.desc      Verify listener state after RA-UA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0005 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0600
     * @tc.name      testListenerLifecycle0006
     * @tc.desc      Verify listener state after RA-UA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0006 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0700
     * @tc.name      testListenerLifecycle0007
     * @tc.desc      Verify listener state after RA-UA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0007 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0800
     * @tc.name      testListenerLifecycle0008
     * @tc.desc      Verify listener state after RA-UA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0008 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_0900
     * @tc.name      testListenerLifecycle0009
     * @tc.desc      Verify listener state after RA-RB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0009 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1000
     * @tc.name      testListenerLifecycle0010
     * @tc.desc      Verify listener state after RA-RB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0010 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1100
     * @tc.name      testListenerLifecycle0011
     * @tc.desc      Verify listener state after RA-RB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0011 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1200
     * @tc.name      testListenerLifecycle0012
     * @tc.desc      Verify listener state after RA-RB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0012 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1300
     * @tc.name      testListenerLifecycle0013
     * @tc.desc      Verify listener state after RA-UB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0013 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1400
     * @tc.name      testListenerLifecycle0014
     * @tc.desc      Verify listener state after RA-UB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0014 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1500
     * @tc.name      testListenerLifecycle0015
     * @tc.desc      Verify listener state after RA-UB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0015 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1600
     * @tc.name      testListenerLifecycle0016
     * @tc.desc      Verify listener state after RA-UB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0016 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0016 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1700
     * @tc.name      testListenerLifecycle0017
     * @tc.desc      Verify listener state after UA-RA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0017 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0017 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1800
     * @tc.name      testListenerLifecycle0018
     * @tc.desc      Verify listener state after UA-RA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0018 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0018 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_1900
     * @tc.name      testListenerLifecycle0019
     * @tc.desc      Verify listener state after UA-RA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0019 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0019 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2000
     * @tc.name      testListenerLifecycle0020
     * @tc.desc      Verify listener state after UA-RA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0020 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0020 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2100
     * @tc.name      testListenerLifecycle0021
     * @tc.desc      Verify listener state after UA-UA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0021 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0021 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2200
     * @tc.name      testListenerLifecycle0022
     * @tc.desc      Verify listener state after UA-UA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0022 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0022 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2300
     * @tc.name      testListenerLifecycle0023
     * @tc.desc      Verify listener state after UA-UA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0023 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0023 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2400
     * @tc.name      testListenerLifecycle0024
     * @tc.desc      Verify listener state after UA-UA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0024 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0024 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2500
     * @tc.name      testListenerLifecycle0025
     * @tc.desc      Verify listener state after UA-RB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0025 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0025 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2600
     * @tc.name      testListenerLifecycle0026
     * @tc.desc      Verify listener state after UA-RB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0026 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0026 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2700
     * @tc.name      testListenerLifecycle0027
     * @tc.desc      Verify listener state after UA-RB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0027 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0027 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2800
     * @tc.name      testListenerLifecycle0028
     * @tc.desc      Verify listener state after UA-RB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0028 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0028 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_2900
     * @tc.name      testListenerLifecycle0029
     * @tc.desc      Verify listener state after UA-UB-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0029 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0029 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3000
     * @tc.name      testListenerLifecycle0030
     * @tc.desc      Verify listener state after UA-UB-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0030 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0030 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3100
     * @tc.name      testListenerLifecycle0031
     * @tc.desc      Verify listener state after UA-UB-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0031 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0031 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3200
     * @tc.name      testListenerLifecycle0032
     * @tc.desc      Verify listener state after UA-UB-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0032 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0032 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3300
     * @tc.name      testListenerLifecycle0033
     * @tc.desc      Verify listener state after RB-RA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0033 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0033 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3400
     * @tc.name      testListenerLifecycle0034
     * @tc.desc      Verify listener state after RB-RA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0034 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0034 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3500
     * @tc.name      testListenerLifecycle0035
     * @tc.desc      Verify listener state after RB-RA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0035 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0035 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3600
     * @tc.name      testListenerLifecycle0036
     * @tc.desc      Verify listener state after RB-RA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0036 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.registerDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0036 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3700
     * @tc.name      testListenerLifecycle0037
     * @tc.desc      Verify listener state after RB-UA-RA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0037 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(1);
      expect(a.changeIndexes.length).assertEqual(1);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0037 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3800
     * @tc.name      testListenerLifecycle0038
     * @tc.desc      Verify listener state after RB-UA-UA receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0038 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(a);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0038 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_3900
     * @tc.name      testListenerLifecycle0039
     * @tc.desc      Verify listener state after RB-UA-RB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0039 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.registerDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(1);
      expect(b.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0039 end');
    })

    /**
     * @tc.number    SUB_HEIF_LIFP1_4000
     * @tc.name      testListenerLifecycle0040
     * @tc.desc      Verify listener state after RB-UA-UB receives the expected events.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testListenerLifecycle0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0040 begin');
      const ds: WaterFlowDataSource = new WaterFlowDataSource();
      const a: RecordingListener = new RecordingListener();
      const b: RecordingListener = new RecordingListener();
      ds.registerDataChangeListener(b);
      ds.unregisterDataChangeListener(a);
      ds.unregisterDataChangeListener(b);
      ds.pushData(new ImageInfo(null, 1, 1, 'x'));
      ds.notifyDataChange(3);
      expect(a.addIndexes.length).assertEqual(0);
      expect(a.changeIndexes.length).assertEqual(0);
      expect(b.addIndexes.length).assertEqual(0);
      expect(b.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerLifecycle0040 end');
    })

  })
}
