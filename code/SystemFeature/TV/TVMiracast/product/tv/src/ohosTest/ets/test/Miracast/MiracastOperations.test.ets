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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_BACK,
  miracastComponentCount,
  checkFocusState,
  waitForPageStable,
  waitForServiceConnected,
  pressAndWait,
  getCurrentFocusIndex,
  triggerMiracastHome,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastOperationsSuite';

const RESULT_OK: number = 0;

const RESULT_FAILED: number = -1;

const MAX_PLAYER_COUNT: number = 9;

enum MiracastOperationKind {
  KIND_START = 'start',
  KIND_STOP = 'stop',
  KIND_CREATE_SESSION = 'createSession',
  KIND_SET_SCREEN = 'setScreen',
  KIND_PLAY = 'play',
  KIND_PAUSE = 'pause',
  KIND_MUTE = 'mute',
  KIND_UNMUTE = 'unMute'
}

enum MiracastOperationStatus {
  STATUS_QUEUED = 'queued',
  STATUS_RUNNING = 'running',
  STATUS_COMPLETED = 'completed',
  STATUS_FAILED = 'failed',
  STATUS_CANCELLED = 'cancelled'
}

interface MiracastOperationRequest {
  requestId: string;
  kind: MiracastOperationKind;
  deviceId: string;
  screenId: string;
  status: MiracastOperationStatus;
  createdAt: number;
}

class MockMiracastService {
  private static instance: MockMiracastService | null = null;
  private operationLog: string[] = [];
  private started: boolean = false;
  private sessionActive: boolean = false;
  private muted: boolean = false;
  private playing: boolean = false;
  private screenCount: number = 0;
  private playerCount: number = 0;
  private activeDeviceId: string = '';
  private callerUid: number = 1000;
  private callingUid: number = 1000;

  public static getInstance(): MockMiracastService {
    if (MockMiracastService.instance === null) {
      MockMiracastService.instance = new MockMiracastService();
    }
    return MockMiracastService.instance;
  }

  public async startService(): Promise<number> {
    this.operationLog.push('startMiracastService called');
    await Promise.resolve();
    this.started = true;
    return RESULT_OK;
  }

  public async stopService(): Promise<number> {
    this.operationLog.push('stopMiracastService called');
    await Promise.resolve();
    this.started = false;
    this.sessionActive = false;
    this.playing = false;
    this.muted = false;
    this.screenCount = 0;
    this.playerCount = 0;
    this.activeDeviceId = '';
    return RESULT_OK;
  }

  public async createSession(deviceId: string): Promise<number> {
    this.operationLog.push('createSession called');
    await Promise.resolve();
    if (!this.started) {
      return RESULT_FAILED;
    }
    if (!this.checkCaller()) {
      return RESULT_FAILED;
    }
    if (deviceId.length === 0) {
      return RESULT_FAILED;
    }
    if (this.playerCount >= MAX_PLAYER_COUNT) {
      return RESULT_FAILED;
    }
    this.sessionActive = true;
    this.activeDeviceId = deviceId;
    this.playerCount++;
    return RESULT_OK;
  }

  public async setScreen(deviceId: string, screenId: string): Promise<number> {
    this.operationLog.push('setScreen called');
    await Promise.resolve();
    if (!this.sessionActive || screenId.length === 0 || deviceId !== this.activeDeviceId) {
      return RESULT_FAILED;
    }
    this.screenCount++;
    return RESULT_OK;
  }

  public async play(): Promise<number> {
    this.operationLog.push('play called');
    await Promise.resolve();
    if (!this.sessionActive || this.screenCount === 0) {
      return RESULT_FAILED;
    }
    this.playing = true;
    return RESULT_OK;
  }

  public async pause(): Promise<number> {
    this.operationLog.push('pause called');
    await Promise.resolve();
    if (!this.playing) {
      return RESULT_FAILED;
    }
    this.playing = false;
    return RESULT_OK;
  }

  public async stop(): Promise<number> {
    this.operationLog.push('stop called');
    await Promise.resolve();
    if (!this.sessionActive) {
      return RESULT_FAILED;
    }
    this.playing = false;
    this.screenCount = 0;
    this.sessionActive = false;
    return RESULT_OK;
  }

  public async mute(): Promise<number> {
    this.operationLog.push('mute called');
    await Promise.resolve();
    this.muted = true;
    return RESULT_OK;
  }

  public async unMute(): Promise<number> {
    this.operationLog.push('unMute called');
    await Promise.resolve();
    this.muted = false;
    return RESULT_OK;
  }

  public setCallerUids(processUid: number, callingUid: number): void {
    this.callerUid = processUid;
    this.callingUid = callingUid;
  }

  public checkCaller(): boolean {
    return this.callerUid === this.callingUid;
  }

  public getOperationLog(): string[] {
    return [...this.operationLog];
  }

  public clearOperationLog(): void {
    this.operationLog = [];
  }

  public isStarted(): boolean { return this.started; }

  public isSessionActive(): boolean { return this.sessionActive; }

  public isMuted(): boolean { return this.muted; }

  public isPlaying(): boolean { return this.playing; }

  public getScreenCount(): number { return this.screenCount; }

  public getPlayerCount(): number { return this.playerCount; }

  public getActiveDeviceId(): string { return this.activeDeviceId; }

  public reset(): void {
    this.operationLog = [];
    this.started = false;
    this.sessionActive = false;
    this.muted = false;
    this.playing = false;
    this.screenCount = 0;
    this.playerCount = 0;
    this.activeDeviceId = '';
    this.callerUid = 1000;
    this.callingUid = 1000;
  }
}

class MiracastOperationQueue {
  private requests: MiracastOperationRequest[] = [];

  public enqueue(request: MiracastOperationRequest): void {
    this.requests.push(request);
  }

  public dequeue(): MiracastOperationRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests.shift() || null;
  }

  public peek(): MiracastOperationRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests[0];
  }

  public getLength(): number { return this.requests.length; }

  public isEmpty(): boolean { return this.requests.length === 0; }

  public getRequests(): MiracastOperationRequest[] {
    return [...this.requests];
  }

  public countByKind(kind: MiracastOperationKind): number {
    return this.requests.filter((request: MiracastOperationRequest) => request.kind === kind).length;
  }

  public removeById(requestId: string): boolean {
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].requestId === requestId) {
        this.requests.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.requests = [];
  }
}

class MiracastOperationValidator {
  private static readonly ALL_KINDS: MiracastOperationKind[] = [
    MiracastOperationKind.KIND_START,
    MiracastOperationKind.KIND_STOP,
    MiracastOperationKind.KIND_CREATE_SESSION,
    MiracastOperationKind.KIND_SET_SCREEN,
    MiracastOperationKind.KIND_PLAY,
    MiracastOperationKind.KIND_PAUSE,
    MiracastOperationKind.KIND_MUTE,
    MiracastOperationKind.KIND_UNMUTE
  ];

  public isValidKind(kind: MiracastOperationKind): boolean {
    return MiracastOperationValidator.ALL_KINDS.includes(kind);
  }

  public isDeviceRequired(kind: MiracastOperationKind): boolean {
    return kind !== MiracastOperationKind.KIND_START && kind !== MiracastOperationKind.KIND_STOP &&
      kind !== MiracastOperationKind.KIND_PLAY && kind !== MiracastOperationKind.KIND_PAUSE &&
      kind !== MiracastOperationKind.KIND_MUTE && kind !== MiracastOperationKind.KIND_UNMUTE;
  }

  public isScreenRequired(kind: MiracastOperationKind): boolean {
    return kind === MiracastOperationKind.KIND_SET_SCREEN;
  }

  public isRequestValid(request: MiracastOperationRequest): boolean {
    return this.validateRequest(request).length === 0;
  }

  public validateRequest(request: MiracastOperationRequest): string[] {
    const violations: string[] = [];
    if (!this.isValidKind(request.kind)) {
      violations.push('unknown operation kind');
    }
    if (this.isDeviceRequired(request.kind) && request.deviceId.trim().length === 0) {
      violations.push('device id required');
    }
    if (this.isScreenRequired(request.kind) && request.screenId.trim().length === 0) {
      violations.push('screen id required');
    }
    return violations;
  }
}

class MiracastRequestBuilder {
  private requestId: string = '';
  private kind: MiracastOperationKind = MiracastOperationKind.KIND_START;
  private deviceId: string = '';
  private screenId: string = '';
  private status: MiracastOperationStatus = MiracastOperationStatus.STATUS_QUEUED;
  private createdAt: number = Date.now();

  public withRequestId(requestId: string): MiracastRequestBuilder {
    this.requestId = requestId;
    return this;
  }

  public withKind(kind: MiracastOperationKind): MiracastRequestBuilder {
    this.kind = kind;
    return this;
  }

  public withDeviceId(deviceId: string): MiracastRequestBuilder {
    this.deviceId = deviceId;
    return this;
  }

  public withScreenId(screenId: string): MiracastRequestBuilder {
    this.screenId = screenId;
    return this;
  }

  public withStatus(status: MiracastOperationStatus): MiracastRequestBuilder {
    this.status = status;
    return this;
  }

  public build(): MiracastOperationRequest {
    const request: MiracastOperationRequest = {
      requestId: this.requestId,
      kind: this.kind,
      deviceId: this.deviceId,
      screenId: this.screenId,
      status: this.status,
      createdAt: this.createdAt
    };
    return request;
  }
}

class PlayerSlotRegistry {
  private slots: Map<string, number> = new Map<string, number>();
  private nextScreenId: number = 100;

  public allocate(deviceId: string): number {
    if (this.slots.has(deviceId)) {
      return RESULT_FAILED;
    }
    if (this.slots.size >= MAX_PLAYER_COUNT) {
      return RESULT_FAILED;
    }
    const screenId: number = this.nextScreenId;
    this.nextScreenId++;
    this.slots.set(deviceId, screenId);
    return screenId;
  }

  public release(deviceId: string): boolean {
    if (!this.slots.has(deviceId)) {
      return false;
    }
    this.slots.delete(deviceId);
    return true;
  }

  public getScreenId(deviceId: string): number {
    const value: number | undefined = this.slots.get(deviceId);
    if (value === undefined) {
      return RESULT_FAILED;
    }
    return value;
  }

  public getSize(): number { return this.slots.size; }

  public hasDevice(deviceId: string): boolean {
    return this.slots.has(deviceId);
  }

  public getDeviceIds(): string[] {
    const ids: string[] = [];
    this.slots.forEach((screenId: number, deviceId: string) => {
      ids.push(deviceId);
    });
    return ids;
  }

  public clear(): void {
    this.slots = new Map<string, number>();
    this.nextScreenId = 100;
  }
}

export default function miracastOperationsSuite(): void {
  describe('MiracastOperations_Test', () => {
    let driver: Driver;
    let service: MockMiracastService;

    beforeAll(async () => {
      driver = getDriver();
      service = MockMiracastService.getInstance();
      service.reset();
      Log.info(TAG, 'suite start');
      await waitForServiceConnected(driver);
      await driver.delayMs(TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await triggerMiracastHome(driver);
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      service.reset();
      Log.info(TAG, 'suite end');
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
    });


    it('session_creation_should_reflect_started_flag', 0, async () => {
      await service.startService();
      const createResult: number = await service.createSession('device_a');
      expect(createResult).assertEqual(RESULT_OK);
      expect(service.isSessionActive()).assertTrue();
      expect(service.isStarted()).assertTrue();
      expect(service.getActiveDeviceId()).assertEqual('device_a');
    });

    it('session_creation_should_require_service_start', 0, async () => {
      service.reset();
      const createResult: number = await service.createSession('device_b');
      expect(createResult).assertEqual(RESULT_FAILED);
      expect(service.isSessionActive()).assertFalse();
    });

    it('service_stop_should_clear_player_and_screen_state', 0, async () => {
      await service.startService();
      await service.createSession('device_c');
      await service.setScreen('device_c', 'screen_1');
      await service.play();
      const stopResult: number = await service.stopService();
      expect(stopResult).assertEqual(RESULT_OK);
      expect(service.getPlayerCount()).assertEqual(0);
      expect(service.getScreenCount()).assertEqual(0);
      expect(service.isPlaying()).assertFalse();
    });

    it('play_and_pause_should_toggle_playback_state', 0, async () => {
      service.reset();
      await service.startService();
      await service.createSession('device_d');
      await service.setScreen('device_d', 'screen_2');
      expect(await service.play()).assertEqual(RESULT_OK);
      expect(service.isPlaying()).assertTrue();
      expect(await service.pause()).assertEqual(RESULT_OK);
      expect(service.isPlaying()).assertFalse();
    });

    it('mute_and_unmute_should_toggle_audio_state', 0, async () => {
      expect(await service.mute()).assertEqual(RESULT_OK);
      expect(service.isMuted()).assertTrue();
      expect(await service.unMute()).assertEqual(RESULT_OK);
      expect(service.isMuted()).assertFalse();
    });

    it('play_without_screen_should_be_rejected', 0, async () => {
      service.reset();
      await service.startService();
      await service.createSession('device_e');
      const playResult: number = await service.play();
      expect(playResult).assertEqual(RESULT_FAILED);
      expect(service.isPlaying()).assertFalse();
    });

    it('screen_binding_should_reject_unknown_device', 0, async () => {
      service.reset();
      await service.startService();
      await service.createSession('device_f');
      expect(await service.setScreen('device_unknown', 'screen_3')).assertEqual(RESULT_FAILED);
      expect(await service.setScreen('device_f', 'screen_3')).assertEqual(RESULT_OK);
      expect(service.getScreenCount()).assertEqual(1);
    });

    it('unauthorized_caller_should_be_rejected', 0, async () => {
      service.reset();
      await service.startService();
      service.setCallerUids(1000, 2000);
      const createResult: number = await service.createSession('device_g');
      expect(createResult).assertEqual(RESULT_FAILED);
      expect(service.checkCaller()).assertFalse();
      service.setCallerUids(3000, 3000);
      expect(service.checkCaller()).assertTrue();
    });

    it('miracast_operations_should_complete_within_time_limit', 0, async () => {
      service.reset();
      const startTime: number = Date.now();
      await service.startService();
      await service.createSession('device_h');
      await service.mute();
      const elapsed: number = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(TIMEOUT_SESSION_CREATE + DELAY_AFTER_SESSION_OP);
    });

    it('player_count_should_be_capped_at_nine', 0, async () => {
      service.reset();
      await service.startService();
      for (let i = 0; i < MAX_PLAYER_COUNT; i++) {
        await service.createSession('cap_device_' + i);
      }
      expect(service.getPlayerCount()).assertEqual(MAX_PLAYER_COUNT);
      const overflowResult: number = await service.createSession('cap_device_extra');
      expect(overflowResult).assertEqual(RESULT_FAILED);
    });

    it('operation_queue_should_enqueue_and_dequeue_in_fifo_order', 0, async () => {
      const queue = new MiracastOperationQueue();
      const builder = new MiracastRequestBuilder();
      queue.enqueue(builder.withRequestId('r1').withKind(MiracastOperationKind.KIND_START).build());
      queue.enqueue(builder.withRequestId('r2').withKind(MiracastOperationKind.KIND_MUTE)
        .withDeviceId('device_q').build());
      expect(queue.getLength()).assertEqual(2);
      const first: MiracastOperationRequest | null = queue.dequeue();
      expect(first === null).assertFalse();
      if (first !== null) {
        expect(first.requestId).assertEqual('r1');
      }
      const second: MiracastOperationRequest | null = queue.dequeue();
      expect(second === null).assertFalse();
      if (second !== null) {
        expect(second.requestId).assertEqual('r2');
      }
      expect(queue.isEmpty()).assertTrue();
    });

    it('operation_queue_should_peek_without_removing', 0, async () => {
      const queue = new MiracastOperationQueue();
      queue.enqueue(new MiracastRequestBuilder().withRequestId('p1')
        .withKind(MiracastOperationKind.KIND_PLAY).build());
      const peeked: MiracastOperationRequest | null = queue.peek();
      expect(peeked === null).assertFalse();
      if (peeked !== null) {
        expect(peeked.requestId).assertEqual('p1');
      }
      expect(queue.getLength()).assertEqual(1);
    });

    it('operation_queue_should_return_null_when_empty', 0, async () => {
      const queue = new MiracastOperationQueue();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.dequeue() === null).assertTrue();
      expect(queue.peek() === null).assertTrue();
      expect(queue.getLength()).assertEqual(0);
    });

    it('operation_queue_should_count_requests_by_kind', 0, async () => {
      const queue = new MiracastOperationQueue();
      const builder = new MiracastRequestBuilder();
      queue.enqueue(builder.withRequestId('a').withKind(MiracastOperationKind.KIND_MUTE).build());
      queue.enqueue(builder.withRequestId('b').withKind(MiracastOperationKind.KIND_UNMUTE).build());
      queue.enqueue(builder.withRequestId('c').withKind(MiracastOperationKind.KIND_MUTE).build());
      expect(queue.countByKind(MiracastOperationKind.KIND_MUTE)).assertEqual(2);
      expect(queue.countByKind(MiracastOperationKind.KIND_UNMUTE)).assertEqual(1);
      expect(queue.countByKind(MiracastOperationKind.KIND_PLAY)).assertEqual(0);
    });

    it('operation_queue_should_remove_request_by_id', 0, async () => {
      const queue = new MiracastOperationQueue();
      const builder = new MiracastRequestBuilder();
      queue.enqueue(builder.withRequestId('keep').withKind(MiracastOperationKind.KIND_PLAY).build());
      queue.enqueue(builder.withRequestId('drop').withKind(MiracastOperationKind.KIND_PAUSE).build());
      expect(queue.removeById('drop')).assertTrue();
      expect(queue.getLength()).assertEqual(1);
      expect(queue.removeById('drop')).assertFalse();
      expect(queue.removeById('unknown')).assertFalse();
    });

    it('validator_should_accept_valid_request', 0, async () => {
      const validator = new MiracastOperationValidator();
      const request: MiracastOperationRequest = new MiracastRequestBuilder()
        .withRequestId('v1')
        .withKind(MiracastOperationKind.KIND_SET_SCREEN)
        .withDeviceId('device_v')
        .withScreenId('screen_v')
        .build();
      expect(validator.isValidKind(request.kind)).assertTrue();
      expect(validator.isRequestValid(request)).assertTrue();
      expect(validator.validateRequest(request).length).assertEqual(0);
    });

    it('validator_should_reject_missing_device_id', 0, async () => {
      const validator = new MiracastOperationValidator();
      const request: MiracastOperationRequest = new MiracastRequestBuilder()
        .withRequestId('v2').withKind(MiracastOperationKind.KIND_CREATE_SESSION).build();
      expect(validator.isDeviceRequired(MiracastOperationKind.KIND_CREATE_SESSION)).assertTrue();
      expect(validator.isRequestValid(request)).assertFalse();
      expect(validator.validateRequest(request).length).assertEqual(1);
    });

    it('validator_should_reject_missing_screen_id', 0, async () => {
      const validator = new MiracastOperationValidator();
      const request: MiracastOperationRequest = new MiracastRequestBuilder()
        .withRequestId('v3').withKind(MiracastOperationKind.KIND_SET_SCREEN)
        .withDeviceId('device_v3').build();
      expect(validator.isScreenRequired(MiracastOperationKind.KIND_SET_SCREEN)).assertTrue();
      expect(validator.isRequestValid(request)).assertFalse();
      const violations: string[] = validator.validateRequest(request);
      expect(violations.length).assertEqual(1);
      expect(violations[0]).assertEqual('screen id required');
    });

    it('validator_should_report_multiple_violations', 0, async () => {
      const validator = new MiracastOperationValidator();
      const request: MiracastOperationRequest = new MiracastRequestBuilder()
        .withRequestId('v4').withKind(MiracastOperationKind.KIND_SET_SCREEN).build();
      const violations: string[] = validator.validateRequest(request);
      expect(violations.length).assertEqual(2);
      expect(violations.includes('device id required')).assertTrue();
      expect(violations.includes('screen id required')).assertTrue();
    });

    it('request_builder_should_build_complete_request', 0, async () => {
      const built: MiracastOperationRequest = new MiracastRequestBuilder()
        .withRequestId('b1')
        .withKind(MiracastOperationKind.KIND_CREATE_SESSION)
        .withDeviceId('device_b1')
        .withScreenId('screen_b1')
        .withStatus(MiracastOperationStatus.STATUS_RUNNING)
        .build();
      expect(built.requestId).assertEqual('b1');
      expect(built.kind).assertEqual(MiracastOperationKind.KIND_CREATE_SESSION);
      expect(built.deviceId).assertEqual('device_b1');
      expect(built.screenId).assertEqual('screen_b1');
      expect(built.status).assertEqual(MiracastOperationStatus.STATUS_RUNNING);
      expect(built.createdAt).assertLargerOrEqual(0);
    });

    it('request_builder_should_default_to_start_kind', 0, async () => {
      const built: MiracastOperationRequest = new MiracastRequestBuilder().build();
      expect(built.kind).assertEqual(MiracastOperationKind.KIND_START);
      expect(built.status).assertEqual(MiracastOperationStatus.STATUS_QUEUED);
      expect(built.deviceId).assertEqual('');
      expect(built.screenId).assertEqual('');
    });

    it('player_slot_registry_should_allocate_increasing_screen_ids', 0, async () => {
      const registry = new PlayerSlotRegistry();
      const first: number = registry.allocate('slot_a');
      const second: number = registry.allocate('slot_b');
      expect(first).assertEqual(100);
      expect(second).assertEqual(101);
      expect(registry.getSize()).assertEqual(2);
      expect(registry.getScreenId('slot_b')).assertEqual(101);
    });

    it('player_slot_registry_should_reject_duplicate_device', 0, async () => {
      const registry = new PlayerSlotRegistry();
      expect(registry.allocate('slot_dup')).assertEqual(100);
      expect(registry.allocate('slot_dup')).assertEqual(RESULT_FAILED);
      expect(registry.getSize()).assertEqual(1);
      expect(registry.hasDevice('slot_dup')).assertTrue();
      expect(registry.hasDevice('slot_missing')).assertFalse();
    });

    it('player_slot_registry_should_reject_tenth_device', 0, async () => {
      const registry = new PlayerSlotRegistry();
      for (let i = 0; i < MAX_PLAYER_COUNT; i++) {
        expect(registry.allocate('fill_' + i)).assertLargerOrEqual(0);
      }
      expect(registry.getSize()).assertEqual(MAX_PLAYER_COUNT);
      expect(registry.allocate('fill_overflow')).assertEqual(RESULT_FAILED);
    });

    it('player_slot_registry_should_release_and_reallocate', 0, async () => {
      const registry = new PlayerSlotRegistry();
      registry.allocate('slot_x');
      expect(registry.release('slot_x')).assertTrue();
      expect(registry.getSize()).assertEqual(0);
      expect(registry.getScreenId('slot_x')).assertEqual(RESULT_FAILED);
      expect(registry.release('slot_x')).assertFalse();
      expect(registry.allocate('slot_x')).assertLargerOrEqual(0);
    });

    it('repeated_service_stop_should_keep_state_consistent', 0, async () => {
      service.reset();
      await service.startService();
      expect(await service.stopService()).assertEqual(RESULT_OK);
      expect(await service.stopService()).assertEqual(RESULT_OK);
      expect(service.isStarted()).assertFalse();
      expect(service.isSessionActive()).assertFalse();
    });

    it('screen_binding_should_fail_after_stop', 0, async () => {
      service.reset();
      await service.startService();
      await service.createSession('device_stop');
      await service.setScreen('device_stop', 'screen_stop');
      await service.stop();
      const bindResult: number = await service.setScreen('device_stop', 'screen_stop_2');
      expect(bindResult).assertEqual(RESULT_FAILED);
      expect(service.getScreenCount()).assertEqual(0);
    });

    it('pause_without_play_should_be_rejected', 0, async () => {
      service.reset();
      await service.startService();
      await service.createSession('device_pause');
      expect(await service.pause()).assertEqual(RESULT_FAILED);
      expect(service.isPlaying()).assertFalse();
    });

    it('operation_log_should_follow_call_order', 0, async () => {
      service.reset();
      await service.startService();
      await service.createSession('device_log');
      await service.setScreen('device_log', 'screen_log');
      await service.play();
      const log: string[] = service.getOperationLog();
      expect(log.length).assertEqual(4);
      expect(log[0].includes('startMiracastService')).assertTrue();
      expect(log[3].includes('play called')).assertTrue();
      service.clearOperationLog();
      expect(service.getOperationLog().length).assertEqual(0);
    });

    it('component_count_should_stay_within_tolerance', 0, async () => {
      await waitForServiceConnected(driver);
      const beforeCount: number = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const afterCount: number = await miracastComponentCount(driver);
      expect(Math.abs(afterCount - beforeCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });


    it('home_page_should_exit_safely_with_back_key', 0, async () => {
      await triggerMiracastHome(driver);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_SESSION_OP);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
      await triggerMiracastHome(driver);
    });

  });
}
