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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatTime } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for formatTime (16 cases). */
export default function formatTime3Test(): void {
  describe('FormatTime3Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0193
     * @tc.name      FormExtAbility_FormatTime_0193
     * @tc.desc      formatTime(hours=2, minutes=5, seconds=10) returns "02:05:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0193 begin`);
      const actual: string = formatTime(2, 5, 10);
      logInfo(`formatTime(hours=2, minutes=5, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('02:05:10');
      logInfo(`${BUNDLE}FormatTime_0193 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0194
     * @tc.name      FormExtAbility_FormatTime_0194
     * @tc.desc      formatTime(hours=12, minutes=10, seconds=10) returns "12:10:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0194 begin`);
      const actual: string = formatTime(12, 10, 10);
      logInfo(`formatTime(hours=12, minutes=10, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('12:10:10');
      logInfo(`${BUNDLE}FormatTime_0194 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0195
     * @tc.name      FormExtAbility_FormatTime_0195
     * @tc.desc      formatTime(hours=-1, minutes=30, seconds=30) returns "0-1:30:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0195 begin`);
      const actual: string = formatTime(-1, 30, 30);
      logInfo(`formatTime(hours=-1, minutes=30, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('0-1:30:30');
      logInfo(`${BUNDLE}FormatTime_0195 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0196
     * @tc.name      FormExtAbility_FormatTime_0196
     * @tc.desc      formatTime(hours=10, minutes=-1, seconds=5) returns "10:0-1:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0196 begin`);
      const actual: string = formatTime(10, -1, 5);
      logInfo(`formatTime(hours=10, minutes=-1, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('10:0-1:05');
      logInfo(`${BUNDLE}FormatTime_0196 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0197
     * @tc.name      FormExtAbility_FormatTime_0197
     * @tc.desc      formatTime(hours=5, minutes=2, seconds=0) returns "05:02:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0197 begin`);
      const actual: string = formatTime(5, 2, 0);
      logInfo(`formatTime(hours=5, minutes=2, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('05:02:00');
      logInfo(`${BUNDLE}FormatTime_0197 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0198
     * @tc.name      FormExtAbility_FormatTime_0198
     * @tc.desc      formatTime(hours=12, minutes=100, seconds=60) returns "12:100:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0198 begin`);
      const actual: string = formatTime(12, 100, 60);
      logInfo(`formatTime(hours=12, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('12:100:60');
      logInfo(`${BUNDLE}FormatTime_0198 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0199
     * @tc.name      FormExtAbility_FormatTime_0199
     * @tc.desc      formatTime(hours=24, minutes=10, seconds=1) returns "24:10:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0199 begin`);
      const actual: string = formatTime(24, 10, 1);
      logInfo(`formatTime(hours=24, minutes=10, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('24:10:01');
      logInfo(`${BUNDLE}FormatTime_0199 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0200
     * @tc.name      FormExtAbility_FormatTime_0200
     * @tc.desc      formatTime(hours=12, minutes=100, seconds=100) returns "12:100:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0200 begin`);
      const actual: string = formatTime(12, 100, 100);
      logInfo(`formatTime(hours=12, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('12:100:100');
      logInfo(`${BUNDLE}FormatTime_0200 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0201
     * @tc.name      FormExtAbility_FormatTime_0201
     * @tc.desc      formatTime(hours=117, minutes=-1, seconds=0) returns "117:0-1:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0201 begin`);
      const actual: string = formatTime(117, -1, 0);
      logInfo(`formatTime(hours=117, minutes=-1, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('117:0-1:00');
      logInfo(`${BUNDLE}FormatTime_0201 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0202
     * @tc.name      FormExtAbility_FormatTime_0202
     * @tc.desc      formatTime(hours=2, minutes=10, seconds=59) returns "02:10:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0202 begin`);
      const actual: string = formatTime(2, 10, 59);
      logInfo(`formatTime(hours=2, minutes=10, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('02:10:59');
      logInfo(`${BUNDLE}FormatTime_0202 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0203
     * @tc.name      FormExtAbility_FormatTime_0203
     * @tc.desc      formatTime(hours=24, minutes=5, seconds=-1) returns "24:05:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0203 begin`);
      const actual: string = formatTime(24, 5, -1);
      logInfo(`formatTime(hours=24, minutes=5, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('24:05:0-1');
      logInfo(`${BUNDLE}FormatTime_0203 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0204
     * @tc.name      FormExtAbility_FormatTime_0204
     * @tc.desc      formatTime(hours=1, minutes=10, seconds=30) returns "01:10:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0204 begin`);
      const actual: string = formatTime(1, 10, 30);
      logInfo(`formatTime(hours=1, minutes=10, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('01:10:30');
      logInfo(`${BUNDLE}FormatTime_0204 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0205
     * @tc.name      FormExtAbility_FormatTime_0205
     * @tc.desc      formatTime(hours=0, minutes=100, seconds=1) returns "00:100:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0205 begin`);
      const actual: string = formatTime(0, 100, 1);
      logInfo(`formatTime(hours=0, minutes=100, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('00:100:01');
      logInfo(`${BUNDLE}FormatTime_0205 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0206
     * @tc.name      FormExtAbility_FormatTime_0206
     * @tc.desc      formatTime(hours=5, minutes=10, seconds=3) returns "05:10:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0206 begin`);
      const actual: string = formatTime(5, 10, 3);
      logInfo(`formatTime(hours=5, minutes=10, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('05:10:03');
      logInfo(`${BUNDLE}FormatTime_0206 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0207
     * @tc.name      FormExtAbility_FormatTime_0207
     * @tc.desc      formatTime(hours=2, minutes=3, seconds=0) returns "02:03:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0207 begin`);
      const actual: string = formatTime(2, 3, 0);
      logInfo(`formatTime(hours=2, minutes=3, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('02:03:00');
      logInfo(`${BUNDLE}FormatTime_0207 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0208
     * @tc.name      FormExtAbility_FormatTime_0208
     * @tc.desc      formatTime(hours=23, minutes=3, seconds=60) returns "23:03:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0208 begin`);
      const actual: string = formatTime(23, 3, 60);
      logInfo(`formatTime(hours=23, minutes=3, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('23:03:60');
      logInfo(`${BUNDLE}FormatTime_0208 end`);
    });
  });
}
