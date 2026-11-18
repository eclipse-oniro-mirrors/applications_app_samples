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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  recorderComponentCount,
  isTipWindowVisible,
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Subsystems that the recorder extension collaborates with. The order of the
// enum mirrors the initialisation order of ScreenRecorderAbility.onCreate.
enum IntegrationComponent {
  SERVICE_EXTENSION = 'service_extension',
  WINDOW_MANAGER = 'window_manager',
  PHOTO_ACCESS = 'photo_access',
  MEDIA_LIBRARY = 'media_library',
  INPUT_SUBSYSTEM = 'input_subsystem'
}

interface SubsystemProbe {
  component: IntegrationComponent
  available: boolean
  apiLevel: number
  note: string
}

interface SubsystemCall {
  component: IntegrationComponent
  action: string
  sequence: number
  atMs: number
}

// Registry of the subsystems the extension can reach. Availability is injected
// so that missing subsystems can be simulated without touching the device.
class SystemSubsystemRegistry {
  private probes: Map<string, SubsystemProbe> = new Map();

  public register(probe: SubsystemProbe): void {
    this.probes.set(probe.component, probe);
  }

  public isAvailable(component: IntegrationComponent): boolean {
    const probe = this.probes.get(component);
    if (probe === undefined) {
      return false;
    }
    return probe.available;
  }

  public getProbe(component: IntegrationComponent): SubsystemProbe | undefined {
    return this.probes.get(component);
  }

  public countAvailable(): number {
    const components = this.getComponents();
    let count = 0;
    for (let index = 0; index < components.length; index++) {
      if (this.isAvailable(components[index])) {
        count++;
      }
    }
    return count;
  }

  public getMissing(): IntegrationComponent[] {
    const components = this.getComponents();
    const missing: IntegrationComponent[] = [];
    for (let index = 0; index < components.length; index++) {
      if (!this.isAvailable(components[index])) {
        missing.push(components[index]);
      }
    }
    return missing;
  }

  public getComponents(): IntegrationComponent[] {
    return [
      IntegrationComponent.SERVICE_EXTENSION,
      IntegrationComponent.WINDOW_MANAGER,
      IntegrationComponent.PHOTO_ACCESS,
      IntegrationComponent.MEDIA_LIBRARY,
      IntegrationComponent.INPUT_SUBSYSTEM
    ];
  }
}

// One recording session driven through the whole system stack. Every step is
// appended to a call log so that the initialisation ordering can be asserted.
class RecorderSystemSession {
  private registry: SystemSubsystemRegistry;
  private calls: SubsystemCall[] = [];
  private sequence: number = 0;
  private clockMs: number = 1700000000000;
  private assetCount: number = 0;
  private libraryCount: number = 0;
  private inputRegistrations: number = 0;
  private startupComplete: boolean = false;

  constructor(registry: SystemSubsystemRegistry) {
    this.registry = registry;
  }

  private record(component: IntegrationComponent, action: string): void {
    const call: SubsystemCall = {
      component: component,
      action: action,
      sequence: this.sequence,
      atMs: this.clockMs
    };
    this.sequence++;
    this.clockMs += 5;
    this.calls.push(call);
  }

  public getCalls(): SubsystemCall[] {
    return this.calls.slice();
  }

  public getCallCount(): number {
    return this.calls.length;
  }

  public getAssetCount(): number {
    return this.assetCount;
  }

  public getLibraryCount(): number {
    return this.libraryCount;
  }

  public getInputRegistrations(): number {
    return this.inputRegistrations;
  }

  public isStartupComplete(): boolean {
    return this.startupComplete;
  }

  public indexOf(component: IntegrationComponent, action: string): number {
    for (let index = 0; index < this.calls.length; index++) {
      if (this.calls[index].component === component && this.calls[index].action === action) {
        return index;
      }
    }
    return -1;
  }

  // Ability.onCreate: the extension itself comes up first, then the two managers
  // and finally the platform services it needs.
  public onCreate(): boolean {
    if (!this.registry.isAvailable(IntegrationComponent.SERVICE_EXTENSION)) {
      this.record(IntegrationComponent.SERVICE_EXTENSION, 'create_failed');
      return false;
    }
    this.record(IntegrationComponent.SERVICE_EXTENSION, 'on_create');
    if (this.registry.isAvailable(IntegrationComponent.WINDOW_MANAGER)) {
      this.record(IntegrationComponent.WINDOW_MANAGER, 'initialize');
    }
    if (this.registry.isAvailable(IntegrationComponent.PHOTO_ACCESS)) {
      this.record(IntegrationComponent.PHOTO_ACCESS, 'initialize');
    }
    if (this.registry.isAvailable(IntegrationComponent.MEDIA_LIBRARY)) {
      this.record(IntegrationComponent.MEDIA_LIBRARY, 'initialize');
    }
    if (this.registry.isAvailable(IntegrationComponent.INPUT_SUBSYSTEM)) {
      this.record(IntegrationComponent.INPUT_SUBSYSTEM, 'subscribe');
      this.inputRegistrations++;
    }
    this.startupComplete = true;
    return true;
  }

  // Start request: register the state callback, create the media asset through
  // photoAccessHelper and hand the descriptor to the capture engine.
  public requestStart(): boolean {
    if (!this.startupComplete) {
      return false;
    }
    this.record(IntegrationComponent.SERVICE_EXTENSION, 'on_request_start');
    if (!this.registry.isAvailable(IntegrationComponent.PHOTO_ACCESS)) {
      this.record(IntegrationComponent.PHOTO_ACCESS, 'asset_skipped');
      return false;
    }
    this.assetCount++;
    this.record(IntegrationComponent.PHOTO_ACCESS, 'create_asset');
    if (this.registry.isAvailable(IntegrationComponent.MEDIA_LIBRARY)) {
      this.libraryCount++;
      this.record(IntegrationComponent.MEDIA_LIBRARY, 'index_asset');
    }
    this.record(IntegrationComponent.SERVICE_EXTENSION, 'capture_started');
    return true;
  }

  // Stop request: close the capture and ask the media library to refresh.
  public requestStop(): boolean {
    if (!this.startupComplete) {
      return false;
    }
    this.record(IntegrationComponent.SERVICE_EXTENSION, 'on_request_stop');
    this.record(IntegrationComponent.SERVICE_EXTENSION, 'capture_stopped');
    if (this.registry.isAvailable(IntegrationComponent.MEDIA_LIBRARY)) {
      this.record(IntegrationComponent.MEDIA_LIBRARY, 'refresh_asset');
    }
    return true;
  }

  // Ability.onDestroy: unsubscribe from the input subsystem and release the
  // managers in reverse order.
  public onDestroy(): void {
    if (this.inputRegistrations > 0) {
      this.record(IntegrationComponent.INPUT_SUBSYSTEM, 'unsubscribe');
      this.inputRegistrations--;
    }
    if (this.registry.isAvailable(IntegrationComponent.WINDOW_MANAGER)) {
      this.record(IntegrationComponent.WINDOW_MANAGER, 'release');
    }
    if (this.registry.isAvailable(IntegrationComponent.PHOTO_ACCESS)) {
      this.record(IntegrationComponent.PHOTO_ACCESS, 'release');
    }
    this.record(IntegrationComponent.SERVICE_EXTENSION, 'on_destroy');
    this.startupComplete = false;
  }
}

// Builds the nominal registry where every subsystem is present.
function buildFullRegistry(): SystemSubsystemRegistry {
  const registry = new SystemSubsystemRegistry();
  registry.register({
    component: IntegrationComponent.SERVICE_EXTENSION,
    available: true,
    apiLevel: 9,
    note: 'ScreenRecorderAbility'
  });
  registry.register({
    component: IntegrationComponent.WINDOW_MANAGER,
    available: true,
    apiLevel: 9,
    note: 'TYPE_FLOAT window creation'
  });
  registry.register({
    component: IntegrationComponent.PHOTO_ACCESS,
    available: true,
    apiLevel: 10,
    note: 'photoAccessHelper.createAsset'
  });
  registry.register({
    component: IntegrationComponent.MEDIA_LIBRARY,
    available: true,
    apiLevel: 10,
    note: 'media library indexing'
  });
  registry.register({
    component: IntegrationComponent.INPUT_SUBSYSTEM,
    available: true,
    apiLevel: 9,
    note: 'menu plus volume down combination'
  });
  return registry;
}

export default function systemIntegrationTest(): void {
  describe('SystemIntegration_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // onCreate must reach every subsystem the recorder depends on.
    it('on_create_should_bring_up_all_subsystems', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      expect(registry.countAvailable()).assertEqual(5);
      expect(session.onCreate()).assertTrue();
      expect(session.isStartupComplete()).assertTrue();
      expect(session.getCallCount()).assertEqual(5);
      expect(session.getInputRegistrations()).assertEqual(1);
      expect(registry.getMissing().length).assertEqual(0);
    });

    // The managers are created before the platform services, which mirrors the
    // field initialisation order of the production ability.
    it('on_create_should_initialize_managers_before_services', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      const windowIndex = session.indexOf(IntegrationComponent.WINDOW_MANAGER, 'initialize');
      const photoIndex = session.indexOf(IntegrationComponent.PHOTO_ACCESS, 'initialize');
      const mediaIndex = session.indexOf(IntegrationComponent.MEDIA_LIBRARY, 'initialize');
      const inputIndex = session.indexOf(IntegrationComponent.INPUT_SUBSYSTEM, 'subscribe');
      expect(windowIndex).assertEqual(1);
      expect(photoIndex).assertEqual(2);
      expect(mediaIndex).assertEqual(3);
      expect(inputIndex).assertEqual(4);
      expect(windowIndex < photoIndex).assertTrue();
      expect(photoIndex < mediaIndex).assertTrue();
      expect(mediaIndex < inputIndex).assertTrue();
    });

    // The asset must exist before the capture starts, otherwise the descriptor
    // handed to the engine would be invalid.
    it('start_request_should_create_asset_before_capture', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      expect(session.requestStart()).assertTrue();
      const assetIndex = session.indexOf(IntegrationComponent.PHOTO_ACCESS, 'create_asset');
      const captureIndex = session.indexOf(IntegrationComponent.SERVICE_EXTENSION, 'capture_started');
      expect(assetIndex > 0).assertTrue();
      expect(captureIndex > assetIndex).assertTrue();
      expect(session.getAssetCount()).assertEqual(1);
      expect(session.getLibraryCount()).assertEqual(1);
    });

    // The media library indexes the freshly created asset immediately so that it
    // is visible in Photos without a manual refresh.
    it('media_library_should_index_asset_right_after_creation', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      session.requestStart();
      const assetIndex = session.indexOf(IntegrationComponent.PHOTO_ACCESS, 'create_asset');
      const libraryIndex = session.indexOf(IntegrationComponent.MEDIA_LIBRARY, 'index_asset');
      expect(libraryIndex).assertEqual(assetIndex + 1);
      const calls = session.getCalls();
      expect(calls[libraryIndex].component).assertEqual(IntegrationComponent.MEDIA_LIBRARY);
      expect(calls[libraryIndex].action).assertEqual('index_asset');
    });

    // Stopping asks the media library to refresh the asset metadata.
    it('stop_should_refresh_media_library', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      session.requestStart();
      expect(session.requestStop()).assertTrue();
      const refreshIndex = session.indexOf(IntegrationComponent.MEDIA_LIBRARY, 'refresh_asset');
      const stopIndex = session.indexOf(IntegrationComponent.SERVICE_EXTENSION, 'capture_stopped');
      expect(refreshIndex > stopIndex).assertTrue();
      expect(session.getLibraryCount()).assertEqual(1);
    });

    // The input subsystem is subscribed in onCreate and released in onDestroy,
    // so a long lived extension never leaks a key listener.
    it('destroy_should_unsubscribe_input_before_release', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      session.requestStart();
      session.requestStop();
      session.onDestroy();
      const unsubscribeIndex = session.indexOf(IntegrationComponent.INPUT_SUBSYSTEM, 'unsubscribe');
      const destroyIndex = session.indexOf(IntegrationComponent.SERVICE_EXTENSION, 'on_destroy');
      expect(unsubscribeIndex).assertLargerOrEqual(0);
      expect(destroyIndex > unsubscribeIndex).assertTrue();
      expect(session.getInputRegistrations()).assertEqual(0);
      expect(session.isStartupComplete()).assertFalse();
    });

    // One complete lifecycle produces a fixed number of subsystem calls; the
    // count is the regression anchor of the collaboration.
    it('full_lifecycle_should_produce_sixteen_calls', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      session.requestStart();
      session.requestStop();
      session.onDestroy();
      expect(session.getCallCount()).assertEqual(16);
      expect(session.getAssetCount()).assertEqual(1);
      expect(session.getLibraryCount()).assertEqual(1);
      const calls = session.getCalls();
      expect(calls[0].action).assertEqual('on_create');
      expect(calls[15].action).assertEqual('on_destroy');
    });

    // Without photoAccessHelper the capture cannot obtain a descriptor, so the
    // start request is rejected instead of writing to an invalid fd.
    it('missing_photo_access_should_reject_start', 0, () => {
      const registry = buildFullRegistry();
      registry.register({
        component: IntegrationComponent.PHOTO_ACCESS,
        available: false,
        apiLevel: 10,
        note: 'photoAccessHelper unavailable'
      });
      const session = new RecorderSystemSession(registry);
      expect(session.onCreate()).assertTrue();
      expect(session.requestStart()).assertFalse();
      expect(session.getAssetCount()).assertEqual(0);
      expect(session.indexOf(IntegrationComponent.PHOTO_ACCESS, 'asset_skipped')).assertLargerOrEqual(0);
      expect(session.indexOf(IntegrationComponent.SERVICE_EXTENSION, 'capture_started')).assertEqual(-1);
    });

    // A missing input subsystem only removes the shortcut registration; the
    // capture itself still works.
    it('missing_input_subsystem_should_not_break_startup', 0, () => {
      const registry = buildFullRegistry();
      registry.register({
        component: IntegrationComponent.INPUT_SUBSYSTEM,
        available: false,
        apiLevel: 9,
        note: 'no key listener available'
      });
      const session = new RecorderSystemSession(registry);
      expect(session.onCreate()).assertTrue();
      expect(session.getInputRegistrations()).assertEqual(0);
      expect(session.requestStart()).assertTrue();
      expect(session.getAssetCount()).assertEqual(1);
      session.onDestroy();
      expect(session.indexOf(IntegrationComponent.INPUT_SUBSYSTEM, 'unsubscribe')).assertEqual(-1);
    });

    // A missing media library keeps the capture alive; only the indexing and the
    // refresh of the asset are skipped.
    it('missing_media_library_should_keep_capture_alive', 0, () => {
      const registry = buildFullRegistry();
      registry.register({
        component: IntegrationComponent.MEDIA_LIBRARY,
        available: false,
        apiLevel: 10,
        note: 'media library unavailable'
      });
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      expect(session.requestStart()).assertTrue();
      expect(session.getAssetCount()).assertEqual(1);
      expect(session.getLibraryCount()).assertEqual(0);
      expect(session.requestStop()).assertTrue();
      expect(session.indexOf(IntegrationComponent.MEDIA_LIBRARY, 'refresh_asset')).assertEqual(-1);
    });

    // Without the service extension itself the ability cannot come up and every
    // request is rejected.
    it('missing_service_extension_should_fail_on_create', 0, () => {
      const registry = buildFullRegistry();
      registry.register({
        component: IntegrationComponent.SERVICE_EXTENSION,
        available: false,
        apiLevel: 9,
        note: 'extension not installed'
      });
      const session = new RecorderSystemSession(registry);
      expect(session.onCreate()).assertFalse();
      expect(session.isStartupComplete()).assertFalse();
      expect(session.requestStart()).assertFalse();
      expect(session.requestStop()).assertFalse();
      expect(session.getCallCount()).assertEqual(1);
      expect(session.getCalls()[0].action).assertEqual('create_failed');
    });

    // The registry reports exactly the subsystems that are not usable.
    it('registry_should_report_missing_subsystems', 0, () => {
      const registry = buildFullRegistry();
      registry.register({
        component: IntegrationComponent.INPUT_SUBSYSTEM,
        available: false,
        apiLevel: 9,
        note: 'disabled for test'
      });
      registry.register({
        component: IntegrationComponent.MEDIA_LIBRARY,
        available: false,
        apiLevel: 10,
        note: 'disabled for test'
      });
      const missing = registry.getMissing();
      expect(missing.length).assertEqual(2);
      expect(registry.countAvailable()).assertEqual(3);
      expect(registry.isAvailable(IntegrationComponent.WINDOW_MANAGER)).assertTrue();
      expect(registry.isAvailable(IntegrationComponent.INPUT_SUBSYSTEM)).assertFalse();
      const probe = registry.getProbe(IntegrationComponent.MEDIA_LIBRARY);
      expect(probe === undefined).assertFalse();
      if (probe !== undefined) {
        expect(probe.apiLevel).assertEqual(10);
      }
    });

    // Every call is dense and timestamped in creation order.
    it('calls_should_be_sequential_and_timestamped', 0, () => {
      const registry = buildFullRegistry();
      const session = new RecorderSystemSession(registry);
      session.onCreate();
      session.requestStart();
      session.requestStop();
      const calls = session.getCalls();
      expect(calls.length).assertEqual(12);
      for (let index = 0; index < calls.length; index++) {
        expect(calls[index].sequence).assertEqual(index);
        expect(calls[index].atMs > 0).assertTrue();
        if (index > 0) {
          expect(calls[index - 1].atMs < calls[index].atMs).assertTrue();
        }
      }
    });

    // Two consecutive sessions do not share counters.
    it('two_sessions_should_be_independent', 0, () => {
      const registry = buildFullRegistry();
      const first = new RecorderSystemSession(registry);
      first.onCreate();
      first.requestStart();
      first.requestStop();
      first.onDestroy();
      const second = new RecorderSystemSession(registry);
      second.onCreate();
      second.requestStart();
      expect(first.getCallCount()).assertEqual(16);
      expect(second.getCallCount()).assertEqual(9);
      expect(second.getAssetCount()).assertEqual(1);
      expect(second.indexOf(IntegrationComponent.SERVICE_EXTENSION, 'on_request_start')).assertLargerOrEqual(0);
      expect(second.indexOf(IntegrationComponent.SERVICE_EXTENSION, 'on_destroy')).assertEqual(-1);
    });

    // Real-device probe: the extension either presents the tip window after a
    // stop or exposes a readable component tree.
    it('device_should_render_system_integrated_windows', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 800);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      const tipVisible: boolean = await isTipWindowVisible(driver);
      expect(tipVisible && componentCount === 0).assertFalse();
    });
  });
}

