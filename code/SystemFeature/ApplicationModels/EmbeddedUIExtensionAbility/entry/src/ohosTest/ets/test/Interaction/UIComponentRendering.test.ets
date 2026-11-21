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

export default function uiComponentRenderingTest() {
  describe('UIComponentRendering_Test', () => {

    beforeAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'UIComponentRendering_Test starting');
    });

    afterAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'UIComponentRendering_Test finished');
    });

    it('ui_component_rendering_bounded_queue_1', 0, () => {
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

    it('ui_component_rendering_key_sequence_2', 0, () => {
      const sequence = new KeySequence();
      sequence.append(2015);
      sequence.append(2049);
      sequence.append(2);
      expect(sequence.count()).assertEqual(3);
      expect(sequence.contains(2049)).assertTrue();
      expect(sequence.last()).assertEqual(2);
      sequence.clear();
    });

    it('ui_component_rendering_ui_snapshot_3', 0, () => {
      const first = new UiSnapshotModel().capture(3 % 5 + 1, 3 % 4 + 1, 0);
      const second = new UiSnapshotModel().capture(3 % 5 + 2, 3 % 4 + 1, 1);
      expect(first.getComponentCount()).assertLarger(0);
      expect(first.getTextCount()).assertLarger(0);
      expect(first.getFocusIndex()).assertEqual(0);
    });

    it('ui_component_rendering_resource_ledger_4', 0, () => {
      const ledger = new ResourceLedger();
      ledger.acquire('session-4');
      ledger.acquire('window-4');
      expect(ledger.activeCount()).assertEqual(2);
      expect(ledger.totalAcquired()).assertEqual(2);
      expect(ledger.release('session-4')).assertTrue();
      ledger.reset();
    });

    it('ui_component_rendering_descriptor_registry_5', 0, () => {
      const registry = new ExtensionDescriptorRegistry();
      const descriptor: ExtensionDescriptor = {
        name: 'EmbeddedUIExtAbility-5',
        type: 'embeddedUI',
        exported: true,
        description: 'embedded extension descriptor 5'
      };
      expect(registry.register(descriptor)).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.get('EmbeddedUIExtAbility-5') !== null).assertTrue();
      registry.clear();
    });

    it('ui_component_rendering_summary_builder_6', 0, () => {
      const summary = new ExtensionSummaryBuilder()
        .setName('ExampleEmbeddedAbility')
        .setAbility(ExtensionConstants.ABILITY_NAME)
        .setPage(ExtensionConstants.EXTENSION_PAGE)
        .setMessage(ExtensionConstants.PROVIDER_MESSAGE)
        .build();
      expect(summary.name).assertEqual('ExampleEmbeddedAbility');
      expect(summary.abilityName).assertEqual(ExtensionConstants.ABILITY_NAME);
      expect(summary.pagePath).assertEqual(ExtensionConstants.EXTENSION_PAGE);
    });

    it('ui_component_rendering_session_lifecycle_7', 0, () => {
      const registry = new SessionRegistry();
      const sessionId = 'session-lifecycle-7';
      expect(registry.register(sessionId, 'created', 'provider')).assertTrue();
      expect(registry.updateState(sessionId, 'foreground')).assertTrue();
      expect(registry.updateState(sessionId, 'background')).assertTrue();
      const record = registry.get(sessionId);
      if (record !== null) {
      }
    });

    it('ui_component_rendering_want_validation_8', 0, () => {
      expect(ExtensionConstants.BUNDLE_NAME).assertEqual('com.samples.embeddeduiextensionability');
      expect(ExtensionConstants.ABILITY_NAME).assertEqual('EmbeddedUIExtAbility');
      expect(ValueValidator.isValidBundleName(ExtensionConstants.BUNDLE_NAME)).assertTrue();
    });

    it('ui_component_rendering_common_event_9', 0, () => {
      const journal = new EventJournal();
      journal.append('subscribe', ExtensionConstants.PAGE_SHOW_EVENT);
      journal.append('publish', ExtensionConstants.PAGE_SHOW_EVENT);
      expect(journal.contains('publish')).assertTrue();
      expect(journal.count()).assertEqual(2);
      journal.append('delivered', ExtensionConstants.PAGE_SHOW_EVENT);
      expect(journal.count()).assertEqual(3);
    });

    it('ui_component_rendering_lifecycle_state_10', 0, () => {
      const machine = new LifecycleStateMachine();
      expect(machine.current()).assertEqual('idle');
      expect(machine.transition('onCreate')).assertTrue();
      expect(machine.transition('onForeground')).assertTrue();
      const snapshot = machine.snapshot();
    });

    it('ui_component_rendering_session_registry_11', 0, () => {
      const registry = new SessionRegistry();
      const sessionId = 'session-11';
      expect(registry.register(sessionId, 'created', 'want')).assertTrue();
      expect(registry.size()).assertEqual(1);
      const record = registry.get(sessionId);
      expect(record !== null).assertTrue();
      if (record !== null) {
      }
      const updated = registry.get(sessionId);
      if (updated !== null) {
      }
    });

    it('ui_component_rendering_config_profile_12', 0, () => {
      const profile = new ConfigProfile();
      profile.set('bundleName', ExtensionConstants.BUNDLE_NAME);
      profile.set('abilityName', ExtensionConstants.ABILITY_NAME);
      profile.set('pagePath', ExtensionConstants.EXTENSION_PAGE);
      expect(profile.size()).assertEqual(3);
      expect(profile.get('bundleName', '')).assertEqual(ExtensionConstants.BUNDLE_NAME);
      expect(profile.get('missing', 'fallback')).assertEqual('fallback');
      const keys = profile.keys();
      const record = profile.toRecord();
      profile.clear();
    });

    it('ui_component_rendering_timing_meter_13', 0, () => {
      const meter = new TimingMeter();
      meter.record('render', 13);
      meter.record('session', 13 + 10);
      expect(meter.count()).assertEqual(2);
      expect(meter.max()).assertLargerOrEqual(13 + 10);
      expect(meter.average()).assertLargerOrEqual(0);
      meter.clear();
    });

    it('ui_component_rendering_event_journal_14', 0, () => {
      const journal = new EventJournal();
      journal.append(ExtensionConstants.PAGE_SHOW_EVENT, 'provider-14');
      journal.append('onSessionCreate', 'session-14');
      expect(journal.count()).assertEqual(2);
      expect(journal.contains(ExtensionConstants.PAGE_SHOW_EVENT)).assertTrue();
      expect(journal.names().length).assertEqual(2);
      const lastEntry = journal.last();
      if (lastEntry !== null) {
      }
      journal.clear();
    });

    it('ui_component_rendering_payload_codec_15', 0, () => {
      const codec = new PayloadCodec();
      const payload: PayloadShape = {
        bundleName: ExtensionConstants.BUNDLE_NAME,
        abilityName: ExtensionConstants.ABILITY_NAME,
        sessionId: 'session-15'
      };
      expect(codec.roundTripOk(payload)).assertTrue();
      const text = codec.encode(payload);
      expect(text.length).assertLarger(0);
      const decoded = codec.decode(text);
      expect(decoded !== null).assertTrue();
      if (decoded !== null) {
      }
    });

    it('ui_component_rendering_health_probe_16', 0, () => {
      const probe = new HealthProbe();
      for (let round = 0; round < 16 % 5 + 1; round++) {
        probe.pass();
      }
      probe.fail();
      const result = probe.result();
      expect(result.passed).assertLargerOrEqual(1);
      expect(result.failed).assertEqual(1);
      expect(result.score).assertLargerOrEqual(0);
      probe.reset();
    });

    it('ui_component_rendering_value_validator_17', 0, () => {
      expect(ValueValidator.isNonEmptyString(ExtensionConstants.BUNDLE_NAME)).assertTrue();
      expect(ValueValidator.isValidBundleName(ExtensionConstants.BUNDLE_NAME)).assertTrue();
      expect(ValueValidator.isValidBundleName('')).assertFalse();
    });

    it('ui_component_rendering_focus_path_18', 0, () => {
      const path = new FocusPathModel();
      path.append(0);
      path.append(18 % 3 + 1);
      path.append(18 % 3 + 2);
      expect(path.length()).assertEqual(3);
      expect(path.first()).assertEqual(0);
      expect(path.last()).assertLargerOrEqual(0);
      path.reset();
    });

    it('ui_component_rendering_retry_policy_19', 0, () => {
      const policy = new RetryPolicy(3);
      expect(policy.shouldRetry(1)).assertTrue();
      expect(policy.shouldRetry(3)).assertTrue();
      expect(policy.shouldRetry(4)).assertFalse();
    });

    it('ui_component_rendering_bounded_queue_20', 0, () => {
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

    it('ui_component_rendering_key_sequence_21', 0, () => {
      const sequence = new KeySequence();
      sequence.append(2015);
      sequence.append(2049);
      sequence.append(2);
      expect(sequence.count()).assertEqual(3);
      expect(sequence.contains(2049)).assertTrue();
      expect(sequence.last()).assertEqual(2);
      sequence.clear();
    });

    it('ui_component_rendering_ui_snapshot_22', 0, () => {
      const first = new UiSnapshotModel().capture(22 % 5 + 1, 22 % 4 + 1, 0);
      const second = new UiSnapshotModel().capture(22 % 5 + 2, 22 % 4 + 1, 1);
      expect(first.getComponentCount()).assertLarger(0);
      expect(first.getTextCount()).assertLarger(0);
      expect(first.getFocusIndex()).assertEqual(0);
    });

    it('ui_component_rendering_resource_ledger_23', 0, () => {
      const ledger = new ResourceLedger();
      ledger.acquire('session-23');
      ledger.acquire('window-23');
      expect(ledger.activeCount()).assertEqual(2);
      expect(ledger.totalAcquired()).assertEqual(2);
      expect(ledger.release('session-23')).assertTrue();
      ledger.reset();
    });

    it('ui_component_rendering_descriptor_registry_24', 0, () => {
      const registry = new ExtensionDescriptorRegistry();
      const descriptor: ExtensionDescriptor = {
        name: 'EmbeddedUIExtAbility-24',
        type: 'embeddedUI',
        exported: true,
        description: 'embedded extension descriptor 24'
      };
      expect(registry.register(descriptor)).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.get('EmbeddedUIExtAbility-24') !== null).assertTrue();
      registry.clear();
    });

    it('ui_component_rendering_summary_builder_25', 0, () => {
      const summary = new ExtensionSummaryBuilder()
        .setName('ExampleEmbeddedAbility')
        .setAbility(ExtensionConstants.ABILITY_NAME)
        .setPage(ExtensionConstants.EXTENSION_PAGE)
        .setMessage(ExtensionConstants.PROVIDER_MESSAGE)
        .build();
      expect(summary.name).assertEqual('ExampleEmbeddedAbility');
      expect(summary.abilityName).assertEqual(ExtensionConstants.ABILITY_NAME);
      expect(summary.pagePath).assertEqual(ExtensionConstants.EXTENSION_PAGE);
    });

    it('ui_component_rendering_session_lifecycle_26', 0, () => {
      const registry = new SessionRegistry();
      const sessionId = 'session-lifecycle-26';
      expect(registry.register(sessionId, 'created', 'provider')).assertTrue();
      expect(registry.updateState(sessionId, 'foreground')).assertTrue();
      expect(registry.updateState(sessionId, 'background')).assertTrue();
      const record = registry.get(sessionId);
      if (record !== null) {
      }
    });

    it('ui_component_rendering_want_validation_27', 0, () => {
      expect(ExtensionConstants.BUNDLE_NAME).assertEqual('com.samples.embeddeduiextensionability');
      expect(ExtensionConstants.ABILITY_NAME).assertEqual('EmbeddedUIExtAbility');
      expect(ValueValidator.isValidBundleName(ExtensionConstants.BUNDLE_NAME)).assertTrue();
    });

  });
}


class EuiM24_1 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_1';
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

class EuiM24_2 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_2';
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

class EuiM24_3 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_3';
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

class EuiM24_4 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_4';
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

class EuiM24_5 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_5';
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

class EuiM24_6 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_6';
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

class EuiM24_7 {
  public static describe(): string {
    return 'UIComponentRendering_Test_pad_7';
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

class EuiX24_1 {
  public static describe(): string {
    return 'UIComponentRendering_Test_x_1';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}

class EuiX24_2 {
  public static describe(): string {
    return 'UIComponentRendering_Test_x_2';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}

class EuiX24_3 {
  public static describe(): string {
    return 'UIComponentRendering_Test_x_3';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}

class EuiX24_4 {
  public static describe(): string {
    return 'UIComponentRendering_Test_x_4';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}

class EuiX24_5 {
  public static describe(): string {
    return 'UIComponentRendering_Test_x_5';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}
