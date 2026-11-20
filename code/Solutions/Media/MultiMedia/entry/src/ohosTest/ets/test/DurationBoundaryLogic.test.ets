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
      expect(result).assertEqual('59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1580
     * @tc.name MultiMedia_Duration_1580
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1580', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1580';
      LogicTestLog.begin(name, 'milliseconds=3599000.001');
      const input: number = 3599000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('59:59'), String(result));
      expect(result).assertEqual('59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1581
     * @tc.name MultiMedia_Duration_1581
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1581', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1581';
      LogicTestLog.begin(name, 'milliseconds=3599999');
      const input: number = 3599999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('59:59'), String(result));
      expect(result).assertEqual('59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1582
     * @tc.name MultiMedia_Duration_1582
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1582', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1582';
      LogicTestLog.begin(name, 'milliseconds=3599999.999');
      const input: number = 3599999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('59:59'), String(result));
      expect(result).assertEqual('59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 2, result.split(':').length);
      expect(result.split(':').length).assertEqual(2);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1583
     * @tc.name MultiMedia_Duration_1583
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1583', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1583';
      LogicTestLog.begin(name, 'milliseconds=3600000');
      const input: number = 3600000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:00'), String(result));
      expect(result).assertEqual('01:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1584
     * @tc.name MultiMedia_Duration_1584
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1584', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1584';
      LogicTestLog.begin(name, 'milliseconds=3600000.001');
      const input: number = 3600000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:00'), String(result));
      expect(result).assertEqual('01:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1585
     * @tc.name MultiMedia_Duration_1585
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1585', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1585';
      LogicTestLog.begin(name, 'milliseconds=3600999');
      const input: number = 3600999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:00'), String(result));
      expect(result).assertEqual('01:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1586
     * @tc.name MultiMedia_Duration_1586
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1586', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1586';
      LogicTestLog.begin(name, 'milliseconds=3600999.999');
      const input: number = 3600999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:00'), String(result));
      expect(result).assertEqual('01:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1587
     * @tc.name MultiMedia_Duration_1587
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1587', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1587';
      LogicTestLog.begin(name, 'milliseconds=3601000');
      const input: number = 3601000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:01'), String(result));
      expect(result).assertEqual('01:00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1588
     * @tc.name MultiMedia_Duration_1588
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1588', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1588';
      LogicTestLog.begin(name, 'milliseconds=3601000.001');
      const input: number = 3601000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:01'), String(result));
      expect(result).assertEqual('01:00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1589
     * @tc.name MultiMedia_Duration_1589
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1589', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1589';
      LogicTestLog.begin(name, 'milliseconds=3601999');
      const input: number = 3601999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('01:00:01'), String(result));
      expect(result).assertEqual('01:00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('01:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('01:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('01:00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1590
     * @tc.name MultiMedia_Duration_1590
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1590', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1590';
      LogicTestLog.begin(name, 'milliseconds=86398999.999');
      const input: number = 86398999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('23:59:58'), String(result));
      expect(result).assertEqual('23:59:58');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('58'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('58');
      LogicTestLog.value(name, 'repeat formatting', String('23:59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:58');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('23:59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:58');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1591
     * @tc.name MultiMedia_Duration_1591
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1591', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1591';
      LogicTestLog.begin(name, 'milliseconds=86399000');
      const input: number = 86399000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('23:59:59'), String(result));
      expect(result).assertEqual('23:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1592
     * @tc.name MultiMedia_Duration_1592
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1592', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1592';
      LogicTestLog.begin(name, 'milliseconds=86399000.001');
      const input: number = 86399000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('23:59:59'), String(result));
      expect(result).assertEqual('23:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1593
     * @tc.name MultiMedia_Duration_1593
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1593', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1593';
      LogicTestLog.begin(name, 'milliseconds=86399999');
      const input: number = 86399999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('23:59:59'), String(result));
      expect(result).assertEqual('23:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1594
     * @tc.name MultiMedia_Duration_1594
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1594', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1594';
      LogicTestLog.begin(name, 'milliseconds=86399999.999');
      const input: number = 86399999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('23:59:59'), String(result));
      expect(result).assertEqual('23:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('23:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('23:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1595
     * @tc.name MultiMedia_Duration_1595
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1595', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1595';
      LogicTestLog.begin(name, 'milliseconds=86400000');
      const input: number = 86400000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:00'), String(result));
      expect(result).assertEqual('24:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1596
     * @tc.name MultiMedia_Duration_1596
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1596', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1596';
      LogicTestLog.begin(name, 'milliseconds=86400000.001');
      const input: number = 86400000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:00'), String(result));
      expect(result).assertEqual('24:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1597
     * @tc.name MultiMedia_Duration_1597
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1597', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1597';
      LogicTestLog.begin(name, 'milliseconds=86400999');
      const input: number = 86400999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:00'), String(result));
      expect(result).assertEqual('24:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1598
     * @tc.name MultiMedia_Duration_1598
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1598', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1598';
      LogicTestLog.begin(name, 'milliseconds=86400999.999');
      const input: number = 86400999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:00'), String(result));
      expect(result).assertEqual('24:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1599
     * @tc.name MultiMedia_Duration_1599
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1599', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1599';
      LogicTestLog.begin(name, 'milliseconds=86401000');
      const input: number = 86401000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:01'), String(result));
      expect(result).assertEqual('24:00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1600
     * @tc.name MultiMedia_Duration_1600
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1600', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1600';
      LogicTestLog.begin(name, 'milliseconds=86401000.001');
      const input: number = 86401000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:01'), String(result));
      expect(result).assertEqual('24:00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1601
     * @tc.name MultiMedia_Duration_1601
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1601', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1601';
      LogicTestLog.begin(name, 'milliseconds=86401999');
      const input: number = 86401999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('24:00:01'), String(result));
      expect(result).assertEqual('24:00:01');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('01'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('01');
      LogicTestLog.value(name, 'repeat formatting', String('24:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:01');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('24:00:01'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('24:00:01');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1602
     * @tc.name MultiMedia_Duration_1602
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1602', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1602';
      LogicTestLog.begin(name, 'milliseconds=359998999.999');
      const input: number = 359998999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('99:59:58'), String(result));
      expect(result).assertEqual('99:59:58');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('58'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('58');
      LogicTestLog.value(name, 'repeat formatting', String('99:59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:58');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('99:59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:58');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1603
     * @tc.name MultiMedia_Duration_1603
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1603', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1603';
      LogicTestLog.begin(name, 'milliseconds=359999000');
      const input: number = 359999000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('99:59:59'), String(result));
      expect(result).assertEqual('99:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1604
     * @tc.name MultiMedia_Duration_1604
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1604', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1604';
      LogicTestLog.begin(name, 'milliseconds=359999000.001');
      const input: number = 359999000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('99:59:59'), String(result));
      expect(result).assertEqual('99:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1605
     * @tc.name MultiMedia_Duration_1605
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1605', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1605';
      LogicTestLog.begin(name, 'milliseconds=359999999');
      const input: number = 359999999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('99:59:59'), String(result));
      expect(result).assertEqual('99:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1606
     * @tc.name MultiMedia_Duration_1606
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1606', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1606';
      LogicTestLog.begin(name, 'milliseconds=359999999.999');
      const input: number = 359999999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('99:59:59'), String(result));
      expect(result).assertEqual('99:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('99:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('99:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1607
     * @tc.name MultiMedia_Duration_1607
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1607', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1607';
      LogicTestLog.begin(name, 'milliseconds=360000000');
      const input: number = 360000000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('100:00:00'), String(result));
      expect(result).assertEqual('100:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('100:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('100:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('100:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('100:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1608
     * @tc.name MultiMedia_Duration_1608
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1608', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1608';
      LogicTestLog.begin(name, 'milliseconds=360000000.001');
      const input: number = 360000000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('100:00:00'), String(result));
      expect(result).assertEqual('100:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('100:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('100:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('100:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('100:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1609
     * @tc.name MultiMedia_Duration_1609
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1609', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1609';
      LogicTestLog.begin(name, 'milliseconds=360000999');
      const input: number = 360000999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('100:00:00'), String(result));
      expect(result).assertEqual('100:00:00');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('00'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('00');
      LogicTestLog.value(name, 'repeat formatting', String('100:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('100:00:00');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('100:00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('100:00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1610
     * @tc.name MultiMedia_Duration_1610
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1610', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1610';
      LogicTestLog.begin(name, 'milliseconds=3599998999.999');
      const input: number = 3599998999.999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('999:59:58'), String(result));
      expect(result).assertEqual('999:59:58');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('58'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('58');
      LogicTestLog.value(name, 'repeat formatting', String('999:59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:58');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('999:59:58'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:58');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1611
     * @tc.name MultiMedia_Duration_1611
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1611', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1611';
      LogicTestLog.begin(name, 'milliseconds=3599999000');
      const input: number = 3599999000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('999:59:59'), String(result));
      expect(result).assertEqual('999:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('999:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('999:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1612
     * @tc.name MultiMedia_Duration_1612
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1612', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1612';
      LogicTestLog.begin(name, 'milliseconds=3599999000.001');
      const input: number = 3599999000.001;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('999:59:59'), String(result));
      expect(result).assertEqual('999:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('999:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('999:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1613
     * @tc.name MultiMedia_Duration_1613
     * @tc.desc Milliseconds truncate at second, minute, hour and long recording boundaries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Duration_1613', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Duration_1613';
      LogicTestLog.begin(name, 'milliseconds=3599999999');
      const input: number = 3599999999;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'duration output', String('999:59:59'), String(result));
      expect(result).assertEqual('999:59:59');
      LogicTestLog.value(name, 'duration result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.number(name, 'display component count', 3, result.split(':').length);
      expect(result.split(':').length).assertEqual(3);
      LogicTestLog.value(name, 'last second digits', String('59'), String(result.substring(result.length - 2)));
      expect(result.substring(result.length - 2)).assertEqual('59');
      LogicTestLog.value(name, 'repeat formatting', String('999:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:59');
      LogicTestLog.value(name, 'zero interleave', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'interleave independence', String('999:59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('999:59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1614
     * @tc.name MultiMedia_DurationLegacy_1614
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1614', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1614';
      LogicTestLog.begin(name, 'milliseconds=-1');
      const input: number = -1;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('59:59'), String(result));
      expect(result).assertEqual('59:59');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1615
     * @tc.name MultiMedia_DurationLegacy_1615
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1615', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1615';
      LogicTestLog.begin(name, 'milliseconds=-1000');
      const input: number = -1000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('59:59'), String(result));
      expect(result).assertEqual('59:59');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('59:59'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:59');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1616
     * @tc.name MultiMedia_DurationLegacy_1616
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1616', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1616';
      LogicTestLog.begin(name, 'milliseconds=-60000');
      const input: number = -60000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('59:00'), String(result));
      expect(result).assertEqual('59:00');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('59:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('59:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1617
     * @tc.name MultiMedia_DurationLegacy_1617
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1617', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1617';
      LogicTestLog.begin(name, 'milliseconds=-3600000');
      const input: number = -3600000;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('00:00'), String(result));
      expect(result).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('00:00'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('00:00');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1618
     * @tc.name MultiMedia_DurationLegacy_1618
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1618', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1618';
      LogicTestLog.begin(name, 'milliseconds=Infinity');
      const input: number = Number.POSITIVE_INFINITY;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('Infinity:NaN:NaN'), String(result));
      expect(result).assertEqual('Infinity:NaN:NaN');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('Infinity:NaN:NaN'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('Infinity:NaN:NaN');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1619
     * @tc.name MultiMedia_DurationLegacy_1619
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1619', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1619';
      LogicTestLog.begin(name, 'milliseconds=-Infinity');
      const input: number = Number.NEGATIVE_INFINITY;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('NaN:NaN'), String(result));
      expect(result).assertEqual('NaN:NaN');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('NaN:NaN'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('NaN:NaN');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1620
     * @tc.name MultiMedia_DurationLegacy_1620
     * @tc.desc Characterize legacy non-finite and negative durations without imposing a new contract
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_DurationLegacy_1620', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_DurationLegacy_1620';
      LogicTestLog.begin(name, 'milliseconds=NaN');
      const input: number = Number.NaN;
      const result: string = getDurationString(input);
      LogicTestLog.value(name, 'legacy duration output', String('NaN:NaN'), String(result));
      expect(result).assertEqual('NaN:NaN');
      LogicTestLog.value(name, 'legacy result type', String('string'), String(typeof result));
      expect(typeof result).assertEqual('string');
      LogicTestLog.value(name, 'other call unaffected', String('00:00'), String(getDurationString(0)));
      expect(getDurationString(0)).assertEqual('00:00');
      LogicTestLog.value(name, 'legacy repeat output', String('NaN:NaN'), String(getDurationString(input)));
      expect(getDurationString(input)).assertEqual('NaN:NaN');
      LogicTestLog.end(name);
    });
  });
}
