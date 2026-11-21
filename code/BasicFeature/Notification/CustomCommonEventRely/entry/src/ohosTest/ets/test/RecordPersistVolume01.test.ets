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
import { EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { EventSource } from '../../../main/ets/util/Constants';
import { EventRecordStore } from '../../../main/ets/feature/EventRecordStore';
import { FakeClock, MemoryRecordStorage } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function recordPersistVolume01Test() {
  describe('RecordPersistVolume01Test', () => {

    /**
     * @tc.name   testRecordPersist0001
     * @tc.number SUB_CCER_PERSIST_01_0001
     * @tc.desc   存量 0 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0001 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 0;
      for (let i: number = 0; i < 0; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 0));
      expect(EventRecordStore.deserialize(storage.getText()).length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(storage.getText()), String('[]'));
      expect(storage.getText()).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0001 end');
    })

    /**
     * @tc.name   testRecordPersist0002
     * @tc.number SUB_CCER_PERSIST_01_0002
     * @tc.desc   存量 1 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0002 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 1;
      for (let i: number = 0; i < 1; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 1));
      expect(EventRecordStore.deserialize(storage.getText()).length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_1"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_1"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0002 end');
    })

    /**
     * @tc.name   testRecordPersist0003
     * @tc.number SUB_CCER_PERSIST_01_0003
     * @tc.desc   存量 2 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0003 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 2;
      for (let i: number = 0; i < 2; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 2));
      expect(EventRecordStore.deserialize(storage.getText()).length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_2"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_2"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0003 end');
    })

    /**
     * @tc.name   testRecordPersist0004
     * @tc.number SUB_CCER_PERSIST_01_0004
     * @tc.desc   存量 3 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0004 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 3;
      for (let i: number = 0; i < 3; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 3));
      expect(EventRecordStore.deserialize(storage.getText()).length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_3"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_3"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0004 end');
    })

    /**
     * @tc.name   testRecordPersist0005
     * @tc.number SUB_CCER_PERSIST_01_0005
     * @tc.desc   存量 4 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0005 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 4;
      for (let i: number = 0; i < 4; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 4));
      expect(EventRecordStore.deserialize(storage.getText()).length === 4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_4"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_4"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0005 end');
    })

    /**
     * @tc.name   testRecordPersist0006
     * @tc.number SUB_CCER_PERSIST_01_0006
     * @tc.desc   存量 5 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0006 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 5;
      for (let i: number = 0; i < 5; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 5));
      expect(EventRecordStore.deserialize(storage.getText()).length === 5).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_5"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_5"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0006 end');
    })

    /**
     * @tc.name   testRecordPersist0007
     * @tc.number SUB_CCER_PERSIST_01_0007
     * @tc.desc   存量 6 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0007 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 6;
      for (let i: number = 0; i < 6; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(6));
      expect(result).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 6));
      expect(EventRecordStore.deserialize(storage.getText()).length === 6).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_6"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_6"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0007 end');
    })

    /**
     * @tc.name   testRecordPersist0008
     * @tc.number SUB_CCER_PERSIST_01_0008
     * @tc.desc   存量 7 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0008 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 7;
      for (let i: number = 0; i < 7; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(7));
      expect(result).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 7));
      expect(EventRecordStore.deserialize(storage.getText()).length === 7).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_7"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_7"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0008 end');
    })

    /**
     * @tc.name   testRecordPersist0009
     * @tc.number SUB_CCER_PERSIST_01_0009
     * @tc.desc   存量 8 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0009 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 8;
      for (let i: number = 0; i < 8; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(8));
      expect(result).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 8));
      expect(EventRecordStore.deserialize(storage.getText()).length === 8).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_8"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_8"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0009 end');
    })

    /**
     * @tc.name   testRecordPersist0010
     * @tc.number SUB_CCER_PERSIST_01_0010
     * @tc.desc   存量 9 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0010 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 9;
      for (let i: number = 0; i < 9; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(9));
      expect(result).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 9));
      expect(EventRecordStore.deserialize(storage.getText()).length === 9).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_9"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_9"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0010 end');
    })

    /**
     * @tc.name   testRecordPersist0011
     * @tc.number SUB_CCER_PERSIST_01_0011
     * @tc.desc   存量 10 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0011 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 10;
      for (let i: number = 0; i < 10; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(10));
      expect(result).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 10));
      expect(EventRecordStore.deserialize(storage.getText()).length === 10).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_10"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_10"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0011 end');
    })

    /**
     * @tc.name   testRecordPersist0012
     * @tc.number SUB_CCER_PERSIST_01_0012
     * @tc.desc   存量 11 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0012 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 11;
      for (let i: number = 0; i < 11; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(11));
      expect(result).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 11));
      expect(EventRecordStore.deserialize(storage.getText()).length === 11).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_11"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_11"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0012 end');
    })

    /**
     * @tc.name   testRecordPersist0013
     * @tc.number SUB_CCER_PERSIST_01_0013
     * @tc.desc   存量 12 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0013 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 12;
      for (let i: number = 0; i < 12; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(12));
      expect(result).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 12));
      expect(EventRecordStore.deserialize(storage.getText()).length === 12).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_12"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_12"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0013 end');
    })

    /**
     * @tc.name   testRecordPersist0014
     * @tc.number SUB_CCER_PERSIST_01_0014
     * @tc.desc   存量 13 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0014 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 13;
      for (let i: number = 0; i < 13; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(13));
      expect(result).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 13));
      expect(EventRecordStore.deserialize(storage.getText()).length === 13).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_13"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_13"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0014 end');
    })

    /**
     * @tc.name   testRecordPersist0015
     * @tc.number SUB_CCER_PERSIST_01_0015
     * @tc.desc   存量 14 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0015 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 14;
      for (let i: number = 0; i < 14; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(14));
      expect(result).assertEqual(14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 14));
      expect(EventRecordStore.deserialize(storage.getText()).length === 14).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_14"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_14"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0015 end');
    })

    /**
     * @tc.name   testRecordPersist0016
     * @tc.number SUB_CCER_PERSIST_01_0016
     * @tc.desc   存量 15 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0016 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 15;
      for (let i: number = 0; i < 15; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(15));
      expect(result).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 15));
      expect(EventRecordStore.deserialize(storage.getText()).length === 15).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_15"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_15"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0016 end');
    })

    /**
     * @tc.name   testRecordPersist0017
     * @tc.number SUB_CCER_PERSIST_01_0017
     * @tc.desc   存量 16 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0017 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 16;
      for (let i: number = 0; i < 16; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(16));
      expect(result).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 16));
      expect(EventRecordStore.deserialize(storage.getText()).length === 16).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_16"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_16"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0017 end');
    })

    /**
     * @tc.name   testRecordPersist0018
     * @tc.number SUB_CCER_PERSIST_01_0018
     * @tc.desc   存量 17 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0018 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 17;
      for (let i: number = 0; i < 17; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(17));
      expect(result).assertEqual(17);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 17));
      expect(EventRecordStore.deserialize(storage.getText()).length === 17).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_17"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_17"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0018 end');
    })

    /**
     * @tc.name   testRecordPersist0019
     * @tc.number SUB_CCER_PERSIST_01_0019
     * @tc.desc   存量 18 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0019 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 18;
      for (let i: number = 0; i < 18; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(18));
      expect(result).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 18));
      expect(EventRecordStore.deserialize(storage.getText()).length === 18).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_18"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_18"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0019 end');
    })

    /**
     * @tc.name   testRecordPersist0020
     * @tc.number SUB_CCER_PERSIST_01_0020
     * @tc.desc   存量 19 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0020 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 19;
      for (let i: number = 0; i < 19; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(19));
      expect(result).assertEqual(19);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 19));
      expect(EventRecordStore.deserialize(storage.getText()).length === 19).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_19"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_19"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0020 end');
    })

    /**
     * @tc.name   testRecordPersist0021
     * @tc.number SUB_CCER_PERSIST_01_0021
     * @tc.desc   存量 20 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0021 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 20;
      for (let i: number = 0; i < 20; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(20));
      expect(result).assertEqual(20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 20));
      expect(EventRecordStore.deserialize(storage.getText()).length === 20).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_20"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_20"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0021 end');
    })

    /**
     * @tc.name   testRecordPersist0022
     * @tc.number SUB_CCER_PERSIST_01_0022
     * @tc.desc   存量 21 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0022 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 21;
      for (let i: number = 0; i < 21; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(21));
      expect(result).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 21));
      expect(EventRecordStore.deserialize(storage.getText()).length === 21).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_21"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_21"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0022 end');
    })

    /**
     * @tc.name   testRecordPersist0023
     * @tc.number SUB_CCER_PERSIST_01_0023
     * @tc.desc   存量 22 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0023 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 22;
      for (let i: number = 0; i < 22; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(22));
      expect(result).assertEqual(22);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 22));
      expect(EventRecordStore.deserialize(storage.getText()).length === 22).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_22"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_22"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0023 end');
    })

    /**
     * @tc.name   testRecordPersist0024
     * @tc.number SUB_CCER_PERSIST_01_0024
     * @tc.desc   存量 23 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0024 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 23;
      for (let i: number = 0; i < 23; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(23));
      expect(result).assertEqual(23);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 23));
      expect(EventRecordStore.deserialize(storage.getText()).length === 23).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_23"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_23"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0024 end');
    })

    /**
     * @tc.name   testRecordPersist0025
     * @tc.number SUB_CCER_PERSIST_01_0025
     * @tc.desc   存量 24 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0025 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 24;
      for (let i: number = 0; i < 24; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(24));
      expect(result).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 24));
      expect(EventRecordStore.deserialize(storage.getText()).length === 24).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_24"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_24"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0025 end');
    })

    /**
     * @tc.name   testRecordPersist0026
     * @tc.number SUB_CCER_PERSIST_01_0026
     * @tc.desc   存量 25 条记录保存后存储文本回读条数一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0026 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 25;
      for (let i: number = 0; i < 25; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(25));
      expect(result).assertEqual(25);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 25));
      expect(EventRecordStore.deserialize(storage.getText()).length === 25).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"Data_25"') >= 0));
      expect(storage.getText().indexOf('"data":"Data_25"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0026 end');
    })

    /**
     * @tc.name   testRecordPersist0027
     * @tc.number SUB_CCER_PERSIST_01_0027
     * @tc.desc   卡片来源与 OutApp 数据 3 条保存后文本包含数据值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0027 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 3;
      for (let i: number = 0; i < 0; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }
      for (let i: number = 0; i < total; i++) { manager.add('OutApp', EventSource.FORM, 1000); }
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 3));
      expect(EventRecordStore.deserialize(storage.getText()).length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"data":"OutApp"') >= 0));
      expect(storage.getText().indexOf('"data":"OutApp"') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0027 end');
    })

    /**
     * @tc.name   testRecordPersist0028
     * @tc.number SUB_CCER_PERSIST_01_0028
     * @tc.desc   外部来源码 999 的记录保存后文本包含原始来源码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0028 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 2;
      for (let i: number = 0; i < 0; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }
      for (let i: number = 0; i < total; i++) { manager.add('Data_' + (i + 1), 999, 1000); }
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2));
      expect(result).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 2));
      expect(EventRecordStore.deserialize(storage.getText()).length === 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"sourceCode":999') >= 0));
      expect(storage.getText().indexOf('"sourceCode":999') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0028 end');
    })

    /**
     * @tc.name   testRecordPersist0029
     * @tc.number SUB_CCER_PERSIST_01_0029
     * @tc.desc   中文数据保存后文本原样保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0029 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 1;
      for (let i: number = 0; i < 0; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }
      manager.add('中文数据', EventSource.PAGE, 1000);
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(EventRecordStore.deserialize(storage.getText()).length === 1));
      expect(EventRecordStore.deserialize(storage.getText()).length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('中文数据') >= 0));
      expect(storage.getText().indexOf('中文数据') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0029 end');
    })

    /**
     * @tc.name   testRecordPersist0030
     * @tc.number SUB_CCER_PERSIST_01_0030
     * @tc.desc   卡片与页面来源交替保存后文本同时包含两种来源码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0030 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 5;
      for (let i: number = 0; i < 0; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }
      for (let i: number = 0; i < total; i++) { manager.add('Data_' + (i + 1), i % 2 === 0 ? 1001 : 1002, 1000); }
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5));
      expect(result).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"sourceCode":1001') >= 0));
      expect(storage.getText().indexOf('"sourceCode":1001') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().indexOf('"sourceCode":1002') >= 0));
      expect(storage.getText().indexOf('"sourceCode":1002') >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0030 end');
    })

    /**
     * @tc.name   testRecordPersist0031
     * @tc.number SUB_CCER_PERSIST_01_0031
     * @tc.desc   保存后的文本可被反序列化并保持末条序号
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRecordPersist0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0031 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      const total: number = 4;
      for (let i: number = 0; i < 4; i++) {
        manager.add('Data_' + (i + 1), EventSource.PAGE, new Date(2026, 5, 15, 8, 9, i).getTime());
      }

      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4));
      expect(result).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(storage.getText().length > 2));
      expect(storage.getText().length > 2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[3].sequence), String(4));
      expect(EventRecordStore.deserialize(storage.getText())[3].sequence).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRecordPersist0031 end');
    })

  })
}
