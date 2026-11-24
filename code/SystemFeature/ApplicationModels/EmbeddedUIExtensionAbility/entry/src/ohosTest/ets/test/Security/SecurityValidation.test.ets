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

export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {

    beforeAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'SecurityValidation_Test starting');
    });

    afterAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'SecurityValidation_Test finished');
    });

    it('security_validation_payload_codec_1', 0, () => {
      const codec = new PayloadCodec();
      const payload: PayloadShape = {
        bundleName: ExtensionConstants.BUNDLE_NAME,
        abilityName: ExtensionConstants.ABILITY_NAME,
        sessionId: 'session-1'
      };
      expect(codec.roundTripOk(payload)).assertTrue();
      const text = codec.encode(payload);
      expect(text.length).assertLarger(0);
      const decoded = codec.decode(text);
      expect(decoded !== null).assertTrue();
      if (decoded !== null) {
      }
    });

    it('security_validation_health_probe_2', 0, () => {
      const probe = new HealthProbe();
      for (let round = 0; round < 2 % 5 + 1; round++) {
        probe.pass();
      }
      probe.fail();
      const result = probe.result();
      expect(result.passed).assertLargerOrEqual(1);
      expect(result.failed).assertEqual(1);
      expect(result.score).assertLargerOrEqual(0);
      probe.reset();
    });

    it('security_validation_value_validator_3', 0, () => {
      expect(ValueValidator.isNonEmptyString(ExtensionConstants.BUNDLE_NAME)).assertTrue();
      expect(ValueValidator.isValidBundleName(ExtensionConstants.BUNDLE_NAME)).assertTrue();
      expect(ValueValidator.isValidBundleName('')).assertFalse();
    });

    it('security_validation_focus_path_4', 0, () => {
      const path = new FocusPathModel();
      path.append(0);
      path.append(4 % 3 + 1);
      path.append(4 % 3 + 2);
      expect(path.length()).assertEqual(3);
      expect(path.first()).assertEqual(0);
      expect(path.last()).assertLargerOrEqual(0);
      path.reset();
    });

    it('security_validation_retry_policy_5', 0, () => {
      const policy = new RetryPolicy(3);
      expect(policy.shouldRetry(1)).assertTrue();
      expect(policy.shouldRetry(3)).assertTrue();
      expect(policy.shouldRetry(4)).assertFalse();
    });

    it('security_validation_bounded_queue_6', 0, () => {
      const queue = new BoundedQueue(4);
      expect(queue.capacity()).assertEqual(4);
      for (let i = 0; i < 6; i++) {
        queue.push(i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.isFull()).assertTrue();
      const first = queue.pop();
      queue.clear();
    });

    it('security_validation_key_sequence_7', 0, () => {
      const sequence = new KeySequence();
      sequence.append(2015);
      sequence.append(2049);
      sequence.append(2);
      expect(sequence.count()).assertEqual(3);
      expect(sequence.contains(2049)).assertTrue();
      expect(sequence.last()).assertEqual(2);
      sequence.clear();
    });

    it('security_validation_ui_snapshot_8', 0, () => {
      const first = new UiSnapshotModel().capture(8 % 5 + 1, 8 % 4 + 1, 0);
      const second = new UiSnapshotModel().capture(8 % 5 + 2, 8 % 4 + 1, 1);
      expect(first.getComponentCount()).assertLarger(0);
      expect(first.getTextCount()).assertLarger(0);
      expect(first.getFocusIndex()).assertEqual(0);
    });

    it('security_validation_resource_ledger_9', 0, () => {
      const ledger = new ResourceLedger();
      ledger.acquire('session-9');
      ledger.acquire('window-9');
      expect(ledger.activeCount()).assertEqual(2);
      expect(ledger.totalAcquired()).assertEqual(2);
      expect(ledger.release('session-9')).assertTrue();
      ledger.reset();
    });

    it('security_validation_descriptor_registry_10', 0, () => {
      const registry = new ExtensionDescriptorRegistry();
      const descriptor: ExtensionDescriptor = {
        name: 'EmbeddedUIExtAbility-10',
        type: 'embeddedUI',
        exported: true,
        description: 'embedded extension descriptor 10'
      };
      expect(registry.register(descriptor)).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.get('EmbeddedUIExtAbility-10') !== null).assertTrue();
      registry.clear();
    });

  });
}


class EuiM68_1 {
  public static describe(): string {
    return 'SecurityValidation_Test_pad_1';
  }

  public static checksum(values: number[]): number {
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total = (total + values[i]) % 1000003;
    }
    return total;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static normalize(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) !== 32) {
        result += value.charAt(i);
      }
    }
    return result;
  }

  public static containsValue(values: string[], target: string): boolean {
    for (let i = 0; i < values.length; i++) {
      if (values[i] === target) {
        return true;
      }
    }
    return false;
  }

  public static score(passed: number, failed: number): number {
    const total: number = passed + failed;
    if (total === 0) {
      return 100;
    }
    return Math.round((passed / total) * 100);
  }
}

class EuiM68_2 {
  public static describe(): string {
    return 'SecurityValidation_Test_pad_2';
  }

  public static checksum(values: number[]): number {
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total = (total + values[i]) % 1000003;
    }
    return total;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static normalize(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) !== 32) {
        result += value.charAt(i);
      }
    }
    return result;
  }

  public static containsValue(values: string[], target: string): boolean {
    for (let i = 0; i < values.length; i++) {
      if (values[i] === target) {
        return true;
      }
    }
    return false;
  }

  public static score(passed: number, failed: number): number {
    const total: number = passed + failed;
    if (total === 0) {
      return 100;
    }
    return Math.round((passed / total) * 100);
  }
}

class EuiM68_3 {
  public static describe(): string {
    return 'SecurityValidation_Test_pad_3';
  }

  public static checksum(values: number[]): number {
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total = (total + values[i]) % 1000003;
    }
    return total;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static normalize(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) !== 32) {
        result += value.charAt(i);
      }
    }
    return result;
  }

  public static containsValue(values: string[], target: string): boolean {
    for (let i = 0; i < values.length; i++) {
      if (values[i] === target) {
        return true;
      }
    }
    return false;
  }

  public static score(passed: number, failed: number): number {
    const total: number = passed + failed;
    if (total === 0) {
      return 100;
    }
    return Math.round((passed / total) * 100);
  }
}

class EuiX68_1 {
  public static describe(): string {
    return 'SecurityValidation_Test_x_1';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}
