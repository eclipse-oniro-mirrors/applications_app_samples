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
import hilog from '@ohos.hilog';
import {
  LifecycleStateMachine,
  SessionRegistry,
  ConfigProfile,
  TimingMeter,
  EventJournal,
  PayloadCodec,
  HealthProbe,
  ValueValidator,
  ExtensionConstants,
  FocusPathModel,
  RetryPolicy,
  BoundedQueue,
  KeySequence,
  UiSnapshotModel,
  ResourceLedger,
  ExtensionDescriptor,
  ExtensionDescriptorRegistry,
  ExtensionSummary,
  ExtensionSummaryBuilder,
  PayloadShape,
  SessionRecord,
  ConfigEntry,
  TimingSample,
  JournalEntry,
  ProbeResult,
  SnapshotResult
} from '../Shared/EmbeddedModels';

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {

    beforeAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'DeviceCompatibility_Test starting');
    });

    afterAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'DeviceCompatibility_Test finished');
    });

    it('device_compatibility_value_validator_1', 0, () => {
      expect(ValueValidator.isNonEmptyString(ExtensionConstants.BUNDLE_NAME)).assertTrue();
      expect(ValueValidator.isValidBundleName(ExtensionConstants.BUNDLE_NAME)).assertTrue();
      expect(ValueValidator.isValidBundleName('')).assertFalse();
    });

    it('device_compatibility_focus_path_2', 0, () => {
      const path = new FocusPathModel();
      path.append(0);
      path.append(2 % 3 + 1);
      path.append(2 % 3 + 2);
      expect(path.length()).assertEqual(3);
      expect(path.first()).assertEqual(0);
      expect(path.last()).assertLargerOrEqual(0);
      path.reset();
    });

  });
}


class EuiT28_1 {
  public static describe(): string {
    return 'DeviceCompatibility_Test_tiny_1';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}
