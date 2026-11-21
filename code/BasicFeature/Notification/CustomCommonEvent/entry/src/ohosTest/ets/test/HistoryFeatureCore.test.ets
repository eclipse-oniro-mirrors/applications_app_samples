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
import common from '@ohos.app.ability.common';
import historyFeature from '../../../main/ets/feature/HistoryFeature';
import consts from '../../../main/ets/module/Consts';
import { clearStore, getTestContext, putStringArray } from './helper/TestStorage';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'HistoryFeatureCore_';
const TOTAL_KEY: string = consts.DATA_BASE_KEY_TOTAL_TIMES;

function logBegin(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case begin');
}

function logEnd(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case end');
}

function logPair(tag: string, label: string, actual: string, expected: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, 'label=%{public}s actual=%{public}s expected=%{public}s',
        label, actual, expected);
}

function requireContext(): common.UIAbilityContext {
    const context: common.UIAbilityContext | undefined = getTestContext();
    if (context === undefined) {
        throw new Error('test ability context is not ready');
    }
    return context;
}

async function loadData(): Promise<Array<Array<string>>> {
    const feature: historyFeature = new historyFeature(requireContext());
    const result: Array<Array<string>> = (await feature.getData()) as Array<Array<string>>;
    return result;
}

async function seed(times: Array<string>, details: Array<Array<string>>): Promise<void> {
    await clearStore();
    await putStringArray(TOTAL_KEY, times);
    for (let index = 0; index < times.length; index++) {
        if (index < details.length) {
            await putStringArray(times[index], details[index]);
        }
    }
}

async function seedTimesOnly(times: Array<string>): Promise<void> {
    await clearStore();
    await putStringArray(TOTAL_KEY, times);
}

function buildTimes(prefix: string, count: number): Array<string> {
    const times: Array<string> = [];
    for (let index = 0; index < count; index++) {
        times.push(prefix + (index + 1).toString());
    }
    return times;
}

function buildSingleDetails(count: number): Array<Array<string>> {
    const details: Array<Array<string>> = [];
    for (let index = 0; index < count; index++) {
        details.push(['st' + (index + 1).toString()]);
    }
    return details;
}

export default function historyFeatureCoreTest(): void {
    describe('HistoryFeatureCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_HISTORY_0001
         * @tc.name      testHistoryEmptyStore0001
         * @tc.desc      从未写入过记录时返回空列表，遍历不会产生任何元素
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryEmptyStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryEmptyStore0001';
            logBegin(tag);
            await clearStore();
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '0');
            expect(data.length).assertEqual(0);
            logPair(tag, 'joined', data.join('|'), '');
            expect(data.join('|')).assertEqual('');
            logPair(tag, 'json', JSON.stringify(data), '[]');
            expect(JSON.stringify(data)).assertEqual('[]');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0002
         * @tc.name      testHistorySingleRecord0002
         * @tc.desc      单条记录按 startTime/endTime/totalTime/totalEvents 四项原样返回
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistorySingleRecord0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistorySingleRecord0002';
            logBegin(tag);
            await seed(['record_001'], [['08:00:00', '08:10:00', '600', '2']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '1');
            expect(data.length).assertEqual(1);
            logPair(tag, 'fieldCount', data[0].length.toString(), '4');
            expect(data[0].length).assertEqual(4);
            logPair(tag, 'totalTime', data[0][2], '600');
            expect(data[0][2]).assertEqual('600');
            logPair(tag, 'startTime', data[0][0], '08:00:00');
            expect(data[0][0]).assertEqual('08:00:00');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0003
         * @tc.name      testHistoryTwoRecordsOrder0003
         * @tc.desc      两条记录的输出顺序与 totalTimes 中保存的键顺序一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryTwoRecordsOrder0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryTwoRecordsOrder0003';
            logBegin(tag);
            await seed(['record_001', 'record_002'], [['a1'], ['b2']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '2');
            expect(data.length).assertEqual(2);
            logPair(tag, 'first', data[0][0], 'a1');
            expect(data[0][0]).assertEqual('a1');
            logPair(tag, 'second', data[1][0], 'b2');
            expect(data[1][0]).assertEqual('b2');
            logPair(tag, 'secondDetail', JSON.stringify(data[1]), '["b2"]');
            expect(data[1]).assertDeepEquals(['b2']);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0004
         * @tc.name      testHistoryThreeRecordsTail0004
         * @tc.desc      三条记录时末条记录位于列表尾部，内容不被前序记录覆盖
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryThreeRecordsTail0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryThreeRecordsTail0004';
            logBegin(tag);
            await seed(['record_001', 'record_002', 'record_003'], [['a1'], ['b2'], ['c3']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '3');
            expect(data.length).assertEqual(3);
            logPair(tag, 'tail', data[2][0], 'c3');
            expect(data[2][0]).assertEqual('c3');
            const json: string = JSON.stringify(data);
            const indexOfTail: number = json.indexOf('c3');
            logPair(tag, 'indexOfTail', indexOfTail.toString(), '> -1');
            expect(indexOfTail).assertLarger(-1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0005
         * @tc.name      testHistoryAllKeysMissing0005
         * @tc.desc      totalTimes 引用的键都没有对应详情时整体为空，缺省值 [] 被过滤
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryAllKeysMissing0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryAllKeysMissing0005';
            logBegin(tag);
            await seedTimesOnly(['missing_01', 'missing_02']);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '0');
            expect(data.length).assertEqual(0);
            logPair(tag, 'head', String(data[0]), 'undefined');
            expect(data[0]).assertUndefined();
            logPair(tag, 'json', JSON.stringify(data), '[]');
            expect(JSON.stringify(data)).assertEqual('[]');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0006
         * @tc.name      testHistoryEmptyArrayFiltered0006
         * @tc.desc      详情为空数组的引用被过滤，只保留真正有内容的记录
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryEmptyArrayFiltered0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryEmptyArrayFiltered0006';
            logBegin(tag);
            await seed(['record_001', 'record_002', 'record_003'], [['x'], [], ['y']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '2');
            expect(data.length).assertEqual(2);
            logPair(tag, 'kept', data[0][0], 'x');
            expect(data[0][0]).assertEqual('x');
            logPair(tag, 'tailKept', data[1][0], 'y');
            expect(data[1][0]).assertEqual('y');
            logPair(tag, 'json', JSON.stringify(data), '[["x"],["y"]]');
            expect(JSON.stringify(data)).assertEqual('[["x"],["y"]]');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0007
         * @tc.name      testHistoryDetailOneItem0007
         * @tc.desc      详情只有一项时仍被保留，不会被误判为空记录
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDetailOneItem0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDetailOneItem0007';
            logBegin(tag);
            await seed(['record_001'], [['only_start']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '1');
            expect(data.length).assertEqual(1);
            logPair(tag, 'fieldCount', data[0].length.toString(), '1');
            expect(data[0].length).assertEqual(1);
            logPair(tag, 'value', data[0][0], 'only_start');
            expect(data[0][0]).assertEqual('only_start');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0008
         * @tc.name      testHistoryDetailTwoItems0008
         * @tc.desc      详情有两项时首尾两项都保留，拼接结果等于写入内容
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDetailTwoItems0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDetailTwoItems0008';
            logBegin(tag);
            await seed(['record_001'], [['08:00:00', '08:10:00']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'fieldCount', data[0].length.toString(), '2');
            expect(data[0].length).assertEqual(2);
            logPair(tag, 'endTime', data[0][1], '08:10:00');
            expect(data[0][1]).assertEqual('08:10:00');
            logPair(tag, 'joined', data[0].join('|'), '08:00:00|08:10:00');
            expect(data[0].join('|')).assertEqual('08:00:00|08:10:00');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0009
         * @tc.name      testHistoryDetailThreeItems0009
         * @tc.desc      详情有三项时第三项按时长原样保留，不被截断或改写
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDetailThreeItems0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDetailThreeItems0009';
            logBegin(tag);
            await seed(['record_001'], [['08:00:00', '08:10:00', '600']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'fieldCount', data[0].length.toString(), '3');
            expect(data[0].length).assertEqual(3);
            logPair(tag, 'totalTime', data[0][2], '600');
            expect(data[0][2]).assertEqual('600');
            logPair(tag, 'totalTimeLen', data[0][2].length.toString(), '3');
            expect(data[0][2].length).assertEqual(3);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0010
         * @tc.name      testHistoryDetailFourItems0010
         * @tc.desc      完整四项详情逐项返回，字段次序与写入时一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDetailFourItems0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDetailFourItems0010';
            logBegin(tag);
            await seed(['record_001'], [['08:00:00', '08:10:00', '600', '2']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'detail', JSON.stringify(data[0]), '["08:00:00","08:10:00","600","2"]');
            expect(data[0]).assertDeepEquals(['08:00:00', '08:10:00', '600', '2']);
            logPair(tag, 'fieldCount', data[0].length.toString(), '4');
            expect(data[0].length).assertEqual(4);
            logPair(tag, 'totalEvents', data[0][3], '2');
            expect(data[0][3]).assertEqual('2');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0011
         * @tc.name      testHistoryDetailFiveItems0011
         * @tc.desc      多于四项的详情不被裁剪，多余字段一并返回
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDetailFiveItems0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDetailFiveItems0011';
            logBegin(tag);
            await seed(['record_001'], [['a', 'b', 'c', 'd', 'extra']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'fieldCount', data[0].length.toString(), '5');
            expect(data[0].length).assertEqual(5);
            logPair(tag, 'last', data[0][4], 'extra');
            expect(data[0][4]).assertEqual('extra');
            logPair(tag, 'json', JSON.stringify(data), '[["a","b","c","d","extra"]]');
            expect(JSON.stringify(data)).assertContain('extra');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0012
         * @tc.name      testHistoryMaxRecordNum0012
         * @tc.desc      达到上限 10 条时全部返回，首尾记录都能取到
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryMaxRecordNum0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryMaxRecordNum0012';
            logBegin(tag);
            await seed(buildTimes('r', 10), buildSingleDetails(10));
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '10');
            expect(data.length).assertEqual(10);
            logPair(tag, 'head', data[0][0], 'st1');
            expect(data[0][0]).assertEqual('st1');
            logPair(tag, 'tail', data[9][0], 'st10');
            expect(data[9][0]).assertEqual('st10');
            logPair(tag, 'maxRecordNum', consts.MAX_RECORD_NUM.toString(), '10');
            expect(consts.MAX_RECORD_NUM).assertEqual(data.length);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0013
         * @tc.name      testHistoryBeyondMax0013
         * @tc.desc      记录数超过上限时读取侧不做截断，12 条全部返回
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryBeyondMax0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryBeyondMax0013';
            logBegin(tag);
            await seed(buildTimes('r', 12), buildSingleDetails(12));
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '12');
            expect(data.length).assertEqual(12);
            logPair(tag, 'beyondMax', (data.length > consts.MAX_RECORD_NUM).toString(), 'true');
            expect(data.length).assertLarger(consts.MAX_RECORD_NUM);
            logPair(tag, 'tail', data[11][0], 'st12');
            expect(data[11][0]).assertEqual('st12');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0014
         * @tc.name      testHistoryDuplicateReference0014
         * @tc.desc      totalTimes 重复引用同一键时保留两条，且都取该键最后一次写入的值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDuplicateReference0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDuplicateReference0014';
            logBegin(tag);
            await seed(['record_001', 'record_001'], [['dup'], ['dup2']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '2');
            expect(data.length).assertEqual(2);
            logPair(tag, 'latest', data[0][0], 'dup2');
            expect(data[0][0]).assertEqual('dup2');
            logPair(tag, 'sameBoth', (data[0][0] === data[1][0]).toString(), 'true');
            expect(data[0][0]).assertEqual(data[1][0]);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0015
         * @tc.name      testHistoryRepeatedLoad0015
         * @tc.desc      相同存储内容连续读取两次得到一致结果，读取过程不污染数据
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryRepeatedLoad0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryRepeatedLoad0015';
            logBegin(tag);
            await seed(['record_001', 'record_002'], [['a1'], ['b2']]);
            const first: Array<Array<string>> = await loadData();
            const second: Array<Array<string>> = await loadData();
            logPair(tag, 'sameCount', (first.length === second.length).toString(), 'true');
            expect(first.length).assertEqual(second.length);
            logPair(tag, 'sameJson', (JSON.stringify(first) === JSON.stringify(second)).toString(), 'true');
            expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
            logPair(tag, 'secondTail', second[1][0], 'b2');
            expect(second[1][0]).assertEqual('b2');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0016
         * @tc.name      testHistoryClearThenWrite0016
         * @tc.desc      清空存储后旧记录不再出现，随后写入的新记录能被立即读到
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryClearThenWrite0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryClearThenWrite0016';
            logBegin(tag);
            await seed(['record_001', 'record_002'], [['old1'], ['old2']]);
            await clearStore();
            await putStringArray(TOTAL_KEY, ['record_003']);
            await putStringArray('record_003', ['fresh']);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '1');
            expect(data.length).assertEqual(1);
            logPair(tag, 'value', data[0][0], 'fresh');
            expect(data[0][0]).assertEqual('fresh');
            const staleIndex: number = JSON.stringify(data).indexOf('old1');
            logPair(tag, 'staleIndex', staleIndex.toString(), '-1');
            expect(staleIndex).assertEqual(-1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0017
         * @tc.name      testHistoryEmptyStringItem0017
         * @tc.desc      详情中的空字符串属于有效内容，不会被当作空数组过滤
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryEmptyStringItem0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryEmptyStringItem0017';
            logBegin(tag);
            await seed(['record_001'], [['']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '1');
            expect(data.length).assertEqual(1);
            logPair(tag, 'fieldCount', data[0].length.toString(), '1');
            expect(data[0].length).assertEqual(1);
            logPair(tag, 'valueLen', data[0][0].length.toString(), '0');
            expect(data[0][0].length).assertEqual(0);
            expect(data[0][0]).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0018
         * @tc.name      testHistorySparseReferences0018
         * @tc.desc      20 条引用中 5 条缺详情时只返回 15 条，且保持原有相对顺序
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistorySparseReferences0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistorySparseReferences0018';
            logBegin(tag);
            const times: Array<string> = buildTimes('r', 20);
            await clearStore();
            await putStringArray(TOTAL_KEY, times);
            for (let index = 0; index < times.length; index++) {
                const ordinal: number = index + 1;
                if (ordinal % 4 === 0) {
                    continue;
                }
                await putStringArray(times[index], ['st' + ordinal.toString()]);
            }
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '15');
            expect(data.length).assertEqual(15);
            logPair(tag, 'head', data[0][0], 'st1');
            expect(data[0][0]).assertEqual('st1');
            logPair(tag, 'tail', data[14][0], 'st19');
            expect(data[14][0]).assertEqual('st19');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0019
         * @tc.name      testHistorySpecialChars0019
         * @tc.desc      中文与竖线等特殊字符按原样返回，读取链路不做转义或截断
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistorySpecialChars0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistorySpecialChars0019';
            logBegin(tag);
            await seed(['record_001'], [['08:00:00', '结束', '12:34|56', '2']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'totalTime', data[0][2], '12:34|56');
            expect(data[0][2]).assertEqual('12:34|56');
            logPair(tag, 'endTime', data[0][1], '结束');
            expect(data[0][1]).assertEqual('结束');
            logPair(tag, 'jsonHasChinese', (JSON.stringify(data).indexOf('结束') > -1).toString(), 'true');
            expect(JSON.stringify(data)).assertContain('结束');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0020
         * @tc.name      testHistoryLiteralEmptyJson0020
         * @tc.desc      详情元素本身是字符串 '[]' 时被保留，说明过滤依据是数组序列化结果
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryLiteralEmptyJson0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryLiteralEmptyJson0020';
            logBegin(tag);
            await seed(['record_001'], [['[]']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '1');
            expect(data.length).assertEqual(1);
            logPair(tag, 'value', data[0][0], '[]');
            expect(data[0][0]).assertEqual('[]');
            logPair(tag, 'valueLen', data[0][0].length.toString(), '2');
            expect(data[0][0].length).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0021
         * @tc.name      testHistoryEmptyTimesList0021
         * @tc.desc      totalTimes 为空数组时不产生记录，补写一条后即可读到该条
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryEmptyTimesList0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryEmptyTimesList0021';
            logBegin(tag);
            await clearStore();
            await putStringArray(TOTAL_KEY, []);
            const empty: Array<Array<string>> = await loadData();
            logPair(tag, 'emptyCount', empty.length.toString(), '0');
            expect(empty.length).assertEqual(0);
            await putStringArray('record_001', ['x']);
            await putStringArray(TOTAL_KEY, ['record_001']);
            const filled: Array<Array<string>> = await loadData();
            logPair(tag, 'filledCount', filled.length.toString(), '1');
            expect(filled.length).assertEqual(1);
            logPair(tag, 'filledValue', filled[0][0], 'x');
            expect(filled[0][0]).assertEqual('x');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0022
         * @tc.name      testHistoryDifferentLengths0022
         * @tc.desc      两条记录的字段数量不同时各自保留自身长度，缺失字段不被补齐
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryDifferentLengths0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryDifferentLengths0022';
            logBegin(tag);
            await seed(['record_001', 'record_002'], [['a'], ['x', 'y', 'z']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'firstLen', data[0].length.toString(), '1');
            expect(data[0].length).assertEqual(1);
            logPair(tag, 'secondLen', data[1].length.toString(), '3');
            expect(data[1].length).assertEqual(3);
            logPair(tag, 'secondTail', data[1][2], 'z');
            expect(data[1][2]).assertEqual('z');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0023
         * @tc.name      testHistorySnapshotIsolation0023
         * @tc.desc      重新读取后先前取到的结果保持原长度，两次读取互不覆盖
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistorySnapshotIsolation0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistorySnapshotIsolation0023';
            logBegin(tag);
            await seed(['record_001', 'record_002'], [['a'], ['b']]);
            const feature: historyFeature = new historyFeature(requireContext());
            const first: Array<Array<string>> = (await feature.getData()) as Array<Array<string>>;
            await clearStore();
            await putStringArray(TOTAL_KEY, ['record_009']);
            await putStringArray('record_009', ['b9']);
            const second: Array<Array<string>> = (await feature.getData()) as Array<Array<string>>;
            logPair(tag, 'firstCount', first.length.toString(), '2');
            expect(first.length).assertEqual(2);
            logPair(tag, 'secondCount', second.length.toString(), '1');
            expect(second.length).assertEqual(1);
            logPair(tag, 'secondValue', second[0][0], 'b9');
            expect(second[0][0]).assertEqual('b9');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0024
         * @tc.name      testHistoryMissingKeysNoThrow0024
         * @tc.desc      所有引用键都缺失时读取正常结束，不抛异常且返回空列表
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryMissingKeysNoThrow0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryMissingKeysNoThrow0024';
            logBegin(tag);
            await seedTimesOnly(['miss_a', 'miss_b', 'miss_c']);
            let threw: boolean = false;
            let data: Array<Array<string>> = [];
            try {
                data = await loadData();
            } catch (error) {
                threw = true;
                hilog.error(DOMAIN, TAG_PREFIX + tag, 'unexpected error %{public}s', JSON.stringify(error));
            }
            logPair(tag, 'threw', threw.toString(), 'false');
            expect(threw).assertFalse();
            logPair(tag, 'count', data.length.toString(), '0');
            expect(data.length).assertEqual(0);
            logPair(tag, 'json', JSON.stringify(data), '[]');
            expect(JSON.stringify(data)).assertEqual('[]');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0025
         * @tc.name      testHistoryCompleteAllFields0025
         * @tc.desc      四字段齐且非空的记录判为完整，两个时间与耗时字段原样保留
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteAllFields0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteAllFields0025';
            logBegin(tag);
            const full: Array<string> = ['2026-11-18 10:00:00', '2026-11-18 10:01:01', '00:01:01', '7'];
            const complete: boolean = historyFeature.isCompleteRecord(full);
            logPair(tag, 'complete', complete.toString(), 'true');
            expect(complete).assertTrue();
            logPair(tag, 'fieldCount', full.length.toString(), '4');
            expect(full.length).assertEqual(4);
            logPair(tag, 'lastField', full[3], '7');
            expect(full[3]).assertEqual('7');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0026
         * @tc.name      testHistoryCompleteShortRecord0026
         * @tc.desc      只有三个字段的记录判为不完整，补齐第四个字段后即转为完整
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteShortRecord0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteShortRecord0026';
            logBegin(tag);
            const short: Array<string> = ['2026-11-18 10:00:00', '10:01:01', '00:01:01'];
            logPair(tag, 'shortComplete', historyFeature.isCompleteRecord(short).toString(), 'false');
            expect(historyFeature.isCompleteRecord(short)).assertFalse();
            logPair(tag, 'shortCount', short.length.toString(), '3');
            expect(short.length).assertEqual(3);
            logPair(tag, 'paddedComplete', historyFeature.isCompleteRecord(short.concat(['7'])).toString(), 'true');
            expect(historyFeature.isCompleteRecord(short.concat(['7']))).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0027
         * @tc.name      testHistoryCompleteBlankLast0027
         * @tc.desc      第四字段为空串判为不完整，换成非空的 '0' 后判为完整（空判据不看真值性）
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteBlankLast0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteBlankLast0027';
            logBegin(tag);
            const blankLast: Array<string> = ['t0', 't1', '00:00:01', ''];
            logPair(tag, 'blankLastComplete', historyFeature.isCompleteRecord(blankLast).toString(), 'false');
            expect(historyFeature.isCompleteRecord(blankLast)).assertFalse();
            const zeroLast: Array<string> = ['t0', 't1', '00:00:01', '0'];
            logPair(tag, 'zeroLastComplete', historyFeature.isCompleteRecord(zeroLast).toString(), 'true');
            expect(historyFeature.isCompleteRecord(zeroLast)).assertTrue();
            logPair(tag, 'blankCount', blankLast.length.toString(), '4');
            expect(blankLast.length).assertEqual(4);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0028
         * @tc.name      testHistoryCompleteBlankAnyField0028
         * @tc.desc      前四个字段中任意一个为空串即判不完整，全部非空才判完整
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteBlankAnyField0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteBlankAnyField0028';
            logBegin(tag);
            logPair(tag, 'blankHead', historyFeature.isCompleteRecord(['', 'b', 'c', 'd']).toString(), 'false');
            expect(historyFeature.isCompleteRecord(['', 'b', 'c', 'd'])).assertFalse();
            logPair(tag, 'blankSecond', historyFeature.isCompleteRecord(['a', '', 'c', 'd']).toString(), 'false');
            expect(historyFeature.isCompleteRecord(['a', '', 'c', 'd'])).assertFalse();
            logPair(tag, 'allFilled', historyFeature.isCompleteRecord(['a', 'b', 'c', 'd']).toString(), 'true');
            expect(historyFeature.isCompleteRecord(['a', 'b', 'c', 'd'])).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0029
         * @tc.name      testHistoryCompleteExtraField0029
         * @tc.desc      第五个字段不参与完整性判定，但第四个字段仍必须非空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteExtraField0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteExtraField0029';
            logBegin(tag);
            const tailBlank: Array<string> = ['a', 'b', 'c', 'd', ''];
            logPair(tag, 'tailBlankComplete', historyFeature.isCompleteRecord(tailBlank).toString(), 'true');
            expect(historyFeature.isCompleteRecord(tailBlank)).assertTrue();
            logPair(tag, 'fourthBlankComplete',
                historyFeature.isCompleteRecord(['a', 'b', 'c', '', 'e']).toString(), 'false');
            expect(historyFeature.isCompleteRecord(['a', 'b', 'c', '', 'e'])).assertFalse();
            logPair(tag, 'tailCount', tailBlank.length.toString(), '5');
            expect(tailBlank.length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0030
         * @tc.name      testHistoryFilterIncompleteOnRender0030
         * @tc.desc      落盘两条（一完整一缺字段）时保留两条原始记录，按完整性过滤后只剩完整那条，与历史页渲染口径一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryFilterIncompleteOnRender0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryFilterIncompleteOnRender0030';
            logBegin(tag);
            await seed(['record_001', 'record_002'],
                [['2026-11-18 10:00:00', '2026-11-18 10:01:01', '00:01:01', '7'],
                ['2026-11-18 11:00:00', '2026-11-18 11:01:01', '00:01:01']]);
            const data: Array<Array<string>> = await loadData();
            const rendered: Array<Array<string>> = data.filter((item: Array<string>) => historyFeature.isCompleteRecord(item));
            logPair(tag, 'rawCount', data.length.toString(), '2');
            expect(data.length).assertEqual(2);
            logPair(tag, 'renderedCount', rendered.length.toString(), '1');
            expect(rendered.length).assertEqual(1);
            logPair(tag, 'renderedTotal', rendered[0][3], '7');
            expect(rendered[0][3]).assertEqual('7');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0031
         * @tc.name      testHistoryCompleteAllWhitespace0031
         * @tc.desc      四个字段全为空白字符时仍判完整，空串判据是精确空串而非空白
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteAllWhitespace0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteAllWhitespace0031';
            logBegin(tag);
            const allSpaces: Array<string> = [' ', ' ', ' ', ' '];
            logPair(tag, 'allSpaces', historyFeature.isCompleteRecord(allSpaces).toString(), 'true');
            expect(historyFeature.isCompleteRecord(allSpaces)).assertTrue();
            logPair(tag, 'fieldCount', allSpaces.length.toString(), '4');
            expect(allSpaces.length).assertEqual(4);
            logPair(tag, 'fieldWidth', allSpaces[0].length.toString(), '1');
            expect(allSpaces[0].length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0032
         * @tc.name      testHistoryCompleteAllZeroStrings0032
         * @tc.desc      四个零串字段判完整，同样内容仅三字段则长度门限判不完整
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryCompleteAllZeroStrings0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryCompleteAllZeroStrings0032';
            logBegin(tag);
            const fourZeros: Array<string> = ['0', '0', '0', '0'];
            const threeZeros: Array<string> = ['0', '0', '0'];
            logPair(tag, 'fourZeros', historyFeature.isCompleteRecord(fourZeros).toString(), 'true');
            expect(historyFeature.isCompleteRecord(fourZeros)).assertTrue();
            logPair(tag, 'threeZeros', historyFeature.isCompleteRecord(threeZeros).toString(), 'false');
            expect(historyFeature.isCompleteRecord(threeZeros)).assertFalse();
            logPair(tag, 'sameField', fourZeros[0], threeZeros[0]);
            expect(fourZeros[0]).assertEqual(threeZeros[0]);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0033
         * @tc.name      testHistoryKeepCompleteDecoupled0033
         * @tc.desc      保留判定与完整性判定解耦：含空串字段可保留但不完整，全空数组两判都否
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryKeepCompleteDecoupled0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryKeepCompleteDecoupled0033';
            logBegin(tag);
            const blankHead: Array<string> = ['', 'x', 'y', 'z'];
            logPair(tag, 'blankHeadKept', historyFeature.shouldKeep(blankHead).toString(), 'true');
            expect(historyFeature.shouldKeep(blankHead)).assertTrue();
            logPair(tag, 'blankHeadIncomplete', historyFeature.isCompleteRecord(blankHead).toString(), 'false');
            expect(historyFeature.isCompleteRecord(blankHead)).assertFalse();
            logPair(tag, 'emptyDropped', historyFeature.shouldKeep([]).toString(), 'false');
            expect(historyFeature.shouldKeep([])).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0034
         * @tc.name      testHistoryAssembleAlternating0034
         * @tc.desc      四条引用中第二条详情为空数组时只保留其余三条，顺序与内容均不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryAssembleAlternating0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryAssembleAlternating0034';
            logBegin(tag);
            const records: Array<string> = ['r1', 'r2', 'r3', 'r4'];
            const details: Array<Array<string>> = [['d1'], [], ['d3'], ['d4']];
            const kept: Array<Array<string>> = historyFeature.assemble(records, details);
            logPair(tag, 'count', kept.length.toString(), '3');
            expect(kept.length).assertEqual(3);
            logPair(tag, 'head', kept[0][0], 'd1');
            expect(kept[0][0]).assertEqual('d1');
            logPair(tag, 'tail', kept[2][0], 'd4');
            expect(kept[2][0]).assertEqual('d4');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0035
         * @tc.name      testHistoryAssembleAllDropped0035
         * @tc.desc      三条引用的详情全为空数组时结果为空列表，与空入参结果一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryAssembleAllDropped0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryAssembleAllDropped0035';
            logBegin(tag);
            const records: Array<string> = ['r1', 'r2', 'r3'];
            const details: Array<Array<string>> = [[], [], []];
            const kept: Array<Array<string>> = historyFeature.assemble(records, details);
            logPair(tag, 'count', kept.length.toString(), '0');
            expect(kept.length).assertEqual(0);
            logPair(tag, 'json', JSON.stringify(kept), '[]');
            expect(JSON.stringify(kept)).assertEqual('[]');
            logPair(tag, 'emptyInputs', historyFeature.assemble([], []).length.toString(), '0');
            expect(historyFeature.assemble([], []).length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0036
         * @tc.name      testHistoryAssembleDuplicateRef0036
         * @tc.desc      同一详情对象被两条引用复用时两处都保留，内容互为副本语义
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryAssembleDuplicateRef0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryAssembleDuplicateRef0036';
            logBegin(tag);
            const shared: Array<string> = ['same'];
            const records: Array<string> = ['r1', 'r2'];
            const details: Array<Array<string>> = [shared, shared];
            const kept: Array<Array<string>> = historyFeature.assemble(records, details);
            logPair(tag, 'count', kept.length.toString(), '2');
            expect(kept.length).assertEqual(2);
            logPair(tag, 'json', JSON.stringify(kept), '[["same"],["same"]]');
            expect(JSON.stringify(kept)).assertEqual('[["same"],["same"]]');
            logPair(tag, 'bothSame', (kept[0][0] === kept[1][0]).toString(), 'true');
            expect(kept[0][0]).assertEqual(kept[1][0]);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0037
         * @tc.name      testHistoryAssembleInputImmutable0037
         * @tc.desc      装配不修改入参：调用后 records 与 details 的序列化结果与调用前一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryAssembleInputImmutable0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryAssembleInputImmutable0037';
            logBegin(tag);
            const records: Array<string> = ['r1', 'r2'];
            const details: Array<Array<string>> = [['d1'], []];
            const recordsBefore: string = JSON.stringify(records);
            const detailsBefore: string = JSON.stringify(details);
            const kept: Array<Array<string>> = historyFeature.assemble(records, details);
            logPair(tag, 'recordsStable', (JSON.stringify(records) === recordsBefore).toString(), 'true');
            expect(JSON.stringify(records)).assertEqual(recordsBefore);
            logPair(tag, 'detailsStable', (JSON.stringify(details) === detailsBefore).toString(), 'true');
            expect(JSON.stringify(details)).assertEqual(detailsBefore);
            logPair(tag, 'keptCount', kept.length.toString(), '1');
            expect(kept.length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_HISTORY_0038
         * @tc.name      testHistoryStoreFiveFieldComplete0038
         * @tc.desc      落盘五字段记录（第五字段空串）被完整保留且判完整，前四字段口径生效
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testHistoryStoreFiveFieldComplete0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testHistoryStoreFiveFieldComplete0038';
            logBegin(tag);
            await seed(['record_005'],
                [['2026-11-18 08:00:00', '2026-11-18 08:01:01', '00:01:01', '3', '']]);
            const data: Array<Array<string>> = await loadData();
            logPair(tag, 'count', data.length.toString(), '1');
            expect(data.length).assertEqual(1);
            logPair(tag, 'fieldCount', data[0].length.toString(), '5');
            expect(data[0].length).assertEqual(5);
            logPair(tag, 'complete', historyFeature.isCompleteRecord(data[0]).toString(), 'true');
            expect(historyFeature.isCompleteRecord(data[0])).assertTrue();
            logEnd(tag);
        })
    })
}
