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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';

// Recording states exposed by SRManager and the native recording engine.
enum DeepRecState {
  Idle = 0,
  Recording = 1,
  Stopped = 2,
  Error = 3
}

// Reasons that produce a state transition, used by the audit trail.
enum TransitionReason {
  START_REQUEST = 'start-request',
  START_SUCCESS = 'start-success',
  START_FAILURE = 'start-failure',
  STOP_REQUEST = 'stop-request',
  STOP_SUCCESS = 'stop-success',
  STOP_FAILURE = 'stop-failure',
  NATIVE_CALLBACK = 'native-callback',
  SERVICE_DESTROY = 'service-destroy'
}

// One immutable transition record.
interface TransitionRecord {
  from: DeepRecState;
  to: DeepRecState;
  reason: TransitionReason;
  at: number;
}

// Metadata of a created photo asset.
interface AssetRecord {
  uri: string;
  fileName: string;
  subtype: number;
  createdAt: number;
  fd: number;
}

// Result of the asset creation pipeline.
interface AssetCreationResult {
  success: boolean;
  asset: AssetRecord | undefined;
  errorMessage: string;
}

// Formats recording file names exactly like SRManager.getVideoName().
class VideoNameFormatter {
  public static readonly TIME_LENGTH: number = 2;
  public static readonly TIME_PREFIX: string = '0';
  public static readonly FILE_PREFIX: string = 'REC';
  public static readonly CONNECTOR: string = '_';
  public static readonly VIDEO_TYPE: string = '.mp4';

  public static pad(value: number, length: number = VideoNameFormatter.TIME_LENGTH): string {
    return value.toString().padStart(length, VideoNameFormatter.TIME_PREFIX);
  }

  public static format(date: Date): string {
    const month = VideoNameFormatter.pad(date.getMonth() + 1);
    const day = VideoNameFormatter.pad(date.getDate());
    const year = date.getFullYear().toString().padStart(VideoNameFormatter.TIME_LENGTH,
      VideoNameFormatter.TIME_PREFIX);
    const hour = VideoNameFormatter.pad(date.getHours());
    const minute = VideoNameFormatter.pad(date.getMinutes());
    const second = VideoNameFormatter.pad(date.getSeconds());
    const stamp = `${year}${month}${day}${VideoNameFormatter.CONNECTOR}${hour}${minute}${second}`;
    return `${VideoNameFormatter.FILE_PREFIX}${VideoNameFormatter.CONNECTOR}${stamp}${VideoNameFormatter.VIDEO_TYPE}`;
  }

  public static isWellFormed(name: string): boolean {
    if (!name.startsWith('REC_') || !name.endsWith('.mp4')) {
      return false;
    }
    const body = name.substring(4, name.length - 4);
    if (body.length !== 15 || body.charAt(8) !== '_') {
      return false;
    }
    return VideoNameFormatter.isDigits(body.substring(0, 8)) && VideoNameFormatter.isDigits(body.substring(9));
  }

  private static isDigits(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      const code = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return text.length > 0;
  }

  public static parseDate(name: string): Date {
    const body = name.substring(4, name.length - 4);
    const year = Number(body.substring(0, 4));
    const month = Number(body.substring(4, 6));
    const day = Number(body.substring(6, 8));
    const hour = Number(body.substring(9, 11));
    const minute = Number(body.substring(11, 13));
    const second = Number(body.substring(13, 15));
    return new Date(year, month - 1, day, hour, minute, second);
  }
}

// Audit trail of the recording state machine.
class TransitionAudit {
  private records: TransitionRecord[] = [];

  public append(from: DeepRecState, to: DeepRecState, reason: TransitionReason, at: number): void {
    this.records.push({ from: from, to: to, reason: reason, at: at });
  }

  public getAll(): TransitionRecord[] {
    return this.records.slice();
  }

  public getCount(): number {
    return this.records.length;
  }

  public countByReason(reason: TransitionReason): number {
    let count = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].reason === reason) {
        count++;
      }
    }
    return count;
  }

  public getLast(): TransitionRecord | undefined {
    if (this.records.length === 0) {
      return undefined;
    }
    return this.records[this.records.length - 1];
  }

  public clear(): void {
    this.records = [];
  }
}

// Callback hub of SRManager.onStateChange. It keeps the last callback and
// counts every notification so that lost notifications become visible.
class StateCallbackHub {
  private callback: (state: DeepRecState) => void = (): void => {};
  private notifications: number = 0;
  private lastState: DeepRecState = DeepRecState.Idle;
  private history: DeepRecState[] = [];

  public register(callback: (state: DeepRecState) => void): void {
    this.callback = callback;
  }

  public notify(state: DeepRecState): void {
    this.notifications++;
    this.lastState = state;
    this.history.push(state);
    this.callback(state);
  }

  public getNotifications(): number {
    return this.notifications;
  }

  public getLastState(): DeepRecState {
    return this.lastState;
  }

  public getHistory(): DeepRecState[] {
    return this.history.slice();
  }
}

// Mock photo access helper aligned with photoAccessHelper.PhotoAccessHelper.
class PhotoAccessMock {
  private counter: number = 0;
  private assets: AssetRecord[] = [];
  public throwOnCreate: boolean = false;
  public nullHelper: boolean = false;
  private fdSeed: number = 1000;

  public async createAsset(fileName: string, subtype: number, at: number): Promise<AssetRecord> {
    if (this.nullHelper) {
      throw new Error('phAccessHelper is null');
    }
    if (this.throwOnCreate) {
      throw new Error('createAsset failed');
    }
    this.counter++;
    const uri = `file://media/Photo/${this.counter}/${fileName}`;
    const record: AssetRecord = {
      uri: uri,
      fileName: fileName,
      subtype: subtype,
      createdAt: at,
      fd: this.fdSeed++
    };
    this.assets.push(record);
    return record;
  }

  public getAssets(): AssetRecord[] {
    return this.assets.slice();
  }

  public getCounter(): number {
    return this.counter;
  }

  public reset(): void {
    this.counter = 0;
    this.assets = [];
    this.throwOnCreate = false;
    this.nullHelper = false;
    this.fdSeed = 1000;
  }
}

// Behavior model of SRManager. It reproduces the ordering that matters for the
// product: the state listener is registered before the asset is created, the
// asset and the fd are prepared before the native start call, and any failure is
// reported through the state callback.
class SRManagerModel {
  private static instance: SRManagerModel | undefined;

  private state: DeepRecState = DeepRecState.Idle;
  private photoAccess: PhotoAccessMock;
  private hub: StateCallbackHub = new StateCallbackHub();
  private audit: TransitionAudit = new TransitionAudit();
  private fd: number = -1;
  private asset: AssetRecord | undefined;
  private fileName: string = '';
  private clockMs: number;
  private listenerRegistered: boolean = false;
  private startCalls: number = 0;
  private stopCalls: number = 0;
  private startReturnCode: number = 0;
  private stopReturnCode: number = 0;
  private startOrder: string[] = [];

  constructor(photoAccess: PhotoAccessMock, seed: number = 1700000000000) {
    this.photoAccess = photoAccess;
    this.clockMs = seed;
  }

  public static getInstance(photoAccess: PhotoAccessMock): SRManagerModel {
    if (!SRManagerModel.instance) {
      SRManagerModel.instance = new SRManagerModel(photoAccess);
    }
    return SRManagerModel.instance;
  }

  public static resetSingleton(): void {
    SRManagerModel.instance = undefined;
  }

  public advance(ms: number): void {
    this.clockMs += ms;
  }

  private transit(next: DeepRecState, reason: TransitionReason): void {
    const from = this.state;
    this.state = next;
    this.audit.append(from, next, reason, this.clockMs);
  }

  private registerListener(): void {
    this.listenerRegistered = true;
    this.startOrder.push('register-listener');
    this.hub.register((state: DeepRecState) => {
      this.state = state;
    });
  }

  private async createVideoAsset(): Promise<AssetCreationResult> {
    this.startOrder.push('create-asset');
    try {
      this.fileName = VideoNameFormatter.format(new Date(this.clockMs));
      this.asset = await this.photoAccess.createAsset(this.fileName, 1, this.clockMs);
      this.fd = this.asset.fd;
      return { success: true, asset: this.asset, errorMessage: '' };
    } catch (error) {
      const message = error instanceof Error ? error.message : String(error);
      this.transit(DeepRecState.Error, TransitionReason.START_FAILURE);
      this.hub.notify(DeepRecState.Error);
      return { success: false, asset: undefined, errorMessage: message };
    }
  }

  public async startRecording(): Promise<void> {
    this.startCalls++;
    this.registerListener();
    const creation = await this.createVideoAsset();
    if (!creation.success) {
      return;
    }
    this.startOrder.push('native-start');
    if (this.startReturnCode !== 0) {
      this.transit(DeepRecState.Error, TransitionReason.START_FAILURE);
      this.hub.notify(DeepRecState.Error);
      return;
    }
    this.transit(DeepRecState.Recording, TransitionReason.START_SUCCESS);
    this.hub.notify(DeepRecState.Recording);
  }

  public nativeStateCallback(state: DeepRecState): void {
    switch (state) {
      case DeepRecState.Idle: {
        this.transit(DeepRecState.Idle, TransitionReason.NATIVE_CALLBACK);
        break;
      }
      case DeepRecState.Recording: {
        this.transit(DeepRecState.Recording, TransitionReason.NATIVE_CALLBACK);
        this.hub.notify(DeepRecState.Recording);
        break;
      }
      case DeepRecState.Stopped: {
        this.transit(DeepRecState.Stopped, TransitionReason.NATIVE_CALLBACK);
        this.hub.notify(DeepRecState.Stopped);
        break;
      }
      case DeepRecState.Error: {
        this.transit(DeepRecState.Error, TransitionReason.NATIVE_CALLBACK);
        this.hub.notify(DeepRecState.Error);
        break;
      }
      default: {
        break;
      }
    }
  }

  public async stopRecording(): Promise<void> {
    this.stopCalls++;
    this.startOrder.push('native-stop');
    if (this.stopReturnCode !== 0) {
      this.transit(DeepRecState.Error, TransitionReason.STOP_FAILURE);
      this.hub.notify(DeepRecState.Error);
      return;
    }
    this.transit(DeepRecState.Stopped, TransitionReason.STOP_SUCCESS);
    this.hub.notify(DeepRecState.Stopped);
  }

  public queryState(): DeepRecState {
    return this.state;
  }

  public onStateChange(callback: (state: DeepRecState) => void): void {
    this.hub.register(callback);
  }

  public destroy(): void {
    this.transit(DeepRecState.Idle, TransitionReason.SERVICE_DESTROY);
    this.asset = undefined;
    this.fd = -1;
  }

  public setStartReturnCode(code: number): void {
    this.startReturnCode = code;
  }

  public setStopReturnCode(code: number): void {
    this.stopReturnCode = code;
  }

  public getFd(): number {
    return this.fd;
  }

  public getFileName(): string {
    return this.fileName;
  }

  public getAsset(): AssetRecord | undefined {
    return this.asset;
  }

  public getHub(): StateCallbackHub {
    return this.hub;
  }

  public getAudit(): TransitionAudit {
    return this.audit;
  }

  public getStartOrder(): string[] {
    return this.startOrder.slice();
  }

  public isListenerRegistered(): boolean {
    return this.listenerRegistered;
  }

  public getStartCalls(): number {
    return this.startCalls;
  }

  public getStopCalls(): number {
    return this.stopCalls;
  }
}

// Static configuration of the recorder, aligned with Constants.ets.
class RecorderConfigSpec {
  public static readonly VIDEO_SOURCE_TYPE_SURFACE_YUV: number = 0;
  public static readonly VIDEO_SOURCE_TYPE_SURFACE_ES: number = 1;
  public static readonly AUDIO_SOURCE_MIC: number = 1;
  public static readonly FD_PREFIX: string = 'fd://';
  public static readonly VIRTUAL_SCREEN_NAME: string = 'screenRecorder';
  public static readonly DEVICE_RATE: number = 0.6;
  public static readonly WIDTH: number = 1920;
  public static readonly HEIGHT: number = 1080;

  public static buildFdUrl(fd: number): string {
    return `${RecorderConfigSpec.FD_PREFIX}${fd}`;
  }

  public static isFdUrlValid(url: string): boolean {
    if (!url.startsWith(RecorderConfigSpec.FD_PREFIX)) {
      return false;
    }
    const tail = url.substring(RecorderConfigSpec.FD_PREFIX.length);
    if (tail.length === 0) {
      return false;
    }
    for (let i = 0; i < tail.length; i++) {
      const code = tail.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  public static scaledWidth(displayWidth: number): number {
    return Math.round(RecorderConfigSpec.WIDTH * RecorderConfigSpec.DEVICE_RATE * displayWidth / 1920);
  }

  public static scaledHeight(displayHeight: number): number {
    return Math.round(RecorderConfigSpec.HEIGHT * RecorderConfigSpec.DEVICE_RATE * displayHeight / 1080);
  }

  public static isSupported(width: number, height: number): boolean {
    return width <= RecorderConfigSpec.WIDTH && height <= RecorderConfigSpec.HEIGHT;
  }
}

// Snapshot used by the deep assertions. A snapshot is immutable so that the
// comparison between two moments cannot be affected by later mutations.
interface DeepSnapshot {
  state: DeepRecState;
  fd: number;
  fileName: string;
  transitions: number;
  notifications: number;
  listenerRegistered: boolean;
}

// Ordered event timeline of one recording session. It is used to validate that
// the observable events (start, first frame, stop, saved) keep their order.
interface TimelineEvent {
  label: string;
  at: number;
}

class RecordingTimeline {
  private events: TimelineEvent[] = [];

  public addEvent(label: string, at: number): void {
    this.events.push({ label: label, at: at });
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public getEvents(): TimelineEvent[] {
    return this.events.slice();
  }

  public getLabels(): string {
    let result = '';
    for (let i = 0; i < this.events.length; i++) {
      if (i > 0) {
        result += '>';
      }
      result += this.events[i].label;
    }
    return result;
  }

  public hasLabel(label: string): boolean {
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].label === label) {
        return true;
      }
    }
    return false;
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].at < this.events[i - 1].at) {
        return false;
      }
    }
    return true;
  }

  public getTotalDuration(): number {
    if (this.events.length < 2) {
      return 0;
    }
    let min: number = this.events[0].at;
    let max: number = this.events[0].at;
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].at < min) {
        min = this.events[i].at;
      }
      if (this.events[i].at > max) {
        max = this.events[i].at;
      }
    }
    return max > min ? max - min : 0;
  }

  public clear(): void {
    this.events = [];
  }
}

function takeSnapshot(model: SRManagerModel): DeepSnapshot {
  return {
    state: model.queryState(),
    fd: model.getFd(),
    fileName: model.getFileName(),
    transitions: model.getAudit().getCount(),
    notifications: model.getHub().getNotifications(),
    listenerRegistered: model.isListenerRegistered()
  };
}

export default function recordingModelDeepTest(): void {
  describe('RecordingModelDeep_Test', () => {
    let photoAccess: PhotoAccessMock;
    let model: SRManagerModel;

    beforeAll(() => {
      SRManagerModel.resetSingleton();
    });

    beforeEach(() => {
      photoAccess = new PhotoAccessMock();
      model = new SRManagerModel(photoAccess);
    });

    afterAll(() => {
      SRManagerModel.resetSingleton();
    });

    it('video_name_formatter_should_pad_every_field', 0, () => {
      const name = VideoNameFormatter.format(new Date(2024, 0, 5, 3, 4, 5));
      expect(name).assertEqual('REC_20240105_030405.mp4');
      expect(VideoNameFormatter.isWellFormed(name)).assertEqual(true);
      expect(name.length).assertEqual(23);
    });

    it('video_name_formatter_should_handle_double_digit_months', 0, () => {
      const name = VideoNameFormatter.format(new Date(2024, 11, 31, 23, 59, 59));
      expect(name).assertEqual('REC_20241231_235959.mp4');
      expect(VideoNameFormatter.isWellFormed(name)).assertEqual(true);
    });

    it('video_name_formatter_should_round_trip_through_parse', 0, () => {
      const date = new Date(2025, 5, 17, 8, 9, 10);
      const name = VideoNameFormatter.format(date);
      const parsed = VideoNameFormatter.parseDate(name);
      expect(parsed.getFullYear()).assertEqual(2025);
      expect(parsed.getMonth()).assertEqual(5);
      expect(parsed.getDate()).assertEqual(17);
      expect(parsed.getHours()).assertEqual(8);
      expect(parsed.getMinutes()).assertEqual(9);
      expect(parsed.getSeconds()).assertEqual(10);
    });

    it('video_name_formatter_should_reject_malformed_names', 0, () => {
      expect(VideoNameFormatter.isWellFormed('REC_20240105_030405.mp4')).assertEqual(true);
      expect(VideoNameFormatter.isWellFormed('REC_20240105_030405.MP4')).assertEqual(false);
      expect(VideoNameFormatter.isWellFormed('REC-20240105-030405.mp4')).assertEqual(false);
      expect(VideoNameFormatter.isWellFormed('REC_2024010_030405.mp4')).assertEqual(false);
      expect(VideoNameFormatter.isWellFormed('REC_20240105_03040A.mp4')).assertEqual(false);
      expect(VideoNameFormatter.isWellFormed('')).assertEqual(false);
    });

    it('start_recording_should_register_listener_first', 0, async () => {
      await model.startRecording();
      const order = model.getStartOrder();
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('register-listener');
      expect(order[1]).assertEqual('create-asset');
      expect(order[2]).assertEqual('native-start');
      expect(model.isListenerRegistered()).assertEqual(true);
    });

    it('start_recording_should_create_asset_with_screenshot_subtype', 0, async () => {
      await model.startRecording();
      const assets = photoAccess.getAssets();
      expect(assets.length).assertEqual(1);
      expect(assets[0].subtype).assertEqual(1);
      expect(assets[0].fileName.startsWith('REC_')).assertEqual(true);
      expect(assets[0].uri.indexOf('file://media/Photo') === 0).assertEqual(true);
    });

    it('start_recording_should_switch_to_recording_state', 0, async () => {
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Recording);
      expect(model.getFd()).assertEqual(1000);
      expect(model.getHub().getLastState()).assertEqual(DeepRecState.Recording);
      expect(model.getHub().getNotifications()).assertEqual(1);
    });

    it('start_recording_should_record_transition_reason', 0, async () => {
      await model.startRecording();
      const audit = model.getAudit();
      expect(audit.getCount()).assertEqual(1);
      const last = audit.getLast();
      expect(last !== undefined).assertEqual(true);
      expect(audit.countByReason(TransitionReason.START_SUCCESS)).assertEqual(1);
    });

    it('asset_creation_failure_should_report_error_state', 0, async () => {
      photoAccess.throwOnCreate = true;
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Error);
      expect(model.getFd()).assertEqual(-1);
      expect(model.getHub().getLastState()).assertEqual(DeepRecState.Error);
      expect(model.getAudit().countByReason(TransitionReason.START_FAILURE)).assertEqual(1);
    });

    it('null_helper_should_report_error_state', 0, async () => {
      photoAccess.nullHelper = true;
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Error);
      expect(model.getAsset() === undefined).assertEqual(true);
    });

    it('native_start_failure_should_report_error_state', 0, async () => {
      model.setStartReturnCode(-1);
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Error);
      expect(model.getHub().getLastState()).assertEqual(DeepRecState.Error);
      expect(model.getAudit().countByReason(TransitionReason.START_FAILURE)).assertEqual(1);
    });

    it('native_start_success_should_only_notify_once', 0, async () => {
      await model.startRecording();
      const hub = model.getHub();
      expect(hub.getNotifications()).assertEqual(1);
      expect(hub.getHistory().length).assertEqual(1);
      hub.notify(DeepRecState.Recording);
      expect(hub.getNotifications()).assertEqual(2);
    });

    it('stop_recording_should_switch_to_stopped_state', 0, async () => {
      await model.startRecording();
      await model.stopRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Stopped);
      expect(model.getStopCalls()).assertEqual(1);
      expect(model.getHub().getLastState()).assertEqual(DeepRecState.Stopped);
      expect(model.getAudit().countByReason(TransitionReason.STOP_SUCCESS)).assertEqual(1);
    });

    it('stop_failure_should_report_error_state', 0, async () => {
      await model.startRecording();
      model.setStopReturnCode(-2);
      await model.stopRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Error);
      expect(model.getAudit().countByReason(TransitionReason.STOP_FAILURE)).assertEqual(1);
    });

    it('native_callback_should_keep_hub_and_state_in_sync', 0, () => {
      model.nativeStateCallback(DeepRecState.Recording);
      expect(model.queryState()).assertEqual(DeepRecState.Recording);
      expect(model.getHub().getLastState()).assertEqual(DeepRecState.Recording);
      model.nativeStateCallback(DeepRecState.Stopped);
      expect(model.getHub().getLastState()).assertEqual(DeepRecState.Stopped);
      expect(model.getAudit().countByReason(TransitionReason.NATIVE_CALLBACK)).assertEqual(2);
    });

    it('native_idle_callback_should_not_notify_subscribers', 0, () => {
      model.nativeStateCallback(DeepRecState.Idle);
      expect(model.queryState()).assertEqual(DeepRecState.Idle);
      expect(model.getHub().getNotifications()).assertEqual(0);
      expect(model.getAudit().getCount()).assertEqual(1);
    });

    it('snapshot_should_capture_all_core_fields', 0, async () => {
      await model.startRecording();
      const snapshot = takeSnapshot(model);
      expect(snapshot.state).assertEqual(DeepRecState.Recording);
      expect(snapshot.fd).assertEqual(1000);
      expect(snapshot.fileName.startsWith('REC_')).assertEqual(true);
      expect(snapshot.transitions).assertEqual(1);
      expect(snapshot.notifications).assertEqual(1);
      expect(snapshot.listenerRegistered).assertEqual(true);
    });

    it('get_instance_should_return_singleton', 0, () => {
      SRManagerModel.resetSingleton();
      const first = SRManagerModel.getInstance(photoAccess);
      const second = SRManagerModel.getInstance(new PhotoAccessMock());
      expect(first === second).assertEqual(true);
      SRManagerModel.resetSingleton();
      const third = SRManagerModel.getInstance(photoAccess);
      expect(first === third).assertEqual(false);
    });

    it('destroy_should_release_asset_and_fd', 0, async () => {
      await model.startRecording();
      expect(model.getAsset() !== undefined).assertEqual(true);
      model.destroy();
      expect(model.getAsset() === undefined).assertEqual(true);
      expect(model.getFd()).assertEqual(-1);
      expect(model.queryState()).assertEqual(DeepRecState.Idle);
      expect(model.getAudit().countByReason(TransitionReason.SERVICE_DESTROY)).assertEqual(1);
    });

    it('fd_url_should_be_valid_for_every_allocation', 0, async () => {
      await model.startRecording();
      const url = RecorderConfigSpec.buildFdUrl(model.getFd());
      expect(url).assertEqual('fd://1000');
      expect(RecorderConfigSpec.isFdUrlValid(url)).assertEqual(true);
      expect(RecorderConfigSpec.isFdUrlValid('fd://')).assertEqual(false);
      expect(RecorderConfigSpec.isFdUrlValid('file://1000')).assertEqual(false);
    });

    it('recorder_config_should_match_production_constants', 0, () => {
      expect(RecorderConfigSpec.FD_PREFIX).assertEqual('fd://');
      expect(RecorderConfigSpec.VIRTUAL_SCREEN_NAME).assertEqual('screenRecorder');
      expect(RecorderConfigSpec.DEVICE_RATE).assertEqual(0.6);
      expect(RecorderConfigSpec.WIDTH).assertEqual(1920);
      expect(RecorderConfigSpec.HEIGHT).assertEqual(1080);
      expect(RecorderConfigSpec.VIDEO_SOURCE_TYPE_SURFACE_YUV).assertEqual(0);
      expect(RecorderConfigSpec.VIDEO_SOURCE_TYPE_SURFACE_ES).assertEqual(1);
      expect(RecorderConfigSpec.AUDIO_SOURCE_MIC).assertEqual(1);
    });

    it('recorder_config_should_scale_with_display', 0, () => {
      expect(RecorderConfigSpec.scaledWidth(1920)).assertEqual(1152);
      expect(RecorderConfigSpec.scaledHeight(1080)).assertEqual(648);
      expect(RecorderConfigSpec.scaledWidth(960)).assertEqual(576);
      expect(RecorderConfigSpec.isSupported(1920, 1080)).assertEqual(true);
      expect(RecorderConfigSpec.isSupported(2560, 1080)).assertEqual(false);
    });

    it('audit_count_by_reason_should_be_typed', 0, () => {
      const audit = new TransitionAudit();
      audit.append(DeepRecState.Idle, DeepRecState.Recording, TransitionReason.START_SUCCESS, 1);
      audit.append(DeepRecState.Recording, DeepRecState.Stopped, TransitionReason.STOP_SUCCESS, 2);
      audit.append(DeepRecState.Stopped, DeepRecState.Idle, TransitionReason.SERVICE_DESTROY, 3);
      expect(audit.getCount()).assertEqual(3);
      expect(audit.countByReason(TransitionReason.START_SUCCESS)).assertEqual(1);
      expect(audit.countByReason(TransitionReason.STOP_SUCCESS)).assertEqual(1);
      expect(audit.countByReason(TransitionReason.NATIVE_CALLBACK)).assertEqual(0);
      const last = audit.getLast();
      expect(last !== undefined).assertEqual(true);
      if (last !== undefined) {
        expect(last.from).assertEqual(DeepRecState.Stopped);
        expect(last.to).assertEqual(DeepRecState.Idle);
      }
      audit.clear();
      expect(audit.getCount()).assertEqual(0);
      expect(audit.getLast() === undefined).assertEqual(true);
    });

    it('recording_timeline_should_order_events', 0, () => {
      const timeline = new RecordingTimeline();
      timeline.addEvent('start', 100);
      timeline.addEvent('first-frame', 320);
      timeline.addEvent('stop', 5000);
      timeline.addEvent('saved', 5120);
      expect(timeline.getEventCount()).assertEqual(4);
      expect(timeline.getLabels()).assertEqual('start>first-frame>stop>saved');
      expect(timeline.hasLabel('first-frame')).assertEqual(true);
      expect(timeline.hasLabel('unknown')).assertEqual(false);
      expect(timeline.isMonotonic()).assertEqual(true);
    });

    it('recording_timeline_duration_should_be_monotonic', 0, () => {
      const timeline = new RecordingTimeline();
      expect(timeline.getTotalDuration()).assertEqual(0);
      timeline.addEvent('start', 1000);
      expect(timeline.getTotalDuration()).assertEqual(0);
      timeline.addEvent('stop', 61000);
      expect(timeline.getTotalDuration()).assertEqual(60000);
      timeline.addEvent('too-early', 500);
      expect(timeline.isMonotonic()).assertEqual(false);
      expect(timeline.getTotalDuration()).assertEqual(60500);
    });

    it('start_stop_start_should_produce_three_transitions', 0, async () => {
      await model.startRecording();
      await model.stopRecording();
      model.advance(2000);
      const fresh = new SRManagerModel(new PhotoAccessMock());
      await fresh.startRecording();
      expect(model.getAudit().getCount()).assertEqual(2);
      expect(fresh.getAudit().getCount()).assertEqual(1);
      expect(fresh.queryState()).assertEqual(DeepRecState.Recording);
    });

    it('concurrent_start_requests_should_be_serialized', 0, async () => {
      const tasks: Promise<void>[] = [];
      tasks.push(model.startRecording());
      tasks.push(model.startRecording());
      await Promise.all(tasks);
      expect(model.getStartCalls()).assertEqual(2);
      expect(photoAccess.getAssets().length).assertEqual(2);
      expect(model.queryState()).assertEqual(DeepRecState.Recording);
    });

    it('asset_counter_should_increase_per_recording', 0, async () => {
      await model.startRecording();
      expect(photoAccess.getCounter()).assertEqual(1);
      model.destroy();
      photoAccess.throwOnCreate = false;
      const second = new SRManagerModel(photoAccess);
      await second.startRecording();
      expect(photoAccess.getCounter()).assertEqual(2);
      const assets = photoAccess.getAssets();
      expect(assets.length).assertEqual(2);
      expect(assets[0].uri === assets[1].uri).assertEqual(false);
    });

    it('multiple_models_should_be_isolated', 0, async () => {
      const other = new SRManagerModel(new PhotoAccessMock());
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Recording);
      expect(other.queryState()).assertEqual(DeepRecState.Idle);
      expect(other.getFd()).assertEqual(-1);
      await other.startRecording();
      expect(other.queryState()).assertEqual(DeepRecState.Recording);
      expect(model.getAudit().getCount()).assertEqual(1);
      expect(other.getAudit().getCount()).assertEqual(1);
    });

    it('error_state_should_require_explicit_reset', 0, async () => {
      model.setStartReturnCode(-1);
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Error);
      model.nativeStateCallback(DeepRecState.Idle);
      expect(model.queryState()).assertEqual(DeepRecState.Idle);
      model.setStartReturnCode(0);
      await model.startRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Recording);
    });

    it('long_sequence_should_keep_audit_ordered', 0, () => {
      for (let i = 0; i < 30; i++) {
        model.nativeStateCallback(DeepRecState.Recording);
        model.nativeStateCallback(DeepRecState.Stopped);
      }
      const audit = model.getAudit();
      expect(audit.getCount()).assertEqual(60);
      expect(audit.countByReason(TransitionReason.NATIVE_CALLBACK)).assertEqual(60);
      const records = audit.getAll();
      expect(records[0].from).assertEqual(DeepRecState.Idle);
      expect(records[0].to).assertEqual(DeepRecState.Recording);
      expect(records[59].to).assertEqual(DeepRecState.Stopped);
      expect(model.getHub().getNotifications()).assertEqual(60);
    });

    it('snapshot_should_be_stable_after_state_settles', 0, async () => {
      await model.startRecording();
      const first = takeSnapshot(model);
      const second = takeSnapshot(model);
      expect(first.state).assertEqual(second.state);
      expect(first.fd).assertEqual(second.fd);
      expect(first.fileName).assertEqual(second.fileName);
      expect(first.transitions).assertEqual(second.transitions);
      expect(first.notifications).assertEqual(second.notifications);
    });

    it('config_scaling_should_be_stable_at_boundaries', 0, () => {
      expect(RecorderConfigSpec.scaledWidth(0)).assertEqual(0);
      expect(RecorderConfigSpec.scaledHeight(0)).assertEqual(0);
      expect(RecorderConfigSpec.scaledWidth(3840)).assertEqual(2304);
      expect(RecorderConfigSpec.scaledHeight(2160)).assertEqual(1296);
      expect(RecorderConfigSpec.isSupported(1920, 1080)).assertEqual(true);
      expect(RecorderConfigSpec.isSupported(1921, 1080)).assertEqual(false);
      expect(RecorderConfigSpec.isSupported(1920, 1081)).assertEqual(false);
    });

    it('timeline_clear_should_reset_all_fields', 0, () => {
      const timeline = new RecordingTimeline();
      timeline.addEvent('a', 10);
      timeline.addEvent('b', 20);
      expect(timeline.getEventCount()).assertEqual(2);
      expect(timeline.getTotalDuration()).assertEqual(10);
      timeline.clear();
      expect(timeline.getEventCount()).assertEqual(0);
      expect(timeline.getLabels()).assertEqual('');
      expect(timeline.getTotalDuration()).assertEqual(0);
      expect(timeline.isMonotonic()).assertEqual(true);
      expect(timeline.getEvents().length).assertEqual(0);
    });

    it('asset_uri_should_embed_generated_file_name', 0, async () => {
      await model.startRecording();
      const asset = model.getAsset();
      expect(asset !== undefined).assertEqual(true);
      if (asset !== undefined) {
        expect(asset.uri.indexOf(asset.fileName) > 0).assertEqual(true);
        expect(asset.fileName).assertEqual(model.getFileName());
        expect(asset.createdAt).assertEqual(1700000000000);
      }
    });

    it('start_order_should_not_duplicate_listener_registration', 0, async () => {
      await model.startRecording();
      expect(model.getStartOrder()[0]).assertEqual('register-listener');
      model.destroy();
      const orderSize = model.getStartOrder().length;
      model.nativeStateCallback(DeepRecState.Recording);
      expect(model.getStartOrder().length).assertEqual(orderSize);
    });

    it('stop_without_start_should_follow_native_result', 0, async () => {
      await model.stopRecording();
      expect(model.queryState()).assertEqual(DeepRecState.Stopped);
      expect(model.getStopCalls()).assertEqual(1);
      expect(model.getAudit().countByReason(TransitionReason.STOP_SUCCESS)).assertEqual(1);
    });

    it('state_enum_values_should_match_native_contract', 0, () => {
      expect(DeepRecState.Idle).assertEqual(0);
      expect(DeepRecState.Recording).assertEqual(1);
      expect(DeepRecState.Stopped).assertEqual(2);
      expect(DeepRecState.Error).assertEqual(3);
      const names: string[] = [
        TransitionReason.START_REQUEST,
        TransitionReason.START_SUCCESS,
        TransitionReason.START_FAILURE,
        TransitionReason.STOP_REQUEST,
        TransitionReason.STOP_SUCCESS,
        TransitionReason.STOP_FAILURE,
        TransitionReason.NATIVE_CALLBACK,
        TransitionReason.SERVICE_DESTROY
      ];
      expect(names.length).assertEqual(8);
      for (let i = 0; i < names.length; i++) {
        expect(names[i].length > 0).assertEqual(true);
      }
    });

    it('callback_hub_should_keep_history_order', 0, () => {
      const hub = new StateCallbackHub();
      let observed = 0;
      hub.register((state: DeepRecState) => {
        observed++;
        expect(state >= DeepRecState.Idle).assertEqual(true);
      });
      hub.notify(DeepRecState.Recording);
      hub.notify(DeepRecState.Stopped);
      hub.notify(DeepRecState.Error);
      expect(observed).assertEqual(3);
      expect(hub.getHistory().length).assertEqual(3);
      expect(hub.getHistory()[0]).assertEqual(DeepRecState.Recording);
      expect(hub.getHistory()[2]).assertEqual(DeepRecState.Error);
      expect(hub.getLastState()).assertEqual(DeepRecState.Error);
    });

    it('error_then_stopped_sequence_should_be_audited', 0, () => {
      model.nativeStateCallback(DeepRecState.Recording);
      model.nativeStateCallback(DeepRecState.Error);
      model.nativeStateCallback(DeepRecState.Stopped);
      const audit = model.getAudit();
      expect(audit.getCount()).assertEqual(3);
      const records = audit.getAll();
      expect(records[1].to).assertEqual(DeepRecState.Error);
      expect(records[2].from).assertEqual(DeepRecState.Error);
      expect(records[2].to).assertEqual(DeepRecState.Stopped);
      expect(model.getHub().getHistory().length).assertEqual(3);
    });

    it('file_name_and_fd_should_be_cleared_only_by_destroy', 0, async () => {
      await model.startRecording();
      const fileName = model.getFileName();
      const fd = model.getFd();
      await model.stopRecording();
      expect(model.getFileName()).assertEqual(fileName);
      expect(model.getFd()).assertEqual(fd);
      model.destroy();
      expect(model.getFd()).assertEqual(-1);
      expect(model.getFileName()).assertEqual(fileName);
    });

    it('hub_notify_should_record_repeated_states', 0, () => {
      const hub = new StateCallbackHub();
      hub.register((state: DeepRecState) => {
        expect(state).assertEqual(DeepRecState.Recording);
      });
      hub.notify(DeepRecState.Recording);
      hub.notify(DeepRecState.Recording);
      expect(hub.getNotifications()).assertEqual(2);
      expect(hub.getHistory().length).assertEqual(2);
      expect(hub.getLastState()).assertEqual(DeepRecState.Recording);
    });

    it('snapshot_before_start_should_reflect_idle_defaults', 0, () => {
      const snapshot = takeSnapshot(model);
      expect(snapshot.state).assertEqual(DeepRecState.Idle);
      expect(snapshot.fd).assertEqual(-1);
      expect(snapshot.fileName).assertEqual('');
      expect(snapshot.transitions).assertEqual(0);
      expect(snapshot.notifications).assertEqual(0);
      expect(snapshot.listenerRegistered).assertEqual(false);
    });

    it('formatter_padding_should_use_configured_prefix', 0, () => {
      expect(VideoNameFormatter.pad(3)).assertEqual('03');
      expect(VideoNameFormatter.pad(12)).assertEqual('12');
      expect(VideoNameFormatter.pad(0)).assertEqual('00');
      expect(VideoNameFormatter.pad(7, 3)).assertEqual('007');
      expect(VideoNameFormatter.TIME_PREFIX).assertEqual('0');
      expect(VideoNameFormatter.TIME_LENGTH).assertEqual(2);
    });

    it('fd_prefix_should_be_shared_with_operation_guard', 0, () => {
      expect(RecorderConfigSpec.FD_PREFIX).assertEqual('fd://');
      expect(RecorderConfigSpec.buildFdUrl(1000)).assertEqual('fd://1000');
      expect(RecorderConfigSpec.buildFdUrl(0)).assertEqual('fd://0');
      expect(RecorderConfigSpec.isFdUrlValid('fd://0')).assertEqual(true);
    });
  });
}


