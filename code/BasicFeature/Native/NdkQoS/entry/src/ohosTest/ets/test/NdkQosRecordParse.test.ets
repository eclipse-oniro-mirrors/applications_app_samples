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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { ParsedRecordReport } from 'libentry.so';

const TAG: string = '[Sample_NdkQosParseTest]';
const DOMAIN: number = 0xF811;
const CODE_OK: number = 0;
const CODE_INVALID_ARG: number = 401;
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;
const DURATION_TOLERANCE: number = 0.001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const SETTLE_INTERVAL: number = 120;

function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

function isNear(left: number, right: number): boolean {
  return Math.abs(left - right) <= DURATION_TOLERANCE;
}

export default function ndkQosParseTest(): void {
  describe('NdkQosParse', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0001
     * @tc.name      testNdkQosParse0001
     * @tc.desc      Checks a complete record line is parsed into every field without loss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0001 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('5,1234.500,0,5,0,0');
      logInfo('parsed = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(5);
      expect(isNear(report.duration, 1234.5)).assertTrue();
      expect(report.setResult).assertEqual(0);
      expect(report.queryLevel).assertEqual(5);
      expect(report.resetResult).assertEqual(0);
      expect(report.bindResult).assertEqual(0);
      logInfo('testNdkQosParse0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0002
     * @tc.name      testNdkQosParse0002
     * @tc.desc      Checks the lowest QoS level is accepted and echoed as written.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0002 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('0,880.000,0,0,0,0');
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(0);
      expect(isNear(report.duration, 880)).assertTrue();
      expect(report.queryLevel).assertEqual(0);
      logInfo('testNdkQosParse0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0003
     * @tc.name      testNdkQosParse0003
     * @tc.desc      Checks the highest QoS level is accepted and echoed as written.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0003 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('5,640.250,0,5,0,0');
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(5);
      expect(isNear(report.duration, 640.25)).assertTrue();
      expect(report.resetResult).assertEqual(0);
      logInfo('testNdkQosParse0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0004
     * @tc.name      testNdkQosParse0004
     * @tc.desc      Checks a zero duration record is still a valid record.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0004 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('2,0.000,0,2,0,0');
      expect(report.code).assertEqual(CODE_OK);
      expect(report.duration).assertEqual(0);
      expect(report.level).assertEqual(2);
      expect(report.setResult).assertEqual(0);
      logInfo('testNdkQosParse0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0005
     * @tc.name      testNdkQosParse0005
     * @tc.desc      Checks a fractional duration keeps millisecond precision after the round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0005 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('3,0.125,0,3,0,0');
      logInfo('fractional duration = ' + report.duration.toString());
      expect(report.code).assertEqual(CODE_OK);
      expect(isNear(report.duration, 0.125)).assertTrue();
      expect(report.duration >= 0).assertTrue();
      logInfo('testNdkQosParse0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0006
     * @tc.name      testNdkQosParse0006
     * @tc.desc      Checks a record of a failed run keeps its negative result codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0006 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('4,12.500,-1,-1,-1,-1');
      logInfo('failed run record = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(4);
      expect(report.setResult).assertEqual(INVALID_RESULT);
      expect(report.queryLevel).assertEqual(INVALID_RESULT);
      expect(report.resetResult).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0007
     * @tc.name      testNdkQosParse0007
     * @tc.desc      Checks a level above the QoS range is rejected instead of clamped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0007 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('6,100.000,0,6,0,0');
      logInfo('out of range level record = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.level).assertEqual(INVALID_RESULT);
      expect(report.setResult).assertEqual(INVALID_RESULT);
      expect(report.queryLevel).assertEqual(INVALID_RESULT);
      expect(report.resetResult).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0008
     * @tc.name      testNdkQosParse0008
     * @tc.desc      Checks a negative level is rejected because no QoS level is below background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0008 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('-1,100.000,0,-1,0,0');
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.level).assertEqual(INVALID_RESULT);
      expect(report.setResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0009
     * @tc.name      testNdkQosParse0009
     * @tc.desc      Checks a negative duration is rejected so statistics never see a negative sample.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0009 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('2,-5.000,0,2,0,0');
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.duration).assertEqual(INVALID_DURATION);
      expect(report.level).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0010
     * @tc.name      testNdkQosParse0010
     * @tc.desc      Checks a line with fewer than six fields is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0010 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('5,100.000,0');
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.level).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0011
     * @tc.name      testNdkQosParse0011
     * @tc.desc      Checks a blank line is rejected rather than treated as an empty record.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0011 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('   ');
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.duration).assertEqual(INVALID_DURATION);
      expect(report.queryLevel).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0012
     * @tc.name      testNdkQosParse0012
     * @tc.desc      Checks text without the expected separators is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0012 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('5;100;0;5;0;0');
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.level).assertEqual(INVALID_RESULT);
      expect(report.resetResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0013
     * @tc.name      testNdkQosParse0013
     * @tc.desc      Checks a record with an empty duration field is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0013 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('5,,0,5,0,0');
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.duration).assertEqual(INVALID_DURATION);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      logInfo('testNdkQosParse0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0014
     * @tc.name      testNdkQosParse0014
     * @tc.desc      Checks an empty text is rejected without touching the sentinel fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0014 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('');
      logInfo('empty text record = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.level).assertEqual(INVALID_RESULT);
      expect(report.duration).assertEqual(INVALID_DURATION);
      expect(report.setResult).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosParse0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0015
     * @tc.name      testNdkQosParse0015
     * @tc.desc      Checks content after the sixth field is ignored so extra columns do not break old files.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0015 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('5,100.000,0,5,0,0,ignored');
      logInfo('trailing content parsed = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(5);
      expect(isNear(report.duration, 100)).assertTrue();
      logInfo('testNdkQosParse0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0016
     * @tc.name      testNdkQosParse0016
     * @tc.desc      Checks leading spaces before the level are tolerated.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0016 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('  2,64.000,0,2,0,0');
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(2);
      expect(isNear(report.duration, 64)).assertTrue();
      logInfo('testNdkQosParse0016 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0017
     * @tc.name      testNdkQosParse0017
     * @tc.desc      Checks a trailing line break from a file read does not break parsing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0017 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('1,42.000,0,1,0,0\n');
      expect(report.code).assertEqual(CODE_OK);
      expect(report.level).assertEqual(1);
      expect(report.queryLevel).assertEqual(1);
      expect(isNear(report.duration, 42)).assertTrue();
      logInfo('testNdkQosParse0017 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0018
     * @tc.name      testNdkQosParse0018
     * @tc.desc      Checks a very large duration is kept as a finite value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0018 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('0,987654.321,0,0,0,0');
      logInfo('large duration = ' + report.duration.toString());
      expect(report.code).assertEqual(CODE_OK);
      expect(isNear(report.duration, 987654.321)).assertTrue();
      expect(Number.isFinite(report.duration)).assertTrue();
      logInfo('testNdkQosParse0018 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0019
     * @tc.name      testNdkQosParse0019
     * @tc.desc      Checks large positive result codes from the platform are preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0019 begin');
      const report: ParsedRecordReport = testNapi.parseRunRecordLine('3,2000.000,401,3,1201,0');
      expect(report.code).assertEqual(CODE_OK);
      expect(report.setResult).assertEqual(401);
      expect(report.resetResult).assertEqual(1201);
      expect(report.bindResult).assertEqual(0);
      logInfo('testNdkQosParse0019 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0020
     * @tc.name      testNdkQosParse0020
     * @tc.desc      Checks a level field that is not numeric is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0020 begin');
      const invalid: ParsedRecordReport = testNapi.parseRunRecordLine('high,100.000,0,5,0,0');
      const valid: ParsedRecordReport = testNapi.parseRunRecordLine('5,100.000,0,5,0,0');
      logInfo('invalid then valid codes: ' + invalid.code.toString() + ', ' + valid.code.toString());
      expect(invalid.code).assertEqual(CODE_INVALID_ARG);
      expect(valid.code).assertEqual(CODE_OK);
      expect(valid.level).assertEqual(5);
      expect(valid.queryLevel).assertEqual(5);
      expect(isNear(valid.duration, 100)).assertTrue();
      logInfo('testNdkQosParse0020 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_PARSE_0021
     * @tc.name      testNdkQosParse0021
     * @tc.desc      Checks parsing the same text twice returns identical values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosParse0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosParse0021 begin');
      const first: ParsedRecordReport = testNapi.parseRunRecordLine('4,512.750,0,4,0,0');
      const second: ParsedRecordReport = testNapi.parseRunRecordLine('4,512.750,0,4,0,0');
      expect(second.code).assertEqual(first.code);
      expect(second.level).assertEqual(first.level);
      expect(second.duration).assertEqual(first.duration);
      expect(second.queryLevel).assertEqual(first.queryLevel);
      logInfo('testNdkQosParse0021 end');
    })
  })
}
