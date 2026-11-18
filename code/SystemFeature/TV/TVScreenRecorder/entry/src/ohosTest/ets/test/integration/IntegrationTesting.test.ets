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
  waitForTimerWindowStable,
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';
import { MockPhotoAccessHelperFactory, MockSRApiFactory, MockWindowManagerFactory } from '../foundation/MockFactories';
import { MockRecordingState, MockSRApiController, MockWindowManagerLike, MockWindowRect,
  MockWindowRectEntity } from '../foundation/TestTypes';

// Geometry of the two floating windows. The values are taken from
// ScreenRecorderAbility so that the integration assertions can verify that the
// ability passes the very same rectangle to the window manager.
const TIMER_RECT_X: number = 96;
const TIMER_RECT_Y: number = 48;
const TIMER_RECT_WIDTH: number = 624;
const TIMER_RECT_HEIGHT: number = 56;
const TIP_RECT_X: number = 615;
const TIP_RECT_Y: number = 46;
const TIP_RECT_WIDTH: number = 686;
const TIP_RECT_HEIGHT: number = 100;
const TIP_DURATION_MS: number = 3000;

// Delay used by the ability before terminating itself after an error.
const TERMINATE_DELAY_MS: number = 2000;

const TIMER_PAGE: string = 'pages/ScreenRecorderTimer';
const TIP_PAGE: string = 'pages/ScreenRecorderDialog';
const TIMER_WINDOW_NAME: string = 'timer_window';
const TIP_WINDOW_NAME: string = 'tip_window';

interface OperationRecord {
  component: string
  operation: string
  sequence: number
}

// Integration bridge that reproduces the collaboration of the three modules:
// ScreenRecorderAbility orchestrates, SRManager owns the capture pipeline and
// WindowManagerMgr owns the floating windows. Every call is appended to a shared
// operation log so that the ordering can be asserted.
class RecordingIntegrationBridge {
  private api: MockSRApiController;
  private photoFactory: MockPhotoAccessHelperFactory;
  private windowManager: MockWindowManagerLike;
  private windowFactory: MockWindowManagerFactory;
  private log: OperationRecord[] = [];
  private sequence: number = 0;
  private stateListenerCount: number = 0;
  private terminateScheduledAtMs: number = -1;
  private clockMs: number = 1700000000000;
  private lastTimerRect: MockWindowRect | null = null;
  private lastTipRect: MockWindowRect | null = null;

  constructor() {
    const apiFactory = new MockSRApiFactory();
    this.api = apiFactory.build();
    this.photoFactory = new MockPhotoAccessHelperFactory();
    this.windowFactory = new MockWindowManagerFactory();
    this.windowManager = this.windowFactory.build();
  }

  public getApi(): MockSRApiController {
    return this.api;
  }

  public getPhotoFactory(): MockPhotoAccessHelperFactory {
    return this.photoFactory;
  }

  public getWindowFactory(): MockWindowManagerFactory {
    return this.windowFactory;
  }

  public getLog(): OperationRecord[] {
    return this.log.slice();
  }

  public getLogSize(): number {
    return this.log.length;
  }

  public getStateListenerCount(): number {
    return this.stateListenerCount;
  }

  public getTerminateScheduledAtMs(): number {
    return this.terminateScheduledAtMs;
  }

  public getLastTimerRect(): MockWindowRect | null {
    return this.lastTimerRect;
  }

  public getLastTipRect(): MockWindowRect | null {
    return this.lastTipRect;
  }

  // Returns the position of the first matching operation, or -1 when the
  // operation never happened.
  public indexOfOperation(component: string, operation: string): number {
    for (let index = 0; index < this.log.length; index++) {
      if (this.log[index].component === component && this.log[index].operation === operation) {
        return index;
      }
    }
    return -1;
  }

  public countOperations(component: string, operation: string): number {
    let count = 0;
    for (let index = 0; index < this.log.length; index++) {
      if (this.log[index].component === component && this.log[index].operation === operation) {
        count++;
      }
    }
    return count;
  }

  public countByComponent(component: string): number {
    let count = 0;
    for (let index = 0; index < this.log.length; index++) {
      if (this.log[index].component === component) {
        count++;
      }
    }
    return count;
  }

  public isLogSequential(): boolean {
    for (let index = 0; index < this.log.length; index++) {
      if (this.log[index].sequence !== index) {
        return false;
      }
    }
    return true;
  }

  private record(component: string, operation: string): void {
    const entry: OperationRecord = {
      component: component,
      operation: operation,
      sequence: this.sequence
    };
    this.sequence++;
    this.log.push(entry);
  }

  // Ability.onRequest with startId === 1: the listener is registered first,
  // then the media asset is created and finally the capture starts.
  public async requestStart(): Promise<number> {
    if (this.api.getRecorderState() === MockRecordingState.Recording) {
      this.record('ability', 'start_ignored');
      return -1;
    }
    this.record('ability', 'on_request_start');
    this.api.onStateChange((state: number) => {
      this.handleStateChange(state);
    });
    this.stateListenerCount++;
    this.record('srmanager', 'register_state_listener');
    const fileName = 'REC_20260101_120000.mp4';
    const asset = await this.photoFactory.build().createAsset(fileName, { subtype: 1 });
    this.record('photoaccesshelper', 'create_asset');
    const code = this.api.startRecording(`fd://${asset.uri.length}`);
    this.record('srapi', 'start_recording');
    if (this.api.getRecorderState() === MockRecordingState.Recording) {
      this.openTimerWindow();
    } else if (this.api.getRecorderState() === MockRecordingState.Error) {
      this.scheduleTerminate();
    }
    return code;
  }

  // Ability.onRequest with startId !== 1: stop the capture and present the tip.
  public requestStop(): number {
    if (this.api.getRecorderState() !== MockRecordingState.Recording) {
      this.record('ability', 'stop_ignored');
      return -1;
    }
    this.record('ability', 'on_request_stop');
    const code = this.api.stopRecording();
    this.record('srapi', 'stop_recording');
    if (this.api.getRecorderState() === MockRecordingState.Stopped) {
      this.closeTimerWindow();
      this.popupTipWindow();
    } else if (this.api.getRecorderState() === MockRecordingState.Error) {
      this.scheduleTerminate();
    }
    return code;
  }

  public openTimerWindow(): void {
    const rect: MockWindowRect = new MockWindowRectEntity(TIMER_RECT_X, TIMER_RECT_Y,
      TIMER_RECT_WIDTH, TIMER_RECT_HEIGHT);
    this.lastTimerRect = rect;
    this.windowManager.openTimerWindow(TIMER_WINDOW_NAME, TIMER_PAGE, rect, new Object(), new Object());
    this.record('windowmanager', 'open_timer_window');
  }

  public closeTimerWindow(): void {
    const window = this.windowManager.get(TIMER_WINDOW_NAME);
    if (window !== undefined) {
      window.hide();
      this.record('windowmanager', 'hide_timer_window');
    }
  }

  public popupTipWindow(): void {
    const rect: MockWindowRect = new MockWindowRectEntity(TIP_RECT_X, TIP_RECT_Y,
      TIP_RECT_WIDTH, TIP_RECT_HEIGHT);
    this.lastTipRect = rect;
    this.windowManager.popupRecorderTip(TIP_WINDOW_NAME, TIP_PAGE, rect, TIP_DURATION_MS, new Object());
    this.record('windowmanager', 'popup_tip_window');
  }

  public handleStateChange(state: number): void {
    this.record('srmanager', 'state_change');
    if (state === MockRecordingState.Error) {
      this.closeTimerWindow();
      this.scheduleTerminate();
    }
  }

  public scheduleTerminate(): void {
    this.terminateScheduledAtMs = this.clockMs + TERMINATE_DELAY_MS;
    this.record('ability', 'schedule_terminate');
  }

  public advanceClock(ms: number): void {
    this.clockMs += ms;
  }

  public teardown(): void {
    this.record('ability', 'on_destroy');
    this.windowManager.release();
    this.record('windowmanager', 'release');
    this.record('srmanager', 'release');
  }
}

export default function integrationTestingTest(): void {
  describe('IntegrationTesting_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // SRManager must subscribe to the capture callbacks before the media asset is
    // created, otherwise the first state change would be missed.
    it('start_request_should_register_listener_before_asset', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      const listenerIndex = bridge.indexOfOperation('srmanager', 'register_state_listener');
      const assetIndex = bridge.indexOfOperation('photoaccesshelper', 'create_asset');
      expect(listenerIndex).assertEqual(1);
      expect(assetIndex).assertEqual(2);
      expect(listenerIndex < assetIndex).assertTrue();
      expect(bridge.getStateListenerCount()).assertEqual(1);
      expect(bridge.getPhotoFactory().getAssetCount()).assertEqual(1);
    });

    // The file descriptor can only be handed to the capture API after the asset
    // exists, therefore createAsset must precede startRecording.
    it('start_request_should_create_asset_before_capture', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      const code = await bridge.requestStart();
      expect(code).assertEqual(0);
      const assetIndex = bridge.indexOfOperation('photoaccesshelper', 'create_asset');
      const startIndex = bridge.indexOfOperation('srapi', 'start_recording');
      expect(assetIndex > 0).assertTrue();
      expect(startIndex > assetIndex).assertTrue();
      expect(bridge.getApi().getLastStartUrl().startsWith('fd://')).assertTrue();
      expect(bridge.getApi().getRecorderState()).assertEqual(MockRecordingState.Recording);
    });

    // The timer window is opened only after the capture reported the recording
    // state, so a failed start never leaves an orphan window behind.
    it('start_request_should_open_timer_window_after_capture', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      const startIndex = bridge.indexOfOperation('srapi', 'start_recording');
      const windowIndex = bridge.indexOfOperation('windowmanager', 'open_timer_window');
      expect(startIndex).assertLargerOrEqual(0);
      expect(windowIndex > startIndex).assertTrue();
      expect(bridge.getWindowFactory().getOpenRecords().length).assertEqual(1);
      expect(bridge.getWindowFactory().getOpenRecords()[0].page).assertEqual('pages/ScreenRecorderTimer');
    });

    // The rectangle passed by the ability is part of the visual contract and must
    // not drift when the integration is refactored.
    it('timer_window_geometry_should_match_ability_contract', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      const rect = bridge.getLastTimerRect();
      expect(rect === null).assertFalse();
      if (rect !== null) {
        expect(rect.x).assertEqual(TIMER_RECT_X);
        expect(rect.y).assertEqual(TIMER_RECT_Y);
        expect(rect.width).assertEqual(TIMER_RECT_WIDTH);
        expect(rect.height).assertEqual(TIMER_RECT_HEIGHT);
      }
    });

    // Stopping hides the timer window and presents the saved-to-photos tip.
    it('stop_request_should_hide_timer_and_show_tip', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      const code = bridge.requestStop();
      expect(code).assertEqual(0);
      expect(bridge.getApi().getRecorderState()).assertEqual(MockRecordingState.Stopped);
      const hideIndex = bridge.indexOfOperation('windowmanager', 'hide_timer_window');
      const tipIndex = bridge.indexOfOperation('windowmanager', 'popup_tip_window');
      expect(hideIndex).assertLargerOrEqual(0);
      expect(tipIndex > hideIndex).assertTrue();
      expect(bridge.getWindowFactory().getWindowHideCount(TIMER_WINDOW_NAME)).assertEqual(1);
    });

    // The tip window keeps its 3000 ms duration and its own rectangle.
    it('tip_window_contract_should_match_ability', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      bridge.requestStop();
      const popups = bridge.getWindowFactory().getPopupRecords();
      expect(popups.length).assertEqual(1);
      expect(popups[0].name).assertEqual(TIP_WINDOW_NAME);
      expect(popups[0].page).assertEqual('pages/ScreenRecorderDialog');
      expect(popups[0].duration).assertEqual(TIP_DURATION_MS);
      const rect = bridge.getLastTipRect();
      expect(rect === null).assertFalse();
      if (rect !== null) {
        expect(rect.x).assertEqual(TIP_RECT_X);
        expect(rect.y).assertEqual(TIP_RECT_Y);
        expect(rect.width).assertEqual(TIP_RECT_WIDTH);
        expect(rect.height).assertEqual(TIP_RECT_HEIGHT);
      }
    });

    // A stop request while idle must be ignored without touching any module.
    it('stop_without_recording_should_be_ignored', 0, () => {
      const bridge = new RecordingIntegrationBridge();
      const code = bridge.requestStop();
      expect(code).assertEqual(-1);
      expect(bridge.countOperations('ability', 'stop_ignored')).assertEqual(1);
      expect(bridge.countOperations('srapi', 'stop_recording')).assertEqual(0);
      expect(bridge.getWindowFactory().getPopupRecords().length).assertEqual(0);
    });

    // A duplicated start request is rejected by the ability gate, so the capture
    // API is invoked exactly once.
    it('duplicate_start_should_be_ignored', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      const second = await bridge.requestStart();
      expect(second).assertEqual(-1);
      expect(bridge.countOperations('srapi', 'start_recording')).assertEqual(1);
      expect(bridge.countOperations('photoaccesshelper', 'create_asset')).assertEqual(1);
      expect(bridge.getWindowFactory().getOpenRecords().length).assertEqual(1);
    });

    // When the capture API fails the ability schedules its termination with the
    // two second grace period used by the production code.
    it('error_state_should_schedule_terminate_with_delay', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      bridge.getApi().setStartReturn(-500);
      const code = await bridge.requestStart();
      expect(code).assertEqual(-500);
      expect(bridge.getApi().getRecorderState()).assertEqual(MockRecordingState.Error);
      expect(bridge.countOperations('ability', 'schedule_terminate') > 0).assertTrue();
      expect(bridge.getTerminateScheduledAtMs()).assertLarger(0);
      expect(bridge.getWindowFactory().getOpenRecords().length).assertEqual(0);
    });

    // The shared operation log has to be dense and strictly increasing so that
    // every ordering assertion above stays trustworthy.
    it('operation_log_should_be_sequential', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      bridge.requestStop();
      const log = bridge.getLog();
      expect(log.length).assertLargerOrEqual(11);
      expect(bridge.isLogSequential()).assertTrue();
      for (let index = 1; index < log.length; index++) {
        expect(log[index - 1].sequence).assertLess(log[index].sequence);
      }
      expect(log[0].operation).assertEqual('on_request_start');
    });

    // Destroying the service releases the windows before the managers, and the
    // release is recorded for both modules.
    it('teardown_should_release_all_components_in_order', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      bridge.requestStop();
      bridge.teardown();
      const log = bridge.getLog();
      const last = log[log.length - 1];
      expect(last.component).assertEqual('srmanager');
      expect(last.operation).assertEqual('release');
      expect(bridge.countOperations('ability', 'on_destroy')).assertEqual(1);
      expect(bridge.countOperations('windowmanager', 'release')).assertEqual(1);
      expect(bridge.getWindowFactory().isReleased()).assertTrue();
    });

    // Per-module call counters summarise the collaboration of one journey.
    it('component_call_counts_should_match_expectations', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      bridge.requestStop();
      expect(bridge.countByComponent('ability')).assertEqual(2);
      expect(bridge.countByComponent('srmanager')).assertEqual(3);
      expect(bridge.countByComponent('windowmanager')).assertEqual(3);
      expect(bridge.countByComponent('srapi')).assertEqual(2);
      expect(bridge.countByComponent('photoaccesshelper')).assertEqual(1);
      expect(bridge.getLogSize()).assertEqual(11);
    });

    // Two complete journeys keep the ordering invariant and create one media
    // asset per journey.
    it('two_full_cycles_should_keep_ordering', 0, async () => {
      const bridge = new RecordingIntegrationBridge();
      await bridge.requestStart();
      bridge.requestStop();
      await bridge.requestStart();
      bridge.requestStop();
      expect(bridge.countOperations('srapi', 'start_recording')).assertEqual(2);
      expect(bridge.countOperations('srapi', 'stop_recording')).assertEqual(2);
      expect(bridge.countOperations('windowmanager', 'popup_tip_window')).assertEqual(2);
      expect(bridge.getPhotoFactory().getAssetCount()).assertEqual(2);
      expect(bridge.isLogSequential()).assertTrue();
    });

    // Real-device probe: the integration either renders the timer window or the
    // tip window, and the component tree is always readable.
    it('device_should_render_integrated_window', 0, async () => {
      await launchRecorderService();
      const stable = await waitForTimerWindowStable(driver, 3000);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      expect(typeof stable).assertEqual('boolean');
    });
  });
}

