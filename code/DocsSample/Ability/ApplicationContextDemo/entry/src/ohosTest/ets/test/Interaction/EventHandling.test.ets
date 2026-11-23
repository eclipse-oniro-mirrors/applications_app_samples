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

export default function eventHandlingTest(): void {
  describe('EventHandling', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'EventHandling completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0001
     * @tc.name EventHandling_001
     * @tc.desc Verify 1 ordered event payloads, 1 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling89', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0002
     * @tc.name EventHandling_002
     * @tc.desc Verify 2 ordered event payloads, 1 emissions after off, payload 中 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('中', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling90', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0003
     * @tc.name EventHandling_003
     * @tc.desc Verify 3 ordered event payloads, 1 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling91', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0004
     * @tc.name EventHandling_004
     * @tc.desc Verify 5 ordered event payloads, 1 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling92', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0005
     * @tc.name EventHandling_005
     * @tc.desc Verify 8 ordered event payloads, 1 emissions after off, payload 0123456789 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        values.push(payload('0123456789', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling93', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0006
     * @tc.name EventHandling_006
     * @tc.desc Verify 13 ordered event payloads, 1 emissions after off, payload Z9 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 13; index++) {
        values.push(payload('Z9', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling94', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0007
     * @tc.name EventHandling_007
     * @tc.desc Verify 21 ordered event payloads, 1 emissions after off, payload 😀 repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 21; index++) {
        values.push(payload('😀', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling95', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0008
     * @tc.name EventHandling_008
     * @tc.desc Verify 34 ordered event payloads, 1 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 34; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling96', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0009
     * @tc.name EventHandling_009
     * @tc.desc Verify 55 ordered event payloads, 1 emissions after off, payload é repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 55; index++) {
        values.push(payload('é', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling97', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0010
     * @tc.name EventHandling_010
     * @tc.desc Verify 89 ordered event payloads, 1 emissions after off, payload a repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 89; index++) {
        values.push(payload('a', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling98', values, 1);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0011
     * @tc.name EventHandling_011
     * @tc.desc Verify 1 ordered event payloads, 2 emissions after off, payload \n repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        values.push(payload('\n', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling100', values, 2);
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
     * @tc.number SUB_APPLICATIONCONTEXT_EVENTHANDLING_0012
     * @tc.name EventHandling_012
     * @tc.desc Verify 2 ordered event payloads, 2 emissions after off, payload space  repeated 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('EventHandling_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const original: string = context.filesDir;
      const values: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        values.push(payload('space ', 2) + ':' + index.toString());
      }
      const actual: EventProbe = await probeEvents('EventHandling101', values, 2);
      expect(actual.received.length).assertEqual(2);
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
