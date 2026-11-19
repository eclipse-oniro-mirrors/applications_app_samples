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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { EventRecord, EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the record management used by the record list of the home page.
 */
export default function eventRecordCoreTest() {
  describe('EventRecordCoreTest', () => {
    /**
     * @tc.number    SUB_CCER_RECORD_0001
     * @tc.name      testEmptyManager0001
     * @tc.desc      新建记录管理器为空且没有最新记录
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testEmptyManager0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testEmptyManager0001';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      logPair(caseName, 'getCount', manager.getCount().toString(), '0');
      expect(manager.getCount()).assertEqual(0);
      logPair(caseName, 'getRecords.length', manager.getRecords().length.toString(), '0');
      expect(manager.getRecords().length).assertEqual(0);
      logPair(caseName, 'getLastRecord', (manager.getLastRecord() === null).toString(), 'true');
      expect(manager.getLastRecord() === null).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0002
     * @tc.name      testAddFormRecord0002
     * @tc.desc      卡片来源的事件记录包含自增序号、数据、来源与接收时间
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testAddFormRecord0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testAddFormRecord0002';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      const timestamp: number = new Date(2026, 0, 2, 8, 9, 10).getTime();
      const record: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.FORM, timestamp);
      logPair(caseName, 'sequence', record.sequence.toString(), '1');
      expect(record.sequence).assertEqual(1);
      logPair(caseName, 'data', record.data, CommonEventConstants.DATA_OUT_APP);
      expect(record.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      logPair(caseName, 'sourceCode', record.sourceCode.toString(), EventSource.FORM.toString());
      expect(record.sourceCode).assertEqual(EventSource.FORM);
      logPair(caseName, 'sourceName', record.sourceName, EventSource.NAME_FORM);
      expect(record.sourceName).assertEqual(EventSource.NAME_FORM);
      logPair(caseName, 'receivedTime', record.receivedTime, '08:09:10');
      expect(record.receivedTime).assertEqual('08:09:10');
      logPair(caseName, 'getCount', manager.getCount().toString(), '1');
      expect(manager.getCount()).assertEqual(1);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0003
     * @tc.name      testAddPageRecord0003
     * @tc.desc      页面来源的事件记录来源名称解析为页面
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testAddPageRecord0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testAddPageRecord0003';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      const record: EventRecord = manager.add(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
      logPair(caseName, 'sourceCode', record.sourceCode.toString(), EventSource.PAGE.toString());
      expect(record.sourceCode).assertEqual(EventSource.PAGE);
      logPair(caseName, 'sourceName', record.sourceName, EventSource.NAME_PAGE);
      expect(record.sourceName).assertEqual(EventSource.NAME_PAGE);
      logPair(caseName, 'data', record.data, CommonEventConstants.DATA_IN_APP);
      expect(record.data).assertEqual(CommonEventConstants.DATA_IN_APP);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0004
     * @tc.name      testUnknownSourceRecord0004
     * @tc.desc      未知来源码的事件记录来源名称解析为外部
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testUnknownSourceRecord0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testUnknownSourceRecord0004';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      const record: EventRecord = manager.add(CommonEventConstants.DATA_IN_APP, EventSource.UNKNOWN);
      logPair(caseName, 'sourceCode', record.sourceCode.toString(), EventSource.UNKNOWN.toString());
      expect(record.sourceCode).assertEqual(EventSource.UNKNOWN);
      logPair(caseName, 'sourceName', record.sourceName, EventSource.NAME_EXTERNAL);
      expect(record.sourceName).assertEqual(EventSource.NAME_EXTERNAL);
      const outside: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, 2048);
      logPair(caseName, 'outsideSourceName', outside.sourceName, EventSource.NAME_EXTERNAL);
      expect(outside.sourceName).assertEqual(EventSource.NAME_EXTERNAL);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0005
     * @tc.name      testSequenceIncrement0005
     * @tc.desc      连续接收事件时序号按到达顺序递增
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testSequenceIncrement0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testSequenceIncrement0005';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      manager.add(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
      manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.FORM);
      const last: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.UNKNOWN);
      logPair(caseName, 'thirdSequence', last.sequence.toString(), '3');
      expect(last.sequence).assertEqual(3);
      const records: EventRecord[] = manager.getRecords();
      logPair(caseName, 'firstSequence', records[0].sequence.toString(), '1');
      expect(records[0].sequence).assertEqual(1);
      logPair(caseName, 'secondSequence', records[1].sequence.toString(), '2');
      expect(records[1].sequence).assertEqual(2);
      logPair(caseName, 'monotonic',
        (records[0].sequence < records[1].sequence && records[1].sequence < records[2].sequence).toString(), 'true');
      expect(records[0].sequence < records[1].sequence && records[1].sequence < records[2].sequence).assertTrue();
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0006
     * @tc.name      testArrivalOrder0006
     * @tc.desc      记录列表按事件到达顺序保存
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testArrivalOrder0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testArrivalOrder0006';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      manager.add('First', EventSource.PAGE);
      manager.add('Second', EventSource.FORM);
      manager.add('Third', EventSource.UNKNOWN);
      const records: EventRecord[] = manager.getRecords();
      logPair(caseName, 'records[0].data', records[0].data, 'First');
      expect(records[0].data).assertEqual('First');
      logPair(caseName, 'records[1].data', records[1].data, 'Second');
      expect(records[1].data).assertEqual('Second');
      logPair(caseName, 'records[2].data', records[2].data, 'Third');
      expect(records[2].data).assertEqual('Third');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0007
     * @tc.name      testRecordsSnapshot0007
     * @tc.desc      取出的记录列表是副本，修改副本不影响管理器
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testRecordsSnapshot0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testRecordsSnapshot0007';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
      const snapshot: EventRecord[] = manager.getRecords();
      snapshot.push({
        sequence: 99,
        data: 'Tampered',
        sourceCode: EventSource.UNKNOWN,
        sourceName: EventSource.NAME_EXTERNAL,
        receivedTime: '00:00:00'
      });
      logPair(caseName, 'managerCount', manager.getCount().toString(), '1');
      expect(manager.getCount()).assertEqual(1);
      logPair(caseName, 'newSnapshotCount', manager.getRecords().length.toString(), '1');
      expect(manager.getRecords().length).assertEqual(1);
      logPair(caseName, 'lastData', manager.getLastRecord()?.data ?? '', CommonEventConstants.DATA_OUT_APP);
      expect(manager.getLastRecord()?.data).assertEqual(CommonEventConstants.DATA_OUT_APP);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0008
     * @tc.name      testDefaultCapacity0008
     * @tc.desc      默认容量为 20，超出后丢弃最早记录并保留最新记录
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testDefaultCapacity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testDefaultCapacity0008';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      for (let index: number = 1; index <= 25; index++) {
        manager.add(`Data_${index}`, EventSource.PAGE);
      }
      logPair(caseName, 'getCount', manager.getCount().toString(), CommonEventConstants.MAX_RECORD_COUNT.toString());
      expect(manager.getCount()).assertEqual(CommonEventConstants.MAX_RECORD_COUNT);
      const records: EventRecord[] = manager.getRecords();
      logPair(caseName, 'firstSequence', records[0].sequence.toString(), '6');
      expect(records[0].sequence).assertEqual(6);
      logPair(caseName, 'firstData', records[0].data, 'Data_6');
      expect(records[0].data).assertEqual('Data_6');
      logPair(caseName, 'lastData', records[records.length - 1].data, 'Data_25');
      expect(records[records.length - 1].data).assertEqual('Data_25');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0009
     * @tc.name      testCustomCapacity0009
     * @tc.desc      自定义容量生效，只保留最新的记录
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testCustomCapacity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testCustomCapacity0009';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager(3);
      manager.add('Data_1', EventSource.PAGE);
      manager.add('Data_2', EventSource.PAGE);
      manager.add('Data_3', EventSource.PAGE);
      manager.add('Data_4', EventSource.PAGE);
      logPair(caseName, 'getCount', manager.getCount().toString(), '3');
      expect(manager.getCount()).assertEqual(3);
      const records: EventRecord[] = manager.getRecords();
      logPair(caseName, 'firstData', records[0].data, 'Data_2');
      expect(records[0].data).assertEqual('Data_2');
      logPair(caseName, 'lastData', records[2].data, 'Data_4');
      expect(records[2].data).assertEqual('Data_4');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0010
     * @tc.name      testZeroCapacityFallback0010
     * @tc.desc      容量为 0 时回退为默认容量 20
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testZeroCapacityFallback0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testZeroCapacityFallback0010';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager(0);
      for (let index: number = 1; index <= 21; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      logPair(caseName, 'getCount', manager.getCount().toString(), CommonEventConstants.MAX_RECORD_COUNT.toString());
      expect(manager.getCount()).assertEqual(CommonEventConstants.MAX_RECORD_COUNT);
      logPair(caseName, 'firstSequence', manager.getRecords()[0].sequence.toString(), '2');
      expect(manager.getRecords()[0].sequence).assertEqual(2);
      expect(manager.getLastRecord()?.data).assertEqual('Data_21');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0011
     * @tc.name      testNegativeCapacityFallback0011
     * @tc.desc      容量为负数时回退为默认容量 20
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testNegativeCapacityFallback0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testNegativeCapacityFallback0011';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager(-5);
      for (let index: number = 1; index <= 20; index++) {
        manager.add(`Data_${index}`, EventSource.FORM);
      }
      logPair(caseName, 'getCount', manager.getCount().toString(), '20');
      expect(manager.getCount()).assertEqual(20);
      logPair(caseName, 'firstData', manager.getRecords()[0].data, 'Data_1');
      expect(manager.getRecords()[0].data).assertEqual('Data_1');
      expect(manager.getLastRecord()?.sequence).assertEqual(20);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0012
     * @tc.name      testLastRecord0012
     * @tc.desc      最新记录始终是最后到达的事件
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testLastRecord0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testLastRecord0012';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      manager.add('First', EventSource.PAGE);
      manager.add('Second', EventSource.FORM);
      const last: EventRecord | null = manager.getLastRecord();
      logPair(caseName, 'notNull', (last !== null).toString(), 'true');
      expect(last !== null).assertTrue();
      logPair(caseName, 'lastData', last?.data ?? '', 'Second');
      expect(last?.data).assertEqual('Second');
      logPair(caseName, 'lastSequence', (last?.sequence ?? 0).toString(), '2');
      expect(last?.sequence).assertEqual(2);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0013
     * @tc.name      testClearRecords0013
     * @tc.desc      清空记录后数量归零并且序号重新从 1 开始
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testClearRecords0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testClearRecords0013';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      manager.add('First', EventSource.PAGE);
      manager.add('Second', EventSource.FORM);
      manager.clear();
      logPair(caseName, 'getCountAfterClear', manager.getCount().toString(), '0');
      expect(manager.getCount()).assertEqual(0);
      logPair(caseName, 'getLastRecord', (manager.getLastRecord() === null).toString(), 'true');
      expect(manager.getLastRecord() === null).assertTrue();
      const restarted: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.FORM);
      logPair(caseName, 'sequenceAfterClear', restarted.sequence.toString(), '1');
      expect(restarted.sequence).assertEqual(1);
      logPair(caseName, 'getCountAfterAdd', manager.getCount().toString(), '1');
      expect(manager.getCount()).assertEqual(1);
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0014
     * @tc.name      testFormatTimePadding0014
     * @tc.desc      接收时间格式化为补零的 HH:mm:ss
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testFormatTimePadding0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testFormatTimePadding0014';
      logBegin(caseName);
      const earlyMorning: string = EventRecordManager.formatTime(new Date(2026, 0, 1, 5, 6, 7).getTime());
      logPair(caseName, 'formatTime(05:06:07)', earlyMorning, '05:06:07');
      expect(earlyMorning).assertEqual('05:06:07');
      logPair(caseName, 'length', earlyMorning.length.toString(), '8');
      expect(earlyMorning.length).assertEqual(8);
      expect(earlyMorning.split(':').length).assertEqual(3);
      expect(earlyMorning.split(':')[0]).assertEqual('05');
      expect(earlyMorning.split(':')[2]).assertEqual('07');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0015
     * @tc.name      testFormatTimeAfternoon0015
     * @tc.desc      两位数时分秒按原值格式化
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testFormatTimeAfternoon0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testFormatTimeAfternoon0015';
      logBegin(caseName);
      const afternoon: string = EventRecordManager.formatTime(new Date(2026, 5, 15, 12, 34, 56).getTime());
      logPair(caseName, 'formatTime(12:34:56)', afternoon, '12:34:56');
      expect(afternoon).assertEqual('12:34:56');
      const midnight: string = EventRecordManager.formatTime(new Date(2026, 11, 31, 0, 0, 0).getTime());
      logPair(caseName, 'formatTime(00:00:00)', midnight, '00:00:00');
      expect(midnight).assertEqual('00:00:00');
      expect(afternoon.split(':').length).assertEqual(3);
      expect(afternoon.split(':')[1]).assertEqual('34');
      logEnd(caseName);
    })

    /**
     * @tc.number    SUB_CCER_RECORD_0016
     * @tc.name      testDefaultTimestamp0016
     * @tc.desc      未传入时间时使用当前时间作为接收时间
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level1
     */
    it('testDefaultTimestamp0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const caseName: string = 'testDefaultTimestamp0016';
      logBegin(caseName);
      const manager: EventRecordManager = new EventRecordManager();
      const before: string = EventRecordManager.formatTime(Date.now());
      const record: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
      const after: string = EventRecordManager.formatTime(Date.now());
      logPair(caseName, 'receivedTime', record.receivedTime, `${before} or ${after}`);
      expect(record.receivedTime === before || record.receivedTime === after).assertTrue();
      logPair(caseName, 'length', record.receivedTime.length.toString(), '8');
      expect(record.receivedTime.length).assertEqual(8);
      expect(record.receivedTime.split(':').length).assertEqual(3);
      logEnd(caseName);
    })
  })
}
