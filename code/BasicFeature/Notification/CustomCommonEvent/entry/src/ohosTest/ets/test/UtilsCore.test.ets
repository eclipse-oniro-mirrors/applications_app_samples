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
import utils from '../../../main/ets/module/Utils';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'UtilsCore_';

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

export default function utilsCoreTest(): void {
    describe('UtilsCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_UTIL_0001
         * @tc.name      testUtilsConvertTime0001
         * @tc.desc      零值毫秒转换为零时长字符串，格式为定宽 8 字符的分段形式
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0001';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(0);
            logPair(tag, 'zero', actual, '00:00:00');
            expect(actual).assertEqual('00:00:00');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logPair(tag, 'separatorAt2', actual.charAt(2), ':');
            expect(actual.charAt(2)).assertEqual(':');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0002
         * @tc.name      testUtilsConvertTime0002
         * @tc.desc      不足一秒的毫秒被截断为 0，与零值输出完全一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0002';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(999);
            logPair(tag, 'subSecond', actual, '00:00:00');
            expect(actual).assertEqual('00:00:00');
            logPair(tag, 'equalsZeroInput', actual, utils.convertTimeToFormatString(0));
            expect(actual).assertEqual(utils.convertTimeToFormatString(0));
            logPair(tag, 'separatorAt5', actual.charAt(5), ':');
            expect(actual.charAt(5)).assertEqual(':');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0003
         * @tc.name      testUtilsConvertTime0003
         * @tc.desc      一千毫秒进位为 1 秒，秒段补零右侧为非零数字
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0003';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(1000);
            logPair(tag, 'oneSecond', actual, '00:00:01');
            expect(actual).assertEqual('00:00:01');
            logPair(tag, 'lastChar', actual.charAt(7), '1');
            expect(actual.charAt(7)).assertEqual('1');
            logPair(tag, 'secondSegment', actual.substring(6, 8), '01');
            expect(actual.substring(6, 8)).assertEqual('01');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0004
         * @tc.name      testUtilsConvertTime0004
         * @tc.desc      一千四百九十九毫秒按向下取整截断，不四舍五入进到 2 秒
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0004';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(1499);
            logPair(tag, 'truncate1499', actual, '00:00:01');
            expect(actual).assertEqual('00:00:01');
            logPair(tag, 'notRounded', actual, utils.convertTimeToFormatString(1000));
            expect(actual).assertEqual(utils.convertTimeToFormatString(1000));
            logPair(tag, 'notEqualTo2s', actual, utils.convertTimeToFormatString(2000));
            expect(actual === utils.convertTimeToFormatString(2000)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0005
         * @tc.name      testUtilsConvertTime0005
         * @tc.desc      两千毫秒进位为 2 秒，秒段数值正确
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0005';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(2000);
            logPair(tag, 'twoSeconds', actual, '00:00:02');
            expect(actual).assertEqual('00:00:02');
            logPair(tag, 'lastChar', actual.charAt(7), '2');
            expect(actual.charAt(7)).assertEqual('2');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0006
         * @tc.name      testUtilsConvertTime0006
         * @tc.desc      不足一分钟的最大毫秒值仍是两位秒段 59
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0006';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(59999);
            logPair(tag, 'fiftyNineSeconds', actual, '00:00:59');
            expect(actual).assertEqual('00:00:59');
            logPair(tag, 'secondTens', actual.charAt(6), '5');
            expect(actual.charAt(6)).assertEqual('5');
            logPair(tag, 'secondUnits', actual.charAt(7), '9');
            expect(actual.charAt(7)).assertEqual('9');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0007
         * @tc.name      testUtilsConvertTime0007
         * @tc.desc      整分钟边界：秒段归零，分钟段为 01
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0007';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(60000);
            logPair(tag, 'oneMinute', actual, '00:01:00');
            expect(actual).assertEqual('00:01:00');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '01');
            expect(actual.substring(3, 5)).assertEqual('01');
            logPair(tag, 'secondSegment', actual.substring(6, 8), '00');
            expect(actual.substring(6, 8)).assertEqual('00');
            logPair(tag, 'minuteSeparator', actual.indexOf(':').toString(), '2');
            expect(actual.indexOf(':')).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0008
         * @tc.name      testUtilsConvertTime0008
         * @tc.desc      一分零一秒：分钟段与秒段同时为非零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0008';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(61000);
            logPair(tag, 'oneMinuteOneSecond', actual, '00:01:01');
            expect(actual).assertEqual('00:01:01');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '01');
            expect(actual.substring(3, 5)).assertEqual('01');
            logPair(tag, 'secondSegment', actual.substring(6, 8), '01');
            expect(actual.substring(6, 8)).assertEqual('01');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0009
         * @tc.name      testUtilsConvertTime0009
         * @tc.desc      五十九分五十九秒：分钟段与秒段均为最大两位值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0009';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3599000);
            logPair(tag, 'fiftyNineFiftyNine', actual, '00:59:59');
            expect(actual).assertEqual('00:59:59');
            logPair(tag, 'hourTens', actual.charAt(0), '0');
            expect(actual.charAt(0)).assertEqual('0');
            logPair(tag, 'hourUnits', actual.charAt(1), '0');
            expect(actual.charAt(1)).assertEqual('0');
            logPair(tag, 'minuteTens', actual.charAt(3), '5');
            expect(actual.charAt(3)).assertEqual('5');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0010
         * @tc.name      testUtilsConvertTime0010
         * @tc.desc      临界前一毫秒不改写输出，与五十九分五十九秒等价
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0010';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3599999);
            logPair(tag, 'oneMilliBeforeHour', actual, '00:59:59');
            expect(actual).assertEqual('00:59:59');
            logPair(tag, 'sameAsLowerBound', actual, utils.convertTimeToFormatString(3599000));
            expect(actual).assertEqual(utils.convertTimeToFormatString(3599000));
            logPair(tag, 'minuteValueStart', actual.indexOf('59').toString(), '3');
            expect(actual.indexOf('59')).assertEqual(3);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0011
         * @tc.name      testUtilsConvertTime0011
         * @tc.desc      整小时边界：分钟段与秒段归零，小时段为 01
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0011';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3600000);
            logPair(tag, 'oneHour', actual, '01:00:00');
            expect(actual).assertEqual('01:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '01');
            expect(actual.substring(0, 2)).assertEqual('01');
            logPair(tag, 'minuteUnits', actual.charAt(3), '0');
            expect(actual.charAt(3)).assertEqual('0');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0012
         * @tc.name      testUtilsConvertTime0012
         * @tc.desc      一小时零一毫秒仍显示整小时，毫秒级变化不体现在输出
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0012';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3600001);
            logPair(tag, 'oneMilliAfterHour', actual, '01:00:00');
            expect(actual).assertEqual('01:00:00');
            logPair(tag, 'sameAsHour', actual, utils.convertTimeToFormatString(3600000));
            expect(actual).assertEqual(utils.convertTimeToFormatString(3600000));
            logPair(tag, 'sameAsUpperBound', actual, utils.convertTimeToFormatString(3600001));
            expect(actual === utils.convertTimeToFormatString(3600001)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0013
         * @tc.name      testUtilsConvertTime0013
         * @tc.desc      一小时一分一秒：三个分段同为 01
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0013';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3661000);
            logPair(tag, 'oneOneOne', actual, '01:01:01');
            expect(actual).assertEqual('01:01:01');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '01');
            expect(actual.substring(0, 2)).assertEqual('01');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0014
         * @tc.name      testUtilsConvertTime0014
         * @tc.desc      九小时五十九分五十九秒：小时段个位数补零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0014';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(35999000);
            logPair(tag, 'nineHours', actual, '09:59:59');
            expect(actual).assertEqual('09:59:59');
            logPair(tag, 'hourUnits', actual.charAt(1), '9');
            expect(actual.charAt(1)).assertEqual('9');
            logPair(tag, 'lessThanTenHours', (actual < utils.convertTimeToFormatString(36000000)).toString(), 'true');
            expect(actual < utils.convertTimeToFormatString(36000000)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0015
         * @tc.name      testUtilsConvertTime0015
         * @tc.desc      十小时边界：小时段进入两位数且不再补零，长度仍为 8
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0015';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(36000000);
            logPair(tag, 'tenHours', actual, '10:00:00');
            expect(actual).assertEqual('10:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '10');
            expect(actual.substring(0, 2)).assertEqual('10');
            logPair(tag, 'hourSeparator', actual.indexOf(':').toString(), '2');
            expect(actual.indexOf(':')).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0016
         * @tc.name      testUtilsConvertTime0016
         * @tc.desc      一天内最大值二十三小时五十九分五十九秒，未进入跨天进位
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0016';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(86399999);
            logPair(tag, 'oneMilliBeforeDay', actual, '23:59:59');
            expect(actual).assertEqual('23:59:59');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '23');
            expect(actual.substring(0, 2)).assertEqual('23');
            logPair(tag, 'lessThanOneDay', (actual < utils.convertTimeToFormatString(86400000)).toString(), 'true');
            expect(actual < utils.convertTimeToFormatString(86400000)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0017
         * @tc.name      testUtilsConvertTime0017
         * @tc.desc      满一天不做天进位，小时段直接显示 24
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0017';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(86400000);
            logPair(tag, 'oneDay', actual, '24:00:00');
            expect(actual).assertEqual('24:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '24');
            expect(actual.substring(0, 2)).assertEqual('24');
            logPair(tag, 'differsFromPrevDay',
                (actual === utils.convertTimeToFormatString(86399999)).toString(), 'false');
            expect(actual === utils.convertTimeToFormatString(86399999)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0018
         * @tc.name      testUtilsConvertTime0018
         * @tc.desc      九十九小时边界：小时段为两位数最大值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0018';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(359999000);
            logPair(tag, 'ninetyNineHours', actual, '99:59:59');
            expect(actual).assertEqual('99:59:59');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '99');
            expect(actual.substring(0, 2)).assertEqual('99');
            logPair(tag, 'hourUnits', actual.charAt(1), '9');
            expect(actual.charAt(1)).assertEqual('9');
            logPair(tag, 'minuteTens', actual.charAt(3), '5');
            expect(actual.charAt(3)).assertEqual('5');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0019
         * @tc.name      testUtilsConvertTime0019
         * @tc.desc      一百小时边界：小时段升至三位，输出总长突破 8 字符
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0019';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(360000000);
            logPair(tag, 'hundredHours', actual, '100:00:00');
            expect(actual).assertEqual('100:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 3), '100');
            expect(actual.substring(0, 3)).assertEqual('100');
            logPair(tag, 'lengthAboveEight', actual.length.toString(), '>8');
            expect(actual.length).assertLarger(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0020
         * @tc.name      testUtilsConvertTime0020
         * @tc.desc      负一毫秒进入负值分支，三段各自补零后拼接出负号位于段内
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0020';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(-1);
            logPair(tag, 'negativeOne', actual, '0-1:0-1:0-1');
            expect(actual).assertEqual('0-1:0-1:0-1');
            logPair(tag, 'length', actual.length.toString(), '11');
            expect(actual.length).assertEqual(11);
            logPair(tag, 'separatorAt3', actual.charAt(3), ':');
            expect(actual.charAt(3)).assertEqual(':');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0021
         * @tc.name      testUtilsConvertTime0021
         * @tc.desc      负一千毫秒与负一毫秒同段，负值截断后仍为负一秒
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0021';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(-1000);
            logPair(tag, 'negativeThousand', actual, '0-1:0-1:0-1');
            expect(actual).assertEqual('0-1:0-1:0-1');
            logPair(tag, 'equalsNegativeOneMs', actual, utils.convertTimeToFormatString(-1));
            expect(actual).assertEqual(utils.convertTimeToFormatString(-1));
            logPair(tag, 'separatorAt7', actual.charAt(7), ':');
            expect(actual.charAt(7)).assertEqual(':');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0022
         * @tc.name      testUtilsConvertTime0022
         * @tc.desc      负整小时：小时段为负一分钟段归零，得到 -1:00:00 的补零形态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0022';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(-3600000);
            logPair(tag, 'negativeOneHour', actual, '0-1:00:00');
            expect(actual).assertEqual('0-1:00:00');
            logPair(tag, 'minuteSegment', actual.substring(4, 6), '00');
            expect(actual.substring(4, 6)).assertEqual('00');
            logPair(tag, 'length', actual.length.toString(), '9');
            expect(actual.length).assertEqual(9);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0023
         * @tc.name      testUtilsConvertTime0023
         * @tc.desc      亚毫秒输入被向下取整为零，与零值输出一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0023';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(0.5);
            logPair(tag, 'halfMilli', actual, '00:00:00');
            expect(actual).assertEqual('00:00:00');
            logPair(tag, 'sameAsOneMilli', actual, utils.convertTimeToFormatString(1));
            expect(actual === utils.convertTimeToFormatString(1)).assertTrue();
            logPair(tag, 'firstSeparator', actual.indexOf(':').toString(), '2');
            expect(actual.indexOf(':')).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0024
         * @tc.name      testUtilsConvertTime0024
         * @tc.desc      极大值输入：小时段达六位，分秒段仍按两位补零输出
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0024';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(1000000000000);
            logPair(tag, 'hugeInput', actual, '277777:46:40');
            expect(actual).assertEqual('277777:46:40');
            logPair(tag, 'hourSegment', actual.substring(0, 6), '277777');
            expect(actual.substring(0, 6)).assertEqual('277777');
            logPair(tag, 'hourSeparator', actual.charAt(6), ':');
            expect(actual.charAt(6)).assertEqual(':');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0025
         * @tc.name      testUtilsConvertTime0025
         * @tc.desc      进位组合：一小时整加五十九秒，分钟段为 00 而秒段为 59
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0025';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3659000);
            logPair(tag, 'hourPlusFiftyNine', actual, '01:00:59');
            expect(actual).assertEqual('01:00:59');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '00');
            expect(actual.substring(3, 5)).assertEqual('00');
            logPair(tag, 'sameAtUpperBound', actual, utils.convertTimeToFormatString(3659999));
            expect(actual === utils.convertTimeToFormatString(3659999)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0026
         * @tc.name      testUtilsConvertTime0026
         * @tc.desc      性质校验：一天以内所有抽样输出均为定宽 8 字符且两位分隔符位置固定
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0026';
            logBegin(tag);
            const samples: Array<number> = [0, 1000, 60000, 3600000, 86399999, 86400000];
            let widthOk: number = 0;
            let separatorOk: number = 0;
            for (let index = 0; index < samples.length; index++) {
                const result: string = utils.convertTimeToFormatString(samples[index]);
                if (result.length === 8) {
                    widthOk++;
                }
                if (result.charAt(2) === ':' && result.charAt(5) === ':') {
                    separatorOk++;
                }
            }
            logPair(tag, 'widthOk', widthOk.toString(), samples.length.toString());
            expect(widthOk).assertEqual(samples.length);
            logPair(tag, 'separatorOk', separatorOk.toString(), samples.length.toString());
            expect(separatorOk).assertEqual(samples.length);
            logPair(tag, 'sampleCount', samples.length.toString(), '6');
            expect(samples.length).assertEqual(6);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0027
         * @tc.name      testUtilsConvertTime0027
         * @tc.desc      性质校验：同宽输出随输入单调递增，字典序与时序一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0027';
            logBegin(tag);
            const samples: Array<number> = [0, 1000, 60000, 3600000, 86400000];
            let monotonic: number = 0;
            for (let index = 1; index < samples.length; index++) {
                const previous: string = utils.convertTimeToFormatString(samples[index - 1]);
                const current: string = utils.convertTimeToFormatString(samples[index]);
                if (previous < current) {
                    monotonic++;
                }
            }
            logPair(tag, 'monotonicPairs', monotonic.toString(), '4');
            expect(monotonic).assertEqual(4);
            logPair(tag, 'firstPair', utils.convertTimeToFormatString(0), utils.convertTimeToFormatString(1000));
            expect(utils.convertTimeToFormatString(0) < utils.convertTimeToFormatString(1000)).assertTrue();
            logPair(tag, 'lastPair', utils.convertTimeToFormatString(3600000), utils.convertTimeToFormatString(86400000));
            expect(utils.convertTimeToFormatString(3600000) < utils.convertTimeToFormatString(86400000)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0028
         * @tc.name      testUtilsConvertTime0028
         * @tc.desc      状态无关：同一输入连续多次调用结果稳定不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0028';
            logBegin(tag);
            const first: string = utils.convertTimeToFormatString(61000);
            const second: string = utils.convertTimeToFormatString(61000);
            logPair(tag, 'firstCall', first, '00:01:01');
            expect(first).assertEqual('00:01:01');
            logPair(tag, 'secondCall', second, first);
            expect(second).assertEqual(first);
            logPair(tag, 'length', second.length.toString(), '8');
            expect(second.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0029
         * @tc.name      testUtilsConvertTime0029
         * @tc.desc      进位链核对：五十九秒与一分钟的相邻输入产生不同输出，且后者分秒段发生进位
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0029';
            logBegin(tag);
            const before: string = utils.convertTimeToFormatString(59999);
            const after: string = utils.convertTimeToFormatString(60000);
            logPair(tag, 'before', before, '00:00:59');
            expect(before).assertEqual('00:00:59');
            logPair(tag, 'after', after, '00:01:00');
            expect(after).assertEqual('00:01:00');
            logPair(tag, 'minuteSegmentChanged', after.substring(3, 5), '01');
            expect(after.substring(3, 5)).assertEqual('01');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0030
         * @tc.name      testUtilsConvertTime0030
         * @tc.desc      跨小时与跨天叠加：一天多一小时仍按累计小时输出 24:59:59
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTime0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTime0030';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(89999999);
            logPair(tag, 'dayPlusOneHour', actual, '24:59:59');
            expect(actual).assertEqual('24:59:59');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '24');
            expect(actual.substring(0, 2)).assertEqual('24');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0031
         * @tc.name      testUtilsConvertTimeDayBoundary0031
         * @tc.desc      恰一日（86400000ms）输出 24:00:00，小时段突破两位补零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeDayBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeDayBoundary0031';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(86400000);
            logPair(tag, 'oneDay', actual, '24:00:00');
            expect(actual).assertEqual('24:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '24');
            expect(actual.substring(0, 2)).assertEqual('24');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0032
         * @tc.name      testUtilsConvertTimeDayMinusOne0032
         * @tc.desc      一日减一秒输出 23:59:59，日界回退落在最大时分秒
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeDayMinusOne0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeDayMinusOne0032';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(86399000);
            logPair(tag, 'dayMinusOne', actual, '23:59:59');
            expect(actual).assertEqual('23:59:59');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '59');
            expect(actual.substring(3, 5)).assertEqual('59');
            logPair(tag, 'secondSegment', actual.substring(6, 8), '59');
            expect(actual.substring(6, 8)).assertEqual('59');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0033
         * @tc.name      testUtilsConvertTimeDayPlusOne0033
         * @tc.desc      一日加一秒输出 24:00:01，跨日后分秒段重新归零起步
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeDayPlusOne0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeDayPlusOne0033';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(86401000);
            logPair(tag, 'dayPlusOne', actual, '24:00:01');
            expect(actual).assertEqual('24:00:01');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '24');
            expect(actual.substring(0, 2)).assertEqual('24');
            logPair(tag, 'secondSegment', actual.substring(6, 8), '01');
            expect(actual.substring(6, 8)).assertEqual('01');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0034
         * @tc.name      testUtilsConvertTimeTwoDaysMinusOne0034
         * @tc.desc      两日减一秒输出 47:59:59，小时段连续累计不回绕
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeTwoDaysMinusOne0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeTwoDaysMinusOne0034';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(172799000);
            logPair(tag, 'twoDaysMinusOne', actual, '47:59:59');
            expect(actual).assertEqual('47:59:59');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '47');
            expect(actual.substring(0, 2)).assertEqual('47');
            logPair(tag, 'length', actual.length.toString(), '8');
            expect(actual.length).assertEqual(8);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0035
         * @tc.name      testUtilsConvertTimeTwoDays0035
         * @tc.desc      恰两日输出 48:00:00，与两日减一秒仅差末段
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeTwoDays0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeTwoDays0035';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(172800000);
            logPair(tag, 'twoDays', actual, '48:00:00');
            expect(actual).assertEqual('48:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '48');
            expect(actual.substring(0, 2)).assertEqual('48');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '00');
            expect(actual.substring(3, 5)).assertEqual('00');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0036
         * @tc.name      testUtilsConvertTimeNegativeOneSecond0036
         * @tc.desc      负一秒输出 0-1:0-1:0-1，负数段不受两位补零约束
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeNegativeOneSecond0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeNegativeOneSecond0036';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(-1000);
            logPair(tag, 'negativeOneSecond', actual, '0-1:0-1:0-1');
            expect(actual).assertEqual('0-1:0-1:0-1');
            logPair(tag, 'length', actual.length.toString(), '11');
            expect(actual.length).assertEqual(11);
            logPair(tag, 'containsMinus', (actual.indexOf('-') > 0).toString(), 'true');
            expect(actual.indexOf('-') > 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0037
         * @tc.name      testUtilsConvertTimeNegativeDay0037
         * @tc.desc      负一日输出 0-24:00:00，小时段为负而分秒归零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeNegativeDay0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeNegativeDay0037';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(-86400000);
            logPair(tag, 'negativeDay', actual, '0-24:00:00');
            expect(actual).assertEqual('0-24:00:00');
            logPair(tag, 'minuteSegment', actual.substring(actual.length - 5, actual.length - 3), '00');
            expect(actual.substring(actual.length - 5, actual.length - 3)).assertEqual('00');
            logPair(tag, 'secondSegment', actual.substring(actual.length - 2), '00');
            expect(actual.substring(actual.length - 2)).assertEqual('00');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0038
         * @tc.name      testUtilsConvertTimeHourMinusOne0038
         * @tc.desc      一小时减一毫秒输出 00:59:59，进位边界邻域稳定
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeHourMinusOne0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeHourMinusOne0038';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3599999);
            logPair(tag, 'hourMinusOne', actual, '00:59:59');
            expect(actual).assertEqual('00:59:59');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '00');
            expect(actual.substring(0, 2)).assertEqual('00');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '59');
            expect(actual.substring(3, 5)).assertEqual('59');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0039
         * @tc.name      testUtilsConvertTimeHourPlusOne0039
         * @tc.desc      一小时加一毫秒输出 01:00:00，跨小时后分秒归零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeHourPlusOne0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeHourPlusOne0039';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(3600001);
            logPair(tag, 'hourPlusOne', actual, '01:00:00');
            expect(actual).assertEqual('01:00:00');
            logPair(tag, 'hourSegment', actual.substring(0, 2), '01');
            expect(actual.substring(0, 2)).assertEqual('01');
            logPair(tag, 'minuteSegment', actual.substring(3, 5), '00');
            expect(actual.substring(3, 5)).assertEqual('00');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_UTIL_0040
         * @tc.name      testUtilsConvertTimeSafeInteger0040
         * @tc.desc      安全整数上限输出 2501999792:59:00，小时段不再补零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testUtilsConvertTimeSafeInteger0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testUtilsConvertTimeSafeInteger0040';
            logBegin(tag);
            const actual: string = utils.convertTimeToFormatString(9007199254740991);
            logPair(tag, 'safeInteger', actual, '2501999792:59:00');
            expect(actual).assertEqual('2501999792:59:00');
            logPair(tag, 'length', actual.length.toString(), '16');
            expect(actual.length).assertEqual(16);
            logPair(tag, 'hourDigits', actual.substring(0, 10), '2501999792');
            expect(actual.substring(0, 10)).assertEqual('2501999792');
            logEnd(tag);
        })
    })
}
