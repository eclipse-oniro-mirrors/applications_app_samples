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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { common, contextConstant } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import { requireContext, requireModule, requireBundleInfo, byteLength, payload, probeFile, probeEvents,
  probeIndex, switchArea, FileProbe, EventProbe, IndexProbe } from '../Shared/ContextProbe';

export default function commonEventValidationTest(): void {
  describe('CommonEventValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'CommonEventValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0001
     * @tc.name CommonEventValidation_001
     * @tc.desc Verify 2 ordered event payloads, 5 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation46', values, 5);
      expect(actual.received.length).assertEqual(2);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0002
     * @tc.name CommonEventValidation_002
     * @tc.desc Verify 3 ordered event payloads, 5 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation47', values, 5);
      expect(actual.received.length).assertEqual(3);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0003
     * @tc.name CommonEventValidation_003
     * @tc.desc Verify 5 ordered event payloads, 5 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation48', values, 5);
      expect(actual.received.length).assertEqual(5);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0004
     * @tc.name CommonEventValidation_004
     * @tc.desc Verify 8 ordered event payloads, 5 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation49', values, 5);
      expect(actual.received.length).assertEqual(8);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0005
     * @tc.name CommonEventValidation_005
     * @tc.desc Verify 13 ordered event payloads, 5 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation50', values, 5);
      expect(actual.received.length).assertEqual(13);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0006
     * @tc.name CommonEventValidation_006
     * @tc.desc Verify 21 ordered event payloads, 5 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation51', values, 5);
      expect(actual.received.length).assertEqual(21);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0007
     * @tc.name CommonEventValidation_007
     * @tc.desc Verify 34 ordered event payloads, 5 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation52', values, 5);
      expect(actual.received.length).assertEqual(34);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0008
     * @tc.name CommonEventValidation_008
     * @tc.desc Verify 55 ordered event payloads, 5 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation53', values, 5);
      expect(actual.received.length).assertEqual(55);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0009
     * @tc.name CommonEventValidation_009
     * @tc.desc Verify 89 ordered event payloads, 5 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation54', values, 5);
      expect(actual.received.length).assertEqual(89);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0010
     * @tc.name CommonEventValidation_010
     * @tc.desc Verify 0 ordered event payloads, 8 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation55', values, 8);
      expect(actual.received.length).assertEqual(0);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0011
     * @tc.name CommonEventValidation_011
     * @tc.desc Verify 1 ordered event payloads, 8 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation56', values, 8);
      expect(actual.received.length).assertEqual(1);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0012
     * @tc.name CommonEventValidation_012
     * @tc.desc Verify 2 ordered event payloads, 8 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation57', values, 8);
      expect(actual.received.length).assertEqual(2);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0013
     * @tc.name CommonEventValidation_013
     * @tc.desc Verify 3 ordered event payloads, 8 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation58', values, 8);
      expect(actual.received.length).assertEqual(3);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0014
     * @tc.name CommonEventValidation_014
     * @tc.desc Verify 5 ordered event payloads, 8 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation59', values, 8);
      expect(actual.received.length).assertEqual(5);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0015
     * @tc.name CommonEventValidation_015
     * @tc.desc Verify 8 ordered event payloads, 8 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation60', values, 8);
      expect(actual.received.length).assertEqual(8);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0016
     * @tc.name CommonEventValidation_016
     * @tc.desc Verify 13 ordered event payloads, 8 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation61', values, 8);
      expect(actual.received.length).assertEqual(13);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0017
     * @tc.name CommonEventValidation_017
     * @tc.desc Verify 21 ordered event payloads, 8 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation62', values, 8);
      expect(actual.received.length).assertEqual(21);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0018
     * @tc.name CommonEventValidation_018
     * @tc.desc Verify 34 ordered event payloads, 8 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation63', values, 8);
      expect(actual.received.length).assertEqual(34);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0019
     * @tc.name CommonEventValidation_019
     * @tc.desc Verify 55 ordered event payloads, 8 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation64', values, 8);
      expect(actual.received.length).assertEqual(55);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0020
     * @tc.name CommonEventValidation_020
     * @tc.desc Verify 89 ordered event payloads, 8 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation65', values, 8);
      expect(actual.received.length).assertEqual(89);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0021
     * @tc.name CommonEventValidation_021
     * @tc.desc Verify 0 ordered event payloads, 13 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation66', values, 13);
      expect(actual.received.length).assertEqual(0);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0022
     * @tc.name CommonEventValidation_022
     * @tc.desc Verify 1 ordered event payloads, 13 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation67', values, 13);
      expect(actual.received.length).assertEqual(1);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0023
     * @tc.name CommonEventValidation_023
     * @tc.desc Verify 2 ordered event payloads, 13 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation68', values, 13);
      expect(actual.received.length).assertEqual(2);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0024
     * @tc.name CommonEventValidation_024
     * @tc.desc Verify 3 ordered event payloads, 13 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation69', values, 13);
      expect(actual.received.length).assertEqual(3);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0025
     * @tc.name CommonEventValidation_025
     * @tc.desc Verify 5 ordered event payloads, 13 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation70', values, 13);
      expect(actual.received.length).assertEqual(5);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0026
     * @tc.name CommonEventValidation_026
     * @tc.desc Verify 8 ordered event payloads, 13 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation71', values, 13);
      expect(actual.received.length).assertEqual(8);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0027
     * @tc.name CommonEventValidation_027
     * @tc.desc Verify 13 ordered event payloads, 13 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation72', values, 13);
      expect(actual.received.length).assertEqual(13);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0028
     * @tc.name CommonEventValidation_028
     * @tc.desc Verify 21 ordered event payloads, 13 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation73', values, 13);
      expect(actual.received.length).assertEqual(21);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0029
     * @tc.name CommonEventValidation_029
     * @tc.desc Verify 34 ordered event payloads, 13 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation74', values, 13);
      expect(actual.received.length).assertEqual(34);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0030
     * @tc.name CommonEventValidation_030
     * @tc.desc Verify 55 ordered event payloads, 13 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation75', values, 13);
      expect(actual.received.length).assertEqual(55);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0031
     * @tc.name CommonEventValidation_031
     * @tc.desc Verify 89 ordered event payloads, 13 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation76', values, 13);
      expect(actual.received.length).assertEqual(89);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0032
     * @tc.name CommonEventValidation_032
     * @tc.desc Verify 1 ordered event payloads, 0 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation78', values, 0);
      expect(actual.received.length).assertEqual(1);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0033
     * @tc.name CommonEventValidation_033
     * @tc.desc Verify 2 ordered event payloads, 0 emissions after off, payload 0123456789 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('0123456789', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation79', values, 0);
      expect(actual.received.length).assertEqual(2);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0034
     * @tc.name CommonEventValidation_034
     * @tc.desc Verify 3 ordered event payloads, 0 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation80', values, 0);
      expect(actual.received.length).assertEqual(3);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0035
     * @tc.name CommonEventValidation_035
     * @tc.desc Verify 5 ordered event payloads, 0 emissions after off, payload 😀 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('😀', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation81', values, 0);
      expect(actual.received.length).assertEqual(5);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0036
     * @tc.name CommonEventValidation_036
     * @tc.desc Verify 8 ordered event payloads, 0 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation82', values, 0);
      expect(actual.received.length).assertEqual(8);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0037
     * @tc.name CommonEventValidation_037
     * @tc.desc Verify 13 ordered event payloads, 0 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_037', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation83', values, 0);
      expect(actual.received.length).assertEqual(13);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0038
     * @tc.name CommonEventValidation_038
     * @tc.desc Verify 21 ordered event payloads, 0 emissions after off, payload a repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_038', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('a', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation84', values, 0);
      expect(actual.received.length).assertEqual(21);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0039
     * @tc.name CommonEventValidation_039
     * @tc.desc Verify 34 ordered event payloads, 0 emissions after off, payload 中 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_039', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('中', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation85', values, 0);
      expect(actual.received.length).assertEqual(34);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0040
     * @tc.name CommonEventValidation_040
     * @tc.desc Verify 55 ordered event payloads, 0 emissions after off, payload 😀 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_040', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('😀', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation86', values, 0);
      expect(actual.received.length).assertEqual(55);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_COMMONEVENTVALIDATION_0041
     * @tc.name CommonEventValidation_041
     * @tc.desc Verify 89 ordered event payloads, 0 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('CommonEventValidation_041', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('CommonEventValidation87', values, 0);
      expect(actual.received.length).assertEqual(89);
      for (let index: number = 0; index < values.length; index++) {
        expect(actual.received[index]).assertEqual(values[index]);
      }
      expect(actual.unrelated).assertEqual(0);
      expect(actual.afterOff).assertEqual(0);
      expect(context.filesDir).assertEqual(original);
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
  });
}
