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

/** Logic checks for formatTime (96 cases). */
export default function formatTimeTest(): void {
  describe('FormatTimeTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0001
     * @tc.name      FormExtAbility_FormatTime_0001
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=0) returns "00:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormatTime_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormatTime_0001 begin`);
      const actual: string = formatTime(0, 0, 0);
      logInfo(`formatTime(hours=0, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:00:00');
      logInfo(`${BUNDLE}FormatTime_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0002
     * @tc.name      FormExtAbility_FormatTime_0002
     * @tc.desc      formatTime(hours=12, minutes=0, seconds=0) returns "12:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormatTime_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormatTime_0002 begin`);
      const actual: string = formatTime(12, 0, 0);
      logInfo(`formatTime(hours=12, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('12:00:00');
      logInfo(`${BUNDLE}FormatTime_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0003
     * @tc.name      FormExtAbility_FormatTime_0003
     * @tc.desc      formatTime(hours=23, minutes=0, seconds=0) returns "23:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0003 begin`);
      const actual: string = formatTime(23, 0, 0);
      logInfo(`formatTime(hours=23, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('23:00:00');
      logInfo(`${BUNDLE}FormatTime_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0004
     * @tc.name      FormExtAbility_FormatTime_0004
     * @tc.desc      formatTime(hours=24, minutes=0, seconds=0) returns "24:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0004 begin`);
      const actual: string = formatTime(24, 0, 0);
      logInfo(`formatTime(hours=24, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('24:00:00');
      logInfo(`${BUNDLE}FormatTime_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0005
     * @tc.name      FormExtAbility_FormatTime_0005
     * @tc.desc      formatTime(hours=1, minutes=0, seconds=0) returns "01:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0005 begin`);
      const actual: string = formatTime(1, 0, 0);
      logInfo(`formatTime(hours=1, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('01:00:00');
      logInfo(`${BUNDLE}FormatTime_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0006
     * @tc.name      FormExtAbility_FormatTime_0006
     * @tc.desc      formatTime(hours=-1, minutes=0, seconds=0) returns "0-1:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0006 begin`);
      const actual: string = formatTime(-1, 0, 0);
      logInfo(`formatTime(hours=-1, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('0-1:00:00');
      logInfo(`${BUNDLE}FormatTime_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0007
     * @tc.name      FormExtAbility_FormatTime_0007
     * @tc.desc      formatTime(hours=2, minutes=0, seconds=0) returns "02:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0007 begin`);
      const actual: string = formatTime(2, 0, 0);
      logInfo(`formatTime(hours=2, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('02:00:00');
      logInfo(`${BUNDLE}FormatTime_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0008
     * @tc.name      FormExtAbility_FormatTime_0008
     * @tc.desc      formatTime(hours=3, minutes=0, seconds=0) returns "03:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0008 begin`);
      const actual: string = formatTime(3, 0, 0);
      logInfo(`formatTime(hours=3, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('03:00:00');
      logInfo(`${BUNDLE}FormatTime_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0009
     * @tc.name      FormExtAbility_FormatTime_0009
     * @tc.desc      formatTime(hours=10, minutes=0, seconds=0) returns "10:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0009 begin`);
      const actual: string = formatTime(10, 0, 0);
      logInfo(`formatTime(hours=10, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('10:00:00');
      logInfo(`${BUNDLE}FormatTime_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0010
     * @tc.name      FormExtAbility_FormatTime_0010
     * @tc.desc      formatTime(hours=100, minutes=0, seconds=0) returns "100:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0010 begin`);
      const actual: string = formatTime(100, 0, 0);
      logInfo(`formatTime(hours=100, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('100:00:00');
      logInfo(`${BUNDLE}FormatTime_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0011
     * @tc.name      FormExtAbility_FormatTime_0011
     * @tc.desc      formatTime(hours=5, minutes=0, seconds=0) returns "05:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0011 begin`);
      const actual: string = formatTime(5, 0, 0);
      logInfo(`formatTime(hours=5, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('05:00:00');
      logInfo(`${BUNDLE}FormatTime_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0012
     * @tc.name      FormExtAbility_FormatTime_0012
     * @tc.desc      formatTime(hours=117, minutes=0, seconds=0) returns "117:00:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0012 begin`);
      const actual: string = formatTime(117, 0, 0);
      logInfo(`formatTime(hours=117, minutes=0, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('117:00:00');
      logInfo(`${BUNDLE}FormatTime_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0013
     * @tc.name      FormExtAbility_FormatTime_0013
     * @tc.desc      formatTime(hours=0, minutes=30, seconds=0) returns "00:30:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0013 begin`);
      const actual: string = formatTime(0, 30, 0);
      logInfo(`formatTime(hours=0, minutes=30, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:30:00');
      logInfo(`${BUNDLE}FormatTime_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0014
     * @tc.name      FormExtAbility_FormatTime_0014
     * @tc.desc      formatTime(hours=0, minutes=59, seconds=0) returns "00:59:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0014 begin`);
      const actual: string = formatTime(0, 59, 0);
      logInfo(`formatTime(hours=0, minutes=59, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:59:00');
      logInfo(`${BUNDLE}FormatTime_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0015
     * @tc.name      FormExtAbility_FormatTime_0015
     * @tc.desc      formatTime(hours=0, minutes=60, seconds=0) returns "00:60:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0015 begin`);
      const actual: string = formatTime(0, 60, 0);
      logInfo(`formatTime(hours=0, minutes=60, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:60:00');
      logInfo(`${BUNDLE}FormatTime_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0016
     * @tc.name      FormExtAbility_FormatTime_0016
     * @tc.desc      formatTime(hours=0, minutes=1, seconds=0) returns "00:01:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0016 begin`);
      const actual: string = formatTime(0, 1, 0);
      logInfo(`formatTime(hours=0, minutes=1, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:01:00');
      logInfo(`${BUNDLE}FormatTime_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0017
     * @tc.name      FormExtAbility_FormatTime_0017
     * @tc.desc      formatTime(hours=0, minutes=-1, seconds=0) returns "00:0-1:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0017 begin`);
      const actual: string = formatTime(0, -1, 0);
      logInfo(`formatTime(hours=0, minutes=-1, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:0-1:00');
      logInfo(`${BUNDLE}FormatTime_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0018
     * @tc.name      FormExtAbility_FormatTime_0018
     * @tc.desc      formatTime(hours=0, minutes=2, seconds=0) returns "00:02:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0018 begin`);
      const actual: string = formatTime(0, 2, 0);
      logInfo(`formatTime(hours=0, minutes=2, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:02:00');
      logInfo(`${BUNDLE}FormatTime_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0019
     * @tc.name      FormExtAbility_FormatTime_0019
     * @tc.desc      formatTime(hours=0, minutes=3, seconds=0) returns "00:03:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0019 begin`);
      const actual: string = formatTime(0, 3, 0);
      logInfo(`formatTime(hours=0, minutes=3, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:03:00');
      logInfo(`${BUNDLE}FormatTime_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0020
     * @tc.name      FormExtAbility_FormatTime_0020
     * @tc.desc      formatTime(hours=0, minutes=10, seconds=0) returns "00:10:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0020 begin`);
      const actual: string = formatTime(0, 10, 0);
      logInfo(`formatTime(hours=0, minutes=10, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:10:00');
      logInfo(`${BUNDLE}FormatTime_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0021
     * @tc.name      FormExtAbility_FormatTime_0021
     * @tc.desc      formatTime(hours=0, minutes=100, seconds=0) returns "00:100:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0021 begin`);
      const actual: string = formatTime(0, 100, 0);
      logInfo(`formatTime(hours=0, minutes=100, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:100:00');
      logInfo(`${BUNDLE}FormatTime_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0022
     * @tc.name      FormExtAbility_FormatTime_0022
     * @tc.desc      formatTime(hours=0, minutes=5, seconds=0) returns "00:05:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0022 begin`);
      const actual: string = formatTime(0, 5, 0);
      logInfo(`formatTime(hours=0, minutes=5, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:05:00');
      logInfo(`${BUNDLE}FormatTime_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0023
     * @tc.name      FormExtAbility_FormatTime_0023
     * @tc.desc      formatTime(hours=0, minutes=141, seconds=0) returns "00:141:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0023 begin`);
      const actual: string = formatTime(0, 141, 0);
      logInfo(`formatTime(hours=0, minutes=141, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('00:141:00');
      logInfo(`${BUNDLE}FormatTime_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0024
     * @tc.name      FormExtAbility_FormatTime_0024
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=30) returns "00:00:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0024 begin`);
      const actual: string = formatTime(0, 0, 30);
      logInfo(`formatTime(hours=0, minutes=0, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('00:00:30');
      logInfo(`${BUNDLE}FormatTime_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0025
     * @tc.name      FormExtAbility_FormatTime_0025
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=59) returns "00:00:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0025 begin`);
      const actual: string = formatTime(0, 0, 59);
      logInfo(`formatTime(hours=0, minutes=0, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('00:00:59');
      logInfo(`${BUNDLE}FormatTime_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0026
     * @tc.name      FormExtAbility_FormatTime_0026
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=60) returns "00:00:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0026 begin`);
      const actual: string = formatTime(0, 0, 60);
      logInfo(`formatTime(hours=0, minutes=0, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('00:00:60');
      logInfo(`${BUNDLE}FormatTime_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0027
     * @tc.name      FormExtAbility_FormatTime_0027
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=1) returns "00:00:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0027 begin`);
      const actual: string = formatTime(0, 0, 1);
      logInfo(`formatTime(hours=0, minutes=0, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('00:00:01');
      logInfo(`${BUNDLE}FormatTime_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0028
     * @tc.name      FormExtAbility_FormatTime_0028
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=-1) returns "00:00:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0028 begin`);
      const actual: string = formatTime(0, 0, -1);
      logInfo(`formatTime(hours=0, minutes=0, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('00:00:0-1');
      logInfo(`${BUNDLE}FormatTime_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0029
     * @tc.name      FormExtAbility_FormatTime_0029
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=2) returns "00:00:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0029 begin`);
      const actual: string = formatTime(0, 0, 2);
      logInfo(`formatTime(hours=0, minutes=0, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('00:00:02');
      logInfo(`${BUNDLE}FormatTime_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0030
     * @tc.name      FormExtAbility_FormatTime_0030
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=3) returns "00:00:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0030 begin`);
      const actual: string = formatTime(0, 0, 3);
      logInfo(`formatTime(hours=0, minutes=0, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('00:00:03');
      logInfo(`${BUNDLE}FormatTime_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0031
     * @tc.name      FormExtAbility_FormatTime_0031
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=10) returns "00:00:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0031 begin`);
      const actual: string = formatTime(0, 0, 10);
      logInfo(`formatTime(hours=0, minutes=0, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('00:00:10');
      logInfo(`${BUNDLE}FormatTime_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0032
     * @tc.name      FormExtAbility_FormatTime_0032
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=100) returns "00:00:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0032 begin`);
      const actual: string = formatTime(0, 0, 100);
      logInfo(`formatTime(hours=0, minutes=0, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('00:00:100');
      logInfo(`${BUNDLE}FormatTime_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0033
     * @tc.name      FormExtAbility_FormatTime_0033
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=5) returns "00:00:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0033 begin`);
      const actual: string = formatTime(0, 0, 5);
      logInfo(`formatTime(hours=0, minutes=0, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('00:00:05');
      logInfo(`${BUNDLE}FormatTime_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0034
     * @tc.name      FormExtAbility_FormatTime_0034
     * @tc.desc      formatTime(hours=0, minutes=0, seconds=-9) returns "00:00:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0034 begin`);
      const actual: string = formatTime(0, 0, -9);
      logInfo(`formatTime(hours=0, minutes=0, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('00:00:0-9');
      logInfo(`${BUNDLE}FormatTime_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0035
     * @tc.name      FormExtAbility_FormatTime_0035
     * @tc.desc      formatTime(hours=2, minutes=2, seconds=5) returns "02:02:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0035 begin`);
      const actual: string = formatTime(2, 2, 5);
      logInfo(`formatTime(hours=2, minutes=2, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('02:02:05');
      logInfo(`${BUNDLE}FormatTime_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0036
     * @tc.name      FormExtAbility_FormatTime_0036
     * @tc.desc      formatTime(hours=-1, minutes=100, seconds=-1) returns "0-1:100:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0036 begin`);
      const actual: string = formatTime(-1, 100, -1);
      logInfo(`formatTime(hours=-1, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('0-1:100:0-1');
      logInfo(`${BUNDLE}FormatTime_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0037
     * @tc.name      FormExtAbility_FormatTime_0037
     * @tc.desc      formatTime(hours=-1, minutes=3, seconds=-1) returns "0-1:03:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0037 begin`);
      const actual: string = formatTime(-1, 3, -1);
      logInfo(`formatTime(hours=-1, minutes=3, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('0-1:03:0-1');
      logInfo(`${BUNDLE}FormatTime_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0038
     * @tc.name      FormExtAbility_FormatTime_0038
     * @tc.desc      formatTime(hours=10, minutes=100, seconds=-1) returns "10:100:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0038 begin`);
      const actual: string = formatTime(10, 100, -1);
      logInfo(`formatTime(hours=10, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('10:100:0-1');
      logInfo(`${BUNDLE}FormatTime_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0039
     * @tc.name      FormExtAbility_FormatTime_0039
     * @tc.desc      formatTime(hours=1, minutes=60, seconds=-1) returns "01:60:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0039 begin`);
      const actual: string = formatTime(1, 60, -1);
      logInfo(`formatTime(hours=1, minutes=60, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('01:60:0-1');
      logInfo(`${BUNDLE}FormatTime_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0040
     * @tc.name      FormExtAbility_FormatTime_0040
     * @tc.desc      formatTime(hours=2, minutes=0, seconds=1) returns "02:00:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0040 begin`);
      const actual: string = formatTime(2, 0, 1);
      logInfo(`formatTime(hours=2, minutes=0, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('02:00:01');
      logInfo(`${BUNDLE}FormatTime_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0041
     * @tc.name      FormExtAbility_FormatTime_0041
     * @tc.desc      formatTime(hours=24, minutes=59, seconds=-1) returns "24:59:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0041 begin`);
      const actual: string = formatTime(24, 59, -1);
      logInfo(`formatTime(hours=24, minutes=59, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('24:59:0-1');
      logInfo(`${BUNDLE}FormatTime_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0042
     * @tc.name      FormExtAbility_FormatTime_0042
     * @tc.desc      formatTime(hours=5, minutes=100, seconds=2) returns "05:100:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0042 begin`);
      const actual: string = formatTime(5, 100, 2);
      logInfo(`formatTime(hours=5, minutes=100, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('05:100:02');
      logInfo(`${BUNDLE}FormatTime_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0043
     * @tc.name      FormExtAbility_FormatTime_0043
     * @tc.desc      formatTime(hours=0, minutes=1, seconds=3) returns "00:01:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0043 begin`);
      const actual: string = formatTime(0, 1, 3);
      logInfo(`formatTime(hours=0, minutes=1, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('00:01:03');
      logInfo(`${BUNDLE}FormatTime_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0044
     * @tc.name      FormExtAbility_FormatTime_0044
     * @tc.desc      formatTime(hours=5, minutes=5, seconds=1) returns "05:05:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0044 begin`);
      const actual: string = formatTime(5, 5, 1);
      logInfo(`formatTime(hours=5, minutes=5, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('05:05:01');
      logInfo(`${BUNDLE}FormatTime_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0045
     * @tc.name      FormExtAbility_FormatTime_0045
     * @tc.desc      formatTime(hours=24, minutes=0, seconds=5) returns "24:00:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0045 begin`);
      const actual: string = formatTime(24, 0, 5);
      logInfo(`formatTime(hours=24, minutes=0, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('24:00:05');
      logInfo(`${BUNDLE}FormatTime_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0046
     * @tc.name      FormExtAbility_FormatTime_0046
     * @tc.desc      formatTime(hours=5, minutes=10, seconds=0) returns "05:10:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0046 begin`);
      const actual: string = formatTime(5, 10, 0);
      logInfo(`formatTime(hours=5, minutes=10, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('05:10:00');
      logInfo(`${BUNDLE}FormatTime_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0047
     * @tc.name      FormExtAbility_FormatTime_0047
     * @tc.desc      formatTime(hours=117, minutes=141, seconds=30) returns "117:141:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0047 begin`);
      const actual: string = formatTime(117, 141, 30);
      logInfo(`formatTime(hours=117, minutes=141, second...: actual=${actual}`);
      expect(actual).assertEqual('117:141:30');
      logInfo(`${BUNDLE}FormatTime_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0048
     * @tc.name      FormExtAbility_FormatTime_0048
     * @tc.desc      formatTime(hours=-1, minutes=0, seconds=3) returns "0-1:00:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0048 begin`);
      const actual: string = formatTime(-1, 0, 3);
      logInfo(`formatTime(hours=-1, minutes=0, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('0-1:00:03');
      logInfo(`${BUNDLE}FormatTime_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0049
     * @tc.name      FormExtAbility_FormatTime_0049
     * @tc.desc      formatTime(hours=5, minutes=3, seconds=60) returns "05:03:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0049 begin`);
      const actual: string = formatTime(5, 3, 60);
      logInfo(`formatTime(hours=5, minutes=3, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('05:03:60');
      logInfo(`${BUNDLE}FormatTime_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0050
     * @tc.name      FormExtAbility_FormatTime_0050
     * @tc.desc      formatTime(hours=-1, minutes=0, seconds=60) returns "0-1:00:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0050 begin`);
      const actual: string = formatTime(-1, 0, 60);
      logInfo(`formatTime(hours=-1, minutes=0, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('0-1:00:60');
      logInfo(`${BUNDLE}FormatTime_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0051
     * @tc.name      FormExtAbility_FormatTime_0051
     * @tc.desc      formatTime(hours=10, minutes=100, seconds=59) returns "10:100:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0051 begin`);
      const actual: string = formatTime(10, 100, 59);
      logInfo(`formatTime(hours=10, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('10:100:59');
      logInfo(`${BUNDLE}FormatTime_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0052
     * @tc.name      FormExtAbility_FormatTime_0052
     * @tc.desc      formatTime(hours=3, minutes=60, seconds=5) returns "03:60:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0052 begin`);
      const actual: string = formatTime(3, 60, 5);
      logInfo(`formatTime(hours=3, minutes=60, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('03:60:05');
      logInfo(`${BUNDLE}FormatTime_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0053
     * @tc.name      FormExtAbility_FormatTime_0053
     * @tc.desc      formatTime(hours=1, minutes=30, seconds=-9) returns "01:30:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0053 begin`);
      const actual: string = formatTime(1, 30, -9);
      logInfo(`formatTime(hours=1, minutes=30, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('01:30:0-9');
      logInfo(`${BUNDLE}FormatTime_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0054
     * @tc.name      FormExtAbility_FormatTime_0054
     * @tc.desc      formatTime(hours=100, minutes=3, seconds=-1) returns "100:03:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0054 begin`);
      const actual: string = formatTime(100, 3, -1);
      logInfo(`formatTime(hours=100, minutes=3, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('100:03:0-1');
      logInfo(`${BUNDLE}FormatTime_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0055
     * @tc.name      FormExtAbility_FormatTime_0055
     * @tc.desc      formatTime(hours=117, minutes=5, seconds=-9) returns "117:05:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0055 begin`);
      const actual: string = formatTime(117, 5, -9);
      logInfo(`formatTime(hours=117, minutes=5, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('117:05:0-9');
      logInfo(`${BUNDLE}FormatTime_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0056
     * @tc.name      FormExtAbility_FormatTime_0056
     * @tc.desc      formatTime(hours=1, minutes=2, seconds=60) returns "01:02:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0056 begin`);
      const actual: string = formatTime(1, 2, 60);
      logInfo(`formatTime(hours=1, minutes=2, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('01:02:60');
      logInfo(`${BUNDLE}FormatTime_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0057
     * @tc.name      FormExtAbility_FormatTime_0057
     * @tc.desc      formatTime(hours=1, minutes=1, seconds=10) returns "01:01:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0057 begin`);
      const actual: string = formatTime(1, 1, 10);
      logInfo(`formatTime(hours=1, minutes=1, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('01:01:10');
      logInfo(`${BUNDLE}FormatTime_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0058
     * @tc.name      FormExtAbility_FormatTime_0058
     * @tc.desc      formatTime(hours=2, minutes=100, seconds=100) returns "02:100:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0058 begin`);
      const actual: string = formatTime(2, 100, 100);
      logInfo(`formatTime(hours=2, minutes=100, seconds=...: actual=${actual}`);
      expect(actual).assertEqual('02:100:100');
      logInfo(`${BUNDLE}FormatTime_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0059
     * @tc.name      FormExtAbility_FormatTime_0059
     * @tc.desc      formatTime(hours=117, minutes=30, seconds=30) returns "117:30:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0059 begin`);
      const actual: string = formatTime(117, 30, 30);
      logInfo(`formatTime(hours=117, minutes=30, seconds...: actual=${actual}`);
      expect(actual).assertEqual('117:30:30');
      logInfo(`${BUNDLE}FormatTime_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0060
     * @tc.name      FormExtAbility_FormatTime_0060
     * @tc.desc      formatTime(hours=0, minutes=59, seconds=5) returns "00:59:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0060 begin`);
      const actual: string = formatTime(0, 59, 5);
      logInfo(`formatTime(hours=0, minutes=59, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('00:59:05');
      logInfo(`${BUNDLE}FormatTime_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0061
     * @tc.name      FormExtAbility_FormatTime_0061
     * @tc.desc      formatTime(hours=24, minutes=-1, seconds=59) returns "24:0-1:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0061 begin`);
      const actual: string = formatTime(24, -1, 59);
      logInfo(`formatTime(hours=24, minutes=-1, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('24:0-1:59');
      logInfo(`${BUNDLE}FormatTime_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0062
     * @tc.name      FormExtAbility_FormatTime_0062
     * @tc.desc      formatTime(hours=3, minutes=-1, seconds=60) returns "03:0-1:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0062 begin`);
      const actual: string = formatTime(3, -1, 60);
      logInfo(`formatTime(hours=3, minutes=-1, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('03:0-1:60');
      logInfo(`${BUNDLE}FormatTime_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0063
     * @tc.name      FormExtAbility_FormatTime_0063
     * @tc.desc      formatTime(hours=117, minutes=1, seconds=30) returns "117:01:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0063 begin`);
      const actual: string = formatTime(117, 1, 30);
      logInfo(`formatTime(hours=117, minutes=1, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('117:01:30');
      logInfo(`${BUNDLE}FormatTime_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0064
     * @tc.name      FormExtAbility_FormatTime_0064
     * @tc.desc      formatTime(hours=3, minutes=141, seconds=-1) returns "03:141:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0064 begin`);
      const actual: string = formatTime(3, 141, -1);
      logInfo(`formatTime(hours=3, minutes=141, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('03:141:0-1');
      logInfo(`${BUNDLE}FormatTime_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0065
     * @tc.name      FormExtAbility_FormatTime_0065
     * @tc.desc      formatTime(hours=117, minutes=-1, seconds=5) returns "117:0-1:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0065 begin`);
      const actual: string = formatTime(117, -1, 5);
      logInfo(`formatTime(hours=117, minutes=-1, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('117:0-1:05');
      logInfo(`${BUNDLE}FormatTime_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0066
     * @tc.name      FormExtAbility_FormatTime_0066
     * @tc.desc      formatTime(hours=24, minutes=2, seconds=30) returns "24:02:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0066 begin`);
      const actual: string = formatTime(24, 2, 30);
      logInfo(`formatTime(hours=24, minutes=2, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('24:02:30');
      logInfo(`${BUNDLE}FormatTime_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0067
     * @tc.name      FormExtAbility_FormatTime_0067
     * @tc.desc      formatTime(hours=24, minutes=10, seconds=100) returns "24:10:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0067 begin`);
      const actual: string = formatTime(24, 10, 100);
      logInfo(`formatTime(hours=24, minutes=10, seconds=...: actual=${actual}`);
      expect(actual).assertEqual('24:10:100');
      logInfo(`${BUNDLE}FormatTime_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0068
     * @tc.name      FormExtAbility_FormatTime_0068
     * @tc.desc      formatTime(hours=12, minutes=60, seconds=100) returns "12:60:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0068 begin`);
      const actual: string = formatTime(12, 60, 100);
      logInfo(`formatTime(hours=12, minutes=60, seconds=...: actual=${actual}`);
      expect(actual).assertEqual('12:60:100');
      logInfo(`${BUNDLE}FormatTime_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0069
     * @tc.name      FormExtAbility_FormatTime_0069
     * @tc.desc      formatTime(hours=1, minutes=30, seconds=100) returns "01:30:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0069 begin`);
      const actual: string = formatTime(1, 30, 100);
      logInfo(`formatTime(hours=1, minutes=30, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('01:30:100');
      logInfo(`${BUNDLE}FormatTime_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0070
     * @tc.name      FormExtAbility_FormatTime_0070
     * @tc.desc      formatTime(hours=3, minutes=60, seconds=100) returns "03:60:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0070 begin`);
      const actual: string = formatTime(3, 60, 100);
      logInfo(`formatTime(hours=3, minutes=60, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('03:60:100');
      logInfo(`${BUNDLE}FormatTime_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0071
     * @tc.name      FormExtAbility_FormatTime_0071
     * @tc.desc      formatTime(hours=5, minutes=141, seconds=59) returns "05:141:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0071 begin`);
      const actual: string = formatTime(5, 141, 59);
      logInfo(`formatTime(hours=5, minutes=141, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('05:141:59');
      logInfo(`${BUNDLE}FormatTime_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0072
     * @tc.name      FormExtAbility_FormatTime_0072
     * @tc.desc      formatTime(hours=5, minutes=59, seconds=3) returns "05:59:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0072 begin`);
      const actual: string = formatTime(5, 59, 3);
      logInfo(`formatTime(hours=5, minutes=59, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('05:59:03');
      logInfo(`${BUNDLE}FormatTime_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0073
     * @tc.name      FormExtAbility_FormatTime_0073
     * @tc.desc      formatTime(hours=0, minutes=59, seconds=-9) returns "00:59:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0073 begin`);
      const actual: string = formatTime(0, 59, -9);
      logInfo(`formatTime(hours=0, minutes=59, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('00:59:0-9');
      logInfo(`${BUNDLE}FormatTime_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0074
     * @tc.name      FormExtAbility_FormatTime_0074
     * @tc.desc      formatTime(hours=0, minutes=2, seconds=2) returns "00:02:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0074 begin`);
      const actual: string = formatTime(0, 2, 2);
      logInfo(`formatTime(hours=0, minutes=2, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('00:02:02');
      logInfo(`${BUNDLE}FormatTime_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0075
     * @tc.name      FormExtAbility_FormatTime_0075
     * @tc.desc      formatTime(hours=100, minutes=100, seconds=2) returns "100:100:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0075 begin`);
      const actual: string = formatTime(100, 100, 2);
      logInfo(`formatTime(hours=100, minutes=100, second...: actual=${actual}`);
      expect(actual).assertEqual('100:100:02');
      logInfo(`${BUNDLE}FormatTime_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0076
     * @tc.name      FormExtAbility_FormatTime_0076
     * @tc.desc      formatTime(hours=-1, minutes=10, seconds=60) returns "0-1:10:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0076 begin`);
      const actual: string = formatTime(-1, 10, 60);
      logInfo(`formatTime(hours=-1, minutes=10, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('0-1:10:60');
      logInfo(`${BUNDLE}FormatTime_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0077
     * @tc.name      FormExtAbility_FormatTime_0077
     * @tc.desc      formatTime(hours=-1, minutes=59, seconds=2) returns "0-1:59:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0077 begin`);
      const actual: string = formatTime(-1, 59, 2);
      logInfo(`formatTime(hours=-1, minutes=59, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('0-1:59:02');
      logInfo(`${BUNDLE}FormatTime_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0078
     * @tc.name      FormExtAbility_FormatTime_0078
     * @tc.desc      formatTime(hours=12, minutes=0, seconds=1) returns "12:00:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0078 begin`);
      const actual: string = formatTime(12, 0, 1);
      logInfo(`formatTime(hours=12, minutes=0, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('12:00:01');
      logInfo(`${BUNDLE}FormatTime_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0079
     * @tc.name      FormExtAbility_FormatTime_0079
     * @tc.desc      formatTime(hours=3, minutes=10, seconds=30) returns "03:10:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0079 begin`);
      const actual: string = formatTime(3, 10, 30);
      logInfo(`formatTime(hours=3, minutes=10, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('03:10:30');
      logInfo(`${BUNDLE}FormatTime_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0080
     * @tc.name      FormExtAbility_FormatTime_0080
     * @tc.desc      formatTime(hours=2, minutes=3, seconds=10) returns "02:03:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0080 begin`);
      const actual: string = formatTime(2, 3, 10);
      logInfo(`formatTime(hours=2, minutes=3, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('02:03:10');
      logInfo(`${BUNDLE}FormatTime_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0081
     * @tc.name      FormExtAbility_FormatTime_0081
     * @tc.desc      formatTime(hours=2, minutes=-1, seconds=59) returns "02:0-1:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0081 begin`);
      const actual: string = formatTime(2, -1, 59);
      logInfo(`formatTime(hours=2, minutes=-1, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('02:0-1:59');
      logInfo(`${BUNDLE}FormatTime_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0082
     * @tc.name      FormExtAbility_FormatTime_0082
     * @tc.desc      formatTime(hours=117, minutes=-1, seconds=100) returns "117:0-1:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0082 begin`);
      const actual: string = formatTime(117, -1, 100);
      logInfo(`formatTime(hours=117, minutes=-1, seconds...: actual=${actual}`);
      expect(actual).assertEqual('117:0-1:100');
      logInfo(`${BUNDLE}FormatTime_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0083
     * @tc.name      FormExtAbility_FormatTime_0083
     * @tc.desc      formatTime(hours=0, minutes=2, seconds=100) returns "00:02:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0083 begin`);
      const actual: string = formatTime(0, 2, 100);
      logInfo(`formatTime(hours=0, minutes=2, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('00:02:100');
      logInfo(`${BUNDLE}FormatTime_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0084
     * @tc.name      FormExtAbility_FormatTime_0084
     * @tc.desc      formatTime(hours=5, minutes=141, seconds=-1) returns "05:141:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0084 begin`);
      const actual: string = formatTime(5, 141, -1);
      logInfo(`formatTime(hours=5, minutes=141, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('05:141:0-1');
      logInfo(`${BUNDLE}FormatTime_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0085
     * @tc.name      FormExtAbility_FormatTime_0085
     * @tc.desc      formatTime(hours=24, minutes=-1, seconds=-1) returns "24:0-1:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0085 begin`);
      const actual: string = formatTime(24, -1, -1);
      logInfo(`formatTime(hours=24, minutes=-1, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('24:0-1:0-1');
      logInfo(`${BUNDLE}FormatTime_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0086
     * @tc.name      FormExtAbility_FormatTime_0086
     * @tc.desc      formatTime(hours=12, minutes=5, seconds=3) returns "12:05:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0086 begin`);
      const actual: string = formatTime(12, 5, 3);
      logInfo(`formatTime(hours=12, minutes=5, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('12:05:03');
      logInfo(`${BUNDLE}FormatTime_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0087
     * @tc.name      FormExtAbility_FormatTime_0087
     * @tc.desc      formatTime(hours=24, minutes=3, seconds=100) returns "24:03:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0087 begin`);
      const actual: string = formatTime(24, 3, 100);
      logInfo(`formatTime(hours=24, minutes=3, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('24:03:100');
      logInfo(`${BUNDLE}FormatTime_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0088
     * @tc.name      FormExtAbility_FormatTime_0088
     * @tc.desc      formatTime(hours=12, minutes=2, seconds=2) returns "12:02:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0088 begin`);
      const actual: string = formatTime(12, 2, 2);
      logInfo(`formatTime(hours=12, minutes=2, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('12:02:02');
      logInfo(`${BUNDLE}FormatTime_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0089
     * @tc.name      FormExtAbility_FormatTime_0089
     * @tc.desc      formatTime(hours=10, minutes=0, seconds=100) returns "10:00:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0089 begin`);
      const actual: string = formatTime(10, 0, 100);
      logInfo(`formatTime(hours=10, minutes=0, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('10:00:100');
      logInfo(`${BUNDLE}FormatTime_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0090
     * @tc.name      FormExtAbility_FormatTime_0090
     * @tc.desc      formatTime(hours=5, minutes=141, seconds=30) returns "05:141:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0090 begin`);
      const actual: string = formatTime(5, 141, 30);
      logInfo(`formatTime(hours=5, minutes=141, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('05:141:30');
      logInfo(`${BUNDLE}FormatTime_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0091
     * @tc.name      FormExtAbility_FormatTime_0091
     * @tc.desc      formatTime(hours=2, minutes=2, seconds=1) returns "02:02:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0091 begin`);
      const actual: string = formatTime(2, 2, 1);
      logInfo(`formatTime(hours=2, minutes=2, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('02:02:01');
      logInfo(`${BUNDLE}FormatTime_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0092
     * @tc.name      FormExtAbility_FormatTime_0092
     * @tc.desc      formatTime(hours=2, minutes=100, seconds=5) returns "02:100:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0092 begin`);
      const actual: string = formatTime(2, 100, 5);
      logInfo(`formatTime(hours=2, minutes=100, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('02:100:05');
      logInfo(`${BUNDLE}FormatTime_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0093
     * @tc.name      FormExtAbility_FormatTime_0093
     * @tc.desc      formatTime(hours=-1, minutes=5, seconds=60) returns "0-1:05:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0093 begin`);
      const actual: string = formatTime(-1, 5, 60);
      logInfo(`formatTime(hours=-1, minutes=5, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('0-1:05:60');
      logInfo(`${BUNDLE}FormatTime_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0094
     * @tc.name      FormExtAbility_FormatTime_0094
     * @tc.desc      formatTime(hours=23, minutes=0, seconds=3) returns "23:00:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0094 begin`);
      const actual: string = formatTime(23, 0, 3);
      logInfo(`formatTime(hours=23, minutes=0, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('23:00:03');
      logInfo(`${BUNDLE}FormatTime_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0095
     * @tc.name      FormExtAbility_FormatTime_0095
     * @tc.desc      formatTime(hours=117, minutes=141, seconds=100) returns "117:141:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0095 begin`);
      const actual: string = formatTime(117, 141, 100);
      logInfo(`formatTime(hours=117, minutes=141, second...: actual=${actual}`);
      expect(actual).assertEqual('117:141:100');
      logInfo(`${BUNDLE}FormatTime_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0096
     * @tc.name      FormExtAbility_FormatTime_0096
     * @tc.desc      formatTime(hours=1, minutes=-1, seconds=3) returns "01:0-1:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0096 begin`);
      const actual: string = formatTime(1, -1, 3);
      logInfo(`formatTime(hours=1, minutes=-1, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('01:0-1:03');
      logInfo(`${BUNDLE}FormatTime_0096 end`);
    });
  });
}
