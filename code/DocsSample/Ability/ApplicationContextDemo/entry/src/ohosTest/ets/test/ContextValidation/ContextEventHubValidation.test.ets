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

export default function contextEventHubValidationTest(): void {
  describe('ContextEventHubValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextEventHubValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0001
     * @tc.name ContextEventHubValidation_001
     * @tc.desc Verify 0 ordered event payloads, 0 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation0', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0002
     * @tc.name ContextEventHubValidation_002
     * @tc.desc Verify 1 ordered event payloads, 0 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation1', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0003
     * @tc.name ContextEventHubValidation_003
     * @tc.desc Verify 2 ordered event payloads, 0 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation2', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0004
     * @tc.name ContextEventHubValidation_004
     * @tc.desc Verify 3 ordered event payloads, 0 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation3', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0005
     * @tc.name ContextEventHubValidation_005
     * @tc.desc Verify 5 ordered event payloads, 0 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation4', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0006
     * @tc.name ContextEventHubValidation_006
     * @tc.desc Verify 8 ordered event payloads, 0 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation5', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0007
     * @tc.name ContextEventHubValidation_007
     * @tc.desc Verify 13 ordered event payloads, 0 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation6', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0008
     * @tc.name ContextEventHubValidation_008
     * @tc.desc Verify 21 ordered event payloads, 0 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation7', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0009
     * @tc.name ContextEventHubValidation_009
     * @tc.desc Verify 34 ordered event payloads, 0 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation8', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0010
     * @tc.name ContextEventHubValidation_010
     * @tc.desc Verify 55 ordered event payloads, 0 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation9', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0011
     * @tc.name ContextEventHubValidation_011
     * @tc.desc Verify 89 ordered event payloads, 0 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation10', values, 0);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0012
     * @tc.name ContextEventHubValidation_012
     * @tc.desc Verify 0 ordered event payloads, 1 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation11', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0013
     * @tc.name ContextEventHubValidation_013
     * @tc.desc Verify 1 ordered event payloads, 1 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation12', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0014
     * @tc.name ContextEventHubValidation_014
     * @tc.desc Verify 2 ordered event payloads, 1 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation13', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0015
     * @tc.name ContextEventHubValidation_015
     * @tc.desc Verify 3 ordered event payloads, 1 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation14', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0016
     * @tc.name ContextEventHubValidation_016
     * @tc.desc Verify 5 ordered event payloads, 1 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation15', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0017
     * @tc.name ContextEventHubValidation_017
     * @tc.desc Verify 8 ordered event payloads, 1 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation16', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0018
     * @tc.name ContextEventHubValidation_018
     * @tc.desc Verify 13 ordered event payloads, 1 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation17', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0019
     * @tc.name ContextEventHubValidation_019
     * @tc.desc Verify 21 ordered event payloads, 1 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation18', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0020
     * @tc.name ContextEventHubValidation_020
     * @tc.desc Verify 34 ordered event payloads, 1 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation19', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0021
     * @tc.name ContextEventHubValidation_021
     * @tc.desc Verify 55 ordered event payloads, 1 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation20', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0022
     * @tc.name ContextEventHubValidation_022
     * @tc.desc Verify 89 ordered event payloads, 1 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation21', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0023
     * @tc.name ContextEventHubValidation_023
     * @tc.desc Verify 0 ordered event payloads, 2 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation22', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0024
     * @tc.name ContextEventHubValidation_024
     * @tc.desc Verify 1 ordered event payloads, 2 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation23', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0025
     * @tc.name ContextEventHubValidation_025
     * @tc.desc Verify 2 ordered event payloads, 2 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation24', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0026
     * @tc.name ContextEventHubValidation_026
     * @tc.desc Verify 3 ordered event payloads, 2 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation25', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0027
     * @tc.name ContextEventHubValidation_027
     * @tc.desc Verify 5 ordered event payloads, 2 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation26', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0028
     * @tc.name ContextEventHubValidation_028
     * @tc.desc Verify 8 ordered event payloads, 2 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation27', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0029
     * @tc.name ContextEventHubValidation_029
     * @tc.desc Verify 13 ordered event payloads, 2 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation28', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0030
     * @tc.name ContextEventHubValidation_030
     * @tc.desc Verify 21 ordered event payloads, 2 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation29', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0031
     * @tc.name ContextEventHubValidation_031
     * @tc.desc Verify 34 ordered event payloads, 2 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation30', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0032
     * @tc.name ContextEventHubValidation_032
     * @tc.desc Verify 55 ordered event payloads, 2 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation31', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0033
     * @tc.name ContextEventHubValidation_033
     * @tc.desc Verify 89 ordered event payloads, 2 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation32', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0034
     * @tc.name ContextEventHubValidation_034
     * @tc.desc Verify 0 ordered event payloads, 3 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation33', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0035
     * @tc.name ContextEventHubValidation_035
     * @tc.desc Verify 1 ordered event payloads, 3 emissions after off, payload 中 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('中', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation34', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0036
     * @tc.name ContextEventHubValidation_036
     * @tc.desc Verify 2 ordered event payloads, 3 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation35', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0037
     * @tc.name ContextEventHubValidation_037
     * @tc.desc Verify 3 ordered event payloads, 3 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_037', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation36', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0038
     * @tc.name ContextEventHubValidation_038
     * @tc.desc Verify 5 ordered event payloads, 3 emissions after off, payload 0123456789 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_038', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('0123456789', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation37', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0039
     * @tc.name ContextEventHubValidation_039
     * @tc.desc Verify 8 ordered event payloads, 3 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_039', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation38', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0040
     * @tc.name ContextEventHubValidation_040
     * @tc.desc Verify 13 ordered event payloads, 3 emissions after off, payload 😀 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_040', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation39', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0041
     * @tc.name ContextEventHubValidation_041
     * @tc.desc Verify 21 ordered event payloads, 3 emissions after off, payload \n repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_041', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('\n', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation40', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0042
     * @tc.name ContextEventHubValidation_042
     * @tc.desc Verify 34 ordered event payloads, 3 emissions after off, payload é repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_042', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('é', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation41', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0043
     * @tc.name ContextEventHubValidation_043
     * @tc.desc Verify 55 ordered event payloads, 3 emissions after off, payload a repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_043', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('a', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation42', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0044
     * @tc.name ContextEventHubValidation_044
     * @tc.desc Verify 89 ordered event payloads, 3 emissions after off, payload Z9 repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_044', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('Z9', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation43', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0045
     * @tc.name ContextEventHubValidation_045
     * @tc.desc Verify 0 ordered event payloads, 5 emissions after off, payload none repeated 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_045', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        values.push(payload('😀', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation44', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTEVENTHUBVALIDATION_0046
     * @tc.name ContextEventHubValidation_046
     * @tc.desc Verify 1 ordered event payloads, 5 emissions after off, payload space  repeated 1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextEventHubValidation_046', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('space ', 1) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('ContextEventHubValidation45', values, 5);
      expect(actual.received.length).assertEqual(1);
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
