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

import { describe, it, expect } from '@ohos/hypium';
import TestLogger from '../../utils/Logger';
import MainLogger from '../../../../main/ets/util/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.LOGGER;
const LONG_LENGTH: number = 4096;
const VERY_LONG_LENGTH: number = 16384;
const REPEAT_COUNT: number = 200;

function buildRepeated(unit: string, length: number): string {
  let result: string = '';
  while (result.length < length) {
    result += unit;
  }
  return result;
}

/**
 * Logging utility contract. Both the application logger and the test logger
 * wrap hilog, so the suite drives every severity with the payload shapes that
 * the page actually produces and asserts that formatting never throws.
 */
export default function loggerTest(): void {
  describe('LottieLoggerTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0100
     * @tc.name infoWithTwoArguments001
     * @tc.desc Verify the info channel accepts a tag and a message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'infoWithTwoArguments_001', 0, (): void => {
      TestLogger.info(TAG, 'infoWithTwoArguments_001 begin');
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, 'loggerInfoWithTwoArguments');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'infoWithTwoArguments_001, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'infoWithTwoArguments_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0200
     * @tc.name allSeverities002
     * @tc.desc Verify every application logger severity accepts a message
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'allSeverities_002', 0, (): void => {
      TestLogger.info(TAG, 'allSeverities_002 begin');
      let threw: boolean = false;
      try {
        MainLogger.debug(TAG, 'debugMessage');
        MainLogger.info(TAG, 'infoMessage');
        MainLogger.warn(TAG, 'warnMessage');
        MainLogger.error(TAG, 'errorMessage');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'allSeverities_002, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'allSeverities_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0300
     * @tc.name singleArgument003
     * @tc.desc Verify the info channel accepts a single argument
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'singleArgument_003', 0, (): void => {
      TestLogger.info(TAG, 'singleArgument_003 begin');
      let threw: boolean = false;
      try {
        TestLogger.info(TAG);
        MainLogger.info('singleArgumentMessage');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'singleArgument_003, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'singleArgument_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0400
     * @tc.name threeArguments004
     * @tc.desc Verify the logger accepts more arguments than the format string declares
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'threeArguments_004', 0, (): void => {
      TestLogger.info(TAG, 'threeArguments_004 begin');
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, 'firstArgument', 'secondArgument');
        TestLogger.info(TAG, 'firstArgument', 'secondArgument');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'threeArguments_004, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'threeArguments_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0500
     * @tc.name longPayload005
     * @tc.desc Verify a four kilobyte payload does not break the logger
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'longPayload_005', 0, (): void => {
      TestLogger.info(TAG, 'longPayload_005 begin');
      const payload: string = buildRepeated('lottie-log-', LONG_LENGTH);
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, payload);
      } catch (error) {
        threw = true;
      }
      const check01: boolean = payload.length >= LONG_LENGTH;
      TestLogger.info(TAG, 'longPayload_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = threw;
      TestLogger.info(TAG, 'longPayload_005, check02=' + JSON.stringify(check02));
      expect(check02).assertFalse();
      TestLogger.info(TAG, 'longPayload_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0600
     * @tc.name veryLongPayload006
     * @tc.desc Verify a sixteen kilobyte payload does not break the logger
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'veryLongPayload_006', 0, (): void => {
      TestLogger.info(TAG, 'veryLongPayload_006 begin');
      const payload: string = buildRepeated('0123456789', VERY_LONG_LENGTH);
      let threw: boolean = false;
      try {
        TestLogger.error(TAG, payload);
      } catch (error) {
        threw = true;
      }
      const check01: boolean = payload.length >= VERY_LONG_LENGTH;
      TestLogger.info(TAG, 'veryLongPayload_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = threw;
      TestLogger.info(TAG, 'veryLongPayload_006, check02=' + JSON.stringify(check02));
      expect(check02).assertFalse();
      TestLogger.info(TAG, 'veryLongPayload_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0700
     * @tc.name formatTokensAreLiteral007
     * @tc.desc Verify format tokens inside a payload are treated as plain text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'formatTokensAreLiteral_007', 0, (): void => {
      TestLogger.info(TAG, 'formatTokensAreLiteral_007 begin');
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, '%s %d %{public}s %{private}d');
        TestLogger.info(TAG, '100% complete');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'formatTokensAreLiteral_007, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'formatTokensAreLiteral_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0800
     * @tc.name controlCharacters008
     * @tc.desc Verify newlines and tabs inside a payload are accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'controlCharacters_008', 0, (): void => {
      TestLogger.info(TAG, 'controlCharacters_008 begin');
      let threw: boolean = false;
      try {
        MainLogger.warn(TAG, 'lineOne\nlineTwo\tlineThree\r\nlineFour');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'controlCharacters_008, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'controlCharacters_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_0900
     * @tc.name unicodePayload009
     * @tc.desc Verify non ASCII characters in a payload are accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'unicodePayload_009', 0, (): void => {
      TestLogger.info(TAG, 'unicodePayload_009 begin');
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, 'animation loop complete');
        TestLogger.info(TAG, 'grunt animation frame advanced');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'unicodePayload_009, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'unicodePayload_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_1000
     * @tc.name repeatedCalls010
     * @tc.desc Verify two hundred consecutive log calls complete without failure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'repeatedCalls_010', 0, (): void => {
      TestLogger.info(TAG, 'repeatedCalls_010 begin');
      let threw: boolean = false;
      try {
        for (let index: number = 0; index < REPEAT_COUNT; index++) {
          if (index % 2 === 0) {
            MainLogger.info(TAG, 'repeatedCall', index.toString());
          } else {
            TestLogger.debug(TAG, 'repeatedCall', index.toString());
          }
        }
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'repeatedCalls_010, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'repeatedCalls_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_1100
     * @tc.name emptyPayload011
     * @tc.desc Verify an empty message is accepted by both loggers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'emptyPayload_011', 0, (): void => {
      TestLogger.info(TAG, 'emptyPayload_011 begin');
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, '');
        TestLogger.warn(TAG, '');
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'emptyPayload_011, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'emptyPayload_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_1200
     * @tc.name jsonPayload012
     * @tc.desc Verify a serialized object payload is accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'jsonPayload_012', 0, (): void => {
      TestLogger.info(TAG, 'jsonPayload_012 begin');
      const payload: string = JSON.stringify({
        asset: 'grunt',
        frame: 250,
        speed: 2,
        direction: -1
      });
      let threw: boolean = false;
      try {
        MainLogger.info(TAG, payload);
      } catch (error) {
        threw = true;
      }
      const check01: boolean = payload.length > 0;
      TestLogger.info(TAG, 'jsonPayload_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = threw;
      TestLogger.info(TAG, 'jsonPayload_012, check02=' + JSON.stringify(check02));
      expect(check02).assertFalse();
      TestLogger.info(TAG, 'jsonPayload_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LOGGER_1300
     * @tc.name interleavedSeverities013
     * @tc.desc Verify alternating severities keep the logger usable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'interleavedSeverities_013', 0, (): void => {
      TestLogger.info(TAG, 'interleavedSeverities_013 begin');
      let threw: boolean = false;
      try {
        for (let round: number = 0; round < 25; round++) {
          MainLogger.debug(TAG, 'debugRound', round.toString());
          MainLogger.info(TAG, 'infoRound', round.toString());
          MainLogger.warn(TAG, 'warnRound', round.toString());
          MainLogger.error(TAG, 'errorRound', round.toString());
        }
      } catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      TestLogger.info(TAG, 'interleavedSeverities_013, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      TestLogger.info(TAG, 'interleavedSeverities_013 end');
    });
  });
}
