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

export default function eventPropagationTest(): void {
  describe('EventPropagation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'EventPropagation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0001
     * @tc.name EventPropagation_001
     * @tc.desc Verify 3 ordered event payloads, 2 emissions after off, payload 0123456789 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('0123456789', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation102', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0002
     * @tc.name EventPropagation_002
     * @tc.desc Verify 5 ordered event payloads, 2 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation103', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0003
     * @tc.name EventPropagation_003
     * @tc.desc Verify 8 ordered event payloads, 2 emissions after off, payload 中 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('中', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation104', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0004
     * @tc.name EventPropagation_004
     * @tc.desc Verify 13 ordered event payloads, 2 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation105', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0005
     * @tc.name EventPropagation_005
     * @tc.desc Verify 21 ordered event payloads, 2 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation106', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0006
     * @tc.name EventPropagation_006
     * @tc.desc Verify 34 ordered event payloads, 2 emissions after off, payload a repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('a', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation107', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0007
     * @tc.name EventPropagation_007
     * @tc.desc Verify 55 ordered event payloads, 2 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation108', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0008
     * @tc.name EventPropagation_008
     * @tc.desc Verify 89 ordered event payloads, 2 emissions after off, payload 😀 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('😀', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation109', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0009
     * @tc.name EventPropagation_009
     * @tc.desc Verify 1 ordered event payloads, 3 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation111', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0010
     * @tc.name EventPropagation_010
     * @tc.desc Verify 2 ordered event payloads, 3 emissions after off, payload a repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('a', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation112', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0011
     * @tc.name EventPropagation_011
     * @tc.desc Verify 3 ordered event payloads, 3 emissions after off, payload 中 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('中', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation113', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0012
     * @tc.name EventPropagation_012
     * @tc.desc Verify 5 ordered event payloads, 3 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation114', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0013
     * @tc.name EventPropagation_013
     * @tc.desc Verify 8 ordered event payloads, 3 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation115', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0014
     * @tc.name EventPropagation_014
     * @tc.desc Verify 13 ordered event payloads, 3 emissions after off, payload 0123456789 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('0123456789', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation116', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0015
     * @tc.name EventPropagation_015
     * @tc.desc Verify 21 ordered event payloads, 3 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation117', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0016
     * @tc.name EventPropagation_016
     * @tc.desc Verify 34 ordered event payloads, 3 emissions after off, payload 中 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('中', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation118', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0017
     * @tc.name EventPropagation_017
     * @tc.desc Verify 55 ordered event payloads, 3 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation119', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0018
     * @tc.name EventPropagation_018
     * @tc.desc Verify 89 ordered event payloads, 3 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation120', values, 3);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0019
     * @tc.name EventPropagation_019
     * @tc.desc Verify 1 ordered event payloads, 5 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation122', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0020
     * @tc.name EventPropagation_020
     * @tc.desc Verify 2 ordered event payloads, 5 emissions after off, payload 😀 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('😀', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation123', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0021
     * @tc.name EventPropagation_021
     * @tc.desc Verify 3 ordered event payloads, 5 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation124', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0022
     * @tc.name EventPropagation_022
     * @tc.desc Verify 5 ordered event payloads, 5 emissions after off, payload 0123456789 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('0123456789', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation125', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0023
     * @tc.name EventPropagation_023
     * @tc.desc Verify 8 ordered event payloads, 5 emissions after off, payload a repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('a', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation126', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0024
     * @tc.name EventPropagation_024
     * @tc.desc Verify 13 ordered event payloads, 5 emissions after off, payload 中 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('中', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation127', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0025
     * @tc.name EventPropagation_025
     * @tc.desc Verify 21 ordered event payloads, 5 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation128', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0026
     * @tc.name EventPropagation_026
     * @tc.desc Verify 34 ordered event payloads, 5 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation129', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0027
     * @tc.name EventPropagation_027
     * @tc.desc Verify 55 ordered event payloads, 5 emissions after off, payload 0123456789 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('0123456789', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation130', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0028
     * @tc.name EventPropagation_028
     * @tc.desc Verify 89 ordered event payloads, 5 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation131', values, 5);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0029
     * @tc.name EventPropagation_029
     * @tc.desc Verify 1 ordered event payloads, 8 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation133', values, 8);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0030
     * @tc.name EventPropagation_030
     * @tc.desc Verify 2 ordered event payloads, 8 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation134', values, 8);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0031
     * @tc.name EventPropagation_031
     * @tc.desc Verify 3 ordered event payloads, 8 emissions after off, payload a repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('a', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation135', values, 8);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0032
     * @tc.name EventPropagation_032
     * @tc.desc Verify 5 ordered event payloads, 8 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation136', values, 8);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTPROPAGATION_0033
     * @tc.name EventPropagation_033
     * @tc.desc Verify 8 ordered event payloads, 8 emissions after off, payload 😀 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventPropagation_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('😀', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventPropagation137', values, 8);
      expect(actual.received.length).assertEqual(8);
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
