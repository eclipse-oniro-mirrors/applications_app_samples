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
import { FakeClock, MemoryRecordStorage } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function recordRestoreVolume01Test() {
  describe('RecordRestoreVolume01Test', () => {

    /**
     * @tc.name   testRecordRestore0001
     * @tc.number SUB_CCER_RSTREC_01_0001
     * @tc.desc   存量 1 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0001 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 1; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[1 - 1].sequence), String(1));
      expect(restored[1 - 1].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0001 end');
    })

    /**
     * @tc.name   testRecordRestore0002
     * @tc.number SUB_CCER_RSTREC_01_0002
     * @tc.desc   存量 2 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0002 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 2; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[2 - 1].sequence), String(2));
      expect(restored[2 - 1].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0002 end');
    })

    /**
     * @tc.name   testRecordRestore0003
     * @tc.number SUB_CCER_RSTREC_01_0003
     * @tc.desc   存量 3 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0003 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 3; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[3 - 1].sequence), String(3));
      expect(restored[3 - 1].sequence).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0003 end');
    })

    /**
     * @tc.name   testRecordRestore0004
     * @tc.number SUB_CCER_RSTREC_01_0004
     * @tc.desc   存量 4 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0004 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 4; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[4 - 1].sequence), String(4));
      expect(restored[4 - 1].sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0004 end');
    })

    /**
     * @tc.name   testRecordRestore0005
     * @tc.number SUB_CCER_RSTREC_01_0005
     * @tc.desc   存量 5 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0005 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 5; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[5 - 1].sequence), String(5));
      expect(restored[5 - 1].sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0005 end');
    })

    /**
     * @tc.name   testRecordRestore0006
     * @tc.number SUB_CCER_RSTREC_01_0006
     * @tc.desc   存量 8 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0006 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 8; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[8 - 1].sequence), String(8));
      expect(restored[8 - 1].sequence).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0006 end');
    })

    /**
     * @tc.name   testRecordRestore0007
     * @tc.number SUB_CCER_RSTREC_01_0007
     * @tc.desc   存量 10 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0007 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 10; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[10 - 1].sequence), String(10));
      expect(restored[10 - 1].sequence).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0007 end');
    })

    /**
     * @tc.name   testRecordRestore0008
     * @tc.number SUB_CCER_RSTREC_01_0008
     * @tc.desc   存量 12 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0008 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 12; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[12 - 1].sequence), String(12));
      expect(restored[12 - 1].sequence).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0008 end');
    })

    /**
     * @tc.name   testRecordRestore0009
     * @tc.number SUB_CCER_RSTREC_01_0009
     * @tc.desc   存量 16 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0009 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 16; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[16 - 1].sequence), String(16));
      expect(restored[16 - 1].sequence).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0009 end');
    })

    /**
     * @tc.name   testRecordRestore0010
     * @tc.number SUB_CCER_RSTREC_01_0010
     * @tc.desc   存量 20 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0010 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 20; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[20 - 1].sequence), String(20));
      expect(restored[20 - 1].sequence).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0010 end');
    })

    /**
     * @tc.name   testRecordRestore0011
     * @tc.number SUB_CCER_RSTREC_01_0011
     * @tc.desc   存量 25 条合法条目回放后条数、首条数据与末条序号一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0011 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 25; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(25));
      expect(result).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].data), String('Data_1'));
      expect(restored[0].data).assertEqual('Data_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[25 - 1].sequence), String(25));
      expect(restored[25 - 1].sequence).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0011 end');
    })

    /**
     * @tc.name   testRecordRestore0012
     * @tc.number SUB_CCER_RSTREC_01_0012
     * @tc.desc   卡片来源条目回放后来源名与数据保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0012 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('form'));
      expect(restored[0].sourceName).assertEqual('form');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0012 end');
    })

    /**
     * @tc.name   testRecordRestore0013
     * @tc.number SUB_CCER_RSTREC_01_0013
     * @tc.desc   页面来源条目回放后来源名与时间原样保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0013 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"b","sourceCode":1002,"receivedTime":"07:06:05"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('page'));
      expect(restored[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].receivedTime), String('07:06:05'));
      expect(restored[0].receivedTime).assertEqual('07:06:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0013 end');
    })

    /**
     * @tc.name   testRecordRestore0014
     * @tc.number SUB_CCER_RSTREC_01_0014
     * @tc.desc   未知来源条目回放后来源名为外部且原始码保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0014 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"c","sourceCode":999,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('external'));
      expect(restored[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(999));
      expect(restored[0].sourceCode).assertEqual(999);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0014 end');
    })

    /**
     * @tc.name   testRecordRestore0015
     * @tc.number SUB_CCER_RSTREC_01_0015
     * @tc.desc   负数来源码条目回放后被保留且来源名为外部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0015 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"d","sourceCode":-5,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(-5));
      expect(restored[0].sourceCode).assertEqual(-5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceName), String('external'));
      expect(restored[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0015 end');
    })

    /**
     * @tc.name   testRecordRestore0016
     * @tc.number SUB_CCER_RSTREC_01_0016
     * @tc.desc   最大安全整数来源码条目回放后被保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0016 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"e","sourceCode":9007199254740991,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(restored[0].sourceCode), String(9007199254740991));
      expect(restored[0].sourceCode).assertEqual(9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].sequence === 1));
      expect(restored[0].sequence === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0016 end');
    })

    /**
     * @tc.name   testRecordRestore0017
     * @tc.number SUB_CCER_RSTREC_01_0017
     * @tc.desc   乱序序号条目回放后按到达顺序重排为 1 和 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0017 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"B","sequence":9,"sourceCode":1002,"receivedTime":"08:09:10"},{"data":"A","seque'
        + 'nce":2,"sourceCode":1002,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].sequence), String(1));
      expect(restored[0].sequence).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[1].sequence), String(2));
      expect(restored[1].sequence).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0017 end');
    })

    /**
     * @tc.name   testRecordRestore0018
     * @tc.number SUB_CCER_RSTREC_01_0018
     * @tc.desc   缺少 data 字段的条目回放后被跳过，补齐后可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0018 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"sourceCode":1002,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0018 end');
    })

    /**
     * @tc.name   testRecordRestore0019
     * @tc.number SUB_CCER_RSTREC_01_0019
     * @tc.desc   缺少来源码的条目回放后被跳过，补齐后可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0019 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0019 end');
    })

    /**
     * @tc.name   testRecordRestore0020
     * @tc.number SUB_CCER_RSTREC_01_0020
     * @tc.desc   缺少接收时间的条目回放后被跳过，补齐后可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0020 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0020 end');
    })

    /**
     * @tc.name   testRecordRestore0021
     * @tc.number SUB_CCER_RSTREC_01_0021
     * @tc.desc   数据为数字的条目回放后被跳过，改为字符串后可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0021 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":123,"sourceCode":1002,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0021 end');
    })

    /**
     * @tc.name   testRecordRestore0022
     * @tc.number SUB_CCER_RSTREC_01_0022
     * @tc.desc   空数据条目回放后被跳过并给出校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0022 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(EventRecordManager.validateData('').length > 0));
      expect(EventRecordManager.validateData('').length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0022 end');
    })

    /**
     * @tc.name   testRecordRestore0023
     * @tc.number SUB_CCER_RSTREC_01_0023
     * @tc.desc   非整数来源码条目回放后被跳过并给出校验原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0023 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1.5,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordManager.validateSourceCode(1.5).length > 0));
      expect(EventRecordManager.validateSourceCode(1.5).length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0023 end');
    })

    /**
     * @tc.name   testRecordRestore0024
     * @tc.number SUB_CCER_RSTREC_01_0024
     * @tc.desc   来源码为字符串的条目回放后被跳过，改为数字后可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0024 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":"1002","receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0024 end');
    })

    /**
     * @tc.name   testRecordRestore0025
     * @tc.number SUB_CCER_RSTREC_01_0025
     * @tc.desc   接收时间为数字的条目回放后被跳过，改为字符串后可回放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0025 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":123}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(JSON.parse(text).length > result));
      expect(JSON.parse(text).length > result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(okText).length), String(1));
      expect(EventRecordStore.deserialize(okText).length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0025 end');
    })

    /**
     * @tc.name   testRecordRestore0026
     * @tc.number SUB_CCER_RSTREC_01_0026
     * @tc.desc   合法与非法混合条目回放后仅保留合法条目且序号连续
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0026 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"a","sourceCode":1002,"receivedTime":"08:09:10"},{"data":123,"sourceCode":1002,"'
        + 'receivedTime":"08:09:10"},{"data":"b","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('a'));
      expect(restored[0].data).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[1].data), String('b'));
      expect(restored[1].data).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0026 end');
    })

    /**
     * @tc.name   testRecordRestore0027
     * @tc.number SUB_CCER_RSTREC_01_0027
     * @tc.desc   携带多余字段的条目回放后被保留且多余字段被忽略
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0027 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[{"data":"f","note":"x","sourceCode":1002,"receivedTime":"08:09:10"}]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(restored[0].data), String('f'));
      expect(restored[0].data).assertEqual('f');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(restored[0].sequence === 1));
      expect(restored[0].sequence === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0027 end');
    })

    /**
     * @tc.name   testRecordRestore0028
     * @tc.number SUB_CCER_RSTREC_01_0028
     * @tc.desc   空数组文本回放后记录数为零且再序列化为空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0028 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '[]';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(EventRecordStore.serialize(restored)).length === 0));
      expect(EventRecordStore.deserialize(EventRecordStore.serialize(restored)).length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.serialize(restored)), String('[]'));
      expect(EventRecordStore.serialize(restored)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0028 end');
    })

    /**
     * @tc.name   testRecordRestore0029
     * @tc.number SUB_CCER_RSTREC_01_0029
     * @tc.desc   非法 JSON 文本回放后记录数为零且再序列化为空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0029 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = 'garbage';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(EventRecordStore.serialize(restored)).length === 0));
      expect(EventRecordStore.deserialize(EventRecordStore.serialize(restored)).length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.serialize(restored)), String('[]'));
      expect(EventRecordStore.serialize(restored)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0029 end');
    })

    /**
     * @tc.name   testRecordRestore0030
     * @tc.number SUB_CCER_RSTREC_01_0030
     * @tc.desc   非数组 JSON 文本回放后记录数为零且再序列化为空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0030 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 0; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = '{}';
      const restored: EventRecord[] = EventRecordStore.deserialize(text);

      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(EventRecordStore.serialize(restored)).length === 0));
      expect(EventRecordStore.deserialize(EventRecordStore.serialize(restored)).length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.serialize(restored)), String('[]'));
      expect(EventRecordStore.serialize(restored)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0030 end');
    })

    /**
     * @tc.name   testRecordRestore0031
     * @tc.number SUB_CCER_RSTREC_01_0031
     * @tc.desc   容量 3 的管理器回放 5 条时仅保留最新 3 条且末条序号保持为 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordRestore0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0031 begin');
      const entries: Record<string, Object>[] = [];
      for (let i: number = 0; i < 5; i++) {
        entries.push({ 'data': 'Data_' + (i + 1), 'sourceCode': 1002, 'receivedTime': '08:09:10' });
      }
      const okText: string = '[{"data":"a","sourceCode":1001,"receivedTime":"08:09:10"}]';
      const text: string = JSON.stringify(entries);
      const restored: EventRecord[] = EventRecordStore.deserialize(text);
      const anchorStorage: MemoryRecordStorage = new MemoryRecordStorage(text);
        const anchorStore: EventRecordStore = new EventRecordStore(anchorStorage);
        const anchorManager: EventRecordManager = new EventRecordManager(3, new FakeClock(0));
        const anchorCount: number = anchorStore.loadInto(anchorManager);
      const result: number = restored.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(anchorCount), String(3));
      expect(anchorCount).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(anchorManager.getRecords()[0].data), String('Data_3'));
      expect(anchorManager.getRecords()[0].data).assertEqual('Data_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(anchorManager.getRecords()[2].sequence), String(5));
      expect(anchorManager.getRecords()[2].sequence).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordRestore0031 end');
    })

  })
}
