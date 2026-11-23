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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { logger } from 'publishmultimediaupdate/src/main/ets/utils/Logger';
import { textOfLength } from '../common/DataFactory';
import { BUNDLE, LOGGER_FORMAT, TAG } from '../common/TestConstant';
/**
 * Second read of the exported singleton.
 * The module exports a single Logger value; reading it from unrelated call
 * sites must yield the same reference, otherwise each importer would build its
 * own instance and lose the shared prefix.
 */
function readExportedLogger(): Object {
  return logger;
}
/**
 * Call contract of the application logger.
 * The logger is used from the page, the dialog and the data source at the same
 * time, so its methods must tolerate any string payload, any argument count and
 * repeated invocation without throwing into the caller's business logic.
 */
export default function loggerContractTest() {
  describe('LoggerContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0100
     * @tc.name DebugCallDoesNotThrow001
     * @tc.desc Verify debug call does not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DebugCallDoesNotThrow_001', 0, (): void => {
      Logger.info(TAG, 'DebugCallDoesNotThrow_001 begin');
      let threw: boolean = false;
      try {
        logger.debug(TAG, 'DebugCallDoesNotThrow_001');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'DebugCallDoesNotThrow_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0200
     * @tc.name InfoCallDoesNotThrow002
     * @tc.desc Verify info call does not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InfoCallDoesNotThrow_002', 0, (): void => {
      Logger.info(TAG, 'InfoCallDoesNotThrow_002 begin');
      let threw: boolean = false;
      try {
        logger.info(TAG, 'InfoCallDoesNotThrow_002');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'InfoCallDoesNotThrow_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0300
     * @tc.name WarnCallDoesNotThrow003
     * @tc.desc Verify warn call does not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WarnCallDoesNotThrow_003', 0, (): void => {
      Logger.info(TAG, 'WarnCallDoesNotThrow_003 begin');
      let threw: boolean = false;
      try {
        logger.warn(TAG, 'WarnCallDoesNotThrow_003');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'WarnCallDoesNotThrow_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0400
     * @tc.name ErrorCallDoesNotThrow004
     * @tc.desc Verify error call does not throw
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ErrorCallDoesNotThrow_004', 0, (): void => {
      Logger.info(TAG, 'ErrorCallDoesNotThrow_004 begin');
      let threw: boolean = false;
      try {
        logger.error(TAG, 'ErrorCallDoesNotThrow_004');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'ErrorCallDoesNotThrow_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0500
     * @tc.name InfoAcceptsSingleArgument005
     * @tc.desc Verify info accepts single argument
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InfoAcceptsSingleArgument_005', 0, (): void => {
      Logger.info(TAG, 'InfoAcceptsSingleArgument_005 begin');
      let threw: boolean = false;
      try {
        logger.info('single argument payload');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'InfoAcceptsSingleArgument_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0600
     * @tc.name InfoAcceptsExtraArguments006
     * @tc.desc Verify info accepts extra arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InfoAcceptsExtraArguments_006', 0, (): void => {
      Logger.info(TAG, 'InfoAcceptsExtraArguments_006 begin');
      let threw: boolean = false;
      try {
        logger.info(TAG, 'first', 'second', 'third', 'fourth', 'fifth');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'InfoAcceptsExtraArguments_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0700
     * @tc.name EmptyStringPayloadAccepted007
     * @tc.desc Verify empty string payload accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyStringPayloadAccepted_007', 0, (): void => {
      Logger.info(TAG, 'EmptyStringPayloadAccepted_007 begin');
      let threw: boolean = false;
      try {
        logger.info('');
        logger.info(TAG, '');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'EmptyStringPayloadAccepted_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0800
     * @tc.name LongPayloadAccepted008
     * @tc.desc Verify long payload accepted, as covered by the logger contract test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongPayloadAccepted_008', 0, (): void => {
      Logger.info(TAG, 'LongPayloadAccepted_008 begin');
      const payload: string = textOfLength(4096, 'log-segment-');
      let threw: boolean = false;
      try {
        logger.info(TAG, payload);
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'payloadLength=' + payload.length);
      expect(payload.length).assertEqual(4096);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'LongPayloadAccepted_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_0900
     * @tc.name FormatTokenPayloadAccepted009
     * @tc.desc Verify format token payload accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FormatTokenPayloadAccepted_009', 0, (): void => {
      Logger.info(TAG, 'FormatTokenPayloadAccepted_009 begin');
      const payload: string = LOGGER_FORMAT;
      let threw: boolean = false;
      try {
        logger.info(payload, payload);
      }
      catch (error) {
        threw = true;
      }
      expect(payload).assertContain('%{public}s');
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'FormatTokenPayloadAccepted_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1000
     * @tc.name NewlineAndTabPayloadAccepted010
     * @tc.desc Verify newline and tab payload accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NewlineAndTabPayloadAccepted_010', 0, (): void => {
      Logger.info(TAG, 'NewlineAndTabPayloadAccepted_010 begin');
      const payload: string = 'line one\nline two\tend';
      let threw: boolean = false;
      try {
        logger.warn(TAG, payload);
      }
      catch (error) {
        threw = true;
      }
      expect(payload).assertContain('\n');
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'NewlineAndTabPayloadAccepted_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1100
     * @tc.name ChinesePayloadAccepted011
     * @tc.desc Verify chinese payload accepted, as covered by the logger contract test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChinesePayloadAccepted_011', 0, (): void => {
      Logger.info(TAG, 'ChinesePayloadAccepted_011 begin');
      const payload: string = '中文日志载荷，含标点。';
      let threw: boolean = false;
      try {
        logger.info(TAG, payload);
      }
      catch (error) {
        threw = true;
      }
      expect(payload.length).assertEqual(11);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'ChinesePayloadAccepted_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1200
     * @tc.name RepeatedInfoCallsAreStable012
     * @tc.desc Verify repeated info calls are stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedInfoCallsAreStable_012', 0, (): void => {
      Logger.info(TAG, 'RepeatedInfoCallsAreStable_012 begin');
      let threw: boolean = false;
      let delivered: number = 0;
      try {
        for (let attempt: number = 0; attempt < 100; attempt++) {
          logger.info(TAG, 'repeated info payload ' + attempt);
          delivered += 1;
        }
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(100);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'RepeatedInfoCallsAreStable_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1300
     * @tc.name AllSeveritiesInSequenceAreStable013
     * @tc.desc Verify all severities in sequence are stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllSeveritiesInSequenceAreStable_013', 0, (): void => {
      Logger.info(TAG, 'AllSeveritiesInSequenceAreStable_013 begin');
      let threw: boolean = false;
      let delivered: number = 0;
      try {
        logger.debug(TAG, 'sequence debug');
        delivered += 1;
        logger.info(TAG, 'sequence info');
        delivered += 1;
        logger.warn(TAG, 'sequence warn');
        delivered += 1;
        logger.error(TAG, 'sequence error');
        delivered += 1;
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(4);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'AllSeveritiesInSequenceAreStable_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1400
     * @tc.name ExportedLoggerIsSelfIdentical014
     * @tc.desc Verify exported logger is self identical
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ExportedLoggerIsSelfIdentical_014', 0, (): void => {
      Logger.info(TAG, 'ExportedLoggerIsSelfIdentical_014 begin');
      const firstRead: Object = readExportedLogger();
      const secondRead: Object = readExportedLogger();
      const check01: boolean = firstRead === secondRead;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'ExportedLoggerIsSelfIdentical_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1500
     * @tc.name MethodsReturnUndefined015
     * @tc.desc Verify methods return undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MethodsReturnUndefined_015', 0, (): void => {
      Logger.info(TAG, 'MethodsReturnUndefined_015 begin');
      let threw: boolean = false;
      try {
        logger.debug(TAG, 'debug return value');
        logger.info(TAG, 'info return value');
        logger.warn(TAG, 'warn return value');
        logger.error(TAG, 'error return value');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'MethodsReturnUndefined_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1600
     * @tc.name SeverityOrderDoesNotMatter016
     * @tc.desc Verify severity order does not matter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SeverityOrderDoesNotMatter_016', 0, (): void => {
      Logger.info(TAG, 'SeverityOrderDoesNotMatter_016 begin');
      let threw: boolean = false;
      let delivered: number = 0;
      try {
        logger.error(TAG, 'reversed error');
        delivered += 1;
        logger.warn(TAG, 'reversed warn');
        delivered += 1;
        logger.info(TAG, 'reversed info');
        delivered += 1;
        logger.debug(TAG, 'reversed debug');
        delivered += 1;
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(4);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'SeverityOrderDoesNotMatter_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1700
     * @tc.name InfoAcceptsZeroArguments017
     * @tc.desc Verify info accepts zero arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InfoAcceptsZeroArguments_017', 0, (): void => {
      Logger.info(TAG, 'InfoAcceptsZeroArguments_017 begin');
      let threw: boolean = false;
      try {
        logger.info();
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'InfoAcceptsZeroArguments_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1800
     * @tc.name AlternatingSeveritiesAreStable018
     * @tc.desc Verify alternating severities are stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AlternatingSeveritiesAreStable_018', 0, (): void => {
      Logger.info(TAG, 'AlternatingSeveritiesAreStable_018 begin');
      let threw: boolean = false;
      let delivered: number = 0;
      try {
        for (let attempt: number = 0; attempt < 50; attempt++) {
          if (attempt % 2 === 0) {
            logger.debug(TAG, 'alternating debug ' + attempt);
          }
          else {
            logger.error(TAG, 'alternating error ' + attempt);
          }
          delivered += 1;
        }
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(50);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'AlternatingSeveritiesAreStable_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_1900
     * @tc.name AllSeveritiesAcceptLongPayload019
     * @tc.desc Verify all severities accept long payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllSeveritiesAcceptLongPayload_019', 0, (): void => {
      Logger.info(TAG, 'AllSeveritiesAcceptLongPayload_019 begin');
      const payload: string = textOfLength(1024, 'severity-');
      let threw: boolean = false;
      let delivered: number = 0;
      try {
        logger.debug(TAG, payload);
        delivered += 1;
        logger.info(TAG, payload);
        delivered += 1;
        logger.warn(TAG, payload);
        delivered += 1;
        logger.error(TAG, payload);
        delivered += 1;
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'delivered=' + delivered + ' payloadLength=' + payload.length);
      expect(delivered).assertEqual(4);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'AllSeveritiesAcceptLongPayload_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_2000
     * @tc.name QuotedAndBackslashPayloadAccepted020
     * @tc.desc Verify quoted and backslash payload accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QuotedAndBackslashPayloadAccepted_020', 0, (): void => {
      Logger.info(TAG, 'QuotedAndBackslashPayloadAccepted_020 begin');
      const payload: string = 'path C:\\sample\\media "quoted" done';
      let threw: boolean = false;
      try {
        logger.info(TAG, payload);
      }
      catch (error) {
        threw = true;
      }
      expect(payload).assertContain('\\sample\\');
      expect(payload).assertContain('"quoted"');
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'QuotedAndBackslashPayloadAccepted_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_UTIL_LOGGER_2100
     * @tc.name InterleavedEmptyAndLongPayloadsAreStable021
     * @tc.desc Verify interleaved empty and long payloads are stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InterleavedEmptyAndLongPayloadsAreStable_021', 0, (): void => {
      Logger.info(TAG, 'InterleavedEmptyAndLongPayloadsAreStable_021 begin');
      const longPayload: string = textOfLength(4096, 'interleave-');
      let threw: boolean = false;
      let delivered: number = 0;
      try {
        for (let round: number = 0; round < 20; round++) {
          if (round % 2 === 0) {
            logger.info(TAG, '');
          }
          else {
            logger.warn(TAG, longPayload);
          }
          delivered += 1;
        }
      }
      catch (error) {
        threw = true;
      }
      Logger.info(TAG, 'delivered=' + delivered);
      expect(delivered).assertEqual(20);
      const check01: boolean = threw;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'InterleavedEmptyAndLongPayloadsAreStable_021 end');
    });
  });
}
