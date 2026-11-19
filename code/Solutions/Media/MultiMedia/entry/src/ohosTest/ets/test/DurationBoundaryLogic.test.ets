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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { LogicTestLog } from '../utils/LogicTestLog';
import DateTimeUtil from '../../../main/ets/model/DateTimeUtil';
import { getDurationString, tempNum } from '../../../main/ets/model/TimeUtils';

export default function DurationBoundaryLogic(): void {
  describe('DurationBoundaryLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1542
     * @tc.name MultiMedia_Duration_1542
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1542', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1542';
      LogicTestLog.begin(name, 'milliseconds=0');
      const input: number = 0;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:00'), String(result));
      expect(result).assertEqual('00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1543
     * @tc.name MultiMedia_Duration_1543
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1543', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1543';
      LogicTestLog.begin(name, 'milliseconds=0');
      const input: number = 0;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:00'), String(result));
      expect(result).assertEqual('00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1544
     * @tc.name MultiMedia_Duration_1544
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1544', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1544';
      LogicTestLog.begin(name, 'milliseconds=0.001');
      const input: number = 0.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:00'), String(result));
      expect(result).assertEqual('00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1545
     * @tc.name MultiMedia_Duration_1545
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1545', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1545';
      LogicTestLog.begin(name, 'milliseconds=999');
      const input: number = 999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:00'), String(result));
      expect(result).assertEqual('00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1546
     * @tc.name MultiMedia_Duration_1546
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1546', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1546';
      LogicTestLog.begin(name, 'milliseconds=999.999');
      const input: number = 999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:00'), String(result));
      expect(result).assertEqual('00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1547
     * @tc.name MultiMedia_Duration_1547
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1547', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1547';
      LogicTestLog.begin(name, 'milliseconds=1000');
      const input: number = 1000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:01'), String(result));
      expect(result).assertEqual('00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1548
     * @tc.name MultiMedia_Duration_1548
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1548', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1548';
      LogicTestLog.begin(name, 'milliseconds=1000.001');
      const input: number = 1000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:01'), String(result));
      expect(result).assertEqual('00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1549
     * @tc.name MultiMedia_Duration_1549
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1549', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1549';
      LogicTestLog.begin(name, 'milliseconds=1999');
      const input: number = 1999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:01'), String(result));
      expect(result).assertEqual('00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1550
     * @tc.name MultiMedia_Duration_1550
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1550', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1550';
      LogicTestLog.begin(name, 'milliseconds=8999.999');
      const input: number = 8999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:08'), String(result));
      expect(result).assertEqual('00:08');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('08'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('08');
      LogicTestLog.value(name, 'repeat formatting', String('00:08'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:08');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:08'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:08');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1551
     * @tc.name MultiMedia_Duration_1551
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1551', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1551';
      LogicTestLog.begin(name, 'milliseconds=9000');
      const input: number = 9000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:09'), String(result));
      expect(result).assertEqual('00:09');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('09'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('09');
      LogicTestLog.value(name, 'repeat formatting', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1552
     * @tc.name MultiMedia_Duration_1552
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1552', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1552';
      LogicTestLog.begin(name, 'milliseconds=9000.001');
      const input: number = 9000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:09'), String(result));
      expect(result).assertEqual('00:09');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('09'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('09');
      LogicTestLog.value(name, 'repeat formatting', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1553
     * @tc.name MultiMedia_Duration_1553
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1553', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1553';
      LogicTestLog.begin(name, 'milliseconds=9999');
      const input: number = 9999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:09'), String(result));
      expect(result).assertEqual('00:09');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('09'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('09');
      LogicTestLog.value(name, 'repeat formatting', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1554
     * @tc.name MultiMedia_Duration_1554
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1554', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1554';
      LogicTestLog.begin(name, 'milliseconds=9999.999');
      const input: number = 9999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:09'), String(result));
      expect(result).assertEqual('00:09');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('09'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('09');
      LogicTestLog.value(name, 'repeat formatting', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:09'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:09');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1555
     * @tc.name MultiMedia_Duration_1555
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1555', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1555';
      LogicTestLog.begin(name, 'milliseconds=10000');
      const input: number = 10000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:10'), String(result));
      expect(result).assertEqual('00:10');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('10'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('10');
      LogicTestLog.value(name, 'repeat formatting', String('00:10'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:10');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:10'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:10');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1556
     * @tc.name MultiMedia_Duration_1556
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1556', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1556';
      LogicTestLog.begin(name, 'milliseconds=10000.001');
      const input: number = 10000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:10'), String(result));
      expect(result).assertEqual('00:10');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('10'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('10');
      LogicTestLog.value(name, 'repeat formatting', String('00:10'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:10');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:10'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:10');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1557
     * @tc.name MultiMedia_Duration_1557
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1557', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1557';
      LogicTestLog.begin(name, 'milliseconds=10999');
      const input: number = 10999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:10'), String(result));
      expect(result).assertEqual('00:10');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('10'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('10');
      LogicTestLog.value(name, 'repeat formatting', String('00:10'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:10');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:10'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:10');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1558
     * @tc.name MultiMedia_Duration_1558
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1558', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1558';
      LogicTestLog.begin(name, 'milliseconds=58999.999');
      const input: number = 58999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:58'), String(result));
      expect(result).assertEqual('00:58');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('58'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('58');
      LogicTestLog.value(name, 'repeat formatting', String('00:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:58');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:58');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1559
     * @tc.name MultiMedia_Duration_1559
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1559', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1559';
      LogicTestLog.begin(name, 'milliseconds=59000');
      const input: number = 59000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:59'), String(result));
      expect(result).assertEqual('00:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1560
     * @tc.name MultiMedia_Duration_1560
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1560', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1560';
      LogicTestLog.begin(name, 'milliseconds=59000.001');
      const input: number = 59000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:59'), String(result));
      expect(result).assertEqual('00:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1561
     * @tc.name MultiMedia_Duration_1561
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1561', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1561';
      LogicTestLog.begin(name, 'milliseconds=59999');
      const input: number = 59999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:59'), String(result));
      expect(result).assertEqual('00:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1562
     * @tc.name MultiMedia_Duration_1562
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1562', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1562';
      LogicTestLog.begin(name, 'milliseconds=59999.999');
      const input: number = 59999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('00:59'), String(result));
      expect(result).assertEqual('00:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('00:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1563
     * @tc.name MultiMedia_Duration_1563
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1563', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1563';
      LogicTestLog.begin(name, 'milliseconds=60000');
      const input: number = 60000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00'), String(result));
      expect(result).assertEqual('01:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1564
     * @tc.name MultiMedia_Duration_1564
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1564', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1564';
      LogicTestLog.begin(name, 'milliseconds=60000.001');
      const input: number = 60000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00'), String(result));
      expect(result).assertEqual('01:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1565
     * @tc.name MultiMedia_Duration_1565
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1565', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1565';
      LogicTestLog.begin(name, 'milliseconds=60999');
      const input: number = 60999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00'), String(result));
      expect(result).assertEqual('01:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1566
     * @tc.name MultiMedia_Duration_1566
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1566', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1566';
      LogicTestLog.begin(name, 'milliseconds=60999.999');
      const input: number = 60999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00'), String(result));
      expect(result).assertEqual('01:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1567
     * @tc.name MultiMedia_Duration_1567
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1567', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1567';
      LogicTestLog.begin(name, 'milliseconds=61000');
      const input: number = 61000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:01'), String(result));
      expect(result).assertEqual('01:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('01:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1568
     * @tc.name MultiMedia_Duration_1568
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1568', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1568';
      LogicTestLog.begin(name, 'milliseconds=61000.001');
      const input: number = 61000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:01'), String(result));
      expect(result).assertEqual('01:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('01:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1569
     * @tc.name MultiMedia_Duration_1569
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1569', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1569';
      LogicTestLog.begin(name, 'milliseconds=61999');
      const input: number = 61999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:01'), String(result));
      expect(result).assertEqual('01:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('01:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1570
     * @tc.name MultiMedia_Duration_1570
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1570', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1570';
      LogicTestLog.begin(name, 'milliseconds=598999.999');
      const input: number = 598999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('09:58'), String(result));
      expect(result).assertEqual('09:58');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('58'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('58');
      LogicTestLog.value(name, 'repeat formatting', String('09:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:58');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('09:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:58');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1571
     * @tc.name MultiMedia_Duration_1571
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1571', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1571';
      LogicTestLog.begin(name, 'milliseconds=599000');
      const input: number = 599000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('09:59'), String(result));
      expect(result).assertEqual('09:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1572
     * @tc.name MultiMedia_Duration_1572
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1572', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1572';
      LogicTestLog.begin(name, 'milliseconds=599000.001');
      const input: number = 599000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('09:59'), String(result));
      expect(result).assertEqual('09:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1573
     * @tc.name MultiMedia_Duration_1573
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1573', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1573';
      LogicTestLog.begin(name, 'milliseconds=599999');
      const input: number = 599999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('09:59'), String(result));
      expect(result).assertEqual('09:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1574
     * @tc.name MultiMedia_Duration_1574
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1574', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1574';
      LogicTestLog.begin(name, 'milliseconds=599999.999');
      const input: number = 599999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('09:59'), String(result));
      expect(result).assertEqual('09:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('09:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('09:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1575
     * @tc.name MultiMedia_Duration_1575
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1575', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1575';
      LogicTestLog.begin(name, 'milliseconds=600000');
      const input: number = 600000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('10:00'), String(result));
      expect(result).assertEqual('10:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('10:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('10:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('10:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('10:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1576
     * @tc.name MultiMedia_Duration_1576
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1576', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1576';
      LogicTestLog.begin(name, 'milliseconds=600000.001');
      const input: number = 600000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('10:00'), String(result));
      expect(result).assertEqual('10:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('10:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('10:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('10:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('10:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1577
     * @tc.name MultiMedia_Duration_1577
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1577', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1577';
      LogicTestLog.begin(name, 'milliseconds=600999');
      const input: number = 600999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('10:00'), String(result));
      expect(result).assertEqual('10:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('10:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('10:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('10:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('10:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1578
     * @tc.name MultiMedia_Duration_1578
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1578', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1578';
      LogicTestLog.begin(name, 'milliseconds=3598999.999');
      const input: number = 3598999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('59:58'), String(result));
      expect(result).assertEqual('59:58');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('58'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('58');
      LogicTestLog.value(name, 'repeat formatting', String('59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:58');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:58');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1579
     * @tc.name MultiMedia_Duration_1579
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1579', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1579';
      LogicTestLog.begin(name, 'milliseconds=3599000');
      const input: number = 3599000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('59:59'), String(result));