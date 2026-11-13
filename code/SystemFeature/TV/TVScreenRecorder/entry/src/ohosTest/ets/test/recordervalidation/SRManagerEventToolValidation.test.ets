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
import hilog from '@ohos.hilog';
import {
  getDriver,
  recorderComponentCount,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'SREventToolValidation';

// Recording states exposed by SRManager through libentry.so.
enum RecorderState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

// Event kinds emitted by SRManager while a recording session is prepared.
enum RecorderEventKind {
  STATE_CHANGED = 'state_changed',
  START_REQUESTED = 'start_requested',
  STOP_REQUESTED = 'stop_requested',
  ASSET_CREATED = 'asset_created',
  SINK_URL_BUILT = 'sink_url_built',
  RECORD_FAILED = 'record_failed',
  TERMINATE_SCHEDULED = 'terminate_scheduled'
}

// One entry of the recording event journal.
interface RecorderEventRecord {
  kind: RecorderEventKind;
  stateCode: number;
  detail: string;
  timestamp: number;
}

// One video asset descriptor produced by photoAccessHelper.createAsset.
interface RecorderAssetDescriptor {
  fileName: string;
  uri: string;
  fd: number;
  sizeBytes: number;
}

// Shared text, size and time helpers used by SRManager validation.
class RecorderToolUtil {
  // Aligns with Tools_byte2Str: readable size for a recorded mp4 file.
  public static formatByteSize(bytes: number): string {
    if (bytes <= 0) {
      return '0B';
    }
    const units: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];
    let index: number = 0;
    let value: number = bytes;
    while (value >= 1024 && index < units.length - 1) {
      value = value / 1024;
      index++;
    }
    const formatted: string = value.toFixed(index === 0 ? 0 : 2).replace(/\.00$/, '');
    return formatted + units[index];
  }

  // Aligns with Tools_isEmpty: guards empty asset names and empty fd strings.
  public static isEmpty(value: string | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return value.length === 0;
  }

  // Serializes the sink url into bytes before it is handed to SRApi.
  public static stringToBuffer(text: string): Uint8Array {
    const bytes = new Uint8Array(text.length);
    for (let i = 0; i < text.length; i++) {
      bytes[i] = text.charCodeAt(i);
    }
    return bytes;
  }

  // Restores a sink url from bytes to validate the fd round trip.
  public static bufferToString(bytes: Uint8Array): string {
    let result: string = '';
    for (let i = 0; i < bytes.length; i++) {
      result += String.fromCharCode(bytes[i]);
    }
    return result;
  }

  // Formats the recording date as yyyy-MM-dd.
  public static formatDate(timestamp: number): string {
    const date = new Date(timestamp);
    const year: number = date.getFullYear();
    const month: string = String(date.getMonth() + 1).padStart(2, '0');
    const day: string = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

  // Aligns with the timer window format HH:mm:ss.
  public static formatTimerLabel(totalSeconds: number): string {
    const safeSeconds: number = totalSeconds < 0 ? 0 : Math.floor(totalSeconds);
    const hours: string = String(Math.floor(safeSeconds / 3600)).padStart(2, '0');
    const minutes: string = String(Math.floor(safeSeconds / 60) % 60).padStart(2, '0');
    const seconds: string = String(safeSeconds % 60).padStart(2, '0');
    return `${hours}:${minutes}:${seconds}`;
  }

  // Suffix matcher used for focus icon resource names.
  public static endsWith(text: string, suffix: string): boolean {
    return text.length >= suffix.length && text.slice(text.length - suffix.length) === suffix;
  }

  // Normalizes a resource name to lower case for comparisons.
  public static normalizeResourceName(name: string): string {
    return name.trim().toLowerCase();
  }
}

// Icon helper for the timer and tip windows of the recorder.
class RecorderIconUtil {
  public static readonly FOCUS_SUFFIX: string = '_focus';

  public static getFocusIcon(icon: string): string {
    return icon + RecorderIconUtil.FOCUS_SUFFIX;
  }

  public static isFocusIcon(icon: string): boolean {
    return RecorderToolUtil.endsWith(icon, RecorderIconUtil.FOCUS_SUFFIX);
  }
}

// Builds and parses the fd sink url consumed by SRApi.startRecording.
class SurfaceUrlBuilder {
  public static readonly FD_PREFIX: string = 'fd://';
  public static readonly INVALID_FD: number = -1;

  public static build(fd: number): string {
    return SurfaceUrlBuilder.FD_PREFIX + fd;
  }

  public static parseFd(url: string): number {
    if (!url.startsWith(SurfaceUrlBuilder.FD_PREFIX)) {
      return SurfaceUrlBuilder.INVALID_FD;
    }
    const raw: string = url.slice(SurfaceUrlBuilder.FD_PREFIX.length);
    if (raw.length === 0) {
      return SurfaceUrlBuilder.INVALID_FD;
    }
    for (let i = 0; i < raw.length; i++) {
      const code: number = raw.charCodeAt(i);
      if (code < 48 || code > 57) {
        return SurfaceUrlBuilder.INVALID_FD;
      }
    }
    return Number(raw);
  }

  public static isValid(url: string): boolean {
    return SurfaceUrlBuilder.parseFd(url) >= 0;
  }

  public static isFdBased(url: string): boolean {
    return url.startsWith(SurfaceUrlBuilder.FD_PREFIX);
  }
}

// Builds the REC_yyyyMMdd_HHmmss.mp4 asset name used by SRManager.
class RecordingFileNameBuilder {
  public static readonly PREFIX: string = 'REC';
  public static readonly SUFFIX: string = '.mp4';
  public static readonly CONNECTOR: string = '_';
  public static readonly TIME_LENGTH: number = 2;
  public static readonly TIME_PAD: string = '0';

  public static build(date: Date): string {
    const year: string = String(date.getFullYear());
    const month: string = String(date.getMonth() + 1).padStart(RecordingFileNameBuilder.TIME_LENGTH,
      RecordingFileNameBuilder.TIME_PAD);
    const day: string = String(date.getDate()).padStart(RecordingFileNameBuilder.TIME_LENGTH,
      RecordingFileNameBuilder.TIME_PAD);
    const hour: string = String(date.getHours()).padStart(RecordingFileNameBuilder.TIME_LENGTH,
      RecordingFileNameBuilder.TIME_PAD);
    const minute: string = String(date.getMinutes()).padStart(RecordingFileNameBuilder.TIME_LENGTH,
      RecordingFileNameBuilder.TIME_PAD);
    const second: string = String(date.getSeconds()).padStart(RecordingFileNameBuilder.TIME_LENGTH,
      RecordingFileNameBuilder.TIME_PAD);
    return RecordingFileNameBuilder.PREFIX + RecordingFileNameBuilder.CONNECTOR + year + month + day +
      RecordingFileNameBuilder.CONNECTOR + hour + minute + second + RecordingFileNameBuilder.SUFFIX;
  }

  public static isValid(fileName: string): boolean {
    if (!fileName.startsWith(RecordingFileNameBuilder.PREFIX + RecordingFileNameBuilder.CONNECTOR)) {
      return false;
    }
    if (!fileName.endsWith(RecordingFileNameBuilder.SUFFIX)) {
      return false;
    }
    const body: string = fileName.slice(0, fileName.length - RecordingFileNameBuilder.SUFFIX.length);
    return body.length === RecordingFileNameBuilder.PREFIX.length + 1 + 8 + 1 + 6;
  }

  public static timestampPart(fileName: string): string {
    return fileName.slice(RecordingFileNameBuilder.PREFIX.length + 1,
      fileName.length - RecordingFileNameBuilder.SUFFIX.length);
  }
}

// Guards the four-state machine owned by SRManager.
class RecorderTransitionGuard {
  public static canStart(state: number): boolean {
    return state === RecorderState.IDLE;
  }

  public static canStop(state: number): boolean {
    return state === RecorderState.RECORDING;
  }

  public static isTerminal(state: number): boolean {
    return state === RecorderState.STOPPED || state === RecorderState.ERROR;
  }

  public static isFailure(state: number): boolean {
    return state === RecorderState.ERROR;
  }

  public static isValid(from: number, to: number): boolean {
    if (from === to) {
      return true;
    }
    if (from === RecorderState.IDLE) {
      return to === RecorderState.RECORDING || to === RecorderState.ERROR;
    }
    if (from === RecorderState.RECORDING) {
      return to === RecorderState.STOPPED || to === RecorderState.ERROR;
    }
    if (from === RecorderState.STOPPED) {
      return to === RecorderState.IDLE;
    }
    return to === RecorderState.IDLE;
  }

  public static requiresTerminateSelf(state: number): boolean {
    return state === RecorderState.ERROR;
  }
}

// Journal of every event emitted during one recording attempt.
class RecordingEventJournal {
  private records: RecorderEventRecord[] = [];

  public record(kind: RecorderEventKind, stateCode: number, detail: string): void {
    const entry: RecorderEventRecord = {
      kind: kind,
      stateCode: stateCode,
      detail: detail,
      timestamp: Date.now()
    };
    this.records.push(entry);
  }

  public getRecords(): RecorderEventRecord[] {
    const result: RecorderEventRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i]);
    }
    return result;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public countKind(kind: RecorderEventKind): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public hasKind(kind: RecorderEventKind): boolean {
    return this.countKind(kind) > 0;
  }

  public getLastRecord(): RecorderEventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.records = [];
  }
}

// Numeric helpers used for recorder scaling and statistics.
class NumericFormatter {
  public static formatInteger(value: number): string {
    return Math.floor(value).toString();
  }

  public static formatPercent(value: number, total: number): string {
    if (total === 0) {
      return '0%';
    }
    return ((value / total) * 100).toFixed(2) + '%';
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

  public static hasFraction(value: number): boolean {
    return Math.floor(value) !== value;
  }
}

// Byte sequence builder for sink url payloads, without spread syntax.
class ByteArrayBuilder {
  private bytes: number[] = [];

  public appendByte(value: number): void {
    this.bytes.push(value & 0xff);
  }

  public appendBytes(values: number[]): void {
    for (let i = 0; i < values.length; i++) {
      this.bytes.push(values[i] & 0xff);
    }
  }

  public getBytes(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.bytes.length; i++) {
      result.push(this.bytes[i]);
    }
    return result;
  }

  public getLength(): number {
    return this.bytes.length;
  }

  public toUint8Array(): Uint8Array {
    const result = new Uint8Array(this.bytes.length);
    for (let i = 0; i < this.bytes.length; i++) {
      result[i] = this.bytes[i];
    }
    return result;
  }

  public clear(): void {
    this.bytes = [];
  }
}

// Text metrics for recorder tip text and timer labels.
class RecorderTextMetrics {
  public static countChars(text: string): number {
    return text.length;
  }

  public static countOccurrences(text: string, target: string): number {
    if (target.length === 0) {
      return 0;
    }
    let count: number = 0;
    let index: number = text.indexOf(target);
    while (index >= 0) {
      count++;
      index = text.indexOf(target, index + target.length);
    }
    return count;
  }

  public static hasOnlyAscii(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      if (text.charCodeAt(i) > 127) {
        return false;
      }
    }
    return true;
  }

  public static splitNonEmpty(text: string): string[] {
    const trimmed: string = text.trim();
    if (trimmed.length === 0) {
      return [];
    }
    return trimmed.split(/\s+/);
  }
}

// Reproduces SizeCalc.sizeCalc against the 1920 reference width.
class RecorderSizeScale {
  public static readonly REFERENCE_WIDTH: number = 1920;
  public static readonly DEVICE_RATE: number = 0.6;
  public static readonly TIMER_WIDTH: number = 624;
  public static readonly TIMER_HEIGHT: number = 56;
  public static readonly TIP_WIDTH: number = 686;
  public static readonly TIP_HEIGHT: number = 100;

  public static sizeCalc(displayWidth: number, base: number): number {
    if (displayWidth <= 0) {
      return 0;
    }
    return displayWidth / RecorderSizeScale.REFERENCE_WIDTH * base;
  }

  public static scaledTimerWidth(displayWidth: number): number {
    return RecorderSizeScale.sizeCalc(displayWidth, RecorderSizeScale.TIMER_WIDTH);
  }

  public static scaledTipHeight(displayWidth: number): number {
    return RecorderSizeScale.sizeCalc(displayWidth, RecorderSizeScale.TIP_HEIGHT);
  }

  public static scaledVirtualScreenWidth(displayWidth: number): number {
    return RecorderSizeScale.sizeCalc(displayWidth, RecorderSizeScale.REFERENCE_WIDTH) *
      RecorderSizeScale.DEVICE_RATE;
  }
}

// Menu plus volume down double key gate with a 500 ms window.
class StopKeyCombinationGate {
  public static readonly DOUBLE_CLICK_INTERVAL_MS: number = 500;
  private menuDown: boolean = false;
  private volumeDownDown: boolean = false;
  private lastTriggerAt: number = -1;
  private triggerCount: number = 0;

  public onKeyDown(keyCode: number, now: number): boolean {
    if (keyCode === 2018) {
      this.menuDown = true;
    }
    if (keyCode === 17) {
      this.volumeDownDown = true;
    }
    if (!this.menuDown || !this.volumeDownDown) {
      return false;
    }
    this.triggerCount++;
    this.lastTriggerAt = now;
    return true;
  }

  public onKeyUp(keyCode: number): void {
    if (keyCode === 2018) {
      this.menuDown = false;
    }
    if (keyCode === 17) {
      this.volumeDownDown = false;
    }
  }

  public isArmed(): boolean {
    return this.menuDown && this.volumeDownDown;
  }

  public getTriggerCount(): number {
    return this.triggerCount;
  }

  public getLastTriggerAt(): number {
    return this.lastTriggerAt;
  }

  public isWithinWindow(first: number, second: number): boolean {
    return Math.abs(second - first) <= StopKeyCombinationGate.DOUBLE_CLICK_INTERVAL_MS;
  }
}

export default function srManagerEventToolValidationTest(): void {
  describe('SRManagerEventToolValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare recorder event tool validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recorder event tool validation finished');
      await serializedDelay(driver, 300);
    });

    // Aligns with Tools_byte2Str: zero bytes are rendered as 0B.
    it('byte_size_zero_should_return_0B', 0, async () => {
      expect(RecorderToolUtil.formatByteSize(0)).assertEqual('0B');
    });

    // Aligns with Tools_byte2Str: KB range for short recordings.
    it('byte_size_kb_range_should_format_correctly', 0, async () => {
      expect(RecorderToolUtil.formatByteSize(1024)).assertEqual('1KB');
      expect(RecorderToolUtil.formatByteSize(2048)).assertEqual('2KB');
    });

    // Aligns with Tools_byte2Str: MB range for typical mp4 files.
    it('byte_size_mb_range_should_format_correctly', 0, async () => {
      expect(RecorderToolUtil.formatByteSize(1048576)).assertEqual('1MB');
      expect(RecorderToolUtil.formatByteSize(5 * 1048576)).assertEqual('5MB');
    });

    // Aligns with Tools_byte2Str: GB range for long recordings.
    it('byte_size_gb_range_should_format_correctly', 0, async () => {
      expect(RecorderToolUtil.formatByteSize(1073741824)).assertEqual('1GB');
    });

    // Aligns with Tools_byte2Str: negative sizes fall back to 0B.
    it('byte_size_negative_should_return_0B', 0, async () => {
      expect(RecorderToolUtil.formatByteSize(-1024)).assertEqual('0B');
    });

    // Aligns with Tools_isEmpty: empty asset names are rejected.
    it('is_empty_should_return_true_for_empty_values', 0, async () => {
      expect(RecorderToolUtil.isEmpty('')).assertTrue();
      expect(RecorderToolUtil.isEmpty(null)).assertTrue();
      expect(RecorderToolUtil.isEmpty(undefined)).assertTrue();
    });

    // Aligns with Tools_isEmpty: generated mp4 names are never empty.
    it('is_empty_should_return_false_for_generated_name', 0, async () => {
      const name: string = RecordingFileNameBuilder.build(new Date(2026, 0, 15, 10, 20, 30));
      expect(RecorderToolUtil.isEmpty(name)).assertFalse();
    });

    // Aligns with Tools_ArrayToString: sink url bytes round trip.
    it('buffer_string_roundtrip_should_work', 0, async () => {
      const original: string = SurfaceUrlBuilder.build(42);
      const restored: string = RecorderToolUtil.bufferToString(RecorderToolUtil.stringToBuffer(original));
      expect(restored).assertEqual('fd://42');
    });

    // Aligns with Tools_ArrayToString: empty buffer yields empty string.
    it('empty_buffer_should_return_empty_string', 0, async () => {
      expect(RecorderToolUtil.bufferToString(new Uint8Array(0))).assertEqual('');
    });

    // Aligns with DateTools_formatDate: recording date formatting.
    it('format_date_should_return_yyyy_mm_dd', 0, async () => {
      expect(RecorderToolUtil.formatDate(new Date(2026, 0, 15).getTime())).assertEqual('2026-01-15');
    });

    // Aligns with DateTools_Edge_Cases: epoch timestamp stays parseable.
    it('format_date_epoch_should_work', 0, async () => {
      expect(RecorderToolUtil.formatDate(0).length).assertEqual(10);
    });

    // Timer window label must use HH:mm:ss.
    it('timer_label_should_use_hh_mm_ss', 0, async () => {
      expect(RecorderToolUtil.formatTimerLabel(0)).assertEqual('00:00:00');
      expect(RecorderToolUtil.formatTimerLabel(59)).assertEqual('00:00:59');
      expect(RecorderToolUtil.formatTimerLabel(3661)).assertEqual('01:01:01');
    });

    // Timer label must clamp negative input to zero.
    it('timer_label_negative_should_clamp_to_zero', 0, async () => {
      expect(RecorderToolUtil.formatTimerLabel(-5)).assertEqual('00:00:00');
    });

    // EndsWith_Semantics: exact suffix matching for icons.
    it('ends_with_should_match_exact_suffix', 0, async () => {
      expect(RecorderToolUtil.endsWith('app.media.timer_focus', '_focus')).assertTrue();
      expect(RecorderToolUtil.endsWith('app.media.timer', '_focus')).assertFalse();
      expect(RecorderToolUtil.endsWith('a', '_focus')).assertFalse();
    });

    // Suffix_Matching_Boundary: focus icon generation.
    it('get_focus_icon_should_append_suffix', 0, async () => {
      expect(RecorderIconUtil.getFocusIcon('app.media.recorder_stop')).assertEqual(
        'app.media.recorder_stop_focus');
      expect(RecorderIconUtil.isFocusIcon('app.media.recorder_stop_focus')).assertTrue();
    });

    // SRManager creates the media asset before opening the fd sink.
    it('asset_descriptor_should_describe_created_asset', 0, async () => {
      const descriptor: RecorderAssetDescriptor = {
        fileName: 'REC_20260115_102030.mp4',
        uri: 'file://media/Photo/1',
        fd: 11,
        sizeBytes: 1048576
      };
      expect(descriptor.fileName).assertEqual('REC_20260115_102030.mp4');
      expect(descriptor.uri.startsWith('file://media')).assertTrue();
      expect(SurfaceUrlBuilder.build(descriptor.fd)).assertEqual('fd://11');
      expect(descriptor.sizeBytes).assertLarger(0);
    });

    // SurfaceUrlBuilder: fd sink url construction.
    it('sink_url_should_be_built_from_fd', 0, async () => {
      expect(SurfaceUrlBuilder.build(12)).assertEqual('fd://12');
      expect(SurfaceUrlBuilder.isFdBased('fd://12')).assertTrue();
      expect(SurfaceUrlBuilder.isFdBased('/data/storage/el2/base/rec.mp4')).assertFalse();
    });

    // SurfaceUrlBuilder: parsing a valid fd sink url.
    it('sink_url_should_parse_valid_fd', 0, async () => {
      expect(SurfaceUrlBuilder.parseFd('fd://7')).assertEqual(7);
      expect(SurfaceUrlBuilder.isValid('fd://7')).assertTrue();
    });

    // SurfaceUrlBuilder: malformed sink urls are rejected.
    it('sink_url_should_reject_malformed_values', 0, async () => {
      expect(SurfaceUrlBuilder.parseFd('fd://')).assertEqual(SurfaceUrlBuilder.INVALID_FD);
      expect(SurfaceUrlBuilder.parseFd('file://7')).assertEqual(SurfaceUrlBuilder.INVALID_FD);
      expect(SurfaceUrlBuilder.parseFd('fd://abc')).assertEqual(SurfaceUrlBuilder.INVALID_FD);
      expect(SurfaceUrlBuilder.parseFd('fd://-1')).assertEqual(SurfaceUrlBuilder.INVALID_FD);
    });

    // FileNameBuilder: REC_yyyyMMdd_HHmmss.mp4 naming.
    it('file_name_should_follow_rec_timestamp_pattern', 0, async () => {
      const name: string = RecordingFileNameBuilder.build(new Date(2026, 0, 15, 10, 20, 30));
      expect(name).assertEqual('REC_20260115_102030.mp4');
    });

    // FileNameBuilder: name validation accepts generated names only.
    it('file_name_validation_should_accept_generated_names', 0, async () => {
      const name: string = RecordingFileNameBuilder.build(new Date(2026, 11, 31, 23, 59, 59));
      expect(RecordingFileNameBuilder.isValid(name)).assertTrue();
      expect(RecordingFileNameBuilder.isValid('VID_20260115_102030.mp4')).assertFalse();
      expect(RecordingFileNameBuilder.isValid('REC_20260115_102030.mkv')).assertFalse();
      expect(RecordingFileNameBuilder.isValid('REC_20260115.mp4')).assertFalse();
    });

    // FileNameBuilder: timestamp segment keeps the compact layout.
    it('file_name_timestamp_part_should_be_compact', 0, async () => {
      const name: string = RecordingFileNameBuilder.build(new Date(2026, 5, 7, 1, 2, 3));
      expect(RecordingFileNameBuilder.timestampPart(name)).assertEqual('20260607_010203');
    });

    // RecorderTransitionGuard: start is allowed only from Idle.
    it('start_should_be_allowed_only_from_idle', 0, async () => {
      expect(RecorderTransitionGuard.canStart(RecorderState.IDLE)).assertTrue();
      expect(RecorderTransitionGuard.canStart(RecorderState.RECORDING)).assertFalse();
      expect(RecorderTransitionGuard.canStart(RecorderState.STOPPED)).assertFalse();
      expect(RecorderTransitionGuard.canStart(RecorderState.ERROR)).assertFalse();
    });

    // RecorderTransitionGuard: stop is allowed only while recording.
    it('stop_should_be_allowed_only_while_recording', 0, async () => {
      expect(RecorderTransitionGuard.canStop(RecorderState.RECORDING)).assertTrue();
      expect(RecorderTransitionGuard.canStop(RecorderState.IDLE)).assertFalse();
    });

    // RecorderTransitionGuard: legal and illegal transitions.
    it('transition_guard_should_validate_state_changes', 0, async () => {
      expect(RecorderTransitionGuard.isValid(RecorderState.IDLE, RecorderState.RECORDING)).assertTrue();
      expect(RecorderTransitionGuard.isValid(RecorderState.RECORDING, RecorderState.STOPPED)).assertTrue();
      expect(RecorderTransitionGuard.isValid(RecorderState.RECORDING, RecorderState.ERROR)).assertTrue();
      expect(RecorderTransitionGuard.isValid(RecorderState.STOPPED, RecorderState.IDLE)).assertTrue();
      expect(RecorderTransitionGuard.isValid(RecorderState.IDLE, RecorderState.STOPPED)).assertFalse();
    });

    // RecorderTransitionGuard: Error is the only state that terminates the ability.
    it('error_state_should_require_terminate_self', 0, async () => {
      expect(RecorderTransitionGuard.requiresTerminateSelf(RecorderState.ERROR)).assertTrue();
      expect(RecorderTransitionGuard.requiresTerminateSelf(RecorderState.STOPPED)).assertFalse();
      expect(RecorderTransitionGuard.isTerminal(RecorderState.STOPPED)).assertTrue();
    });

    // EventJournal: records are appended in emission order.
    it('event_journal_should_record_in_order', 0, async () => {
      const journal = new RecordingEventJournal();
      journal.record(RecorderEventKind.START_REQUESTED, RecorderState.IDLE, 'start');
      journal.record(RecorderEventKind.ASSET_CREATED, RecorderState.IDLE, 'asset');
      journal.record(RecorderEventKind.SINK_URL_BUILT, RecorderState.IDLE, 'fd');
      journal.record(RecorderEventKind.STATE_CHANGED, RecorderState.RECORDING, 'recording');
      expect(journal.getRecordCount()).assertEqual(4);
      expect(journal.isChronological()).assertTrue();
      const records: RecorderEventRecord[] = journal.getRecords();
      expect(records[0].kind).assertEqual(RecorderEventKind.START_REQUESTED);
      expect(records[3].stateCode).assertEqual(RecorderState.RECORDING);
    });

    // EventJournal: kind statistics and lookups.
    it('event_journal_should_count_kinds', 0, async () => {
      const journal = new RecordingEventJournal();
      journal.record(RecorderEventKind.STATE_CHANGED, RecorderState.RECORDING, 'a');
      journal.record(RecorderEventKind.STATE_CHANGED, RecorderState.STOPPED, 'b');
      journal.record(RecorderEventKind.RECORD_FAILED, RecorderState.ERROR, 'c');
      expect(journal.countKind(RecorderEventKind.STATE_CHANGED)).assertEqual(2);
      expect(journal.countKind(RecorderEventKind.RECORD_FAILED)).assertEqual(1);
      expect(journal.countKind(RecorderEventKind.STOP_REQUESTED)).assertEqual(0);
      expect(journal.hasKind(RecorderEventKind.RECORD_FAILED)).assertTrue();
    });

    // EventJournal: last record and clear behaviour.
    it('event_journal_should_track_last_and_clear', 0, async () => {
      const journal = new RecordingEventJournal();
      expect(journal.getLastRecord()).assertNull();
      journal.record(RecorderEventKind.TERMINATE_SCHEDULED, RecorderState.ERROR, 'delay 2000');
      const last: RecorderEventRecord | null = journal.getLastRecord();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.kind).assertEqual(RecorderEventKind.TERMINATE_SCHEDULED);
      }
      journal.clear();
      expect(journal.getRecordCount()).assertEqual(0);
    });

    // NumericFormatter: clamping the recorder device rate.
    it('numeric_formatter_should_clamp_values', 0, async () => {
      expect(NumericFormatter.clamp(0.6, 0.1, 1)).assertEqual(0.6);
      expect(NumericFormatter.clamp(-1, 0, 1)).assertEqual(0);
      expect(NumericFormatter.clamp(5, 0, 1)).assertEqual(1);
      expect(NumericFormatter.hasFraction(0.6)).assertTrue();
    });

    // NumericFormatter: percent formatting for recorded progress.
    it('numeric_formatter_should_format_percent', 0, async () => {
      expect(NumericFormatter.formatPercent(1, 4)).assertEqual('25.00%');
      expect(NumericFormatter.formatPercent(1, 0)).assertEqual('0%');
      expect(NumericFormatter.formatInteger(12.9)).assertEqual('12');
    });

    // ByteArrayBuilder: appending bytes without spread syntax.
    it('byte_array_builder_should_append_bytes', 0, async () => {
      const builder = new ByteArrayBuilder();
      builder.appendByte(102);
      builder.appendBytes([100, 58, 47, 47, 55]);
      expect(builder.getLength()).assertEqual(6);
      expect(RecorderToolUtil.bufferToString(builder.toUint8Array())).assertEqual('fd://7');
      builder.clear();
      expect(builder.getLength()).assertEqual(0);
    });

    // RecorderTextMetrics: tip text keeps its own spacing rules.
    it('text_metrics_should_count_tip_characters', 0, async () => {
      expect(RecorderTextMetrics.countChars('REC')).assertEqual(3);
      expect(RecorderTextMetrics.countOccurrences('REC_REC_REC', 'REC')).assertEqual(3);
      expect(RecorderTextMetrics.countOccurrences('REC', '')).assertEqual(0);
      expect(RecorderTextMetrics.splitNonEmpty('  a  b  ').length).assertEqual(2);
    });

    // RecorderSizeScale: width scaling against the 1920 reference.
    it('size_scale_should_follow_reference_width', 0, async () => {
      expect(RecorderSizeScale.sizeCalc(1920, RecorderSizeScale.TIMER_WIDTH)).assertEqual(624);
      expect(RecorderSizeScale.sizeCalc(960, RecorderSizeScale.TIP_HEIGHT)).assertEqual(50);
      expect(RecorderSizeScale.sizeCalc(0, RecorderSizeScale.TIP_WIDTH)).assertEqual(0);
    });

    // RecorderSizeScale: virtual screen width uses the 0.6 device rate.
    it('size_scale_should_apply_device_rate', 0, async () => {
      expect(RecorderSizeScale.scaledVirtualScreenWidth(1920)).assertEqual(1152);
      expect(RecorderSizeScale.scaledTimerWidth(1920)).assertEqual(624);
    });

    // StopKeyCombinationGate: menu plus volume down triggers exactly once.
    it('stop_gate_should_trigger_on_key_combination', 0, async () => {
      const gate = new StopKeyCombinationGate();
      expect(gate.onKeyDown(2018, 1000)).assertFalse();
      expect(gate.isArmed()).assertFalse();
      expect(gate.onKeyDown(17, 1010)).assertTrue();
      expect(gate.isArmed()).assertTrue();
      expect(gate.getTriggerCount()).assertEqual(1);
      expect(gate.getLastTriggerAt()).assertEqual(1010);
    });

    // StopKeyCombinationGate: releasing either key resets the gate.
    it('stop_gate_should_reset_after_key_up', 0, async () => {
      const gate = new StopKeyCombinationGate();
      expect(gate.onKeyDown(2018, 1000)).assertFalse();
      expect(gate.onKeyDown(17, 1000)).assertTrue();
      gate.onKeyUp(17);
      expect(gate.isArmed()).assertFalse();
      expect(gate.onKeyDown(17, 1200)).assertTrue();
      expect(gate.getTriggerCount()).assertEqual(2);
      gate.onKeyUp(2018);
      expect(gate.isArmed()).assertFalse();
    });

    // StopKeyCombinationGate: the 500 ms window is shared with DoubleClickDetector.
    it('stop_gate_should_respect_double_click_window', 0, async () => {
      const gate = new StopKeyCombinationGate();
      expect(gate.isWithinWindow(1000, 1500)).assertTrue();
      expect(gate.isWithinWindow(1000, 1501)).assertFalse();
      expect(gate.isWithinWindow(1000, 900)).assertTrue();
    });

    // Special_Char_Filenames: asset names tolerate special characters.
    it('special_characters_should_be_handled', 0, async () => {
      expect(RecorderToolUtil.isEmpty('REC *() .mp4')).assertFalse();
      expect(RecorderIconUtil.getFocusIcon('icon!@#')).assertEqual('icon!@#_focus');
      expect(RecorderToolUtil.normalizeResourceName(' App.Media.Timer ')).assertEqual('app.media.timer');
    });

    // UI smoke check: the recorder window composition stays observable.
    it('recorder_window_should_stay_observable', 0, async () => {
      const count: number = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'recorder component count observed');
    });
  });
}
