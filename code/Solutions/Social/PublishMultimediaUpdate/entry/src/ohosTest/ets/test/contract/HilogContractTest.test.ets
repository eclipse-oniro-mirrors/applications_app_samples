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
import hilog from '@ohos.hilog';
import { BUNDLE, DOMAIN, TAG } from '../common/TestConstant';
/**
 * Logging facility used by the sample.
 * Both the application logger and this suite go through hilog with a public
 * format string. The cases check that each severity accepts the argument forms
 * the sample uses and that unusual payloads never abort a code path.
 */
function buildPayload(length: number, filler: string): string {
  let payload: string = '';
  while (payload.length < length) {
    payload += filler;
  }
  return payload.substring(0, length);
}
export default function hilogContractTest() {
  describe('HilogContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0100
     * @tc.name InfoSingleValue001
     * @tc.desc Verify info single value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InfoSingleValue_001', 0, (): void => {
      let threw: boolean = false;
      try {
        hilog.info(DOMAIN, TAG, 'single value');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0200
     * @tc.name InfoFormatAndArgs002
     * @tc.desc Verify info format and args
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'InfoFormatAndArgs_002', 0, (): void => {
      let threw: boolean = false;
      try {
        hilog.info(DOMAIN, TAG, '%{public}s, %{public}s', 'first', 'second');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0300
     * @tc.name DebugChannelWorks003
     * @tc.desc Verify debug channel works
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DebugChannelWorks_003', 0, (): void => {
      let threw: boolean = false;
      try {
        hilog.debug(DOMAIN, TAG, 'debug message');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0400
     * @tc.name WarnChannelWorks004
     * @tc.desc Verify warn channel works
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WarnChannelWorks_004', 0, (): void => {
      let threw: boolean = false;
      try {
        hilog.warn(DOMAIN, TAG, 'warn message');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0500
     * @tc.name ErrorChannelWorks005
     * @tc.desc Verify error channel works
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ErrorChannelWorks_005', 0, (): void => {
      let threw: boolean = false;
      try {
        hilog.error(DOMAIN, TAG, 'error message');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0600
     * @tc.name LongPayloadAccepted006
     * @tc.desc Verify long payload accepted, as covered by the hilog contract test suite
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongPayloadAccepted_006', 0, (): void => {
      const payload: string = buildPayload(4096, 'publish-log-');
      let threw: boolean = false;
      try {
        hilog.info(DOMAIN, TAG, '%{public}s', payload);
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0700
     * @tc.name EmptyPayloadAccepted007
     * @tc.desc Verify empty payload accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyPayloadAccepted_007', 0, (): void => {
      let threw: boolean = false;
      try {
        hilog.info(DOMAIN, TAG, '%{public}s', '');
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw;
      expect(check01).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0800
     * @tc.name RepeatedWritesStable008
     * @tc.desc Verify repeated writes stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedWritesStable_008', 0, (): void => {
      let failures: number = 0;
      for (let index: number = 0; index < 100; index++) {
        try {
          hilog.info(DOMAIN, TAG, 'repeat ' + index);
        }
        catch (error) {
          failures += 1;
        }
      }
      expect(failures).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_HILOG_0900
     * @tc.name MultiLinePayloadAccepted009
     * @tc.desc Verify multi line payload accepted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MultiLinePayloadAccepted_009', 0, (): void => {
      const payloads: Array<string> = ['line one\nline two\ttabbed', 'first\nsecond'];
      let failures: number = 0;
      for (let index: number = 0; index < payloads.length; index++) {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', payloads[index]);
        }
        catch (error) {
          failures += 1;
        }
      }
      expect(failures).assertEqual(0);
    });
  });
}
