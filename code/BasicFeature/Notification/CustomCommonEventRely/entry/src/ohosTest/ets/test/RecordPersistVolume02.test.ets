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

export default function recordPersistVolume02Test() {
  describe('RecordPersistVolume02Test', () => {

    /**
     * @tc.name   testPersistContent0001
     * @tc.number SUB_CCER_PERSIST_02_0001
     * @tc.desc   特殊内容 双引号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0001 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('say "hello"', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('say "hello"'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('say "hello"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0001 end');
    })

    /**
     * @tc.name   testPersistContent0002
     * @tc.number SUB_CCER_PERSIST_02_0002
     * @tc.desc   特殊内容 单引号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0002 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('it\'s a record', EventSource.FORM, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('it\'s a record'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('it\'s a record');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('form'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('form');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0002 end');
    })

    /**
     * @tc.name   testPersistContent0003
     * @tc.number SUB_CCER_PERSIST_02_0003
     * @tc.desc   特殊内容 单反斜杠 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0003 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('back\\slash', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('back\\slash'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('back\\slash');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0003 end');
    })

    /**
     * @tc.name   testPersistContent0004
     * @tc.number SUB_CCER_PERSIST_02_0004
     * @tc.desc   特殊内容 双反斜杠 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0004 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('deep\\\\path', 999, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('deep\\\\path'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('deep\\\\path');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('external'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0004 end');
    })

    /**
     * @tc.name   testPersistContent0005
     * @tc.number SUB_CCER_PERSIST_02_0005
     * @tc.desc   特殊内容 换行内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0005 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('line1\nline2', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('line1\nline2'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('line1\nline2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0005 end');
    })

    /**
     * @tc.name   testPersistContent0006
     * @tc.number SUB_CCER_PERSIST_02_0006
     * @tc.desc   特殊内容 制表符内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0006 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('tab\tseparated', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('tab\tseparated'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('tab\tseparated');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0006 end');
    })

    /**
     * @tc.name   testPersistContent0007
     * @tc.number SUB_CCER_PERSIST_02_0007
     * @tc.desc   特殊内容 引号混合 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0007 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('quote " and \' mix', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('quote " and \' mix'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('quote " and \' mix');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0007 end');
    })

    /**
     * @tc.name   testPersistContent0008
     * @tc.number SUB_CCER_PERSIST_02_0008
     * @tc.desc   特殊内容 花括号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0008 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('{braced:json}', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('{braced:json}'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('{braced:json}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0008 end');
    })

    /**
     * @tc.name   testPersistContent0009
     * @tc.number SUB_CCER_PERSIST_02_0009
     * @tc.desc   特殊内容 方括号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0009 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('[1,2,3]', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('[1,2,3]'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('[1,2,3]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0009 end');
    })

    /**
     * @tc.name   testPersistContent0010
     * @tc.number SUB_CCER_PERSIST_02_0010
     * @tc.desc   特殊内容 逗号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0010 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('comma,no-space,list', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('comma,no-space,list'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('comma,no-space,list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0010 end');
    })

    /**
     * @tc.name   testPersistContent0011
     * @tc.number SUB_CCER_PERSIST_02_0011
     * @tc.desc   特殊内容 等号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0011 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('key=value', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('key=value'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('key=value');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0011 end');
    })

    /**
     * @tc.name   testPersistContent0012
     * @tc.number SUB_CCER_PERSIST_02_0012
     * @tc.desc   特殊内容 表情符号 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0012 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('rocket 🚀 launch', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('rocket 🚀 launch'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('rocket 🚀 launch');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0012 end');
    })

    /**
     * @tc.name   testPersistContent0013
     * @tc.number SUB_CCER_PERSIST_02_0013
     * @tc.desc   特殊内容 中英混合 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0013 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('中英文 mixed 内容', 999, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('中英文 mixed 内容'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('中英文 mixed 内容');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('external'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('external');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0013 end');
    })

    /**
     * @tc.name   testPersistContent0014
     * @tc.number SUB_CCER_PERSIST_02_0014
     * @tc.desc   特殊内容 日文内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0014 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('日本語のテキスト', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('日本語のテキスト'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('日本語のテキスト');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0014 end');
    })

    /**
     * @tc.name   testPersistContent0015
     * @tc.number SUB_CCER_PERSIST_02_0015
     * @tc.desc   特殊内容 重音字符 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0015 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('Ünïcödé äccents', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('Ünïcödé äccents'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('Ünïcödé äccents');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0015 end');
    })

    /**
     * @tc.name   testPersistContent0016
     * @tc.number SUB_CCER_PERSIST_02_0016
     * @tc.desc   特殊内容 前导空格 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0016 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('  leading spaces kept', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('  leading spaces kept'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('  leading spaces kept');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0016 end');
    })

    /**
     * @tc.name   testPersistContent0017
     * @tc.number SUB_CCER_PERSIST_02_0017
     * @tc.desc   特殊内容 尾部空格 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0017 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('trailing spaces kept  ', EventSource.FORM, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('trailing spaces kept  '));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('trailing spaces kept  ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('form'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('form');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0017 end');
    })

    /**
     * @tc.name   testPersistContent0018
     * @tc.number SUB_CCER_PERSIST_02_0018
     * @tc.desc   特殊内容 null 字面量 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0018 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('null literal', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('null literal'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('null literal');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0018 end');
    })

    /**
     * @tc.name   testPersistContent0019
     * @tc.number SUB_CCER_PERSIST_02_0019
     * @tc.desc   特殊内容 数字文本 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0019 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('123 number text', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('123 number text'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('123 number text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0019 end');
    })

    /**
     * @tc.name   testPersistContent0020
     * @tc.number SUB_CCER_PERSIST_02_0020
     * @tc.desc   特殊内容 负数文本 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0020 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('-42 negative text', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('-42 negative text'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('-42 negative text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0020 end');
    })

    /**
     * @tc.name   testPersistContent0021
     * @tc.number SUB_CCER_PERSIST_02_0021
     * @tc.desc   特殊内容 布尔文本 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0021 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('true boolean text', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('true boolean text'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('true boolean text');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0021 end');
    })

    /**
     * @tc.name   testPersistContent0022
     * @tc.number SUB_CCER_PERSIST_02_0022
     * @tc.desc   特殊内容 嵌套 JSON 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0022 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('{"data":"nested"}', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('{"data":"nested"}'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('{"data":"nested"}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0022 end');
    })

    /**
     * @tc.name   testPersistContent0023
     * @tc.number SUB_CCER_PERSIST_02_0023
     * @tc.desc   特殊内容 带空格 JSON 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0023 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('{ "spaced" : "json" }', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('{ "spaced" : "json" }'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('{ "spaced" : "json" }');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0023 end');
    })

    /**
     * @tc.name   testPersistContent0024
     * @tc.number SUB_CCER_PERSIST_02_0024
     * @tc.desc   特殊内容 路径斜杠 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0024 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('slash/path/file', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('slash/path/file'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('slash/path/file');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0024 end');
    })

    /**
     * @tc.name   testPersistContent0025
     * @tc.number SUB_CCER_PERSIST_02_0025
     * @tc.desc   特殊内容 Windows 路径 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0025 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('C:\\Windows\\Path', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('C:\\Windows\\Path'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('C:\\Windows\\Path');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0025 end');
    })

    /**
     * @tc.name   testPersistContent0026
     * @tc.number SUB_CCER_PERSIST_02_0026
     * @tc.desc   特殊内容 格式占位符 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0026 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('%s format token', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('%s format token'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('%s format token');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0026 end');
    })

    /**
     * @tc.name   testPersistContent0027
     * @tc.number SUB_CCER_PERSIST_02_0027
     * @tc.desc   特殊内容 hilog 占位符 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0027 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('%{public}s token', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('%{public}s token'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('%{public}s token');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0027 end');
    })

    /**
     * @tc.name   testPersistContent0028
     * @tc.number SUB_CCER_PERSIST_02_0028
     * @tc.desc   特殊内容 多重制表 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0028 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('hello\ttabs\tagain', EventSource.FORM, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('hello\ttabs\tagain'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('hello\ttabs\tagain');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('form'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('form');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0028 end');
    })

    /**
     * @tc.name   testPersistContent0029
     * @tc.number SUB_CCER_PERSIST_02_0029
     * @tc.desc   特殊内容 多行内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0029 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('multi\nline\nvalue', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('multi\nline\nvalue'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('multi\nline\nvalue');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0029 end');
    })

    /**
     * @tc.name   testPersistContent0030
     * @tc.number SUB_CCER_PERSIST_02_0030
     * @tc.desc   特殊内容 成对双引号 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0030 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('"" double quotes', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('"" double quotes'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('"" double quotes');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0030 end');
    })

    /**
     * @tc.name   testPersistContent0031
     * @tc.number SUB_CCER_PERSIST_02_0031
     * @tc.desc   特殊内容 成对单引号 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0031 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('\'\' two apostrophes', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('\'\' two apostrophes'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('\'\' two apostrophes');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0031 end');
    })

    /**
     * @tc.name   testPersistContent0032
     * @tc.number SUB_CCER_PERSIST_02_0032
     * @tc.desc   特殊内容 反斜杠与 n 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0032 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('\\n literal escape', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('\\n literal escape'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('\\n literal escape');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0032 end');
    })

    /**
     * @tc.name   testPersistContent0033
     * @tc.number SUB_CCER_PERSIST_02_0033
     * @tc.desc   特殊内容 表情符号脸 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0033 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('😀 emoji face', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('😀 emoji face'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('😀 emoji face');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0033 end');
    })

    /**
     * @tc.name   testPersistContent0034
     * @tc.number SUB_CCER_PERSIST_02_0034
     * @tc.desc   特殊内容 分号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0034 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('semicolon;value;', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('semicolon;value;'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('semicolon;value;');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0034 end');
    })

    /**
     * @tc.name   testPersistContent0035
     * @tc.number SUB_CCER_PERSIST_02_0035
     * @tc.desc   特殊内容 HTML 标签 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0035 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('<tag>html</tag>', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('<tag>html</tag>'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('<tag>html</tag>');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0035 end');
    })

    /**
     * @tc.name   testPersistContent0036
     * @tc.number SUB_CCER_PERSIST_02_0036
     * @tc.desc   特殊内容 实体字符 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0036 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('&amp;entity', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('&amp;entity'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('&amp;entity');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0036 end');
    })

    /**
     * @tc.name   testPersistContent0037
     * @tc.number SUB_CCER_PERSIST_02_0037
     * @tc.desc   特殊内容 井号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0037 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('#hash tag#', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('#hash tag#'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('#hash tag#');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0037 end');
    })

    /**
     * @tc.name   testPersistContent0038
     * @tc.number SUB_CCER_PERSIST_02_0038
     * @tc.desc   特殊内容 冒号内容 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0038 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('a:b:c colons', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('a:b:c colons'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('a:b:c colons');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0038 end');
    })

    /**
     * @tc.name   testPersistContent0039
     * @tc.number SUB_CCER_PERSIST_02_0039
     * @tc.desc   特殊内容 控制字符 保存序列化后回读保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0039 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('\u0001 control char', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('\u0001 control char'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('\u0001 control char');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].sourceName), String('page'));
      expect(EventRecordStore.deserialize(storage.getText())[0].sourceName).assertEqual('page');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0039 end');
    })

    /**
     * @tc.name   testPersistContent0040
     * @tc.number SUB_CCER_PERSIST_02_0040
     * @tc.desc   三条特殊内容记录保存回读后顺序与内容保持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPersistContent0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0040 begin');
      const storage: MemoryRecordStorage = new MemoryRecordStorage();
      const store: EventRecordStore = new EventRecordStore(storage);
      const manager: EventRecordManager = new EventRecordManager(30, new FakeClock(0));
      manager.add('say "hi"', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 10).getTime());
        manager.add('back\\slash', EventSource.PAGE, new Date(2026, 5, 15, 8, 9, 11).getTime());
        manager.add('中文记录', EventSource.FORM, new Date(2026, 5, 15, 8, 9, 12).getTime());
      const result: number = store.save(manager);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3));
      expect(result).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[0].data), String('say "hi"'));
      expect(EventRecordStore.deserialize(storage.getText())[0].data).assertEqual('say "hi"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(EventRecordStore.deserialize(storage.getText())[2].data), String('中文记录'));
      expect(EventRecordStore.deserialize(storage.getText())[2].data).assertEqual('中文记录');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPersistContent0040 end');
    })

  })
}
