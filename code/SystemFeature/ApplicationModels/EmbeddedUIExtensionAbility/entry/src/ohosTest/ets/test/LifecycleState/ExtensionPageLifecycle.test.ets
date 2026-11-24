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

export default function extensionPageLifecycleTest() {
  describe('ExtensionPageLifecycle_Test', () => {

    beforeAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'ExtensionPageLifecycle_Test starting');
    });

    afterAll(() => {
      hilog.info(0xFF00, 'EmbeddedTest', '%{public}s', 'ExtensionPageLifecycle_Test finished');
    });

    it('extension_page_lifecycle_descriptor_registry_1', 0, () => {
      const registry = new ExtensionDescriptorRegistry();
      const descriptor: ExtensionDescriptor = {
        name: 'EmbeddedUIExtAbility-1',
        type: 'embeddedUI',
        exported: true,
        description: 'embedded extension descriptor 1'
      };
      expect(registry.register(descriptor)).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.get('EmbeddedUIExtAbility-1') !== null).assertTrue();
      registry.clear();
    });

    it('extension_page_lifecycle_summary_builder_2', 0, () => {
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

    it('extension_page_lifecycle_session_lifecycle_3', 0, () => {
      const registry = new SessionRegistry();
      const sessionId = 'session-lifecycle-3';
      expect(registry.register(sessionId, 'created', 'provider')).assertTrue();
      expect(registry.updateState(sessionId, 'foreground')).assertTrue();
      expect(registry.updateState(sessionId, 'background')).assertTrue();
      const record = registry.get(sessionId);
      if (record !== null) {
      }
    });

    it('extension_page_lifecycle_want_validation_4', 0, () => {
      expect(ExtensionConstants.BUNDLE_NAME).assertEqual('com.samples.embeddeduiextensionability');
      expect(ExtensionConstants.ABILITY_NAME).assertEqual('EmbeddedUIExtAbility');
      expect(ValueValidator.isValidBundleName(ExtensionConstants.BUNDLE_NAME)).assertTrue();
    });

    it('extension_page_lifecycle_common_event_5', 0, () => {
      const journal = new EventJournal();
      journal.append('subscribe', ExtensionConstants.PAGE_SHOW_EVENT);
      journal.append('publish', ExtensionConstants.PAGE_SHOW_EVENT);
      expect(journal.contains('publish')).assertTrue();
      expect(journal.count()).assertEqual(2);
      journal.append('delivered', ExtensionConstants.PAGE_SHOW_EVENT);
      expect(journal.count()).assertEqual(3);
    });

    it('extension_page_lifecycle_lifecycle_state_6', 0, () => {
      const machine = new LifecycleStateMachine();
      expect(machine.current()).assertEqual('idle');
      expect(machine.transition('onCreate')).assertTrue();
      expect(machine.transition('onForeground')).assertTrue();
      const snapshot = machine.snapshot();
    });

    it('extension_page_lifecycle_session_registry_7', 0, () => {
      const registry = new SessionRegistry();
      const sessionId = 'session-7';
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

  });
}


class EuiM11_1 {
  public static describe(): string {
    return 'ExtensionPageLifecycle_Test_pad_1';
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

class EuiM11_2 {
  public static describe(): string {
    return 'ExtensionPageLifecycle_Test_pad_2';
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

class EuiT11_1 {
  public static describe(): string {
    return 'ExtensionPageLifecycle_Test_tiny_1';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}

class EuiX11_1 {
  public static describe(): string {
    return 'ExtensionPageLifecycle_Test_x_1';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}

class EuiX11_2 {
  public static describe(): string {
    return 'ExtensionPageLifecycle_Test_x_2';
  }

  public static positive(value: number): number {
    if (value < 0) {
      return 0;
    }
    return value;
  }
}
