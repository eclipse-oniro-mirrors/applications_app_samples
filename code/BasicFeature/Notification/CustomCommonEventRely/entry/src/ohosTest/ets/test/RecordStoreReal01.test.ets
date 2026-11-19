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
import { EventRecordStore } from '../../../main/ets/feature/EventRecordStore';
import { HomeStateModel } from '../../../main/ets/feature/HomeStateModel';
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { MemoryRecordStorage } from './util/ModelSupport';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

/**
 * Verifies the persisted record store with realistic save, load and model flows.
 */
export default function recordStoreReal01Test() {
    describe('RecordStoreReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_STORREAL_0001
         * @tc.name      testRecordStore0001
         * @tc.desc      保存与回放全链路往返后条数、数据与序号保持且序号接续递增
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0001';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const store: EventRecordStore = new EventRecordStore(storage);
            const manager: EventRecordManager = new EventRecordManager(10);
            for (let index: number = 1; index <= 3; index++) {
                manager.add(`Data_${index}`, EventSource.PAGE);
            }
            const saved: number = store.save(manager);
            const reloaded: number = store.loadInto(new EventRecordManager(10));
            const restored: EventRecord[] = EventRecordStore.deserialize(storage.getText());
            logPair(caseName, 'saved', saved.toString(), '3');
            expect(saved).assertEqual(3);
            logPair(caseName, 'reloaded', reloaded.toString(), '3');
            expect(reloaded).assertEqual(3);
            logPair(caseName, 'restored[2].data', restored[2].data, 'Data_3');
            expect(restored[2].data).assertEqual('Data_3');
            logPair(caseName, 'restored[2].sequence', restored[2].sequence.toString(), '3');
            expect(restored[2].sequence).assertEqual(3);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0002
         * @tc.name      testRecordStore0002
         * @tc.desc      三种来源的记录保存后回放时来源名重新解析且原始码与顺序不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0002';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const store: EventRecordStore = new EventRecordStore(storage);
            const manager: EventRecordManager = new EventRecordManager(10);
            manager.add(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            manager.add('External_Value', 999);
            store.save(manager);
            const restored: EventRecord[] = EventRecordStore.deserialize(storage.getText());
            logPair(caseName, 'form sourceName', restored[0].sourceName, EventSource.NAME_FORM);
            expect(restored[0].sourceName).assertEqual(EventSource.NAME_FORM);
            logPair(caseName, 'page sourceName', restored[1].sourceName, EventSource.NAME_PAGE);
            expect(restored[1].sourceName).assertEqual(EventSource.NAME_PAGE);
            logPair(caseName, 'external sourceName', restored[2].sourceName, EventSource.NAME_EXTERNAL);
            expect(restored[2].sourceName).assertEqual(EventSource.NAME_EXTERNAL);
            logPair(caseName, 'external sourceCode', restored[2].sourceCode.toString(), '999');
            expect(restored[2].sourceCode).assertEqual(999);
            logPair(caseName, 'page data', restored[1].data, CommonEventConstants.DATA_OUT_APP);
            expect(restored[1].data).assertEqual(CommonEventConstants.DATA_OUT_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0003
         * @tc.name      testRecordStore0003
         * @tc.desc      空管理器保存后文本为空数组且回放端记录数为零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0003';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const store: EventRecordStore = new EventRecordStore(storage);
            const emptyManager: EventRecordManager = new EventRecordManager();
            const saved: number = store.save(emptyManager);
            const loaded: number = store.loadInto(new EventRecordManager());
            logPair(caseName, 'saved', saved.toString(), '0');
            expect(saved).assertEqual(0);
            logPair(caseName, 'persisted text', storage.getText(), '[]');
            expect(storage.getText()).assertEqual('[]');
            logPair(caseName, 'loaded', loaded.toString(), '0');
            expect(loaded).assertEqual(0);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0004
         * @tc.name      testRecordStore0004
         * @tc.desc      清空后序号从 1 重新开始而回放恢复后序号从末条接续
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0004';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const store: EventRecordStore = new EventRecordStore(storage);
            const manager: EventRecordManager = new EventRecordManager(10);
            manager.add('First_Value', EventSource.FORM);
            manager.add('Second_Value', EventSource.PAGE);
            store.save(manager);
            manager.clear();
            const afterClear: EventRecord = manager.add('Third_Value', EventSource.PAGE);
            logPair(caseName, 'afterClear.sequence', afterClear.sequence.toString(), '1');
            expect(afterClear.sequence).assertEqual(1);
            const restored: number = store.loadInto(manager);
            logPair(caseName, 'restored', restored.toString(), '2');
            expect(restored).assertEqual(2);
            const afterRestore: EventRecord = manager.add('Fourth_Value', EventSource.FORM);
            logPair(caseName, 'afterRestore.sequence', afterRestore.sequence.toString(), '3');
            expect(afterRestore.sequence).assertEqual(3);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0005
         * @tc.name      testRecordStore0005
         * @tc.desc      回放端容量小于存量时仅保留最新记录且序号接续自末条
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0005';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const store: EventRecordStore = new EventRecordStore(storage);
            const source: EventRecordManager = new EventRecordManager(10);
            for (let index: number = 1; index <= 5; index++) {
                source.add(`Data_${index}`, EventSource.FORM);
            }
            store.save(source);
            const target: EventRecordManager = new EventRecordManager(3);
            const loaded: number = store.loadInto(target);
            const records: EventRecord[] = target.getRecords();
            logPair(caseName, 'loaded', loaded.toString(), '3');
            expect(loaded).assertEqual(3);
            logPair(caseName, 'records[0].data', records[0].data, 'Data_3');
            expect(records[0].data).assertEqual('Data_3');
            logPair(caseName, 'records[2].sequence', records[2].sequence.toString(), '5');
            expect(records[2].sequence).assertEqual(5);
            const continued: EventRecord = target.add('Data_6', EventSource.PAGE);
            logPair(caseName, 'continued.sequence', continued.sequence.toString(), '6');
            expect(continued.sequence).assertEqual(6);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0006
         * @tc.name      testRecordStore0006
         * @tc.desc      序列化往返幂等且落盘文本不包含序号与来源名字段
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0006';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager(10);
            manager.add(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            manager.add('External_Value', 999);
            const firstText: string = EventRecordStore.serialize(manager.getRecords());
            const secondText: string = EventRecordStore.serialize(EventRecordStore.deserialize(firstText));
            logPair(caseName, 'round trip stable', (firstText === secondText).toString(), 'true');
            expect(firstText === secondText).assertTrue();
            logPair(caseName, 'entry count', EventRecordStore.deserialize(firstText).length.toString(), '3');
            expect(EventRecordStore.deserialize(firstText).length).assertEqual(3);
            logPair(caseName, 'sequence not persisted', (firstText.indexOf('sequence') < 0).toString(), 'true');
            expect(firstText.indexOf('sequence') < 0).assertTrue();
            logPair(caseName, 'sourceName not persisted', (firstText.indexOf('sourceName') < 0).toString(), 'true');
            expect(firstText.indexOf('sourceName') < 0).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0007
         * @tc.name      testRecordStore0007
         * @tc.desc      损坏的存量文本回放后记录数为零且再次保存可自愈为合法文本
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0007';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage('not-json');
            const store: EventRecordStore = new EventRecordStore(storage);
            const manager: EventRecordManager = new EventRecordManager(10);
            const loaded: number = store.loadInto(manager);
            logPair(caseName, 'loaded from broken text', loaded.toString(), '0');
            expect(loaded).assertEqual(0);
            const first: EventRecord = manager.add('Fresh_Value', EventSource.PAGE);
            logPair(caseName, 'first.sequence', first.sequence.toString(), '1');
            expect(first.sequence).assertEqual(1);
            store.save(manager);
            const healed: number = EventRecordStore.deserialize(storage.getText()).length;
            logPair(caseName, 'healed count', healed.toString(), '1');
            expect(healed).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0008
         * @tc.name      testRecordStore0008
         * @tc.desc      模型持久化后新模型回放可恢复条数与末条数据且不改变状态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0008';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const model: HomeStateModel = new HomeStateModel(new EventRecordManager(10));
            model.setStore(new EventRecordStore(storage));
            model.handleEvent(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            model.handleEvent(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            model.handleEvent('External_Value', 999);
            model.persist();
            const revived: HomeStateModel = new HomeStateModel(new EventRecordManager(10));
            revived.setStore(new EventRecordStore(storage));
            revived.restore();
            logPair(caseName, 'revived count', revived.getReceivedCount().toString(), '3');
            expect(revived.getReceivedCount()).assertEqual(3);
            logPair(caseName, 'revived last data', revived.getLastEventData(), 'External_Value');
            expect(revived.getLastEventData()).assertEqual('External_Value');
            logPair(caseName, 'revived last source', revived.getLastSourceCode().toString(), '999');
            expect(revived.getLastSourceCode()).assertEqual(999);
            logPair(caseName, 'status untouched', revived.getStatus().toString(), '0');
            expect(revived.getStatus()).assertEqual(0);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0009
         * @tc.name      testRecordStore0009
         * @tc.desc      模型回放后继续接收事件时计数累加且快照末条序号接续
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0009';
            logBegin(caseName);
            const storage: MemoryRecordStorage = new MemoryRecordStorage();
            const store: EventRecordStore = new EventRecordStore(storage);
            const source: HomeStateModel = new HomeStateModel(new EventRecordManager(10));
            source.setStore(store);
            source.handleEvent('First_Value', EventSource.FORM);
            source.handleEvent('Second_Value', EventSource.PAGE);
            source.persist();
            const revived: HomeStateModel = new HomeStateModel(new EventRecordManager(10));
            revived.setStore(store);
            revived.restore();
            revived.handleEvent('Third_Value', EventSource.FORM);
            logPair(caseName, 'count after continue', revived.getReceivedCount().toString(), '3');
            expect(revived.getReceivedCount()).assertEqual(3);
            logPair(caseName, 'last data', revived.getLastEventData(), 'Third_Value');
            expect(revived.getLastEventData()).assertEqual('Third_Value');
            logPair(caseName, 'snapshot lastSequence', revived.snapshot().lastSequence.toString(), '3');
            expect(revived.snapshot().lastSequence).assertEqual(3);
            logPair(caseName, 'snapshot count', revived.snapshot().count.toString(), '3');
            expect(revived.snapshot().count).assertEqual(3);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_STORREAL_0010
         * @tc.name      testRecordStore0010
         * @tc.desc      未注入存储时持久化与回放均为空操作且不改变模型状态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordStore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordStore0010';
            logBegin(caseName);
            const model: HomeStateModel = new HomeStateModel(new EventRecordManager(10));
            model.handleEvent(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            model.persist();
            model.restore();
            logPair(caseName, 'count', model.getReceivedCount().toString(), '1');
            expect(model.getReceivedCount()).assertEqual(1);
            logPair(caseName, 'records kept', model.getRecords().length.toString(), '1');
            expect(model.getRecords().length).assertEqual(1);
            logPair(caseName, 'last data', model.getLastEventData(), CommonEventConstants.DATA_IN_APP);
            expect(model.getLastEventData()).assertEqual(CommonEventConstants.DATA_IN_APP);
            logPair(caseName, 'status', model.getStatus().toString(), '7');
            expect(model.getStatus()).assertEqual(7);
            logEnd(caseName);
        })
    })
}
