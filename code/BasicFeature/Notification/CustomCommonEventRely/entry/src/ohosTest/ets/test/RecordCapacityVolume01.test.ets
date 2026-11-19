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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function capacityEvictTest() {
  describe('RecordCapacityVolume01Test', () => {

    /**
     * @tc.name   testCapacityEvict0001
     * @tc.number SUB_CCER_CAP_0001
     * @tc.desc   容量 1 收到 1 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0001 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      for (let index: number = 1; index <= 1; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(1));
      expect(manager.getLastRecord()?.sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_1'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0001 end');
    })

    /**
     * @tc.name   testCapacityEvict0002
     * @tc.number SUB_CCER_CAP_0002
     * @tc.desc   容量 1 收到 2 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0002 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      for (let index: number = 1; index <= 2; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(2));
      expect(manager.getLastRecord()?.sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_2'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0002 end');
    })

    /**
     * @tc.name   testCapacityEvict0003
     * @tc.number SUB_CCER_CAP_0003
     * @tc.desc   容量 1 收到 3 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0003 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      for (let index: number = 1; index <= 3; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(3));
      expect(manager.getLastRecord()?.sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(3));
      expect(manager.getRecords()[0].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_3'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0003 end');
    })

    /**
     * @tc.name   testCapacityEvict0004
     * @tc.number SUB_CCER_CAP_0004
     * @tc.desc   容量 1 收到 5 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0004 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      for (let index: number = 1; index <= 5; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(5));
      expect(manager.getLastRecord()?.sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(5));
      expect(manager.getRecords()[0].sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_5'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0004 end');
    })

    /**
     * @tc.name   testCapacityEvict0005
     * @tc.number SUB_CCER_CAP_0005
     * @tc.desc   容量 1 收到 10 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0005 begin');
      const manager: EventRecordManager = new EventRecordManager(1);
      for (let index: number = 1; index <= 10; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(10));
      expect(manager.getLastRecord()?.sequence).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(10));
      expect(manager.getRecords()[0].sequence).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_10'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0005 end');
    })

    /**
     * @tc.name   testCapacityEvict0006
     * @tc.number SUB_CCER_CAP_0006
     * @tc.desc   容量 2 收到 1 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0006 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      for (let index: number = 1; index <= 1; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(1));
      expect(manager.getLastRecord()?.sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_1'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0006 end');
    })

    /**
     * @tc.name   testCapacityEvict0007
     * @tc.number SUB_CCER_CAP_0007
     * @tc.desc   容量 2 收到 2 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0007 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      for (let index: number = 1; index <= 2; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(2));
      expect(manager.getLastRecord()?.sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_2'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0007 end');
    })

    /**
     * @tc.name   testCapacityEvict0008
     * @tc.number SUB_CCER_CAP_0008
     * @tc.desc   容量 2 收到 3 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0008 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      for (let index: number = 1; index <= 3; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(3));
      expect(manager.getLastRecord()?.sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_3'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0008 end');
    })

    /**
     * @tc.name   testCapacityEvict0009
     * @tc.number SUB_CCER_CAP_0009
     * @tc.desc   容量 2 收到 4 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0009 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      for (let index: number = 1; index <= 4; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(4));
      expect(manager.getLastRecord()?.sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(3));
      expect(manager.getRecords()[0].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_4'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0009 end');
    })

    /**
     * @tc.name   testCapacityEvict0010
     * @tc.number SUB_CCER_CAP_0010
     * @tc.desc   容量 2 收到 10 条后保留 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0010 begin');
      const manager: EventRecordManager = new EventRecordManager(2);
      for (let index: number = 1; index <= 10; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(10));
      expect(manager.getLastRecord()?.sequence).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(9));
      expect(manager.getRecords()[0].sequence).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_10'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0010 end');
    })

    /**
     * @tc.name   testCapacityEvict0011
     * @tc.number SUB_CCER_CAP_0011
     * @tc.desc   容量 3 收到 3 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0011 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      for (let index: number = 1; index <= 3; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(3));
      expect(manager.getLastRecord()?.sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_3'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0011 end');
    })

    /**
     * @tc.name   testCapacityEvict0012
     * @tc.number SUB_CCER_CAP_0012
     * @tc.desc   容量 3 收到 4 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0012 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      for (let index: number = 1; index <= 4; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(4));
      expect(manager.getLastRecord()?.sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_4'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0012 end');
    })

    /**
     * @tc.name   testCapacityEvict0013
     * @tc.number SUB_CCER_CAP_0013
     * @tc.desc   容量 3 收到 6 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0013 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      for (let index: number = 1; index <= 6; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(6));
      expect(manager.getLastRecord()?.sequence).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(4));
      expect(manager.getRecords()[0].sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_6'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0013 end');
    })

    /**
     * @tc.name   testCapacityEvict0014
     * @tc.number SUB_CCER_CAP_0014
     * @tc.desc   容量 3 收到 9 条后保留 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0014 begin');
      const manager: EventRecordManager = new EventRecordManager(3);
      for (let index: number = 1; index <= 9; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(9));
      expect(manager.getLastRecord()?.sequence).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(7));
      expect(manager.getRecords()[0].sequence).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_9'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0014 end');
    })

    /**
     * @tc.name   testCapacityEvict0015
     * @tc.number SUB_CCER_CAP_0015
     * @tc.desc   容量 5 收到 1 条后保留 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0015 begin');
      const manager: EventRecordManager = new EventRecordManager(5);
      for (let index: number = 1; index <= 1; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(1));
      expect(manager.getLastRecord()?.sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_1'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0015 end');
    })

    /**
     * @tc.name   testCapacityEvict0016
     * @tc.number SUB_CCER_CAP_0016
     * @tc.desc   容量 5 收到 4 条后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0016 begin');
      const manager: EventRecordManager = new EventRecordManager(5);
      for (let index: number = 1; index <= 4; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(4));
      expect(manager.getLastRecord()?.sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_4'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0016 end');
    })

    /**
     * @tc.name   testCapacityEvict0017
     * @tc.number SUB_CCER_CAP_0017
     * @tc.desc   容量 5 收到 5 条后保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0017 begin');
      const manager: EventRecordManager = new EventRecordManager(5);
      for (let index: number = 1; index <= 5; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(5));
      expect(manager.getLastRecord()?.sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_5'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0017 end');
    })

    /**
     * @tc.name   testCapacityEvict0018
     * @tc.number SUB_CCER_CAP_0018
     * @tc.desc   容量 5 收到 6 条后保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0018 begin');
      const manager: EventRecordManager = new EventRecordManager(5);
      for (let index: number = 1; index <= 6; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(6));
      expect(manager.getLastRecord()?.sequence).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_6'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0018 end');
    })

    /**
     * @tc.name   testCapacityEvict0019
     * @tc.number SUB_CCER_CAP_0019
     * @tc.desc   容量 5 收到 25 条后保留 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0019 begin');
      const manager: EventRecordManager = new EventRecordManager(5);
      for (let index: number = 1; index <= 25; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(25));
      expect(manager.getLastRecord()?.sequence).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(21));
      expect(manager.getRecords()[0].sequence).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_25'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0019 end');
    })

    /**
     * @tc.name   testCapacityEvict0020
     * @tc.number SUB_CCER_CAP_0020
     * @tc.desc   容量 10 收到 9 条后保留 9 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0020 begin');
      const manager: EventRecordManager = new EventRecordManager(10);
      for (let index: number = 1; index <= 9; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(9));
      expect(result).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(9));
      expect(manager.getLastRecord()?.sequence).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_9'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0020 end');
    })

    /**
     * @tc.name   testCapacityEvict0021
     * @tc.number SUB_CCER_CAP_0021
     * @tc.desc   容量 10 收到 10 条后保留 10 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0021 begin');
      const manager: EventRecordManager = new EventRecordManager(10);
      for (let index: number = 1; index <= 10; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(10));
      expect(manager.getLastRecord()?.sequence).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_10'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0021 end');
    })

    /**
     * @tc.name   testCapacityEvict0022
     * @tc.number SUB_CCER_CAP_0022
     * @tc.desc   容量 10 收到 11 条后保留 10 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0022 begin');
      const manager: EventRecordManager = new EventRecordManager(10);
      for (let index: number = 1; index <= 11; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(11));
      expect(manager.getLastRecord()?.sequence).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_11'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0022 end');
    })

    /**
     * @tc.name   testCapacityEvict0023
     * @tc.number SUB_CCER_CAP_0023
     * @tc.desc   容量 10 收到 100 条后保留 10 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0023 begin');
      const manager: EventRecordManager = new EventRecordManager(10);
      for (let index: number = 1; index <= 100; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(100));
      expect(manager.getLastRecord()?.sequence).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(91));
      expect(manager.getRecords()[0].sequence).assertEqual(91);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_100'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0023 end');
    })

    /**
     * @tc.name   testCapacityEvict0024
     * @tc.number SUB_CCER_CAP_0024
     * @tc.desc   容量 20 收到 19 条后保留 19 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0024 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      for (let index: number = 1; index <= 19; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(19));
      expect(result).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(19));
      expect(manager.getLastRecord()?.sequence).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_19'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0024 end');
    })

    /**
     * @tc.name   testCapacityEvict0025
     * @tc.number SUB_CCER_CAP_0025
     * @tc.desc   容量 20 收到 20 条后保留 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0025 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      for (let index: number = 1; index <= 20; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(20));
      expect(manager.getLastRecord()?.sequence).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_20'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0025 end');
    })

    /**
     * @tc.name   testCapacityEvict0026
     * @tc.number SUB_CCER_CAP_0026
     * @tc.desc   容量 20 收到 21 条后保留 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0026 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      for (let index: number = 1; index <= 21; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(21));
      expect(manager.getLastRecord()?.sequence).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_21'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0026 end');
    })

    /**
     * @tc.name   testCapacityEvict0027
     * @tc.number SUB_CCER_CAP_0027
     * @tc.desc   容量 20 收到 40 条后保留 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0027 begin');
      const manager: EventRecordManager = new EventRecordManager(20);
      for (let index: number = 1; index <= 40; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(40));
      expect(manager.getLastRecord()?.sequence).assertEqual(40);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(21));
      expect(manager.getRecords()[0].sequence).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_40'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_40');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0027 end');
    })

    /**
     * @tc.name   testCapacityEvict0028
     * @tc.number SUB_CCER_CAP_0028
     * @tc.desc   容量 50 收到 49 条后保留 49 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0028 begin');
      const manager: EventRecordManager = new EventRecordManager(50);
      for (let index: number = 1; index <= 49; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(49));
      expect(result).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(49));
      expect(manager.getLastRecord()?.sequence).assertEqual(49);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_49'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0028 end');
    })

    /**
     * @tc.name   testCapacityEvict0029
     * @tc.number SUB_CCER_CAP_0029
     * @tc.desc   容量 50 收到 50 条后保留 50 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0029 begin');
      const manager: EventRecordManager = new EventRecordManager(50);
      for (let index: number = 1; index <= 50; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(50));
      expect(result).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(50));
      expect(manager.getLastRecord()?.sequence).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_50'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_50');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0029 end');
    })

    /**
     * @tc.name   testCapacityEvict0030
     * @tc.number SUB_CCER_CAP_0030
     * @tc.desc   容量 50 收到 51 条后保留 50 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0030 begin');
      const manager: EventRecordManager = new EventRecordManager(50);
      for (let index: number = 1; index <= 51; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(50));
      expect(result).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(51));
      expect(manager.getLastRecord()?.sequence).assertEqual(51);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_51'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_51');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0030 end');
    })

    /**
     * @tc.name   testCapacityEvict0031
     * @tc.number SUB_CCER_CAP_0031
     * @tc.desc   容量 100 收到 99 条后保留 99 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0031 begin');
      const manager: EventRecordManager = new EventRecordManager(100);
      for (let index: number = 1; index <= 99; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(99));
      expect(result).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(99));
      expect(manager.getLastRecord()?.sequence).assertEqual(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_99'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_99');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0031 end');
    })

    /**
     * @tc.name   testCapacityEvict0032
     * @tc.number SUB_CCER_CAP_0032
     * @tc.desc   容量 100 收到 100 条后保留 100 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0032 begin');
      const manager: EventRecordManager = new EventRecordManager(100);
      for (let index: number = 1; index <= 100; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(100));
      expect(manager.getLastRecord()?.sequence).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_100'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0032 end');
    })

    /**
     * @tc.name   testCapacityEvict0033
     * @tc.number SUB_CCER_CAP_0033
     * @tc.desc   容量 100 收到 101 条后保留 100 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0033 begin');
      const manager: EventRecordManager = new EventRecordManager(100);
      for (let index: number = 1; index <= 101; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(101));
      expect(manager.getLastRecord()?.sequence).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_101'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_101');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0033 end');
    })

    /**
     * @tc.name   testCapacityEvict0034
     * @tc.number SUB_CCER_CAP_0034
     * @tc.desc   容量 100 收到 250 条后保留 100 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0034 begin');
      const manager: EventRecordManager = new EventRecordManager(100);
      for (let index: number = 1; index <= 250; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(100));
      expect(result).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(250));
      expect(manager.getLastRecord()?.sequence).assertEqual(250);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(151));
      expect(manager.getRecords()[0].sequence).assertEqual(151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_250'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_250');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0034 end');
    })

    /**
     * @tc.name   testCapacityEvict0035
     * @tc.number SUB_CCER_CAP_0035
     * @tc.desc   容量 7 收到 7 条后保留 7 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0035 begin');
      const manager: EventRecordManager = new EventRecordManager(7);
      for (let index: number = 1; index <= 7; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(7));
      expect(manager.getLastRecord()?.sequence).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_7'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0035 end');
    })

    /**
     * @tc.name   testCapacityEvict0036
     * @tc.number SUB_CCER_CAP_0036
     * @tc.desc   容量 7 收到 8 条后保留 7 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0036 begin');
      const manager: EventRecordManager = new EventRecordManager(7);
      for (let index: number = 1; index <= 8; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(8));
      expect(manager.getLastRecord()?.sequence).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_8'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0036 end');
    })

    /**
     * @tc.name   testCapacityEvict0037
     * @tc.number SUB_CCER_CAP_0037
     * @tc.desc   容量 4 收到 4 条后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0037 begin');
      const manager: EventRecordManager = new EventRecordManager(4);
      for (let index: number = 1; index <= 4; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(4));
      expect(manager.getLastRecord()?.sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_4'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0037 end');
    })

    /**
     * @tc.name   testCapacityEvict0038
     * @tc.number SUB_CCER_CAP_0038
     * @tc.desc   容量 4 收到 5 条后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0038 begin');
      const manager: EventRecordManager = new EventRecordManager(4);
      for (let index: number = 1; index <= 5; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(5));
      expect(manager.getLastRecord()?.sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_5'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0038 end');
    })

    /**
     * @tc.name   testCapacityEvict0039
     * @tc.number SUB_CCER_CAP_0039
     * @tc.desc   容量 4 收到 12 条后保留 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0039 begin');
      const manager: EventRecordManager = new EventRecordManager(4);
      for (let index: number = 1; index <= 12; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(12));
      expect(manager.getLastRecord()?.sequence).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(9));
      expect(manager.getRecords()[0].sequence).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_12'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0039 end');
    })

    /**
     * @tc.name   testCapacityEvict0040
     * @tc.number SUB_CCER_CAP_0040
     * @tc.desc   容量 6 收到 13 条后保留 6 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0040 begin');
      const manager: EventRecordManager = new EventRecordManager(6);
      for (let index: number = 1; index <= 13; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getLastRecord()?.sequence), String(13));
      expect(manager.getLastRecord()?.sequence).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(8));
      expect(manager.getRecords()[0].sequence).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[manager.getCount() - 1].data), String('Data_13'));
      expect(manager.getRecords()[manager.getCount() - 1].data).assertEqual('Data_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0040 end');
    })

    /**
     * @tc.name   testCapacityEvict0041
     * @tc.number SUB_CCER_CAP_0041
     * @tc.desc   非法容量回落到默认上限，且淘汰后序号不回退
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCapacityEvict0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0041 begin');
      const manager: EventRecordManager = new EventRecordManager(-5);
      for (let index: number = 1; index <= 21; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'count=%{public}d', manager.getCount());
      expect(manager.getCount()).assertEqual(CommonEventConstants.MAX_RECORD_COUNT);
      expect(manager.getLastRecord()?.sequence).assertEqual(21);
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCapacityEvict0041 end');
    })
  })
}
