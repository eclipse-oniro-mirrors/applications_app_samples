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
import { BaseDataSource } from '../../../main/ets/common/BaseDataSource';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

/**
 * 只记录派发结果的数据变更监听器，不持有数据源引用。
 */
class DispatchRecorder implements DataChangeListener {
    public adds: number[] = [];
    public changes: number[] = [];
    public deletes: number[] = [];
    public moves: string[] = [];
    public reloads: number = 0;

    onDataReloaded(): void {
        this.reloads++;
    }

    onDataAdded(index: number): void {
        this.adds.push(index);
    }

    onDataAdd(index: number): void {
        this.adds.push(index);
    }

    onDataMoved(from: number, to: number): void {
        this.moves.push(`${from}->${to}`);
    }

    onDataMove(from: number, to: number): void {
        this.moves.push(`${from}->${to}`);
    }

    onDataDeleted(index: number): void {
        this.deletes.push(index);
    }

    onDataDelete(index: number): void {
        this.deletes.push(index);
    }

    onDataChanged(index: number): void {
        this.changes.push(index);
    }

    onDataChange(index: number): void {
        this.changes.push(index);
    }

    onDatasetChange(dataOperations: DataOperation[]): void {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'dataset batch %{public}d', dataOperations.length);
    }
}

function logCount(label: string, actual: number, expected: number): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s actual=%{public}d expected=%{public}d', label, actual, expected);
}

export default function dataSourceSeqTest() {
    describe('DataSourceSeqTest', () => {

        /**
         * @tc.name   testDataSourceSeq0051
         * @tc.number SUB_ACCT_STRUCT_0051
         * @tc.desc   数据变化通知同时送达两个监听器，各自记录同一下标
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testDataSourceSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0051 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const first: DispatchRecorder = new DispatchRecorder();
            const second: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(first);
            source.registerDataChangeListener(second);
            source.notifyDataChange(2);
            logCount('first.changes', first.changes.length, 1);
            expect(first.changes.length).assertEqual(1);
            expect(first.changes[0]).assertEqual(2);
            expect(second.changes[0]).assertEqual(2);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0051 end');
        });

        /**
         * @tc.name   testDataSourceSeq0052
         * @tc.number SUB_ACCT_STRUCT_0052
         * @tc.desc   删除通知同时送达两个监听器，变化与新增列表保持为空
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testDataSourceSeq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0052 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const first: DispatchRecorder = new DispatchRecorder();
            const second: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(first);
            source.registerDataChangeListener(second);
            source.notifyDataDelete(1);
            logCount('first.deletes', first.deletes.length, 1);
            expect(first.deletes[0]).assertEqual(1);
            expect(second.deletes[0]).assertEqual(1);
            expect(first.changes.length).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0052 end');
        });

        /**
         * @tc.name   testDataSourceSeq0053
         * @tc.number SUB_ACCT_STRUCT_0053
         * @tc.desc   重新加载通知同时送达两个监听器，计数各加一
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testDataSourceSeq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0053 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const first: DispatchRecorder = new DispatchRecorder();
            const second: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(first);
            source.registerDataChangeListener(second);
            source.notifyDataReload();
            logCount('reloads', first.reloads, 1);
            expect(first.reloads).assertEqual(1);
            expect(second.reloads).assertEqual(1);
            expect(first.adds.length).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0053 end');
        });

        /**
         * @tc.name   testDataSourceSeq0054
         * @tc.number SUB_ACCT_STRUCT_0054
         * @tc.desc   位置移动通知同时送达两个监听器，起止下标一致
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testDataSourceSeq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0054 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const first: DispatchRecorder = new DispatchRecorder();
            const second: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(first);
            source.registerDataChangeListener(second);
            source.notifyDataMove(0, 2);
            expect(first.moves.length).assertEqual(1);
            expect(first.moves[0]).assertEqual('0->2');
            expect(second.moves[0]).assertEqual('0->2');
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0054 end');
        });

        /**
         * @tc.name   testDataSourceSeq0055
         * @tc.number SUB_ACCT_STRUCT_0055
         * @tc.desc   三个监听器同时注册后收到同一次新增，计数为三
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0055 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const first: DispatchRecorder = new DispatchRecorder();
            const second: DispatchRecorder = new DispatchRecorder();
            const third: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(first);
            source.registerDataChangeListener(second);
            source.registerDataChangeListener(third);
            source.notifyDataAdd(0);
            logCount('listenerCount', source.listenerCount(), 3);
            expect(source.listenerCount()).assertEqual(3);
            expect(first.adds[0]).assertEqual(0);
            expect(third.adds[0]).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0055 end');
        });

        /**
         * @tc.name   testDataSourceSeq0056
         * @tc.number SUB_ACCT_STRUCT_0056
         * @tc.desc   注销后重新注册，计数回到一且重新收到通知
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0056 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.unregisterDataChangeListener(listener);
            source.notifyDataAdd(0);
            expect(listener.adds.length).assertEqual(0);
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(1);
            logCount('listenerCount', source.listenerCount(), 1);
            expect(source.listenerCount()).assertEqual(1);
            expect(listener.adds.length).assertEqual(1);
            expect(listener.adds[0]).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0056 end');
        });

        /**
         * @tc.name   testDataSourceSeq0057
         * @tc.number SUB_ACCT_STRUCT_0057
         * @tc.desc   连续三次新增按调用顺序派发，下标序列不被合并或重排
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0057 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(0);
            source.notifyDataAdd(1);
            source.notifyDataAdd(2);
            logCount('adds.length', listener.adds.length, 3);
            expect(listener.adds.length).assertEqual(3);
            expect(listener.adds[0]).assertEqual(0);
            expect(listener.adds[2]).assertEqual(2);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0057 end');
        });

        /**
         * @tc.name   testDataSourceSeq0058
         * @tc.number SUB_ACCT_STRUCT_0058
         * @tc.desc   四次变化通知的四个不同下标按顺序完整透传
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0058 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataChange(0);
            source.notifyDataChange(1);
            source.notifyDataChange(2);
            source.notifyDataChange(5);
            expect(listener.changes.length).assertEqual(4);
            expect(listener.changes[0]).assertEqual(0);
            expect(listener.changes[1]).assertEqual(1);
            expect(listener.changes[3]).assertEqual(5);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0058 end');
        });

        /**
         * @tc.name   testDataSourceSeq0059
         * @tc.number SUB_ACCT_STRUCT_0059
         * @tc.desc   删除通知的倒序下标按调用顺序透传，不排序
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0059 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataDelete(2);
            source.notifyDataDelete(1);
            source.notifyDataDelete(0);
            expect(listener.deletes.length).assertEqual(3);
            expect(listener.deletes[0]).assertEqual(2);
            expect(listener.deletes[1]).assertEqual(1);
            expect(listener.deletes[2]).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0059 end');
        });

        /**
         * @tc.name   testDataSourceSeq0060
         * @tc.number SUB_ACCT_STRUCT_0060
         * @tc.desc   四种移动组合的记录逐项一致，含原地移动
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0060 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataMove(0, 1);
            source.notifyDataMove(1, 0);
            source.notifyDataMove(2, 0);
            source.notifyDataMove(0, 0);
            expect(listener.moves.length).assertEqual(4);
            expect(listener.moves[2]).assertEqual('2->0');
            expect(listener.moves[3]).assertEqual('0->0');
            expect(listener.reloads).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0060 end');
        });

        /**
         * @tc.name   testDataSourceSeq0061
         * @tc.number SUB_ACCT_STRUCT_0061
         * @tc.desc   负数下标按原值透传，数据源不做取值域裁剪
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0061 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(-1);
            source.notifyDataChange(-1);
            source.notifyDataDelete(-1);
            expect(listener.adds[0]).assertEqual(-1);
            expect(listener.changes[0]).assertEqual(-1);
            expect(listener.deletes[0]).assertEqual(-1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0061 end');
        });

        /**
         * @tc.name   testDataSourceSeq0062
         * @tc.number SUB_ACCT_STRUCT_0062
         * @tc.desc   七位数下标按原值透传，数据源不校验上界
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0062 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(1000000);
            logCount('adds[0]', listener.adds[0], 1000000);
            expect(listener.adds.length).assertEqual(1);
            expect(listener.adds[0]).assertEqual(1000000);
            expect(source.totalCount()).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0062 end');
        });

        /**
         * @tc.name   testDataSourceSeq0063
         * @tc.number SUB_ACCT_STRUCT_0063
         * @tc.desc   五类通知交叉派发时各自计数独立，互不串到其它列表
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0063 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(0);
            source.notifyDataChange(1);
            source.notifyDataDelete(2);
            source.notifyDataMove(3, 4);
            source.notifyDataReload();
            logCount('adds', listener.adds.length, 1);
            expect(listener.adds.length).assertEqual(1);
            expect(listener.changes.length).assertEqual(1);
            expect(listener.deletes.length).assertEqual(1);
            expect(listener.moves.length).assertEqual(1);
            expect(listener.reloads).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0063 end');
        });

        /**
         * @tc.name   testDataSourceSeq0064
         * @tc.number SUB_ACCT_STRUCT_0064
         * @tc.desc   注销后四类通知都不再送达已注销的监听器
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0064 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.unregisterDataChangeListener(listener);
            source.notifyDataAdd(0);
            source.notifyDataChange(0);
            source.notifyDataDelete(0);
            source.notifyDataReload();
            logCount('reloads after unregister', listener.reloads, 0);
            expect(listener.adds.length).assertEqual(0);
            expect(listener.changes.length).assertEqual(0);
            expect(listener.deletes.length).assertEqual(0);
            expect(listener.reloads).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0064 end');
        });

        /**
         * @tc.name   testDataSourceSeq0065
         * @tc.number SUB_ACCT_STRUCT_0065
         * @tc.desc   后注册的监听器收不到注册之前已发生的通知
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0065 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const early: DispatchRecorder = new DispatchRecorder();
            const late: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(early);
            source.notifyDataAdd(0);
            source.registerDataChangeListener(late);
            source.notifyDataAdd(1);
            logCount('early.adds', early.adds.length, 2);
            expect(early.adds.length).assertEqual(2);
            expect(late.adds.length).assertEqual(1);
            expect(late.adds[0]).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0065 end');
        });

        /**
         * @tc.name   testDataSourceSeq0066
         * @tc.number SUB_ACCT_STRUCT_0066
         * @tc.desc   重新加载通知连续三次，计数累加到三而不是被重置
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0066 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataReload();
            source.notifyDataReload();
            source.notifyDataReload();
            logCount('reloads', listener.reloads, 3);
            expect(listener.reloads).assertEqual(3);
            expect(listener.adds.length).assertEqual(0);
            expect(source.listenerCount()).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0066 end');
        });

        /**
         * @tc.name   testDataSourceSeq0067
         * @tc.number SUB_ACCT_STRUCT_0067
         * @tc.desc   逆序移动记录为起止原序，不被互换
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0067 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataMove(3, 1);
            logCount('moves.length', listener.moves.length, 1);
            expect(listener.moves.length).assertEqual(1);
            expect(listener.moves[0]).assertEqual('3->1');
            expect(listener.moves[0] === '1->3').assertFalse();
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0067 end');
        });

        /**
         * @tc.name   testDataSourceSeq0068
         * @tc.number SUB_ACCT_STRUCT_0068
         * @tc.desc   单次新增通知只派发一次，不在监听器列表上重复调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0068 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(4);
            logCount('adds.length', listener.adds.length, 1);
            expect(listener.adds.length).assertEqual(1);
            expect(listener.adds[0]).assertEqual(4);
            expect(listener.changes.length).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0068 end');
        });

        /**
         * @tc.name   testDataSourceSeq0069
         * @tc.number SUB_ACCT_STRUCT_0069
         * @tc.desc   同一监听器注册两次只保留一份，单次通知只记录一次
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0069 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const listener: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(listener);
            source.registerDataChangeListener(listener);
            source.notifyDataAdd(0);
            logCount('listenerCount', source.listenerCount(), 1);
            expect(source.listenerCount()).assertEqual(1);
            expect(listener.adds.length).assertEqual(1);
            expect(listener.adds[0]).assertEqual(0);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0069 end');
        });

        /**
         * @tc.name   testDataSourceSeq0070
         * @tc.number SUB_ACCT_STRUCT_0070
         * @tc.desc   中途注销一个监听器后，剩余监听器的历史记录不清空且继续累积
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDataSourceSeq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0070 begin');
            const source: BaseDataSource<number> = new BaseDataSource<number>();
            const dropped: DispatchRecorder = new DispatchRecorder();
            const kept: DispatchRecorder = new DispatchRecorder();
            source.registerDataChangeListener(dropped);
            source.registerDataChangeListener(kept);
            source.notifyDataAdd(0);
            source.unregisterDataChangeListener(dropped);
            source.notifyDataAdd(1);
            logCount('kept.adds', kept.adds.length, 2);
            expect(dropped.adds.length).assertEqual(1);
            expect(kept.adds.length).assertEqual(2);
            expect(kept.adds[1]).assertEqual(1);
            hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testDataSourceSeq0070 end');
        });
    })
}
