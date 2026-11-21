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
 * Verifies the received event records with flows that mix capacity, sequence and source resolution.
 */
export default function recordReal01Test() {
    describe('RecordReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_RECREAL_0001
         * @tc.name      testRecordFlow0001
         * @tc.desc      容量 3 连续写入 5 条时淘汰最早两条且序号不回退
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0001';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager(3);
            for (let index: number = 1; index <= 5; index++) {
                manager.add(`Data_${index}`, EventSource.FORM);
            }
            logPair(caseName, 'getCount', manager.getCount().toString(), '3');
            expect(manager.getCount()).assertEqual(3);
            const first: EventRecord = manager.getRecords()[0];
            logPair(caseName, 'records[0].data', first.data, 'Data_3');
            expect(first.data).assertEqual('Data_3');
            logPair(caseName, 'records[0].sequence', first.sequence.toString(), '3');
            expect(first.sequence).assertEqual(3);
            logPair(caseName, 'last.data', manager.getLastRecord()?.data ?? '', 'Data_5');
            expect(manager.getLastRecord()?.data).assertEqual('Data_5');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0002
         * @tc.name      testRecordFlow0002
         * @tc.desc      三个来源码写入后来源名分别为 form、page、external 且原始码保留
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0002';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager();
            const formRecord: EventRecord = manager.add(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const pageRecord: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            const externalRecord: EventRecord = manager.add(CommonEventConstants.DATA_IN_APP, -1);
            logPair(caseName, 'form.sourceName', formRecord.sourceName, EventSource.NAME_FORM);
            expect(formRecord.sourceName).assertEqual(EventSource.NAME_FORM);
            logPair(caseName, 'page.sourceName', pageRecord.sourceName, EventSource.NAME_PAGE);
            expect(pageRecord.sourceName).assertEqual(EventSource.NAME_PAGE);
            logPair(caseName, 'external.sourceName', externalRecord.sourceName, EventSource.NAME_EXTERNAL);
            expect(externalRecord.sourceName).assertEqual(EventSource.NAME_EXTERNAL);
            logPair(caseName, 'external.sourceCode', externalRecord.sourceCode.toString(), '-1');
            expect(externalRecord.sourceCode).assertEqual(-1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0003
         * @tc.name      testRecordFlow0003
         * @tc.desc      清空后记录归零、最后一条为空，重新写入可从序号 1 开始
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0003';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager();
            manager.add(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE);
            manager.clear();
            logPair(caseName, 'getCount after clear', manager.getCount().toString(), '0');
            expect(manager.getCount()).assertEqual(0);
            logPair(caseName, 'getLastRecord after clear', (manager.getLastRecord() === null).toString(), 'true');
            expect(manager.getLastRecord() === null).assertTrue();
            const restarted: EventRecord = manager.add(CommonEventConstants.DATA_IN_APP, EventSource.PAGE);
            logPair(caseName, 'restarted.sequence', restarted.sequence.toString(), '1');
            expect(restarted.sequence).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0004
         * @tc.name      testRecordFlow0004
         * @tc.desc      getRecords 返回副本，外部追加不会改变管理器内记录数量
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0004';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager();
            manager.add(CommonEventConstants.DATA_IN_APP, EventSource.FORM);
            const snapshot: EventRecord[] = manager.getRecords();
            let fake: EventRecord = {
                sequence: 99,
                data: 'Fake_Data',
                sourceCode: EventSource.UNKNOWN,
                sourceName: EventSource.NAME_EXTERNAL,
                receivedTime: '00:00:00'
            };
            snapshot.push(fake);
            logPair(caseName, 'snapshot.length', snapshot.length.toString(), '2');
            expect(snapshot.length).assertEqual(2);
            logPair(caseName, 'manager.getCount', manager.getCount().toString(), '1');
            expect(manager.getCount()).assertEqual(1);
            logPair(caseName, 'last.data', manager.getLastRecord()?.data ?? '', CommonEventConstants.DATA_IN_APP);
            expect(manager.getLastRecord()?.data).assertEqual(CommonEventConstants.DATA_IN_APP);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0005
         * @tc.name      testRecordFlow0005
         * @tc.desc      显式时间戳写入后记录时间与 formatTime 结果一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0005';
            logBegin(caseName);
            const timestamp: number = new Date(2026, 10, 18, 7, 5, 9).getTime();
            const manager: EventRecordManager = new EventRecordManager();
            const record: EventRecord = manager.add(CommonEventConstants.DATA_OUT_APP, EventSource.PAGE, timestamp);
            logPair(caseName, 'receivedTime', record.receivedTime, '07:05:09');
            expect(record.receivedTime).assertEqual('07:05:09');
            logPair(caseName, 'formatTime', EventRecordManager.formatTime(timestamp), record.receivedTime);
            expect(record.receivedTime).assertEqual(EventRecordManager.formatTime(timestamp));
            logPair(caseName, 'last.receivedTime', manager.getLastRecord()?.receivedTime ?? '', '07:05:09');
            expect(manager.getLastRecord()?.receivedTime).assertEqual('07:05:09');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0006
         * @tc.name      testRecordFlow0006
         * @tc.desc      自定义容量 5 时记录按到达顺序保留最早五条
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0006';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager(5);
            for (let index: number = 1; index <= 5; index++) {
                manager.add(`Data_${index}`, EventSource.FORM);
            }
            logPair(caseName, 'getCount', manager.getCount().toString(), '5');
            expect(manager.getCount()).assertEqual(5);
            logPair(caseName, 'records[0].data', manager.getRecords()[0].data, 'Data_1');
            expect(manager.getRecords()[0].data).assertEqual('Data_1');
            logPair(caseName, 'records[4].data', manager.getRecords()[4].data, 'Data_5');
            expect(manager.getRecords()[4].data).assertEqual('Data_5');
            logPair(caseName, 'records[2].sequence', manager.getRecords()[2].sequence.toString(), '3');
            expect(manager.getRecords()[2].sequence).assertEqual(3);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0007
         * @tc.name      testRecordFlow0007
         * @tc.desc      容量 1 时只保留最新一条且序号继续递增
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0007';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager(1);
            manager.add('First_Value', EventSource.FORM);
            manager.add('Second_Value', EventSource.PAGE);
            logPair(caseName, 'getCount', manager.getCount().toString(), '1');
            expect(manager.getCount()).assertEqual(1);
            logPair(caseName, 'last.data', manager.getLastRecord()?.data ?? '', 'Second_Value');
            expect(manager.getLastRecord()?.data).assertEqual('Second_Value');
            logPair(caseName, 'last.sequence', manager.getLastRecord()?.sequence.toString() ?? '', '2');
            expect(manager.getLastRecord()?.sequence).assertEqual(2);
            logPair(caseName, 'records[0].data', manager.getRecords()[0].data, 'Second_Value');
            expect(manager.getRecords()[0].data).assertEqual('Second_Value');
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0008
         * @tc.name      testRecordFlow0008
         * @tc.desc      默认容量按 20 条上限淘汰最早记录
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0008';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager();
            const total: number = CommonEventConstants.MAX_RECORD_COUNT + 5;
            for (let index: number = 1; index <= total; index++) {
                manager.add(`Data_${index}`, EventSource.FORM);
            }
            logPair(caseName, 'getCount', manager.getCount().toString(),
                CommonEventConstants.MAX_RECORD_COUNT.toString());
            expect(manager.getCount()).assertEqual(CommonEventConstants.MAX_RECORD_COUNT);
            logPair(caseName, 'records[0].sequence', manager.getRecords()[0].sequence.toString(), '6');
            expect(manager.getRecords()[0].sequence).assertEqual(6);
            logPair(caseName, 'last.sequence', manager.getLastRecord()?.sequence.toString() ?? '', total.toString());
            expect(manager.getLastRecord()?.sequence).assertEqual(total);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0009
         * @tc.name      testRecordFlow0009
         * @tc.desc      未知来源码记录为 external 且码值保持常量 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0009';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager();
            const record: EventRecord = manager.add(CommonEventConstants.DATA_IN_APP, EventSource.UNKNOWN);
            logPair(caseName, 'sourceCode', record.sourceCode.toString(), EventSource.UNKNOWN.toString());
            expect(record.sourceCode).assertEqual(EventSource.UNKNOWN);
            logPair(caseName, 'sourceName', record.sourceName, EventSource.NAME_EXTERNAL);
            expect(record.sourceName).assertEqual(EventSource.NAME_EXTERNAL);
            logPair(caseName, 'resolveName', EventSource.resolveName(record.sourceCode), record.sourceName);
            expect(EventSource.resolveName(record.sourceCode)).assertEqual(record.sourceName);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_RECREAL_0010
         * @tc.name      testRecordFlow0010
         * @tc.desc      容量 20 写入 100 条后首尾序号分别为 81 与 100
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testRecordFlow0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
            const caseName: string = 'testRecordFlow0010';
            logBegin(caseName);
            const manager: EventRecordManager = new EventRecordManager();
            for (let index: number = 1; index <= 100; index++) {
                manager.add(`Data_${index}`, EventSource.FORM);
            }
            logPair(caseName, 'getCount', manager.getCount().toString(), '20');
            expect(manager.getCount()).assertEqual(20);
            logPair(caseName, 'records[0].sequence', manager.getRecords()[0].sequence.toString(), '81');
            expect(manager.getRecords()[0].sequence).assertEqual(81);
            logPair(caseName, 'last.sequence', manager.getLastRecord()?.sequence.toString() ?? '', '100');
            expect(manager.getLastRecord()?.sequence).assertEqual(100);
            logPair(caseName, 'last.data', manager.getLastRecord()?.data ?? '', 'Data_100');
            expect(manager.getLastRecord()?.data).assertEqual('Data_100');
            logEnd(caseName);
        })
    })
}