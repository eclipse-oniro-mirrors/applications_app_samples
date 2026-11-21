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
import deviceInfo from '@ohos.deviceInfo';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * System capability gate.
 * The feed needs the full ArkUI surface (lazy list, custom dialog, tab bar) and
 * the media library picker. canIUse is the runtime gate an application uses to
 * decide whether the page can run at all, so its answers are pinned here for
 * the capabilities the sample actually depends on.
 */
const UNKNOWN_CAPABILITY: string = 'SystemCapability.Sample.Publish.NotReal';
export default function syscapContractTest() {
  describe('SyscapContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0100
     * @tc.name ArkUiFullAvailable001
     * @tc.desc Verify ark ui full available
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArkUiFullAvailable_001', 0, (): void => {
      Logger.info(TAG, 'ArkUiFullAvailable_001 begin');
      const available: boolean = canIUse('SystemCapability.ArkUI.ArkUI.Full');
      Logger.info(TAG, 'available=' + JSON.stringify(available));
      expect(available).assertTrue();
      Logger.info(TAG, 'ArkUiFullAvailable_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0200
     * @tc.name MediaLibraryPickerAvailable002
     * @tc.desc Verify media library picker available
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaLibraryPickerAvailable_002', 0, (): void => {
      Logger.info(TAG, 'MediaLibraryPickerAvailable_002 begin');
      const capabilities: Array<string> = ['SystemCapability.FileManagement.PhotoAccessHelper.Core'];
      let missing: number = 0;
      for (let index: number = 0; index < capabilities.length; index++) {
        if (!canIUse(capabilities[index])) {
          missing += 1;
        }
      }
      expect(missing).assertEqual(0);
      Logger.info(TAG, 'MediaLibraryPickerAvailable_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0300
     * @tc.name UnknownCapabilityIsFalse003
     * @tc.desc Verify unknown capability is false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnknownCapabilityIsFalse_003', 0, (): void => {
      Logger.info(TAG, 'UnknownCapabilityIsFalse_003 begin');
      const available: boolean = canIUse(UNKNOWN_CAPABILITY);
      expect(available).assertFalse();
      Logger.info(TAG, 'UnknownCapabilityIsFalse_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0400
     * @tc.name EmptyCapabilityIsFalse004
     * @tc.desc Verify empty capability is false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyCapabilityIsFalse_004', 0, (): void => {
      Logger.info(TAG, 'EmptyCapabilityIsFalse_004 begin');
      const available: boolean = canIUse('');
      expect(available).assertFalse();
      Logger.info(TAG, 'EmptyCapabilityIsFalse_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0500
     * @tc.name RepeatedProbeStable005
     * @tc.desc Verify repeated probe stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedProbeStable_005', 0, (): void => {
      Logger.info(TAG, 'RepeatedProbeStable_005 begin');
      const first: boolean = canIUse('SystemCapability.ArkUI.ArkUI.Full');
      const second: boolean = canIUse('SystemCapability.ArkUI.ArkUI.Full');
      expect(first).assertEqual(second);
      Logger.info(TAG, 'RepeatedProbeStable_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0600
     * @tc.name DistinctCapabilitiesIndependent006
     * @tc.desc Verify distinct capabilities independent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DistinctCapabilitiesIndependent_006', 0, (): void => {
      Logger.info(TAG, 'DistinctCapabilitiesIndependent_006 begin');
      const supported: boolean = canIUse('SystemCapability.ArkUI.ArkUI.Full');
      const unsupported: boolean = canIUse(UNKNOWN_CAPABILITY);
      const opposite: boolean = supported !== unsupported;
      Logger.info(TAG, 'opposite=' + JSON.stringify(opposite));
      expect(opposite).assertTrue();
      Logger.info(TAG, 'DistinctCapabilitiesIndependent_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0700
     * @tc.name DeviceTypeRecorded007
     * @tc.desc Verify device type recorded
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeviceTypeRecorded_007', 0, (): void => {
      Logger.info(TAG, 'DeviceTypeRecorded_007 begin');
      const type: string = deviceInfo.deviceType;
      const present: boolean = type.length !== 0;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'DeviceTypeRecorded_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_SYSCAP_0800
     * @tc.name LongCapabilityNameIsFalse008
     * @tc.desc Verify long capability name is false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongCapabilityNameIsFalse_008', 0, (): void => {
      Logger.info(TAG, 'LongCapabilityNameIsFalse_008 begin');
      let payload: string = 'SystemCapability.';
      for (let index: number = 0; index < 32; index++) {
        payload += 'X';
      }
      let threw: boolean = false;
      let available: boolean = true;
      try {
        available = canIUse(payload);
      }
      catch (error) {
        threw = true;
      }
      const check01: boolean = threw === false && available === false;
      Logger.info(TAG, 'check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'LongCapabilityNameIsFalse_008 end');
    });
  });
}
