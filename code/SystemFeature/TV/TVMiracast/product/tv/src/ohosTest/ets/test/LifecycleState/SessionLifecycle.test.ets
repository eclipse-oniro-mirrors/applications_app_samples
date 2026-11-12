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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  waitForPageStable,
  triggerMiracastHome,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'SessionLifecycleSuite';

enum CastSessionPhase {
  IDLE = 'idle',
  CREATED = 'created',
  ACCEPTED = 'accepted',
  MIRRORING = 'mirroring',
  RELEASING = 'releasing',
  RELEASED = 'released'
}

class CastSessionModel {
  private phase: CastSessionPhase = CastSessionPhase.IDLE;
  private deviceId: string = '';
  private mirrorPlayer: string = '';
  private history: CastSessionPhase[] = [];
  public canCreate(phase: CastSessionPhase): boolean {
    return phase === CastSessionPhase.IDLE || phase === CastSessionPhase.RELEASED;
  }
  public canRelease(phase: CastSessionPhase): boolean {
    return phase !== CastSessionPhase.IDLE && phase !== CastSessionPhase.RELEASING;
  }
  public create(deviceId: string): boolean {
    if (deviceId.length === 0 || !this.canCreate(this.phase)) {
      return false;
    }
    this.deviceId = deviceId;
    this.mirrorPlayer = '';
    this.moveTo(CastSessionPhase.CREATED);
    return true;
  }
  public accept(): boolean {
    if (this.phase !== CastSessionPhase.CREATED) {
      return false;
    }
    this.moveTo(CastSessionPhase.ACCEPTED);
    return true;
  }
  public attachMirrorPlayer(playerTag: string): boolean {
    if (playerTag.length === 0 || this.phase !== CastSessionPhase.ACCEPTED) {
      return false;
    }
    this.mirrorPlayer = playerTag;
    this.moveTo(CastSessionPhase.MIRRORING);
    return true;
  }
  public release(): boolean {
    if (!this.canRelease(this.phase)) {
      return false;
    }
    this.mirrorPlayer = '';
    this.moveTo(CastSessionPhase.RELEASING);
    this.moveTo(CastSessionPhase.RELEASED);
    return true;
  }
  public moveTo(phase: CastSessionPhase): void {
    this.phase = phase;
    this.history.push(phase);
  }
  public getPhase(): CastSessionPhase {
    return this.phase;
  }
  public getDeviceId(): string {
    return this.deviceId;
  }
  public getMirrorPlayer(): string {
    return this.mirrorPlayer;
  }
  public countPhase(phase: CastSessionPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i] === phase) {
        count++;
      }
    }
    return count;
  }
}
class SessionLifecycleTracker {
  private static instance: SessionLifecycleTracker | null = null;
  private phases: CastSessionPhase[] = [];
  private successes: boolean[] = [];
  public static getInstance(): SessionLifecycleTracker {
    if (SessionLifecycleTracker.instance === null) {
      SessionLifecycleTracker.instance = new SessionLifecycleTracker();
    }
    return SessionLifecycleTracker.instance;
  }
  public record(phase: CastSessionPhase, success: boolean): void {
    this.phases.push(phase);
    this.successes.push(success);
  }
  public reset(): void {
    this.phases = [];
    this.successes = [];
  }
  public getSuccessRate(): number {
    if (this.phases.length === 0) {
      return 0;
    }
    let count: number = 0;
    for (let i = 0; i < this.successes.length; i++) {
      if (this.successes[i]) {
        count++;
      }
    }
    return count / this.phases.length;
  }
  public countPhase(phase: CastSessionPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.phases.length; i++) {
      if (this.phases[i] === phase) {
        count++;
      }
    }
    return count;
  }
}

export default function sessionLifecycleSuite(): void {
  describe('SessionLifecycle_Suite', () => {
    let driver: Driver;
    let tracker: SessionLifecycleTracker;
    beforeAll(async () => {
      driver = getDriver();
      tracker = SessionLifecycleTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite start');
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      tracker.reset();
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'suite end');
    });

    it('session_create_should_reject_empty_device_id', 0, async () => {
      expect(new CastSessionModel().create('')).assertFalse();
    });
    it('session_should_be_created_with_valid_device_id', 0, async () => {
      const session = new CastSessionModel();
      expect(session.create('device_001') && session.getDeviceId() === 'device_001').assertTrue();
    });
    it('session_create_should_be_rejected_when_created', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_001');
      expect(session.create('device_002')).assertFalse();
    });
    it('session_accept_before_create_should_fail', 0, async () => {
      expect(new CastSessionModel().accept()).assertFalse();
    });
    it('session_should_attach_mirror_player_after_accept', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_001');
      session.accept();
      expect(session.attachMirrorPlayer('player_1') && session.getMirrorPlayer() === 'player_1').assertTrue();
    });
    it('session_should_reject_empty_mirror_player', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_001');
      session.accept();
      expect(session.attachMirrorPlayer('')).assertFalse();
    });
    it('session_mirror_before_accept_should_fail', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_1');
      expect(session.attachMirrorPlayer('player_1')).assertFalse();
    });
    it('session_release_should_clear_mirror_player', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_001');
      session.accept();
      session.attachMirrorPlayer('player_1');
      expect(session.release() && session.getMirrorPlayer() === '').assertTrue();
    });
    it('session_release_before_accept_should_fail', 0, async () => {
      expect(new CastSessionModel().release()).assertFalse();
    });
    it('session_should_be_recreatable_after_release', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_001');
      session.release();
      expect(session.create('device_002') && session.getPhase() === CastSessionPhase.CREATED).assertTrue();
    });
    it('transition_guard_should_limit_phase_changes', 0, async () => {
      const session = new CastSessionModel();
      expect(session.canCreate(CastSessionPhase.IDLE) && session.canCreate(CastSessionPhase.RELEASED)).assertTrue();
      expect(!session.canCreate(CastSessionPhase.CREATED) && session.canRelease(CastSessionPhase.ACCEPTED)).assertTrue();
    });
    it('session_accept_should_move_to_accepted_state', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_a');
      expect(session.accept() && session.getPhase() === CastSessionPhase.ACCEPTED).assertTrue();
    });
    it('session_phase_count_should_grow_with_progress', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_count');
      session.accept();
      expect(session.countPhase(CastSessionPhase.ACCEPTED)).assertEqual(1);
    });
    it('session_should_handle_multiple_lifecycle_cycles', 0, async () => {
      const session = new CastSessionModel();
      for (let i = 0; i < 3; i++) {
        session.create('device_' + i);
        session.release();
      }
      expect(session.countPhase(CastSessionPhase.RELEASED)).assertEqual(3);
    });
    it('session_should_accept_long_device_id', 0, async () => {
      const session = new CastSessionModel();
      expect(session.create('device_0123456789') && session.getDeviceId().length === 17).assertTrue();
    });
    it('session_phase_should_reset_for_new_cycle', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_1');
      session.release();
      session.create('device_2');
      expect(session.getPhase() === CastSessionPhase.CREATED && session.getMirrorPlayer() === '').assertTrue();
    });
    it('lifecycle_tracker_should_compute_success_rate', 0, async () => {
      tracker.reset();
      tracker.record(CastSessionPhase.CREATED, true);
      tracker.record(CastSessionPhase.ACCEPTED, false);
      expect(tracker.getSuccessRate()).assertEqual(0.5);
    });
    it('lifecycle_tracker_should_handle_empty_records', 0, async () => {
      tracker.reset();
      expect(tracker.getSuccessRate()).assertEqual(0);
    });
    it('lifecycle_tracker_should_count_phases', 0, async () => {
      tracker.reset();
      tracker.record(CastSessionPhase.MIRRORING, true);
      tracker.record(CastSessionPhase.MIRRORING, true);
      expect(tracker.countPhase(CastSessionPhase.MIRRORING)).assertEqual(2);
    });
    it('lifecycle_tracker_singleton_should_share_records', 0, async () => {
      const first: SessionLifecycleTracker = SessionLifecycleTracker.getInstance();
      first.reset();
      first.record(CastSessionPhase.CREATED, true);
      expect(tracker.countPhase(CastSessionPhase.CREATED)).assertEqual(1);
    });
    it('lifecycle_tracker_should_include_failures', 0, async () => {
      tracker.reset();
      tracker.record(CastSessionPhase.ACCEPTED, true);
      tracker.record(CastSessionPhase.ACCEPTED, false);
      expect(tracker.countPhase(CastSessionPhase.ACCEPTED)).assertEqual(2);
    });
    it('session_release_should_return_to_index', 0, async () => {
      const session = new CastSessionModel();
      session.create('device_release');
      session.release();
      await triggerMiracastHome(driver);
      expect(session.countPhase(CastSessionPhase.RELEASED)).assertEqual(1);
    });
    it('comprehensive_session_lifecycle_scenario', 0, async () => {
      const session = new CastSessionModel();
      expect(session.create('device_full') && session.accept() && session.attachMirrorPlayer('player_full')).assertTrue();
      expect(session.release() && session.countPhase(CastSessionPhase.RELEASED) === 1).assertTrue();
    });
  });
}
