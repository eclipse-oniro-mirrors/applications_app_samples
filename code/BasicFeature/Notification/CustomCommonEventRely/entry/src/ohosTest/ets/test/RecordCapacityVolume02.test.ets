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
import { EventRecord, EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { EventRecordStore } from '../../../main/ets/feature/EventRecordStore';
import { FakeClock } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function recordCapacityVolume02Test() {
  describe('RecordCapacityVolume02Test', () => {

    /**
     * @tc.name   testRestoreCapacity0001
     * @tc.number SUB_CCER_CAP_02_0001
     * @tc.desc   容量 1 回放 0 条后记录数为零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0001 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getLastRecord() === null));
      expect(manager.getLastRecord() === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getRecords().length === 0));
      expect(manager.getRecords().length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0001 end');
    })

    /**
     * @tc.name   testRestoreCapacity0002
     * @tc.number SUB_CCER_CAP_02_0002
     * @tc.desc   容量 1 回放 1 条后保留最新 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0002 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 1; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0002 end');
    })

    /**
     * @tc.name   testRestoreCapacity0003
     * @tc.number SUB_CCER_CAP_02_0003
     * @tc.desc   容量 1 回放 2 条后保留最新 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0003 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 2; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_2'));
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(2));
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0003 end');
    })

    /**
     * @tc.name   testRestoreCapacity0004
     * @tc.number SUB_CCER_CAP_02_0004
     * @tc.desc   容量 1 回放 3 条后保留最新 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0004 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 3; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_3'));
      expect(manager.getRecords()[0].data).assertEqual('Data_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(3));
      expect(manager.getRecords()[0].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0004 end');
    })

    /**
     * @tc.name   testRestoreCapacity0005
     * @tc.number SUB_CCER_CAP_02_0005
     * @tc.desc   容量 1 回放 4 条后保留最新 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0005 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 4; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_4'));
      expect(manager.getRecords()[0].data).assertEqual('Data_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(4));
      expect(manager.getRecords()[0].sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0005 end');
    })

    /**
     * @tc.name   testRestoreCapacity0006
     * @tc.number SUB_CCER_CAP_02_0006
     * @tc.desc   容量 1 回放 7 条后保留最新 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0006 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 7; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_7'));
      expect(manager.getRecords()[0].data).assertEqual('Data_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(7));
      expect(manager.getRecords()[0].sequence).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0006 end');
    })

    /**
     * @tc.name   testRestoreCapacity0007
     * @tc.number SUB_CCER_CAP_02_0007
     * @tc.desc   容量 1 回放 13 条后保留最新 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0007 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 13; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(1, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_13'));
      expect(manager.getRecords()[0].data).assertEqual('Data_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(13));
      expect(manager.getRecords()[0].sequence).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0007 end');
    })

    /**
     * @tc.name   testRestoreCapacity0008
     * @tc.number SUB_CCER_CAP_02_0008
     * @tc.desc   容量 2 回放 0 条后记录数为零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0008 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getLastRecord() === null));
      expect(manager.getLastRecord() === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getRecords().length === 0));
      expect(manager.getRecords().length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0008 end');
    })

    /**
     * @tc.name   testRestoreCapacity0009
     * @tc.number SUB_CCER_CAP_02_0009
     * @tc.desc   容量 2 回放 2 条后保留最新 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0009 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 2; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].sequence), String(2));
      expect(manager.getRecords()[1].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0009 end');
    })

    /**
     * @tc.name   testRestoreCapacity0010
     * @tc.number SUB_CCER_CAP_02_0010
     * @tc.desc   容量 2 回放 3 条后保留最新 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0010 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 3; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_2'));
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].sequence), String(3));
      expect(manager.getRecords()[1].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0010 end');
    })

    /**
     * @tc.name   testRestoreCapacity0011
     * @tc.number SUB_CCER_CAP_02_0011
     * @tc.desc   容量 2 回放 5 条后保留最新 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0011 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 5; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_4'));
      expect(manager.getRecords()[0].data).assertEqual('Data_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].sequence), String(5));
      expect(manager.getRecords()[1].sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0011 end');
    })

    /**
     * @tc.name   testRestoreCapacity0012
     * @tc.number SUB_CCER_CAP_02_0012
     * @tc.desc   容量 2 回放 6 条后保留最新 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0012 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 6; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_5'));
      expect(manager.getRecords()[0].data).assertEqual('Data_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].sequence), String(6));
      expect(manager.getRecords()[1].sequence).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0012 end');
    })

    /**
     * @tc.name   testRestoreCapacity0013
     * @tc.number SUB_CCER_CAP_02_0013
     * @tc.desc   容量 2 回放 9 条后保留最新 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0013 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 9; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_8'));
      expect(manager.getRecords()[0].data).assertEqual('Data_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].sequence), String(9));
      expect(manager.getRecords()[1].sequence).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0013 end');
    })

    /**
     * @tc.name   testRestoreCapacity0014
     * @tc.number SUB_CCER_CAP_02_0014
     * @tc.desc   容量 2 回放 15 条后保留最新 2 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0014 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 15; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(2, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_14'));
      expect(manager.getRecords()[0].data).assertEqual('Data_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].sequence), String(15));
      expect(manager.getRecords()[1].sequence).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0014 end');
    })

    /**
     * @tc.name   testRestoreCapacity0015
     * @tc.number SUB_CCER_CAP_02_0015
     * @tc.desc   容量 3 回放 0 条后记录数为零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0015 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getLastRecord() === null));
      expect(manager.getLastRecord() === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getRecords().length === 0));
      expect(manager.getRecords().length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0015 end');
    })

    /**
     * @tc.name   testRestoreCapacity0016
     * @tc.number SUB_CCER_CAP_02_0016
     * @tc.desc   容量 3 回放 3 条后保留最新 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0016 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 3; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(3));
      expect(manager.getRecords()[2].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0016 end');
    })

    /**
     * @tc.name   testRestoreCapacity0017
     * @tc.number SUB_CCER_CAP_02_0017
     * @tc.desc   容量 3 回放 4 条后保留最新 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0017 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 4; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_2'));
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(4));
      expect(manager.getRecords()[2].sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0017 end');
    })

    /**
     * @tc.name   testRestoreCapacity0018
     * @tc.number SUB_CCER_CAP_02_0018
     * @tc.desc   容量 3 回放 8 条后保留最新 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0018 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 8; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_6'));
      expect(manager.getRecords()[0].data).assertEqual('Data_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(8));
      expect(manager.getRecords()[2].sequence).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0018 end');
    })

    /**
     * @tc.name   testRestoreCapacity0019
     * @tc.number SUB_CCER_CAP_02_0019
     * @tc.desc   容量 3 回放 10 条后保留最新 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0019 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 10; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_8'));
      expect(manager.getRecords()[0].data).assertEqual('Data_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(10));
      expect(manager.getRecords()[2].sequence).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0019 end');
    })

    /**
     * @tc.name   testRestoreCapacity0020
     * @tc.number SUB_CCER_CAP_02_0020
     * @tc.desc   容量 3 回放 16 条后保留最新 3 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0020 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 16; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_14'));
      expect(manager.getRecords()[0].data).assertEqual('Data_14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(16));
      expect(manager.getRecords()[2].sequence).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0020 end');
    })

    /**
     * @tc.name   testRestoreCapacity0021
     * @tc.number SUB_CCER_CAP_02_0021
     * @tc.desc   容量 5 回放 0 条后记录数为零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0021 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getLastRecord() === null));
      expect(manager.getLastRecord() === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getRecords().length === 0));
      expect(manager.getRecords().length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0021 end');
    })

    /**
     * @tc.name   testRestoreCapacity0022
     * @tc.number SUB_CCER_CAP_02_0022
     * @tc.desc   容量 5 回放 4 条后保留最新 4 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0022 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 4; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[3].sequence), String(4));
      expect(manager.getRecords()[3].sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0022 end');
    })

    /**
     * @tc.name   testRestoreCapacity0023
     * @tc.number SUB_CCER_CAP_02_0023
     * @tc.desc   容量 5 回放 6 条后保留最新 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0023 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 6; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_2'));
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].sequence), String(6));
      expect(manager.getRecords()[4].sequence).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0023 end');
    })

    /**
     * @tc.name   testRestoreCapacity0024
     * @tc.number SUB_CCER_CAP_02_0024
     * @tc.desc   容量 5 回放 11 条后保留最新 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0024 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 11; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_7'));
      expect(manager.getRecords()[0].data).assertEqual('Data_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].sequence), String(11));
      expect(manager.getRecords()[4].sequence).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0024 end');
    })

    /**
     * @tc.name   testRestoreCapacity0025
     * @tc.number SUB_CCER_CAP_02_0025
     * @tc.desc   容量 5 回放 17 条后保留最新 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0025 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 17; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_13'));
      expect(manager.getRecords()[0].data).assertEqual('Data_13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].sequence), String(17));
      expect(manager.getRecords()[4].sequence).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0025 end');
    })

    /**
     * @tc.name   testRestoreCapacity0026
     * @tc.number SUB_CCER_CAP_02_0026
     * @tc.desc   容量 5 回放 26 条后保留最新 5 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0026 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 26; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_22'));
      expect(manager.getRecords()[0].data).assertEqual('Data_22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].sequence), String(26));
      expect(manager.getRecords()[4].sequence).assertEqual(26);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0026 end');
    })

    /**
     * @tc.name   testRestoreCapacity0027
     * @tc.number SUB_CCER_CAP_02_0027
     * @tc.desc   容量 20 回放 0 条后记录数为零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0027 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getLastRecord() === null));
      expect(manager.getLastRecord() === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getRecords().length === 0));
      expect(manager.getRecords().length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0027 end');
    })

    /**
     * @tc.name   testRestoreCapacity0028
     * @tc.number SUB_CCER_CAP_02_0028
     * @tc.desc   容量 20 回放 19 条后保留最新 19 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0028 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 19; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(19));
      expect(result).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[18].sequence), String(19));
      expect(manager.getRecords()[18].sequence).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0028 end');
    })

    /**
     * @tc.name   testRestoreCapacity0029
     * @tc.number SUB_CCER_CAP_02_0029
     * @tc.desc   容量 20 回放 20 条后保留最新 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0029 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 20; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[19].sequence), String(20));
      expect(manager.getRecords()[19].sequence).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0029 end');
    })

    /**
     * @tc.name   testRestoreCapacity0030
     * @tc.number SUB_CCER_CAP_02_0030
     * @tc.desc   容量 20 回放 21 条后保留最新 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0030 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 21; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_2'));
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[19].sequence), String(21));
      expect(manager.getRecords()[19].sequence).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0030 end');
    })

    /**
     * @tc.name   testRestoreCapacity0031
     * @tc.number SUB_CCER_CAP_02_0031
     * @tc.desc   容量 20 回放 44 条后保留最新 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0031 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 44; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_25'));
      expect(manager.getRecords()[0].data).assertEqual('Data_25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[19].sequence), String(44));
      expect(manager.getRecords()[19].sequence).assertEqual(44);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0031 end');
    })

    /**
     * @tc.name   testRestoreCapacity0032
     * @tc.number SUB_CCER_CAP_02_0032
     * @tc.desc   容量 20 回放 61 条后保留最新 20 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0032 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 61; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_42'));
      expect(manager.getRecords()[0].data).assertEqual('Data_42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[19].sequence), String(61));
      expect(manager.getRecords()[19].sequence).assertEqual(61);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0032 end');
    })

    /**
     * @tc.name   testRestoreCapacity0033
     * @tc.number SUB_CCER_CAP_02_0033
     * @tc.desc   容量 30 回放 0 条后记录数为零
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0033 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getLastRecord() === null));
      expect(manager.getLastRecord() === null).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.getRecords().length === 0));
      expect(manager.getRecords().length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0033 end');
    })

    /**
     * @tc.name   testRestoreCapacity0034
     * @tc.number SUB_CCER_CAP_02_0034
     * @tc.desc   容量 30 回放 15 条后保留最新 15 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0034 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 15; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[14].sequence), String(15));
      expect(manager.getRecords()[14].sequence).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0034 end');
    })

    /**
     * @tc.name   testRestoreCapacity0035
     * @tc.number SUB_CCER_CAP_02_0035
     * @tc.desc   容量 30 回放 29 条后保留最新 29 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0035 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 29; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(29));
      expect(result).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[28].sequence), String(29));
      expect(manager.getRecords()[28].sequence).assertEqual(29);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0035 end');
    })

    /**
     * @tc.name   testRestoreCapacity0036
     * @tc.number SUB_CCER_CAP_02_0036
     * @tc.desc   容量 30 回放 30 条后保留最新 30 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0036 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 30; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(30));
      expect(result).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_1'));
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[29].sequence), String(30));
      expect(manager.getRecords()[29].sequence).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0036 end');
    })

    /**
     * @tc.name   testRestoreCapacity0037
     * @tc.number SUB_CCER_CAP_02_0037
     * @tc.desc   容量 30 回放 31 条后保留最新 30 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0037 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 31; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(30));
      expect(result).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_2'));
      expect(manager.getRecords()[0].data).assertEqual('Data_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[29].sequence), String(31));
      expect(manager.getRecords()[29].sequence).assertEqual(31);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0037 end');
    })

    /**
     * @tc.name   testRestoreCapacity0038
     * @tc.number SUB_CCER_CAP_02_0038
     * @tc.desc   容量 30 回放 60 条后保留最新 30 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0038 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 60; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(30));
      expect(result).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_31'));
      expect(manager.getRecords()[0].data).assertEqual('Data_31');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[29].sequence), String(60));
      expect(manager.getRecords()[29].sequence).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0038 end');
    })

    /**
     * @tc.name   testRestoreCapacity0039
     * @tc.number SUB_CCER_CAP_02_0039
     * @tc.desc   容量 3 回放 5 条后再添加一条时淘汰最早记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0039 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 5; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored); manager.add('After', 1002, 1000);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].data), String('After'));
      expect(manager.getRecords()[2].data).assertEqual('After');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(6));
      expect(manager.getRecords()[2].sequence).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0039 end');
    })

    /**
     * @tc.name   testRestoreCapacity0040
     * @tc.number SUB_CCER_CAP_02_0040
     * @tc.desc   容量 10 回放 4 条后再添加一条时直接追加
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0040 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 4; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(10, new FakeClock(0));
      manager.restore(restored); manager.add('Tail', 1002, 1000);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].data), String('Tail'));
      expect(manager.getRecords()[4].data).assertEqual('Tail');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].sequence), String(5));
      expect(manager.getRecords()[4].sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0040 end');
    })

    /**
     * @tc.name   testRestoreCapacity0041
     * @tc.number SUB_CCER_CAP_02_0041
     * @tc.desc   容量 3 重复回放同一批记录时结果幂等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0041 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 7; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored); manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_5'));
      expect(manager.getRecords()[0].data).assertEqual('Data_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[2].sequence), String(7));
      expect(manager.getRecords()[2].sequence).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0041 end');
    })

    /**
     * @tc.name   testRestoreCapacity0042
     * @tc.number SUB_CCER_CAP_02_0042
     * @tc.desc   容量 3 回放后清空再添加时从序号 1 重新开始
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0042 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 7; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
      manager.restore(restored); manager.clear(); manager.add('Fresh', 1001, 1000);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Fresh'));
      expect(manager.getRecords()[0].data).assertEqual('Fresh');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].sequence), String(1));
      expect(manager.getRecords()[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0042 end');
    })

    /**
     * @tc.name   testRestoreCapacity0043
     * @tc.number SUB_CCER_CAP_02_0043
     * @tc.desc   容量 5 回放后清空再次回放时记录完整恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0043 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 7; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(5, new FakeClock(0));
      manager.restore(restored); manager.clear(); manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_3'));
      expect(manager.getRecords()[0].data).assertEqual('Data_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[4].sequence), String(7));
      expect(manager.getRecords()[4].sequence).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0043 end');
    })

    /**
     * @tc.name   testRestoreCapacity0044
     * @tc.number SUB_CCER_CAP_02_0044
     * @tc.desc   容量 20 回放 21 条后再添加一条时序号接续为 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0044 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 21; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(20, new FakeClock(0));
      manager.restore(restored); manager.add('Tail2', 1002, 1000);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[19].data), String('Tail2'));
      expect(manager.getRecords()[19].data).assertEqual('Tail2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[19].sequence), String(22));
      expect(manager.getRecords()[19].sequence).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0044 end');
    })

    /**
     * @tc.name   testRestoreCapacity0045
     * @tc.number SUB_CCER_CAP_02_0045
     * @tc.desc   容量 4 回放 9 条仅保留最新 4 条且序号保持原值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRestoreCapacity0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0045 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 9; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': 't' });
      }
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const manager: EventRecordManager = new EventRecordManager(4, new FakeClock(0));
      manager.restore(restored);
      const result: number = manager.getCount();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[0].data), String('Data_6'));
      expect(manager.getRecords()[0].data).assertEqual('Data_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(manager.getRecords()[1].data), String('Data_7'));
      expect(manager.getRecords()[1].data).assertEqual('Data_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRestoreCapacity0045 end');
    })

  })
}
