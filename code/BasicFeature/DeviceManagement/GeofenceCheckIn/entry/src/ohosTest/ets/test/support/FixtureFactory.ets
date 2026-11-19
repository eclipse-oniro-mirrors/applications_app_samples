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

import {
  CheckInRecord,
  CheckInResult,
  DaySummary,
  DEFAULT_RADIUS,
  FENCE_CAPABILITY_UNSUPPORTED,
  FenceConfig,
  FenceOperationResult,
  FenceTransitionAction,
  INVALID_FENCE_ID,
  LocationResult,
  MAX_RADIUS,
  MIN_RADIUS,
  NO_ERROR,
  OPEN_END,
  PermissionSnapshot
} from 'library';

// Exit time marker of a record that is still open.
const OPEN_MARKER: number = OPEN_END;
// Fence id marker meaning no fence is registered.
const INVALID_ID: number = INVALID_FENCE_ID;
// Error code meaning the operation succeeded.
const OK_CODE: number = NO_ERROR;
// Error code reported when the device misses the geofence capability.
const UNSUPPORTED_CODE: number = FENCE_CAPABILITY_UNSUPPORTED;
// Default radius of a fresh configuration in meters.
const BASE_RADIUS: number = DEFAULT_RADIUS;
// Smallest radius accepted by the configuration validation in meters.
const LOW_RADIUS: number = MIN_RADIUS;
// Largest radius accepted by the configuration validation in meters.
const HIGH_RADIUS: number = MAX_RADIUS;
// One minute expressed in milliseconds, used to build stay durations.
const MINUTE_MS: number = 60 * 1000;
// One hour expressed in milliseconds, used to build stay durations.
const HOUR_MS: number = 60 * MINUTE_MS;
// One day expressed in milliseconds, used to build long stays.
const DAY_MS: number = 24 * HOUR_MS;
// Sample latitude used when a fixture does not care about the center.
const SAMPLE_LATITUDE: number = 39.908;
// Sample longitude used when a fixture does not care about the center.
const SAMPLE_LONGITUDE: number = 116.397;
// Sample fence id used when a fixture does not care about the fence.
const SAMPLE_FENCE_ID: number = 7;
// Sample timestamp used when a fixture does not care about the time.
const SAMPLE_TIME: number = 1735660800000;
// Number of precondition flags carried by a permission snapshot.
const PERMISSION_FLAG_COUNT: number = 5;

/**
 * Kind of a named fence configuration preset.
 */
export enum ConfigPresetKind {
  // Fresh install configuration produced by createDefaultConfig().
  DEFAULT = 0,
  // Configuration entirely inside the accepted radius range.
  NOMINAL = 1,
  // Configuration sitting exactly on the smallest accepted radius.
  RADIUS_LOWER_EDGE = 2,
  // Configuration sitting exactly on the largest accepted radius.
  RADIUS_UPPER_EDGE = 3,
  // Configuration carrying a radius below the accepted range.
  RADIUS_TOO_SMALL = 4,
  // Configuration carrying a radius above the accepted range.
  RADIUS_TOO_LARGE = 5,
  // Configuration whose name is completely empty.
  EMPTY_NAME = 6,
  // Configuration whose name only contains blank characters.
  BLANK_NAME = 7,
  // Configuration whose name uses non ASCII characters.
  UNICODE_NAME = 8,
  // Configuration placed on the equator and prime meridian.
  ORIGIN_CENTER = 9,
  // Configuration placed near the north east corner of the coordinate space.
  FAR_EAST_CENTER = 10,
  // Configuration whose switch is turned on.
  ENABLED = 11,
  // Configuration whose switch is turned off.
  DISABLED = 12,
  // Configuration that never registered a system fence yet.
  NO_FENCE = 13
}

/**
 * Kind of a named check-in record preset.
 */
export enum RecordPresetKind {
  // Record that is still open with the open marker and a zero duration.
  OPEN = 0,
  // Closed record with a one minute stay.
  ONE_MINUTE = 1,
  // Closed record with a one hour stay.
  ONE_HOUR = 2,
  // Closed record with a stay of exactly one millisecond.
  SHORTEST = 3,
  // Closed record whose exit time equals the enter time, a zero stay.
  ZERO_STAY = 4,
  // Closed record whose exit time is older than the enter time.
  NEGATIVE_STAY = 5,
  // Closed record spanning a whole day.
  FULL_DAY = 6,
  // Record whose database id is negative, used for defensive checks.
  NEGATIVE_ID = 7,
  // Record whose database id is the invalid marker.
  INVALID_ID = 8,
  // Record that entered at the epoch start.
  EPOCH = 9
}

/**
 * Builder helpers that turn a preset kind into a fully populated model instance.
 * Every helper is deterministic: the same input always produces the same output,
 * and no helper mutates its arguments or any module level state.
 */
export class FixtureFactory {
  /**
   * Build the default fence configuration mirroring createDefaultConfig().
   * @returns a configuration with an empty name, zero center, default radius and no fence
   */
  public static defaultConfig(): FenceConfig {
    // Mirror the library default one field at a time so a drift is caught by the tests.
    return {
      name: '',
      latitude: 0,
      longitude: 0,
      radius: BASE_RADIUS,
      fenceId: INVALID_ID,
      enabled: false,
      updatedAt: 0
    };
  }

  /**
   * Build a fence configuration with every field filled from the arguments.
   * @param name readable fence name
   * @param latitude center latitude in degrees
   * @param longitude center longitude in degrees
   * @param radius radius in meters
   * @param fenceId system fence id, negative when none is registered
   * @param enabled whether the fence switch is on
   * @param updatedAt last update time in milliseconds
   * @returns the configuration carrying exactly the given values
   */
  public static config(name: string, latitude: number, longitude: number, radius: number,
    fenceId: number, enabled: boolean, updatedAt: number): FenceConfig {
    // Copy every argument into its own interface field.
    return {
      name: name,
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      fenceId: fenceId,
      enabled: enabled,
      updatedAt: updatedAt
    };
  }

  /**
   * Build a nominal fence configuration with a readable name suffix.
   * @param suffix text appended to the fence name to keep fixtures distinguishable
   * @returns a configuration inside the accepted radius range with the switch on
   */
  public static nominalConfig(suffix: string): FenceConfig {
    // Use the base radius and a valid fence id so the fixture is always acceptable.
    return {
      name: 'fence_' + suffix,
      latitude: SAMPLE_LATITUDE,
      longitude: SAMPLE_LONGITUDE,
      radius: BASE_RADIUS,
      fenceId: SAMPLE_FENCE_ID,
      enabled: true,
      updatedAt: SAMPLE_TIME
    };
  }

  /**
   * Build the configuration matching a named preset kind.
   * @param kind preset selector
   * @returns the configuration described by the preset kind
   */
  public static configByPreset(kind: ConfigPresetKind): FenceConfig {
    // Every preset is spelled out explicitly to keep the fixture table readable.
    if (kind === ConfigPresetKind.DEFAULT) {
      return FixtureFactory.defaultConfig();
    }
    if (kind === ConfigPresetKind.NOMINAL) {
      return FixtureFactory.config('preset_nominal', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        BASE_RADIUS, SAMPLE_FENCE_ID, true, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.RADIUS_LOWER_EDGE) {
      return FixtureFactory.config('preset_radius_min', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        LOW_RADIUS, SAMPLE_FENCE_ID, true, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.RADIUS_UPPER_EDGE) {
      return FixtureFactory.config('preset_radius_max', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        HIGH_RADIUS, SAMPLE_FENCE_ID, true, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.RADIUS_TOO_SMALL) {
      return FixtureFactory.config('preset_radius_small', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        LOW_RADIUS - 1, SAMPLE_FENCE_ID, false, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.RADIUS_TOO_LARGE) {
      return FixtureFactory.config('preset_radius_large', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        HIGH_RADIUS + 1, SAMPLE_FENCE_ID, false, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.EMPTY_NAME) {
      return FixtureFactory.config('', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        BASE_RADIUS, INVALID_ID, false, 0);
    }
    if (kind === ConfigPresetKind.BLANK_NAME) {
      return FixtureFactory.config('   ', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        BASE_RADIUS, INVALID_ID, false, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.UNICODE_NAME) {
      return FixtureFactory.config('园区北门', 31.2304, 121.4737, BASE_RADIUS, 11, true, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.ORIGIN_CENTER) {
      return FixtureFactory.config('preset_origin', 0, 0, BASE_RADIUS, 0, false, 1);
    }
    if (kind === ConfigPresetKind.FAR_EAST_CENTER) {
      return FixtureFactory.config('preset_far_east', 89.9999, 179.9999,
        HIGH_RADIUS, 2147483647, true, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.ENABLED) {
      return FixtureFactory.config('preset_enabled', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        BASE_RADIUS, SAMPLE_FENCE_ID, true, SAMPLE_TIME);
    }
    if (kind === ConfigPresetKind.DISABLED) {
      return FixtureFactory.config('preset_disabled', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
        BASE_RADIUS, SAMPLE_FENCE_ID, false, SAMPLE_TIME);
    }
    // The remaining preset is the configuration without a registered fence.
    return FixtureFactory.config('preset_no_fence', SAMPLE_LATITUDE, SAMPLE_LONGITUDE,
      BASE_RADIUS, INVALID_ID, false, 0);
  }

  /**
   * Build the default area presets of every configuration, in declaration order.
   * @returns one configuration for every preset kind
   */
  public static allConfigPresets(): Array<FenceConfig> {
    const configs: Array<FenceConfig> = [];
    for (let kind: number = ConfigPresetKind.DEFAULT; kind <= ConfigPresetKind.NO_FENCE; kind++) {
      configs.push(FixtureFactory.configByPreset(kind));
    }
    return configs;
  }

  /**
   * Build a batch of configurations from the requested preset kinds, keeping the given order.
   * @param kinds preset selectors in the desired batch order
   * @returns one configuration per requested preset kind, in the same order
   */
  public static configBatch(kinds: Array<ConfigPresetKind>): Array<FenceConfig> {
    // Map every requested preset onto its configuration without touching the argument.
    const configs: Array<FenceConfig> = [];
    for (let index: number = 0; index < kinds.length; index++) {
      configs.push(FixtureFactory.configByPreset(kinds[index]));
    }
    return configs;
  }

  /**
   * Build an independent copy of a fence configuration.
   * @param source configuration to copy
   * @returns a new configuration carrying the same field values
   */
  public static cloneConfig(source: FenceConfig): FenceConfig {
    // Copy every field so the clone never shares storage with the source.
    return {
      name: source.name,
      latitude: source.latitude,
      longitude: source.longitude,
      radius: source.radius,
      fenceId: source.fenceId,
      enabled: source.enabled,
      updatedAt: source.updatedAt
    };
  }

  /**
   * Rename the given configuration in place and report the changed instance.
   * @param target configuration to rename
   * @param name new fence name
   * @returns the same configuration instance after the rename
   */
  public static renameConfig(target: FenceConfig, name: string): FenceConfig {
    // Overwrite only the name so every other field keeps its value.
    target.name = name;
    return target;
  }

  /**
   * Compare two configurations field by field.
   * @param left first configuration
   * @param right second configuration
   * @returns true when every field carries the same value
   */
  public static configEquals(left: FenceConfig, right: FenceConfig): boolean {
    // Compare strings, numbers and the flag one by one.
    return left.name === right.name &&
      left.latitude === right.latitude &&
      left.longitude === right.longitude &&
      left.radius === right.radius &&
      left.fenceId === right.fenceId &&
      left.enabled === right.enabled &&
      left.updatedAt === right.updatedAt;
  }

  /**
   * List the configuration fields whose values differ between two configurations.
   * @param left first configuration
   * @param right second configuration
   * @returns field names in a stable order, empty when both configurations match
   */
  public static configDiffFields(left: FenceConfig, right: FenceConfig): Array<string> {
    // Collect the names of the fields that are not equal.
    const fields: Array<string> = [];
    if (left.name !== right.name) {
      fields.push('name');
    }
    if (left.latitude !== right.latitude) {
      fields.push('latitude');
    }
    if (left.longitude !== right.longitude) {
      fields.push('longitude');
    }
    if (left.radius !== right.radius) {
      fields.push('radius');
    }
    if (left.fenceId !== right.fenceId) {
      fields.push('fenceId');
    }
    if (left.enabled !== right.enabled) {
      fields.push('enabled');
    }
    if (left.updatedAt !== right.updatedAt) {
      fields.push('updatedAt');
    }
    return fields;
  }

  /**
   * Build a check-in record with every field filled from the arguments.
   * @param id database row id
   * @param enterTime enter time in milliseconds
   * @param exitTime exit time in milliseconds or the open marker
   * @param durationMs stay duration in milliseconds
   * @returns the record carrying exactly the given values
   */
  public static record(id: number, enterTime: number, exitTime: number,
    durationMs: number): CheckInRecord {
    // Copy every argument into its own interface field.
    return {
      id: id,
      enterTime: enterTime,
      exitTime: exitTime,
      durationMs: durationMs
    };
  }

  /**
   * Build an open check-in record that only carries an enter time.
   * @param id database row id
   * @param enterTime enter time in milliseconds
   * @returns an open record with the open marker and a zero duration
   */
  public static openRecord(id: number, enterTime: number): CheckInRecord {
    // An open record always keeps the open marker and a zero duration.
    return {
      id: id,
      enterTime: enterTime,
      exitTime: OPEN_MARKER,
      durationMs: 0
    };
  }

  /**
   * Build a closed check-in record whose duration is derived from the exit time.
   * @param id database row id
   * @param enterTime enter time in milliseconds
   * @param durationMs stay duration in milliseconds
   * @returns a closed record with the exit time equal to enter time plus duration
   */
  public static closedRecord(id: number, enterTime: number, durationMs: number): CheckInRecord {
    // The exit time of a closed record always equals enter time plus duration.
    return {
      id: id,
      enterTime: enterTime,
      exitTime: enterTime + durationMs,
      durationMs: durationMs
    };
  }

  /**
   * Build the record matching a named preset kind.
   * @param kind preset selector
   * @returns the record described by the preset kind
   */
  public static recordByPreset(kind: RecordPresetKind): CheckInRecord {
    // Every preset is spelled out explicitly to keep the fixture table readable.
    if (kind === RecordPresetKind.OPEN) {
      return FixtureFactory.openRecord(1, SAMPLE_TIME);
    }
    if (kind === RecordPresetKind.ONE_MINUTE) {
      return FixtureFactory.closedRecord(2, SAMPLE_TIME, MINUTE_MS);
    }
    if (kind === RecordPresetKind.ONE_HOUR) {
      return FixtureFactory.closedRecord(3, SAMPLE_TIME, HOUR_MS);
    }
    if (kind === RecordPresetKind.SHORTEST) {
      return FixtureFactory.closedRecord(4, SAMPLE_TIME, 1);
    }
    if (kind === RecordPresetKind.ZERO_STAY) {
      return FixtureFactory.record(5, SAMPLE_TIME, SAMPLE_TIME, 0);
    }
    if (kind === RecordPresetKind.NEGATIVE_STAY) {
      return FixtureFactory.record(6, SAMPLE_TIME, SAMPLE_TIME - MINUTE_MS, -MINUTE_MS);
    }
    if (kind === RecordPresetKind.FULL_DAY) {
      return FixtureFactory.closedRecord(7, SAMPLE_TIME, DAY_MS);
    }
    if (kind === RecordPresetKind.NEGATIVE_ID) {
      return FixtureFactory.closedRecord(-1, SAMPLE_TIME, MINUTE_MS);
    }
    if (kind === RecordPresetKind.INVALID_ID) {
      return FixtureFactory.openRecord(INVALID_ID, SAMPLE_TIME);
    }
    // The remaining preset entered at the epoch start.
    return FixtureFactory.openRecord(0, 0);
  }

  /**
   * Build the sample record of every record preset, in declaration order.
   * @returns one record for every preset kind
   */
  public static allRecordPresets(): Array<CheckInRecord> {
    const records: Array<CheckInRecord> = [];
    for (let kind: number = RecordPresetKind.OPEN; kind <= RecordPresetKind.EPOCH; kind++) {
      records.push(FixtureFactory.recordByPreset(kind));
    }
    return records;
  }

  /**
   * Build a batch of check-in records from the requested preset kinds, keeping the given order.
   * @param kinds preset selectors in the desired batch order
   * @returns one record per requested preset kind, in the same order
   */
  public static recordBatchOfPresets(kinds: Array<RecordPresetKind>): Array<CheckInRecord> {
    // Map every requested preset onto its record without touching the argument.
    const records: Array<CheckInRecord> = [];
    for (let index: number = 0; index < kinds.length; index++) {
      records.push(FixtureFactory.recordByPreset(kinds[index]));
    }
    return records;
  }

  /**
   * Build an independent copy of a check-in record.
   * @param source record to copy
   * @returns a new record carrying the same field values
   */
  public static cloneRecord(source: CheckInRecord): CheckInRecord {
    // Copy every field so the clone never shares storage with the source.
    return {
      id: source.id,
      enterTime: source.enterTime,
      exitTime: source.exitTime,
      durationMs: source.durationMs
    };
  }

  /**
   * Close an open record in place with the given exit time.
   * @param target record to close
   * @param exitTime exit time in milliseconds
   * @returns the same record instance after the close
   */
  public static closeRecord(target: CheckInRecord, exitTime: number): CheckInRecord {
    // The duration is derived from the exit time minus the enter time.
    target.exitTime = exitTime;
    target.durationMs = exitTime - target.enterTime;
    return target;
  }

  /**
   * Report whether a record still carries the open exit marker.
   * @param record record to inspect
   * @returns true when the record was never closed
   */
  public static isOpen(record: CheckInRecord): boolean {
    // Only the open marker counts as an open record.
    return record.exitTime === OPEN_MARKER;
  }

  /**
   * Compare two check-in records field by field.
   * @param left first record
   * @param right second record
   * @returns true when every field carries the same value
   */
  public static recordEquals(left: CheckInRecord, right: CheckInRecord): boolean {
    // Compare the four numeric fields one by one.
    return left.id === right.id &&
      left.enterTime === right.enterTime &&
      left.exitTime === right.exitTime &&
      left.durationMs === right.durationMs;
  }

  /**
   * Build a batch of closed records one hour apart, ordered from oldest to newest.
   * @param count number of records to build
   * @param firstEnterTime enter time of the oldest record in milliseconds
   * @param stayMs stay duration of every record in milliseconds
   * @returns the records with ascending ids and ascending enter times
   */
  public static recordBatch(count: number, firstEnterTime: number,
    stayMs: number): Array<CheckInRecord> {
    // Build the records with stable ids and one hour between the enter times.
    const records: Array<CheckInRecord> = [];
    for (let index: number = 0; index < count; index++) {
      records.push(FixtureFactory.closedRecord(index + 1, firstEnterTime + index * HOUR_MS, stayMs));
    }
    return records;
  }

  /**
   * Build a check-in result describing one processed transition.
   * @param changed whether the transition created or closed a record
   * @param action recognized transition action
   * @param record record produced by the transition, or undefined
   * @param timestamp processing timestamp in milliseconds
   * @returns the result carrying exactly the given values
   */
  public static result(changed: boolean, action: FenceTransitionAction,
    record: CheckInRecord | undefined, timestamp: number): CheckInResult {
    // Copy every argument into its own interface field.
    return {
      changed: changed,
      action: action,
      record: record,
      timestamp: timestamp
    };
  }

  /**
   * Build the result of an accepted enter transition.
   * @param record record created by the enter
   * @param timestamp processing timestamp in milliseconds
   * @returns a changed result carrying the enter action and the created record
   */
  public static enterResult(record: CheckInRecord, timestamp: number): CheckInResult {
    // An accepted enter always reports the enter action and a changed flag.
    return {
      changed: true,
      action: FenceTransitionAction.ENTER,
      record: record,
      timestamp: timestamp
    };
  }

  /**
   * Build the result of an accepted exit transition.
   * @param record record closed by the exit
   * @param timestamp processing timestamp in milliseconds
   * @returns a changed result carrying the exit action and the closed record
   */
  public static exitResult(record: CheckInRecord, timestamp: number): CheckInResult {
    // An accepted exit always reports the exit action and a changed flag.
    return {
      changed: true,
      action: FenceTransitionAction.EXIT,
      record: record,
      timestamp: timestamp
    };
  }

  /**
   * Build the result of a transition that changed nothing.
   * @param timestamp processing timestamp in milliseconds
   * @returns an unchanged result without a record
   */
  public static unchangedResult(timestamp: number): CheckInResult {
    // An ignored transition reports the none action and no record.
    return {
      changed: false,
      action: FenceTransitionAction.NONE,
      record: undefined,
      timestamp: timestamp
    };
  }

  /**
   * Build an independent copy of a check-in result, including its nested record.
   * @param source result to copy
   * @returns a new result whose record is copied as well
   */
  public static cloneResult(source: CheckInResult): CheckInResult {
    // Copy the nested record so the clone never shares it with the source.
    let record: CheckInRecord | undefined = undefined;
    if (source.record !== undefined) {
      record = FixtureFactory.cloneRecord(source.record);
    }
    return {
      changed: source.changed,
      action: source.action,
      record: record,
      timestamp: source.timestamp
    };
  }

  /**
   * Build a day summary with the given count and total duration.
   * @param count number of check-ins inside the day window
   * @param durationMs total stay duration in milliseconds
   * @returns the summary carrying exactly the given values
   */
  public static summary(count: number, durationMs: number): DaySummary {
    // Copy both numbers into their own interface fields.
    return {
      count: count,
      durationMs: durationMs
    };
  }

  /**
   * Build the empty day summary mirroring createEmptySummary().
   * @returns a summary with a zero count and a zero duration
   */
  public static emptySummary(): DaySummary {
    // Mirror the library empty summary one field at a time.
    return {
      count: 0,
      durationMs: 0
    };
  }

  /**
   * Build the summary produced by aggregating a list of records.
   * @param records records inside the day window
   * @returns the count of the records together with the summed duration
   */
  public static summaryOf(records: Array<CheckInRecord>): DaySummary {
    // Accumulate both values over the given records.
    let count: number = 0;
    let durationMs: number = 0;
    for (let index: number = 0; index < records.length; index++) {
      count = count + 1;
      durationMs = durationMs + records[index].durationMs;
    }
    return {
      count: count,
      durationMs: durationMs
    };
  }

  /**
   * Compare two day summaries field by field.
   * @param left first summary
   * @param right second summary
   * @returns true when both the count and the duration match
   */
  public static summaryEquals(left: DaySummary, right: DaySummary): boolean {
    // Compare the two numeric fields one by one.
    return left.count === right.count && left.durationMs === right.durationMs;
  }

  /**
   * Build a location result with the given values.
   * @param success whether a fix was acquired
   * @param latitude fix latitude in degrees
   * @param longitude fix longitude in degrees
   * @param errorCode system error code or the no error marker
   * @returns the result carrying exactly the given values
   */
  public static location(success: boolean, latitude: number, longitude: number,
    errorCode: number): LocationResult {
    // Copy every argument into its own interface field.
    return {
      success: success,
      latitude: latitude,
      longitude: longitude,
      errorCode: errorCode
    };
  }

  /**
   * Build the location result of a successful fix.
   * @param latitude fix latitude in degrees
   * @param longitude fix longitude in degrees
   * @returns a successful result carrying the given coordinates and no error
   */
  public static locationSuccess(latitude: number, longitude: number): LocationResult {
    // A successful fix always carries the no error marker.
    return {
      success: true,
      latitude: latitude,
      longitude: longitude,
      errorCode: OK_CODE
    };
  }

  /**
   * Build the location result of a failed fix.
   * @param errorCode system error code reported by the location kit
   * @returns a failed result with zeroed coordinates and the given error code
   */
  public static locationFailure(errorCode: number): LocationResult {
    // A failed fix always reports zeroed coordinates.
    return {
      success: false,
      latitude: 0,
      longitude: 0,
      errorCode: errorCode
    };
  }

  /**
   * Build a permission snapshot with the given flags.
   * @param foregroundGranted whether the foreground location permission is granted
   * @param backgroundGranted whether the background location permission is granted
   * @param notificationEnabled whether notifications are enabled
   * @param locationEnabled whether the system location switch is on
   * @param capabilitySupported whether the device supports geofences
   * @returns the snapshot carrying exactly the given flags
   */
  public static permissions(foregroundGranted: boolean, backgroundGranted: boolean,
    notificationEnabled: boolean, locationEnabled: boolean,
    capabilitySupported: boolean): PermissionSnapshot {
    // Copy every argument into its own interface field.
    return {
      foregroundGranted: foregroundGranted,
      backgroundGranted: backgroundGranted,
      notificationEnabled: notificationEnabled,
      locationEnabled: locationEnabled,
      capabilitySupported: capabilitySupported
    };
  }

  /**
   * Build the permission snapshot of a fully ready device.
   * @returns a snapshot with every precondition flag turned on
   */
  public static allGrantedPermissions(): PermissionSnapshot {
    // Every precondition is satisfied on a ready device.
    return FixtureFactory.permissions(true, true, true, true, true);
  }

  /**
   * Build the permission snapshot of a fresh device without any grant.
   * @returns a snapshot with every precondition flag turned off
   */
  public static noneGrantedPermissions(): PermissionSnapshot {
    // No precondition is satisfied on a fresh device.
    return FixtureFactory.permissions(false, false, false, false, false);
  }

  /**
   * Count the flags that are turned on inside a permission snapshot.
   * @param snapshot snapshot to inspect
   * @returns the number of satisfied preconditions, between zero and five
   */
  public static permissionScore(snapshot: PermissionSnapshot): number {
    // Add one for every flag that is turned on.
    let score: number = 0;
    if (snapshot.foregroundGranted) {
      score = score + 1;
    }
    if (snapshot.backgroundGranted) {
      score = score + 1;
    }
    if (snapshot.notificationEnabled) {
      score = score + 1;
    }
    if (snapshot.locationEnabled) {
      score = score + 1;
    }
    if (snapshot.capabilitySupported) {
      score = score + 1;
    }
    return score;
  }

  /**
   * Report whether every precondition of the feature is satisfied.
   * @param snapshot snapshot to inspect
   * @returns true when all five flags are turned on
   */
  public static isFullyReady(snapshot: PermissionSnapshot): boolean {
    // A fully ready device satisfies every precondition flag.
    return FixtureFactory.permissionScore(snapshot) === PERMISSION_FLAG_COUNT;
  }

  /**
   * Build a fence operation result with the given values.
   * @param success whether the operation finished successfully
   * @param fenceId system fence id or the invalid marker
   * @param errorCode system error code or the no error marker
   * @returns the result carrying exactly the given values
   */
  public static operation(success: boolean, fenceId: number, errorCode: number): FenceOperationResult {
    // Copy every argument into its own interface field.
    return {
      success: success,
      fenceId: fenceId,
      errorCode: errorCode
    };
  }

  /**
   * Build the result of a successful fence registration or removal.
   * @param fenceId system fence id reported on success
   * @returns a successful result without error
   */
  public static operationSuccess(fenceId: number): FenceOperationResult {
    // A successful operation always carries the no error marker.
    return {
      success: true,
      fenceId: fenceId,
      errorCode: OK_CODE
    };
  }

  /**
   * Build the result of a failed fence registration or removal.
   * @param errorCode system error code reported on failure
   * @returns a failed result carrying the invalid fence id marker
   */
  public static operationFailure(errorCode: number): FenceOperationResult {
    // A failed operation always carries the invalid fence id marker.
    return {
      success: false,
      fenceId: INVALID_ID,
      errorCode: errorCode
    };
  }

  /**
   * Build the result reported when the device misses the geofence capability.
   * @returns a failed result carrying the unsupported capability error code
   */
  public static operationUnsupported(): FenceOperationResult {
    // The unsupported capability result always reports the matching error code.
    return {
      success: false,
      fenceId: INVALID_ID,
      errorCode: UNSUPPORTED_CODE
    };
  }
}
