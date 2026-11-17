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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  CheckInRecord,
  CheckInResult,
  createDefaultConfig,
  createEmptySummary,
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
import { ConfigPresetKind, FixtureFactory, RecordPresetKind } from './support/FixtureFactory';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Fixture]';

// One minute expressed in milliseconds, reused by the duration expectations.
const MINUTE_MS: number = 60 * 1000;
// One hour expressed in milliseconds, reused by the duration expectations.
const HOUR_MS: number = 60 * MINUTE_MS;
// One day expressed in milliseconds, reused by the long stay expectations.
const DAY_MS: number = 24 * HOUR_MS;
// Sample timestamp used when a case does not care about the exact time.
const SAMPLE_TIME: number = 1735660800000;
// Number of precondition flags carried by a permission snapshot.
const PERMISSION_FLAG_COUNT: number = 5;
// Number of fields carried by a fence configuration.
const CONFIG_FIELD_COUNT: number = 7;
// Number of fields carried by a check-in record.
const RECORD_FIELD_COUNT: number = 4;

/**
 * Describe the field names of a configuration in database column order.
 * The order matches RecordStore#saveConfig so a diff can be asserted directly.
 * @returns the configuration field names
 */
function configFieldNames(): Array<string> {
  return ['name', 'latitude', 'longitude', 'radius', 'fenceId', 'enabled', 'updatedAt'];
}

/**
 * Describe the radius values of every configuration preset.
 * Every entry keeps the preset kind together with its expected radius.
 */
interface RadiusPresetRow {
  // Preset selector handed to the factory.
  kind: ConfigPresetKind;
  // Radius the factory must produce for this preset.
  radius: number;
  // Whether the radius is inside the accepted validation range.
  accepted: boolean;
}

/**
 * Radius expectations for every configuration preset that carries a radius.
 */
const RADIUS_PRESET_ROWS: Array<RadiusPresetRow> = [
  { kind: ConfigPresetKind.DEFAULT, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.NOMINAL, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.RADIUS_LOWER_EDGE, radius: MIN_RADIUS, accepted: true },
  { kind: ConfigPresetKind.RADIUS_UPPER_EDGE, radius: MAX_RADIUS, accepted: true },
  { kind: ConfigPresetKind.RADIUS_TOO_SMALL, radius: MIN_RADIUS - 1, accepted: false },
  { kind: ConfigPresetKind.RADIUS_TOO_LARGE, radius: MAX_RADIUS + 1, accepted: false },
  { kind: ConfigPresetKind.EMPTY_NAME, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.BLANK_NAME, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.UNICODE_NAME, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.ORIGIN_CENTER, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.FAR_EAST_CENTER, radius: MAX_RADIUS, accepted: true },
  { kind: ConfigPresetKind.ENABLED, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.DISABLED, radius: DEFAULT_RADIUS, accepted: true },
  { kind: ConfigPresetKind.NO_FENCE, radius: DEFAULT_RADIUS, accepted: true }
];

/**
 * Describe the stay duration of every record preset.
 * Every entry keeps the preset kind together with its expected duration.
 */
interface DurationPresetRow {
  // Preset selector handed to the factory.
  kind: RecordPresetKind;
  // Stay duration the factory must produce for this preset.
  durationMs: number;
  // Whether the record is still open after the factory built it.
  open: boolean;
}

/**
 * Duration expectations for every record preset.
 */
const DURATION_PRESET_ROWS: Array<DurationPresetRow> = [
  { kind: RecordPresetKind.OPEN, durationMs: 0, open: true },
  { kind: RecordPresetKind.ONE_MINUTE, durationMs: MINUTE_MS, open: false },
  { kind: RecordPresetKind.ONE_HOUR, durationMs: HOUR_MS, open: false },
  { kind: RecordPresetKind.SHORTEST, durationMs: 1, open: false },
  { kind: RecordPresetKind.ZERO_STAY, durationMs: 0, open: false },
  { kind: RecordPresetKind.NEGATIVE_STAY, durationMs: -MINUTE_MS, open: false },
  { kind: RecordPresetKind.FULL_DAY, durationMs: DAY_MS, open: false },
  { kind: RecordPresetKind.NEGATIVE_ID, durationMs: MINUTE_MS, open: false },
  { kind: RecordPresetKind.INVALID_ID, durationMs: 0, open: true },
  { kind: RecordPresetKind.EPOCH, durationMs: 0, open: true }
];

/**
 * Describe one permission snapshot preset together with its expected score.
 */
interface PermissionPresetRow {
  // Snapshot preset built by the factory.
  snapshot: PermissionSnapshot;
  // Score the factory must report for this snapshot.
  score: number;
  // Whether every precondition flag of the snapshot is turned on.
  ready: boolean;
}

/**
 * Permission snapshot presets covering none, partial and full readiness.
 */
const PERMISSION_PRESET_ROWS: Array<PermissionPresetRow> = [
  { snapshot: FixtureFactory.noneGrantedPermissions(), score: 0, ready: false },
  { snapshot: FixtureFactory.permissions(true, false, false, false, false), score: 1, ready: false },
  { snapshot: FixtureFactory.permissions(true, true, false, false, false), score: 2, ready: false },
  { snapshot: FixtureFactory.permissions(true, true, true, false, false), score: 3, ready: false },
  { snapshot: FixtureFactory.permissions(true, true, true, true, false), score: 4, ready: false },
  { snapshot: FixtureFactory.permissions(false, false, false, true, true), score: 2, ready: false },
  { snapshot: FixtureFactory.allGrantedPermissions(), score: 5, ready: true }
];

/**
 * Describe one location result preset together with its expected field values.
 */
interface LocationPresetRow {
  // Location result built by the factory.
  result: LocationResult;
  // Whether the fix was reported as successful.
  success: boolean;
  // Error code the factory must report for this result.
  errorCode: number;
}

/**
 * Location result presets covering success, failure and extreme coordinates.
 */
const LOCATION_PRESET_ROWS: Array<LocationPresetRow> = [
  { result: FixtureFactory.locationSuccess(39.908, 116.397), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.locationSuccess(0, 0), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.locationSuccess(-90, -180), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.locationSuccess(90, 180), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.locationSuccess(0.000001, -0.000001), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.locationFailure(201), success: false, errorCode: 201 },
  { result: FixtureFactory.locationFailure(3301100), success: false, errorCode: 3301100 },
  { result: FixtureFactory.locationFailure(NO_ERROR), success: false, errorCode: NO_ERROR },
  { result: FixtureFactory.location(false, 12.5, 13.5, 801), success: false, errorCode: 801 }
];

/**
 * Describe one fence operation result preset together with its expected fields.
 */
interface OperationPresetRow {
  // Operation result built by the factory.
  result: FenceOperationResult;
  // Whether the operation was reported as successful.
  success: boolean;
  // Error code the factory must report for this result.
  errorCode: number;
}

/**
 * Fence operation result presets covering success, failures and the unsupported device.
 */
const OPERATION_PRESET_ROWS: Array<OperationPresetRow> = [
  { result: FixtureFactory.operationSuccess(1), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.operationSuccess(0), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.operationSuccess(2147483647), success: true, errorCode: NO_ERROR },
  { result: FixtureFactory.operationFailure(201), success: false, errorCode: 201 },
  { result: FixtureFactory.operationFailure(FENCE_CAPABILITY_UNSUPPORTED), success: false,
    errorCode: FENCE_CAPABILITY_UNSUPPORTED },
  { result: FixtureFactory.operationUnsupported(), success: false,
    errorCode: FENCE_CAPABILITY_UNSUPPORTED },
  { result: FixtureFactory.operation(false, INVALID_FENCE_ID, 801), success: false, errorCode: 801 },
  { result: FixtureFactory.operation(true, 5, NO_ERROR), success: true, errorCode: NO_ERROR }
];

/**
 * Describe one day summary preset together with its expected field values.
 */
interface SummaryPresetRow {
  // Summary built by the factory.
  summary: DaySummary;
  // Count the factory must produce for this summary.
  count: number;
  // Total duration the factory must produce for this summary.
  durationMs: number;
}

/**
 * Day summary presets covering the empty, single and aggregated shapes.
 */
const SUMMARY_PRESET_ROWS: Array<SummaryPresetRow> = [
  { summary: FixtureFactory.emptySummary(), count: 0, durationMs: 0 },
  { summary: FixtureFactory.summary(1, 0), count: 1, durationMs: 0 },
  { summary: FixtureFactory.summary(0, MINUTE_MS), count: 0, durationMs: MINUTE_MS },
  { summary: FixtureFactory.summary(3, 3 * MINUTE_MS), count: 3, durationMs: 3 * MINUTE_MS },
  { summary: FixtureFactory.summary(24, DAY_MS), count: 24, durationMs: DAY_MS },
  { summary: FixtureFactory.summary(-1, -1), count: -1, durationMs: -1 },
  { summary: FixtureFactory.summary(20, 20 * HOUR_MS), count: 20, durationMs: 20 * HOUR_MS }
];

/**
 * Describe one field difference scenario between two configurations.
 */
interface ConfigDiffRow {
  // Value applied to the single changed field.
  changed: string;
  // Field name the diff must report.
  expectedField: string;
}

/**
 * Field difference scenarios, one per configuration field.
 */
const CONFIG_DIFF_ROWS: Array<ConfigDiffRow> = [
  { changed: 'renamed', expectedField: 'name' },
  { changed: 'latitude', expectedField: 'latitude' },
  { changed: 'longitude', expectedField: 'longitude' },
  { changed: 'radius', expectedField: 'radius' },
  { changed: 'fenceId', expectedField: 'fenceId' },
  { changed: 'enabled', expectedField: 'enabled' },
  { changed: 'updatedAt', expectedField: 'updatedAt' }
];

/**
 * Apply one single field change onto a configuration copy.
 * @param source configuration to copy and change
 * @param field field name to change
 * @returns a copy of the source with only the named field changed
 */
function applySingleFieldChange(source: FenceConfig, field: string): FenceConfig {
  // Always start from a copy so the source fixture stays untouched.
  const changed: FenceConfig = FixtureFactory.cloneConfig(source);
  if (field === 'name') {
    changed.name = 'changed_name';
  }
  if (field === 'latitude') {
    changed.latitude = changed.latitude + 1;
  }
  if (field === 'longitude') {
    changed.longitude = changed.longitude + 1;
  }
  if (field === 'radius') {
    changed.radius = changed.radius + 1;
  }
  if (field === 'fenceId') {
    changed.fenceId = changed.fenceId + 1;
  }
  if (field === 'enabled') {
    changed.enabled = !changed.enabled;
  }
  if (field === 'updatedAt') {
    changed.updatedAt = changed.updatedAt + 1;
  }
  return changed;
}

export default function fixtureFactoryTest() {
  describe('FixtureFactoryTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'FixtureFactoryTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'FixtureFactoryTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0100
     * @tc.name      testDefaultConfigFixture0001
     * @tc.desc      Verify the default configuration fixture matches the library default
     *               field by field and every default value keeps its marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDefaultConfigFixture0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDefaultConfigFixture0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fixture: FenceConfig = FixtureFactory.defaultConfig();
      const library: FenceConfig = createDefaultConfig();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' fixture name length=' + fixture.name.length);

      expect(fixture.name === '').assertTrue();
      expect(fixture.latitude === 0).assertTrue();
      expect(fixture.longitude === 0).assertTrue();
      expect(fixture.radius === DEFAULT_RADIUS).assertTrue();
      expect(fixture.fenceId === INVALID_FENCE_ID).assertTrue();
      expect(fixture.enabled === false).assertTrue();
      expect(fixture.updatedAt === 0).assertTrue();

      expect(FixtureFactory.configEquals(fixture, library)).assertTrue();
      expect(FixtureFactory.configDiffFields(fixture, library).length === 0).assertTrue();
      expect(library.radius === DEFAULT_RADIUS).assertTrue();
      expect(library.fenceId === INVALID_FENCE_ID).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0200
     * @tc.name      testConfigBuilderFields0001
     * @tc.desc      Verify the configuration builder copies every argument into the
     *               matching field without coercion or reordering.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigBuilderFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigBuilderFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fixture: FenceConfig = FixtureFactory.config('builder_case', 31.2304, 121.4737,
        350, 12, true, SAMPLE_TIME);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' radius=' + fixture.radius);

      expect(fixture.name === 'builder_case').assertTrue();
      expect(fixture.latitude === 31.2304).assertTrue();
      expect(fixture.longitude === 121.4737).assertTrue();
      expect(fixture.radius === 350).assertTrue();
      expect(fixture.fenceId === 12).assertTrue();
      expect(fixture.enabled === true).assertTrue();
      expect(fixture.updatedAt === SAMPLE_TIME).assertTrue();

      const zeros: FenceConfig = FixtureFactory.config('', 0, 0, 0, 0, false, 0);
      expect(zeros.name === '').assertTrue();
      expect(zeros.latitude === 0).assertTrue();
      expect(zeros.radius === 0).assertTrue();
      expect(zeros.fenceId === 0).assertTrue();
      expect(zeros.enabled === false).assertTrue();
      expect(zeros.updatedAt === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0300
     * @tc.name      testConfigPresetRadiusMatrix0001
     * @tc.desc      Verify every configuration preset reports the documented radius and
     *               whether that radius sits inside the accepted validation range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigPresetRadiusMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigPresetRadiusMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let acceptedCount: number = 0;
      let rejectedCount: number = 0;
      for (let index: number = 0; index < RADIUS_PRESET_ROWS.length; index++) {
        const row: RadiusPresetRow = RADIUS_PRESET_ROWS[index];
        const fixture: FenceConfig = FixtureFactory.configByPreset(row.kind);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' preset=' + row.kind + ', radius=' + fixture.radius);
        expect(fixture.radius === row.radius).assertTrue();
        const inRange: boolean = fixture.radius >= MIN_RADIUS && fixture.radius <= MAX_RADIUS;
        expect(inRange === row.accepted).assertTrue();
        expect(fixture.name.length >= 0).assertTrue();
        if (row.accepted) {
          acceptedCount = acceptedCount + 1;
        } else {
          rejectedCount = rejectedCount + 1;
        }
      }
      expect(acceptedCount === 12).assertTrue();
      expect(rejectedCount === 2).assertTrue();
      expect(acceptedCount + rejectedCount === RADIUS_PRESET_ROWS.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0400
     * @tc.name      testConfigPresetCenterMatrix0001
     * @tc.desc      Verify every configuration preset keeps its center coordinates inside
     *               the valid latitude and longitude ranges.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigPresetCenterMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigPresetCenterMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const presets: Array<FenceConfig> = FixtureFactory.allConfigPresets();
      expect(presets.length === RADIUS_PRESET_ROWS.length).assertTrue();
      for (let index: number = 0; index < presets.length; index++) {
        const fixture: FenceConfig = presets[index];
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' lat=' + fixture.latitude +
          ', lon=' + fixture.longitude);
        expect(fixture.latitude >= -90).assertTrue();
        expect(fixture.latitude <= 90).assertTrue();
        expect(fixture.longitude >= -180).assertTrue();
        expect(fixture.longitude <= 180).assertTrue();
        expect(Number.isFinite(fixture.latitude)).assertTrue();
        expect(Number.isFinite(fixture.longitude)).assertTrue();
      }
      const origin: FenceConfig = FixtureFactory.configByPreset(ConfigPresetKind.ORIGIN_CENTER);
      expect(origin.latitude === 0).assertTrue();
      expect(origin.longitude === 0).assertTrue();
      expect(origin.fenceId === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0500
     * @tc.name      testConfigPresetNameMatrix0001
     * @tc.desc      Verify the configuration presets produce their documented name shapes,
     *               including the empty, blank and non ASCII names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigPresetNameMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigPresetNameMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emptyName: FenceConfig = FixtureFactory.configByPreset(ConfigPresetKind.EMPTY_NAME);
      const blankName: FenceConfig = FixtureFactory.configByPreset(ConfigPresetKind.BLANK_NAME);
      const unicodeName: FenceConfig = FixtureFactory.configByPreset(ConfigPresetKind.UNICODE_NAME);
      const nominal: FenceConfig = FixtureFactory.configByPreset(ConfigPresetKind.NOMINAL);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' unicode length=' + unicodeName.name.length);

      expect(emptyName.name.length === 0).assertTrue();
      expect(emptyName.name.trim().length === 0).assertTrue();
      expect(blankName.name.length === 3).assertTrue();
      expect(blankName.name.trim().length === 0).assertTrue();
      expect(unicodeName.name.length === 4).assertTrue();
      expect(unicodeName.name.trim().length === 4).assertTrue();
      expect(nominal.name.startsWith('preset_')).assertTrue();
      expect(nominal.name.length > 'preset_'.length).assertTrue();
      expect(nominal.name === FixtureFactory.nominalConfig('').name).assertFalse();
      expect(FixtureFactory.nominalConfig('gate').name === 'fence_gate').assertTrue();
      expect(FixtureFactory.nominalConfig('gate').enabled).assertTrue();
      expect(FixtureFactory.nominalConfig('gate').radius === DEFAULT_RADIUS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0600
     * @tc.name      testCloneConfigIndependence0001
     * @tc.desc      Verify a cloned configuration keeps every field value while staying
     *               independent from the source, so mutations never leak back.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCloneConfigIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCloneConfigIndependence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: FenceConfig = FixtureFactory.nominalConfig('clone');
      const cloned: FenceConfig = FixtureFactory.cloneConfig(source);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' source name=' + source.name);

      expect(cloned === source).assertFalse();
      expect(FixtureFactory.configEquals(cloned, source)).assertTrue();
      expect(cloned.name === source.name).assertTrue();
      expect(cloned.latitude === source.latitude).assertTrue();
      expect(cloned.longitude === source.longitude).assertTrue();
      expect(cloned.radius === source.radius).assertTrue();
      expect(cloned.fenceId === source.fenceId).assertTrue();
      expect(cloned.enabled === source.enabled).assertTrue();
      expect(cloned.updatedAt === source.updatedAt).assertTrue();

      cloned.name = 'mutated';
      cloned.radius = MAX_RADIUS;
      cloned.fenceId = 999;
      cloned.enabled = false;
      expect(source.name === 'fence_clone').assertTrue();
      expect(source.radius === DEFAULT_RADIUS).assertTrue();
      expect(source.fenceId !== 999).assertTrue();
      expect(source.enabled === true).assertTrue();
      expect(FixtureFactory.configEquals(cloned, source)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0700
     * @tc.name      testConfigDiffFieldMatrix0001
     * @tc.desc      Verify a single field change on a configuration copy is reported as
     *               exactly one differing field name in the documented order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigDiffFieldMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigDiffFieldMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: FenceConfig = FixtureFactory.nominalConfig('diff');
      const fieldNames: Array<string> = configFieldNames();
      expect(fieldNames.length === CONFIG_FIELD_COUNT).assertTrue();
      expect(FixtureFactory.configDiffFields(base, base).length === 0).assertTrue();

      for (let index: number = 0; index < CONFIG_DIFF_ROWS.length; index++) {
        const row: ConfigDiffRow = CONFIG_DIFF_ROWS[index];
        const changed: FenceConfig = applySingleFieldChange(base, row.expectedField);
        const diff: Array<string> = FixtureFactory.configDiffFields(base, changed);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' field=' + row.expectedField +
          ', diffCount=' + diff.length);
        expect(diff.length === 1).assertTrue();
        expect(diff[0] === row.expectedField).assertTrue();
        expect(FixtureFactory.configEquals(base, changed)).assertFalse();
        expect(fieldNames.indexOf(row.expectedField) >= 0).assertTrue();
        expect(row.changed.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0800
     * @tc.name      testRenameConfigKeepsOtherFields0001
     * @tc.desc      Verify renaming a configuration in place changes only the name and keeps
     *               every other field and the instance identity untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRenameConfigKeepsOtherFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRenameConfigKeepsOtherFields0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const target: FenceConfig = FixtureFactory.nominalConfig('rename');
      const snapshot: FenceConfig = FixtureFactory.cloneConfig(target);
      const renamed: FenceConfig = FixtureFactory.renameConfig(target, 'renamed_fence');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' renamed=' + renamed.name);

      expect(renamed === target).assertTrue();
      expect(renamed.name === 'renamed_fence').assertTrue();
      expect(renamed.latitude === snapshot.latitude).assertTrue();
      expect(renamed.longitude === snapshot.longitude).assertTrue();
      expect(renamed.radius === snapshot.radius).assertTrue();
      expect(renamed.fenceId === snapshot.fenceId).assertTrue();
      expect(renamed.enabled === snapshot.enabled).assertTrue();
      expect(renamed.updatedAt === snapshot.updatedAt).assertTrue();

      const diff: Array<string> = FixtureFactory.configDiffFields(snapshot, renamed);
      expect(diff.length === 1).assertTrue();
      expect(diff[0] === 'name').assertTrue();
      expect(FixtureFactory.renameConfig(target, '').name.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_0900
     * @tc.name      testOpenAndClosedRecordFixture0001
     * @tc.desc      Verify the open and closed record builders derive the exit marker, the
     *               duration and the exit time consistently.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOpenAndClosedRecordFixture0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testOpenAndClosedRecordFixture0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const opened: CheckInRecord = FixtureFactory.openRecord(1, SAMPLE_TIME);
      const closed: CheckInRecord = FixtureFactory.closedRecord(2, SAMPLE_TIME, MINUTE_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' closed exitTime=' + closed.exitTime);

      expect(opened.id === 1).assertTrue();
      expect(opened.enterTime === SAMPLE_TIME).assertTrue();
      expect(opened.exitTime === OPEN_END).assertTrue();
      expect(opened.durationMs === 0).assertTrue();
      expect(FixtureFactory.isOpen(opened)).assertTrue();

      expect(closed.id === 2).assertTrue();
      expect(closed.enterTime === SAMPLE_TIME).assertTrue();
      expect(closed.exitTime === SAMPLE_TIME + MINUTE_MS).assertTrue();
      expect(closed.durationMs === MINUTE_MS).assertTrue();
      expect(FixtureFactory.isOpen(closed)).assertFalse();
      expect(closed.exitTime - closed.enterTime === closed.durationMs).assertTrue();
      expect(FixtureFactory.recordEquals(opened, closed)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1000
     * @tc.name      testRecordPresetDurationMatrix0001
     * @tc.desc      Verify every record preset reports the documented stay duration and the
     *               documented open or closed state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordPresetDurationMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRecordPresetDurationMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let openCount: number = 0;
      let closedCount: number = 0;
      for (let index: number = 0; index < DURATION_PRESET_ROWS.length; index++) {
        const row: DurationPresetRow = DURATION_PRESET_ROWS[index];
        const record: CheckInRecord = FixtureFactory.recordByPreset(row.kind);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' preset=' + row.kind +
          ', durationMs=' + record.durationMs);
        expect(record.durationMs === row.durationMs).assertTrue();
        expect(FixtureFactory.isOpen(record) === row.open).assertTrue();
        expect(Number.isFinite(record.enterTime)).assertTrue();
        expect(Number.isFinite(record.exitTime)).assertTrue();
        if (row.open) {
          openCount = openCount + 1;
          expect(record.exitTime === OPEN_END).assertTrue();
        } else {
          closedCount = closedCount + 1;
          expect(record.exitTime !== OPEN_END).assertTrue();
        }
      }
      expect(openCount === 3).assertTrue();
      expect(closedCount === 7).assertTrue();
      expect(openCount + closedCount === DURATION_PRESET_ROWS.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1100
     * @tc.name      testRecordPresetIdentityMatrix0001
     * @tc.desc      Verify the record presets keep distinct database ids and that the preset
     *               list stays stable across two factory calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordPresetIdentityMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRecordPresetIdentityMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: Array<CheckInRecord> = FixtureFactory.allRecordPresets();
      const second: Array<CheckInRecord> = FixtureFactory.allRecordPresets();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' preset count=' + first.length);

      expect(first.length === DURATION_PRESET_ROWS.length).assertTrue();
      expect(second.length === first.length).assertTrue();
      for (let index: number = 0; index < first.length; index++) {
        expect(first[index] === second[index]).assertFalse();
        expect(FixtureFactory.recordEquals(first[index], second[index])).assertTrue();
        expect(first[index].durationMs === DURATION_PRESET_ROWS[index].durationMs).assertTrue();
      }
      const ids: Array<number> = [];
      for (let index: number = 0; index < first.length; index++) {
        ids.push(first[index].id);
      }
      expect(ids.length === 10).assertTrue();
      expect(ids.indexOf(-1) >= 0).assertTrue();
      expect(ids.indexOf(0) >= 0).assertTrue();
      expect(ids.indexOf(7) >= 0).assertTrue();
      expect(ids.indexOf(RECORD_FIELD_COUNT) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1200
     * @tc.name      testCloneRecordIndependence0001
     * @tc.desc      Verify a cloned record keeps every field value while staying independent
     *               from the source, so mutation and close operations never leak back.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCloneRecordIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCloneRecordIndependence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: CheckInRecord = FixtureFactory.openRecord(9, SAMPLE_TIME);
      const cloned: CheckInRecord = FixtureFactory.cloneRecord(source);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' clone id=' + cloned.id);

      expect(cloned === source).assertFalse();
      expect(FixtureFactory.recordEquals(cloned, source)).assertTrue();
      expect(cloned.id === 9).assertTrue();
      expect(cloned.enterTime === SAMPLE_TIME).assertTrue();
      expect(cloned.exitTime === OPEN_END).assertTrue();
      expect(cloned.durationMs === 0).assertTrue();

      const closed: CheckInRecord = FixtureFactory.closeRecord(cloned, SAMPLE_TIME + HOUR_MS);
      expect(closed === cloned).assertTrue();
      expect(closed.exitTime === SAMPLE_TIME + HOUR_MS).assertTrue();
      expect(closed.durationMs === HOUR_MS).assertTrue();
      expect(FixtureFactory.isOpen(closed)).assertFalse();
      expect(FixtureFactory.isOpen(source)).assertTrue();
      expect(source.exitTime === OPEN_END).assertTrue();
      expect(source.durationMs === 0).assertTrue();
      expect(FixtureFactory.recordEquals(cloned, source)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1300
     * @tc.name      testRecordBatchShape0001
     * @tc.desc      Verify a record batch keeps ascending ids, one hour spacing and the shared
     *               stay duration while every record stays closed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordBatchShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRecordBatchShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const batch: Array<CheckInRecord> = FixtureFactory.recordBatch(5, SAMPLE_TIME, MINUTE_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' batch size=' + batch.length);

      expect(batch.length === 5).assertTrue();
      for (let index: number = 0; index < batch.length; index++) {
        expect(batch[index].id === index + 1).assertTrue();
        expect(batch[index].enterTime === SAMPLE_TIME + index * HOUR_MS).assertTrue();
        expect(batch[index].durationMs === MINUTE_MS).assertTrue();
        expect(FixtureFactory.isOpen(batch[index])).assertFalse();
      }
      expect(batch[0].enterTime < batch[1].enterTime).assertTrue();
      expect(batch[3].enterTime < batch[4].enterTime).assertTrue();
      expect(FixtureFactory.recordBatch(0, SAMPLE_TIME, MINUTE_MS).length === 0).assertTrue();
      expect(FixtureFactory.recordBatch(1, SAMPLE_TIME, 0).length === 1).assertTrue();
      expect(FixtureFactory.recordBatch(1, SAMPLE_TIME, 0)[0].durationMs === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1400
     * @tc.name      testEnterAndExitResultFixture0001
     * @tc.desc      Verify the enter and exit result fixtures report the changed flag, the
     *               matching action and the carried record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEnterAndExitResultFixture0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEnterAndExitResultFixture0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const opened: CheckInRecord = FixtureFactory.openRecord(1, SAMPLE_TIME);
      const closed: CheckInRecord = FixtureFactory.closedRecord(1, SAMPLE_TIME, MINUTE_MS);
      const enter: CheckInResult = FixtureFactory.enterResult(opened, SAMPLE_TIME);
      const exit: CheckInResult = FixtureFactory.exitResult(closed, SAMPLE_TIME + MINUTE_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' enter action=' + enter.action);

      expect(enter.changed === true).assertTrue();
      expect(enter.action === FenceTransitionAction.ENTER).assertTrue();
      expect(enter.record === opened).assertTrue();
      expect(enter.timestamp === SAMPLE_TIME).assertTrue();

      expect(exit.changed === true).assertTrue();
      expect(exit.action === FenceTransitionAction.EXIT).assertTrue();
      expect(exit.record === closed).assertTrue();
      expect(exit.timestamp === SAMPLE_TIME + MINUTE_MS).assertTrue();

      expect(enter.action !== exit.action).assertTrue();
      expect(enter.timestamp < exit.timestamp).assertTrue();
      const record: CheckInRecord | undefined = enter.record;
      expect(record !== undefined).assertTrue();
      if (record !== undefined) {
        expect(FixtureFactory.isOpen(record)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1500
     * @tc.name      testUnchangedResultFixture0001
     * @tc.desc      Verify the unchanged result fixture reports no change, the none action and
     *               no record while keeping the processing timestamp.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUnchangedResultFixture0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUnchangedResultFixture0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const unchanged: CheckInResult = FixtureFactory.unchangedResult(SAMPLE_TIME);
      const manual: CheckInResult = FixtureFactory.result(false, FenceTransitionAction.NONE,
        undefined, SAMPLE_TIME);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' action=' + unchanged.action);

      expect(unchanged.changed === false).assertTrue();
      expect(unchanged.action === FenceTransitionAction.NONE).assertTrue();
      expect(unchanged.record === undefined).assertTrue();
      expect(unchanged.timestamp === SAMPLE_TIME).assertTrue();

      expect(manual.changed === false).assertTrue();
      expect(manual.action === FenceTransitionAction.NONE).assertTrue();
      expect(manual.record === undefined).assertTrue();
      expect(manual.timestamp === unchanged.timestamp).assertTrue();

      const enterAction: number = FenceTransitionAction.ENTER;
      const exitAction: number = FenceTransitionAction.EXIT;
      const noneAction: number = FenceTransitionAction.NONE;
      expect(enterAction !== noneAction).assertTrue();
      expect(exitAction !== noneAction).assertTrue();
      expect(Number.isFinite(unchanged.timestamp)).assertTrue();
      expect(unchanged.timestamp > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1600
     * @tc.name      testCloneResultIndependence0001
     * @tc.desc      Verify a cloned result keeps every value including the nested record while
     *               the nested record itself is a fresh copy.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCloneResultIndependence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCloneResultIndependence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const opened: CheckInRecord = FixtureFactory.openRecord(11, SAMPLE_TIME);
      const source: CheckInResult = FixtureFactory.enterResult(opened, SAMPLE_TIME);
      const cloned: CheckInResult = FixtureFactory.cloneResult(source);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' clone changed=' + cloned.changed);

      expect(cloned === source).assertFalse();
      expect(cloned.changed === source.changed).assertTrue();
      expect(cloned.action === source.action).assertTrue();
      expect(cloned.timestamp === source.timestamp).assertTrue();
      expect(cloned.record === source.record).assertFalse();
      const clonedRecord: CheckInRecord | undefined = cloned.record;
      const sourceRecord: CheckInRecord | undefined = source.record;
      expect(clonedRecord !== undefined).assertTrue();
      expect(sourceRecord !== undefined).assertTrue();
      if (clonedRecord !== undefined && sourceRecord !== undefined) {
        expect(FixtureFactory.recordEquals(clonedRecord, sourceRecord)).assertTrue();
        FixtureFactory.closeRecord(clonedRecord, SAMPLE_TIME + MINUTE_MS);
        expect(FixtureFactory.isOpen(clonedRecord)).assertFalse();
        expect(FixtureFactory.isOpen(sourceRecord)).assertTrue();
      } else {
        expect(true).assertFalse();
      }
      const emptyClone: CheckInResult = FixtureFactory.cloneResult(FixtureFactory.unchangedResult(1));
      expect(emptyClone.record === undefined).assertTrue();
      expect(emptyClone.changed === false).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1700
     * @tc.name      testSummaryPresetMatrix0001
     * @tc.desc      Verify every day summary preset reports the documented count and total
     *               duration, including the empty and the negative shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSummaryPresetMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSummaryPresetMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: DaySummary = createEmptySummary();
      expect(FixtureFactory.summaryEquals(FixtureFactory.emptySummary(), empty)).assertTrue();
      for (let index: number = 0; index < SUMMARY_PRESET_ROWS.length; index++) {
        const row: SummaryPresetRow = SUMMARY_PRESET_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' count=' + row.summary.count +
          ', durationMs=' + row.summary.durationMs);
        expect(row.summary.count === row.count).assertTrue();
        expect(row.summary.durationMs === row.durationMs).assertTrue();
        expect(FixtureFactory.summaryEquals(row.summary, FixtureFactory.summary(row.count,
          row.durationMs))).assertTrue();
      }
      expect(FixtureFactory.summaryEquals(FixtureFactory.summary(1, 1),
        FixtureFactory.summary(1, 2))).assertFalse();
      expect(FixtureFactory.summaryEquals(FixtureFactory.summary(1, 1),
        FixtureFactory.summary(2, 1))).assertFalse();
      expect(FixtureFactory.summaryOf([]).count === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1800
     * @tc.name      testSummaryOfRecordsAggregation0001
     * @tc.desc      Verify the summary builder counts every record and sums the stay durations
     *               of a mixed record list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSummaryOfRecordsAggregation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSummaryOfRecordsAggregation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const records: Array<CheckInRecord> = FixtureFactory.recordBatch(4, SAMPLE_TIME, MINUTE_MS);
      const summary: DaySummary = FixtureFactory.summaryOf(records);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' count=' + summary.count +
        ', durationMs=' + summary.durationMs);

      expect(summary.count === 4).assertTrue();
      expect(summary.durationMs === 4 * MINUTE_MS).assertTrue();
      expect(summary.count === records.length).assertTrue();

      const opened: Array<CheckInRecord> = FixtureFactory.recordBatchOfPresets([
        RecordPresetKind.OPEN, RecordPresetKind.ONE_MINUTE, RecordPresetKind.OPEN,
        RecordPresetKind.ONE_HOUR
      ]);
      const mixed: DaySummary = FixtureFactory.summaryOf(opened);
      expect(opened.length === 4).assertTrue();
      expect(mixed.count === 4).assertTrue();
      expect(mixed.durationMs === MINUTE_MS + HOUR_MS).assertTrue();
      expect(FixtureFactory.summaryOf(FixtureFactory.recordBatch(1, SAMPLE_TIME, 0)).durationMs === 0)
        .assertTrue();
      expect(FixtureFactory.summaryEquals(FixtureFactory.summaryOf(records),
        FixtureFactory.summary(4, 4 * MINUTE_MS))).assertTrue();
      expect(FixtureFactory.summaryEquals(summary, mixed)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_1900
     * @tc.name      testLocationPresetMatrix0001
     * @tc.desc      Verify every location preset reports the documented success flag, error code
     *               and coordinate shape, including the extreme coordinates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLocationPresetMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLocationPresetMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let failureCount: number = 0;
      for (let index: number = 0; index < LOCATION_PRESET_ROWS.length; index++) {
        const row: LocationPresetRow = LOCATION_PRESET_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' success=' + row.result.success +
          ', errorCode=' + row.result.errorCode);
        expect(row.result.success === row.success).assertTrue();
        expect(row.result.errorCode === row.errorCode).assertTrue();
        expect(row.result.latitude >= -90).assertTrue();
        expect(row.result.latitude <= 90).assertTrue();
        expect(row.result.longitude >= -180).assertTrue();
        expect(row.result.longitude <= 180).assertTrue();
        if (row.success) {
          expect(row.result.errorCode === NO_ERROR).assertTrue();
        } else {
          failureCount = failureCount + 1;
        }
      }
      expect(failureCount === 4).assertTrue();
      const failed: LocationResult = FixtureFactory.locationFailure(201);
      expect(failed.latitude === 0).assertTrue();
      expect(failed.longitude === 0).assertTrue();
      expect(failed.success === false).assertTrue();
      expect(failed.errorCode === 201).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_2000
     * @tc.name      testPermissionPresetMatrix0001
     * @tc.desc      Verify every permission snapshot preset reports the documented score and
     *               readiness, and the flags stay inside the snapshot count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionPresetMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPermissionPresetMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PERMISSION_PRESET_ROWS.length; index++) {
        const row: PermissionPresetRow = PERMISSION_PRESET_ROWS[index];
        const score: number = FixtureFactory.permissionScore(row.snapshot);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' score=' + score);
        expect(score === row.score).assertTrue();
        expect(FixtureFactory.isFullyReady(row.snapshot) === row.ready).assertTrue();
        expect(score >= 0).assertTrue();
        expect(score <= PERMISSION_FLAG_COUNT).assertTrue();
        expect(typeof row.snapshot.foregroundGranted === 'boolean').assertTrue();
        expect(typeof row.snapshot.capabilitySupported === 'boolean').assertTrue();
      }
      const all: PermissionSnapshot = FixtureFactory.allGrantedPermissions();
      expect(all.foregroundGranted).assertTrue();
      expect(all.backgroundGranted).assertTrue();
      expect(all.notificationEnabled).assertTrue();
      expect(all.locationEnabled).assertTrue();
      expect(all.capabilitySupported).assertTrue();
      expect(FixtureFactory.permissionScore(all) === PERMISSION_FLAG_COUNT).assertTrue();
      expect(FixtureFactory.permissionScore(FixtureFactory.noneGrantedPermissions()) === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_2100
     * @tc.name      testOperationPresetMatrix0001
     * @tc.desc      Verify every fence operation preset reports the documented success flag and
     *               error code, and failures always carry the invalid fence id.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOperationPresetMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testOperationPresetMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let successCount: number = 0;
      for (let index: number = 0; index < OPERATION_PRESET_ROWS.length; index++) {
        const row: OperationPresetRow = OPERATION_PRESET_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' success=' + row.result.success +
          ', fenceId=' + row.result.fenceId);
        expect(row.result.success === row.success).assertTrue();
        expect(row.result.errorCode === row.errorCode).assertTrue();
        if (row.success) {
          expect(row.result.fenceId !== INVALID_FENCE_ID).assertTrue();
          successCount = successCount + 1;
        } else {
          expect(row.result.fenceId === INVALID_FENCE_ID).assertTrue();
        }
      }
      expect(successCount === 4).assertTrue();
      const unsupported: FenceOperationResult = FixtureFactory.operationUnsupported();
      expect(unsupported.success === false).assertTrue();
      expect(unsupported.errorCode === FENCE_CAPABILITY_UNSUPPORTED).assertTrue();
      expect(unsupported.fenceId === INVALID_FENCE_ID).assertTrue();
      expect(FENCE_CAPABILITY_UNSUPPORTED === 801).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_2200
     * @tc.name      testConfigBatchOrdering0001
     * @tc.desc      Verify a configuration batch keeps the requested preset order while every
     *               returned configuration stays a distinct instance.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigBatchOrdering0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigBatchOrdering0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const kinds: Array<ConfigPresetKind> = [
        ConfigPresetKind.NOMINAL, ConfigPresetKind.RADIUS_LOWER_EDGE,
        ConfigPresetKind.RADIUS_UPPER_EDGE, ConfigPresetKind.ENABLED
      ];
      const batch: Array<FenceConfig> = FixtureFactory.configBatch(kinds);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' batch size=' + batch.length);

      expect(batch.length === kinds.length).assertTrue();
      for (let index: number = 0; index < kinds.length; index++) {
        expect(FixtureFactory.configEquals(batch[index],
          FixtureFactory.configByPreset(kinds[index]))).assertTrue();
      }
      expect(batch[1].radius === MIN_RADIUS).assertTrue();
      expect(batch[2].radius === MAX_RADIUS).assertTrue();
      expect(batch[1].radius < batch[0].radius).assertTrue();
      expect(batch[0].radius < batch[2].radius).assertTrue();
      expect(batch[3].enabled).assertTrue();
      expect(FixtureFactory.configBatch([]).length === 0).assertTrue();
      expect(batch[0] === batch[3]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_2300
     * @tc.name      testRecordBatchOfPresetsOrdering0001
     * @tc.desc      Verify a record batch built from presets keeps the requested preset order and
     *               every record carries the documented duration.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordBatchOfPresetsOrdering0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRecordBatchOfPresetsOrdering0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const kinds: Array<RecordPresetKind> = [
        RecordPresetKind.FULL_DAY, RecordPresetKind.ONE_HOUR, RecordPresetKind.ONE_MINUTE,
        RecordPresetKind.SHORTEST, RecordPresetKind.OPEN
      ];
      const batch: Array<CheckInRecord> = FixtureFactory.recordBatchOfPresets(kinds);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' batch size=' + batch.length);

      expect(batch.length === kinds.length).assertTrue();
      expect(batch[0].durationMs === DAY_MS).assertTrue();
      expect(batch[1].durationMs === HOUR_MS).assertTrue();
      expect(batch[2].durationMs === MINUTE_MS).assertTrue();
      expect(batch[3].durationMs === 1).assertTrue();
      expect(batch[4].durationMs === 0).assertTrue();
      expect(FixtureFactory.isOpen(batch[4])).assertTrue();
      expect(FixtureFactory.isOpen(batch[0])).assertFalse();
      expect(batch[0].durationMs > batch[1].durationMs).assertTrue();
      expect(batch[1].durationMs > batch[2].durationMs).assertTrue();
      expect(batch[2].durationMs > batch[3].durationMs).assertTrue();
      expect(batch[3].durationMs > batch[4].durationMs).assertTrue();
      expect(FixtureFactory.recordBatchOfPresets([]).length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FIXTURE_2400
     * @tc.name      testFixtureDeterminism0001
     * @tc.desc      Verify every factory helper is deterministic: two calls with the same
     *               arguments always produce equal but independent fixtures.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureDeterminism0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFixtureDeterminism0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const configA: FenceConfig = FixtureFactory.nominalConfig('det');
      const configB: FenceConfig = FixtureFactory.nominalConfig('det');
      expect(FixtureFactory.configEquals(configA, configB)).assertTrue();
      expect(configA === configB).assertFalse();

      const recordA: CheckInRecord = FixtureFactory.closedRecord(3, SAMPLE_TIME, HOUR_MS);
      const recordB: CheckInRecord = FixtureFactory.closedRecord(3, SAMPLE_TIME, HOUR_MS);
      expect(FixtureFactory.recordEquals(recordA, recordB)).assertTrue();
      expect(recordA === recordB).assertFalse();

      const summaryA: DaySummary = FixtureFactory.summary(3, HOUR_MS);
      const summaryB: DaySummary = FixtureFactory.summary(3, HOUR_MS);
      expect(FixtureFactory.summaryEquals(summaryA, summaryB)).assertTrue();
      expect(summaryA === summaryB).assertFalse();

      const locationA: LocationResult = FixtureFactory.locationSuccess(1.5, 2.5);
      const locationB: LocationResult = FixtureFactory.locationSuccess(1.5, 2.5);
      expect(locationA === locationB).assertFalse();
      expect(locationA.latitude === locationB.latitude).assertTrue();
      expect(locationA.longitude === locationB.longitude).assertTrue();
      expect(locationA.errorCode === locationB.errorCode).assertTrue();

      const operationA: FenceOperationResult = FixtureFactory.operationSuccess(4);
      const operationB: FenceOperationResult = FixtureFactory.operationSuccess(4);
      expect(operationA === operationB).assertFalse();
      expect(operationA.fenceId === operationB.fenceId).assertTrue();
      expect(operationA.errorCode === operationB.errorCode).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
