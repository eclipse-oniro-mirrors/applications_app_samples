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

// Import the device information helper under test from the library HAR package.
import { DeviceUtils } from 'library';
// Import the raw device information module so helper output can be cross checked against the system source.
import { deviceInfo } from '@kit.BasicServicesKit';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The smallest API level any real device reports; used as the always true lower bound probe.
const API_LOWER_BOUND: number = 1;
// An API level far beyond any shipping release; used as the always false upper bound probe.
const API_UPPER_BOUND: number = 1000;
// The lowest plausible SDK API level of the OpenHarmony baseline this sample targets.
const API_MIN_PLAUSIBLE: number = 1;
// The highest plausible SDK API level accepted by this sample matrix.
const API_MAX_PLAUSIBLE: number = 100;
// The separator a device type string must never contain because it is a plain identifier.
const DEVICE_TYPE_FORBIDDEN: string = ' ';
// The empty string used as a negative probe when comparing device metadata.
const EMPTY_TEXT: string = '';
// The substring that separates the marketing name from the device type inside the summary.
const SUMMARY_MODEL_SEPARATOR: string = ' (';
// The substring that separates the device type from the OS name inside the summary.
const SUMMARY_OS_SEPARATOR: string = '), ';
// The prefix printed before the numeric API level inside the summary.
const SUMMARY_API_PREFIX: string = ', API ';
// The separator used when several device facts are folded into one report line.
const REPORT_SEPARATOR: string = ' | ';
// The separator used by the nested summary wrapper case.
const WRAPPER_SEPARATOR: string = ' :: ';
// The number of independent summary compositions verified by the repeat case.
const SUMMARY_REPEAT: number = 4;
// The number of consecutive reads compared by the stability sweep.
const STABILITY_ROUNDS: number = 5;
// The repeat count used by the API bound matrix.
const API_MATRIX_ROUNDS: number = 3;
// The device types the sample is documented to run on; the live value must be one of them.
const KNOWN_DEVICE_TYPES: string[] = ['phone', 'tablet', '2in1', 'wearable', 'tv', 'car', 'default'];
// The API levels probed by the boundary matrix, ordered so the verdict must be monotonic.
const API_TARGETS: number[] = [1, 5, 9, 10, 11, 12, 20, 30, 50, 100];
// The version fields whose "at least 1" verdict must always be true on a live device.
const API_ALWAYS_TRUE_TARGETS: number[] = [1];
// The version fields probed by the positive bound case, each verified against isApiAtLeast.
const API_BOUND_TARGETS: number[] = [API_LOWER_BOUND, API_MIN_PLAUSIBLE];

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// The printable ASCII character code ranges that a text device field may legitimately use.
const PRINTABLE_CODE_RANGES: string[] = ['32-126', '160-255', '0x4E00-0x9FFF'];

// Reports whether a character code falls into one of the printable ranges above.
function isPrintableCode(code: number): boolean {
  // Accept the visible ASCII block.
  if (code >= 32 && code <= 126) {
    // The code belongs to the ASCII block.
    return true;
  }
  // Accept the Latin-1 supplement letters used by some vendor strings.
  if (code >= 160 && code <= 255) {
    // The code belongs to the Latin-1 supplement block.
    return true;
  }
  // Accept the CJK unified ideographs used by localized vendor strings.
  if (code >= 0x4E00 && code <= 0x9FFF) {
    // The code belongs to the CJK block.
    return true;
  }
  // Every other code is treated as a control or unpaired surrogate character.
  return false;
}

// Renders a boolean into a stable lower case token for the log lines.
function boolText(value: boolean): string {
  // Map the true case onto its literal name.
  if (value) {
    // Return the true literal.
    return 'true';
  }
  // Map the false case onto its literal name.
  return 'false';
}

// Counts how many characters of the value fall outside the printable ranges.
function countUnprintable(value: string): number {
  // Keep a running counter of unprintable characters.
  let count: number = 0;
  // Walk the string code unit by code unit.
  for (let i: number = 0; i < value.length; i++) {
    // Read the code unit of the current position.
    const code: number = value.charCodeAt(i);
    // Count the code only when it is not printable.
    if (!isPrintableCode(code)) {
      // Advance the unprintable counter.
      count = count + 1;
    }
  }
  // Return the final count.
  return count;
}

// Registers every on-device logic test case of the device information helpers.
export default function deviceUtilsTest() {
  // Group the cases under the "DeviceUtilsSuite" describe block.
  describe('DeviceUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DeviceUtilsSuite, begin');
      // Announce the one line summary so the suite log identifies the running device.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DeviceUtilsSuite, summary=' + DeviceUtils.summaryText());
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0100
     * @tc.name      testDeviceMarketName0001
     * @tc.desc      Verify marketName returns a non empty string type value that matches the live system report.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDeviceMarketName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceMarketName0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the marketing name through the helper under test.
      const marketName: string = DeviceUtils.marketName();
      // Log the resolved marketing name.
      logCase(TAG, 'marketName=' + marketName);
      // The helper is typed as string so the runtime value must be a string.
      expect(typeof marketName).assertEqual('string');
      // The value must not be undefined according to the typed signature.
      expect(marketName === undefined).assertFalse();

      // Compare the helper output against a second immediate read of the same field.
      const secondRead: string = DeviceUtils.marketName();
      // Two consecutive reads must be stable inside one process.
      expect(secondRead).assertEqual(marketName);
      // A device marketing name is never an empty literal in production builds.
      expect(marketName === EMPTY_TEXT).assertFalse();

      // Length is a cheap structural invariant that catches truncated metadata.
      expect(marketName.length).assertLarger(0);
      // The helper must be a faithful pass through of the system field, not a re-composed value.
      expect(marketName).assertEqual(deviceInfo.marketName);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0200
     * @tc.name      testDeviceProductModel0001
     * @tc.desc      Verify productModel returns a stable string type value that differs from the market name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceProductModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceProductModel0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Read the technical product model reported by the system.
      const productModel: string = DeviceUtils.productModel();
      // Log the resolved product model.
      logCase(TAG, 'productModel length=' + productModel.length.toString());
      // The helper is typed as string so the runtime value must be a string.
      expect(typeof productModel).assertEqual('string');
      // The technical model must be present on a real device.
      expect(productModel.length).assertLarger(0);
      // The technical model is reported verbatim by the system.
      expect(productModel).assertEqual(deviceInfo.productModel);
      // A second read must resolve the same identifier.
      expect(DeviceUtils.productModel()).assertEqual(productModel);
      // The marketing name and the technical model are two different fields.
      expect(productModel === DeviceUtils.marketName()).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0300
     * @tc.name      testDeviceType0001
     * @tc.desc      Verify deviceType returns a non empty identifier that never contains whitespace characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceType0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the device form factor reported by the system.
      const deviceType: string = DeviceUtils.deviceType();
      // Log the resolved device type.
      logCase(TAG, 'deviceType=' + deviceType);
      // The helper is typed as string so the runtime value must be a string.
      expect(typeof deviceType).assertEqual('string');
      // The form factor identifier is never empty.
      expect(deviceType.length).assertLarger(0);
      // The identifier is a plain token, so it never carries a space.
      expect(deviceType.indexOf(DEVICE_TYPE_FORBIDDEN)).assertEqual(-1);
      // The helper passes the system field through unchanged.
      expect(deviceType).assertEqual(deviceInfo.deviceType);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0400
     * @tc.name      testDeviceOsFullName0001
     * @tc.desc      Verify osFullName returns the system display name of the running OS build.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceOsFullName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceOsFullName0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the human readable OS name through the helper.
      const osFullName: string = DeviceUtils.osFullName();
      // Log the resolved OS full name.
      logCase(TAG, 'osFullName=' + osFullName);
      // The helper is typed as string so the runtime value must be a string.
      expect(typeof osFullName).assertEqual('string');
      // The OS name is always populated on a booted system.
      expect(osFullName.length).assertLarger(0);
      // The helper must not alter the value reported by the system.
      expect(osFullName).assertEqual(deviceInfo.osFullName);
      // A repeated read resolves the same build name.
      expect(DeviceUtils.osFullName()).assertEqual(osFullName);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0500
     * @tc.name      testDeviceSdkApiVersion0001
     * @tc.desc      Verify sdkApiVersion returns a whole number inside the plausible API range of the sample.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDeviceSdkApiVersion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSdkApiVersion0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the numeric API level through the helper.
      const apiVersion: number = DeviceUtils.sdkApiVersion();
      // Log the resolved API level.
      logCase(TAG, 'sdkApiVersion=' + apiVersion.toString());
      // The helper is typed as number so the runtime value must be a number.
      expect(typeof apiVersion).assertEqual('number');
      // The API level is a whole number, never a fraction.
      expect(apiVersion % 1).assertEqual(0);
      // The API level never drops below the documented baseline.
      expect(apiVersion).assertLargerOrEqual(API_MIN_PLAUSIBLE);
      // The API level never exceeds the accepted upper bound of the matrix.
      expect(apiVersion).assertLessOrEqual(API_MAX_PLAUSIBLE);
      // The helper mirrors the system field exactly.
      expect(apiVersion).assertEqual(deviceInfo.sdkApiVersion);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0600
     * @tc.name      testDeviceIsApiAtLeast0001
     * @tc.desc      Verify isApiAtLeast reports true for a one level target because every device is API 1 or later.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDeviceIsApiAtLeast0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceIsApiAtLeast0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ask whether the running system reaches the lowest possible API level.
      const atLeastOne: boolean = DeviceUtils.isApiAtLeast(API_LOWER_BOUND);
      // Log the verdict of the lowest boundary probe.
      logCase(TAG, 'isApiAtLeast(1)=' + boolText(atLeastOne));
      // The helper returns a boolean so callers can branch on it.
      expect(typeof atLeastOne).assertEqual('boolean');
      // Every booted system is at least API level 1.
      expect(atLeastOne).assertTrue();
      // The verdict agrees with the numeric comparison done by the test itself.
      expect(atLeastOne).assertEqual(DeviceUtils.sdkApiVersion() >= API_LOWER_BOUND);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0700
     * @tc.name      testDeviceMajorVersion0001
     * @tc.desc      Verify majorVersion returns a non negative whole number consistent with the API level.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceMajorVersion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceMajorVersion0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the major OS version through the helper.
      const majorVersion: number = DeviceUtils.majorVersion();
      // Log the resolved major version.
      logCase(TAG, 'majorVersion=' + majorVersion.toString());
      // The helper is typed as number so the runtime value must be a number.
      expect(typeof majorVersion).assertEqual('number');
      // A released OS never reports a negative major version.
      expect(majorVersion).assertLargerOrEqual(0);
      // The major version is a whole number, never a fraction.
      expect(majorVersion % 1).assertEqual(0);
      // The helper passes the system field through unchanged.
      expect(majorVersion).assertEqual(deviceInfo.majorVersion);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0800
     * @tc.name      testDeviceIsApiAtLeastFalse0001
     * @tc.desc      Verify isApiAtLeast reports false for an unreachable target so version gates stay conservative.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceIsApiAtLeastFalse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceIsApiAtLeastFalse0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ask whether the running system reaches an API level no release ships yet.
      const atLeastUpper: boolean = DeviceUtils.isApiAtLeast(API_UPPER_BOUND);
      // Log the verdict of the unreachable target probe.
      logCase(TAG, 'isApiAtLeast(' + API_UPPER_BOUND.toString() + ')=' + boolText(atLeastUpper));
      // An unreachable feature gate must resolve to false.
      expect(atLeastUpper).assertFalse();
      // The verdict agrees with the numeric comparison done by the test itself.
      expect(atLeastUpper).assertEqual(DeviceUtils.sdkApiVersion() >= API_UPPER_BOUND);
      // The helper still returns a boolean for out of range targets.
      expect(typeof atLeastUpper).assertEqual('boolean');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_0900
     * @tc.name      testDeviceSecurityPatch0001
     * @tc.desc      Verify securityPatch returns the patch label string reported by the running system image.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceSecurityPatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSecurityPatch0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the security patch label through the helper.
      const patch: string = DeviceUtils.securityPatch();
      // Log the resolved patch label.
      logCase(TAG, 'securityPatch=' + patch);
      // The helper is typed as string so the runtime value must be a string.
      expect(typeof patch).assertEqual('string');
      // The helper passes the system field through unchanged.
      expect(patch).assertEqual(deviceInfo.securityPatchTag);
      // A repeated read resolves the same patch label.
      expect(DeviceUtils.securityPatch()).assertEqual(patch);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1000
     * @tc.name      testDeviceSerial0001
     * @tc.desc      Verify serial returns a string without throwing even when the platform restricts the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceSerial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSerial0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track whether the helper threw so the case can report the failure mode.
      let failed: boolean = false;
      // The serial text resolved by the helper; empty when the platform restricts the read.
      let serialText: string = EMPTY_TEXT;
      try {
        // Read the serial identifier through the helper.
        serialText = DeviceUtils.serial();
      } catch (error) {
        // Some builds raise instead of returning an empty slot; that must still be observable.
        failed = true;
        // Record the raise in the log channel.
        logCase(TAG, 'serial read raised an exception');
      }
      // Either the read succeeded with a string or it raised; both are tolerated but must be reported.
      expect(!failed || (failed && serialText === EMPTY_TEXT)).assertTrue();
      // When the read succeeded the helper must hand back a string, never a number or undefined.
      if (!failed) {
        // The typed signature promises a string.
        expect(typeof serialText).assertEqual('string');
        // A readable serial mirrors the system field exactly.
        expect(serialText).assertEqual(deviceInfo.serial);
      }
      // Log the resolved serial length so restricted builds stay visible without leaking the value.
      logCase(TAG, 'serial length=' + serialText.length.toString() + ', raised=' + boolText(failed));
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1100
     * @tc.name      testDeviceDisplayVersion0001
     * @tc.desc      Verify displayVersion returns the build version string used in the about-device page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceDisplayVersion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceDisplayVersion0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the display build version through the helper.
      const displayVersion: string = DeviceUtils.displayVersion();
      // Log the resolved display version.
      logCase(TAG, 'displayVersion=' + displayVersion);
      // The helper is typed as string so the runtime value must be a string.
      expect(typeof displayVersion).assertEqual('string');
      // The helper passes the system field through unchanged.
      expect(displayVersion).assertEqual(deviceInfo.displayVersion);
      // A repeated read resolves the same build version.
      expect(DeviceUtils.displayVersion()).assertEqual(displayVersion);
      // The value contains no unprintable control characters that would break log lines.
      expect(countUnprintable(displayVersion)).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1200
     * @tc.name      testDeviceSummaryText0001
     * @tc.desc      Verify summaryText composes the model, form factor, OS name and API level in one line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceSummaryText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSummaryText0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Compose the one line device summary through the helper.
      const summary: string = DeviceUtils.summaryText();
      // Log the composed summary.
      logCase(TAG, 'summary=' + summary);
      // The summary is a printable string the support log can carry directly.
      expect(typeof summary).assertEqual('string');
      // The summary starts with the marketing name of the device.
      expect(summary.indexOf(DeviceUtils.marketName())).assertEqual(0);
      // The form factor is wrapped in parentheses right after the model name.
      expect(summary.indexOf(SUMMARY_MODEL_SEPARATOR)).assertLarger(-1);
      // The OS name follows the closing parenthesis and a comma.
      expect(summary.indexOf(SUMMARY_OS_SEPARATOR)).assertLarger(-1);
      // The numeric API level is the final segment of the summary.
      expect(summary.indexOf(SUMMARY_API_PREFIX)).assertLarger(-1);
      // The summary ends with the decimal rendering of the API level.
      expect(summary.substring(summary.length - DeviceUtils.sdkApiVersion().toString().length))
        .assertEqual(DeviceUtils.sdkApiVersion().toString());
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1300
     * @tc.name      testDeviceSummaryMatchesParts0001
     * @tc.desc      Verify summaryText equals the concatenation of the four individual helper outputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceSummaryMatchesParts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSummaryMatchesParts0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Rebuild the expected summary from the individual helpers.
      const expected: string = DeviceUtils.marketName() + SUMMARY_MODEL_SEPARATOR + DeviceUtils.deviceType() +
        SUMMARY_OS_SEPARATOR + DeviceUtils.osFullName() + SUMMARY_API_PREFIX +
        DeviceUtils.sdkApiVersion().toString();
      // Compose the summary through the helper under test.
      const summary: string = DeviceUtils.summaryText();
      // Log both compositions so a mismatch is easy to diff from the log.
      logCase(TAG, 'expected=' + expected);
      // The helper composition must match the rebuilt composition character for character.
      expect(summary).assertEqual(expected);
      // Every part must appear inside the summary exactly once, starting with the model name.
      expect(summary.indexOf(DeviceUtils.deviceType())).assertLarger(-1);
      // The OS name segment must also be present in the summary.
      expect(summary.indexOf(DeviceUtils.osFullName())).assertLarger(-1);
      // A repeated composition resolves the same line.
      expect(DeviceUtils.summaryText()).assertEqual(summary);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1400
     * @tc.name      testDeviceSummaryRepeat0001
     * @tc.desc      Verify summaryText stays byte identical across repeated compositions inside one process.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceSummaryRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSummaryRepeat0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the reference composition used for every later comparison.
      const reference: string = DeviceUtils.summaryText();
      // Count the compositions that matched the reference.
      let matched: number = 0;
      // Repeat the composition several times to catch unstable field ordering.
      for (let i: number = 0; i < SUMMARY_REPEAT; i++) {
        // Compose the summary once more.
        const current: string = DeviceUtils.summaryText();
        // Compare against the reference composition.
        if (current === reference) {
          // Count the matching composition.
          matched = matched + 1;
        }
      }
      // Log how many compositions agreed with the reference.
      logCase(TAG, 'matched=' + matched.toString() + '/' + SUMMARY_REPEAT.toString());
      // Every composition must agree with the reference.
      expect(matched).assertEqual(SUMMARY_REPEAT);
      // The reference itself must be non empty.
      expect(reference.length).assertLarger(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1500
     * @tc.name      testDeviceFieldStability0001
     * @tc.desc      Verify the five string fields stay stable across five consecutive reads in one process.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceFieldStability0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceFieldStability0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the reference values of the five string fields.
      const referenceModel: string = DeviceUtils.productModel();
      // Capture the reference form factor.
      const referenceType: string = DeviceUtils.deviceType();
      // Capture the reference OS name.
      const referenceOs: string = DeviceUtils.osFullName();
      // Capture the reference patch label.
      const referencePatch: string = DeviceUtils.securityPatch();
      // Capture the reference display version.
      const referenceDisplay: string = DeviceUtils.displayVersion();
      // Count the rounds in which all five fields matched their reference.
      let stableRounds: number = 0;
      // Re-read the fields several times to prove they are process stable.
      for (let round: number = 0; round < STABILITY_ROUNDS; round++) {
        // Track whether this round agreed on every field.
        const same: boolean = DeviceUtils.productModel() === referenceModel &&
          DeviceUtils.deviceType() === referenceType && DeviceUtils.osFullName() === referenceOs &&
          DeviceUtils.securityPatch() === referencePatch && DeviceUtils.displayVersion() === referenceDisplay;
        // Count the fully stable round.
        if (same) {
          // Advance the stable round counter.
          stableRounds = stableRounds + 1;
        }
      }
      // Log how many rounds stayed stable.
      logCase(TAG, 'stableRounds=' + stableRounds.toString() + '/' + STABILITY_ROUNDS.toString());
      // Every round must agree on every field.
      expect(stableRounds).assertEqual(STABILITY_ROUNDS);
      // A stable model name is never empty.
      expect(referenceModel.length).assertLarger(0);
      // A stable OS name is never empty.
      expect(referenceOs.length).assertLarger(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1600
     * @tc.name      testDeviceApiBoundMatrix0001
     * @tc.desc      Verify isApiAtLeast agrees with the numeric comparison for every target of the boundary matrix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceApiBoundMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceApiBoundMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the live API level once so every matrix row compares against the same value.
      const apiVersion: number = DeviceUtils.sdkApiVersion();
      // Count the matrix rows whose verdict agreed with the reference comparison.
      let agreeing: number = 0;
      // Walk the ordered matrix of targets.
      for (let i: number = 0; i < API_TARGETS.length; i++) {
        // Resolve the helper verdict for the current target.
        const verdict: boolean = DeviceUtils.isApiAtLeast(API_TARGETS[i]);
        // Compute the expected verdict from the live API level.
        const expected: boolean = apiVersion >= API_TARGETS[i];
        // Log the row so a mismatch can be traced without a debugger.
        logCase(TAG, 'target=' + API_TARGETS[i].toString() + ', verdict=' + boolText(verdict) +
          ', expected=' + boolText(expected));
        // The helper must agree with the reference comparison on this row.
        expect(verdict).assertEqual(expected);
        // Count the agreeing row.
        if (verdict === expected) {
          // Advance the agreement counter.
          agreeing = agreeing + 1;
        }
      }
      // Every row of the matrix must agree.
      expect(agreeing).assertEqual(API_TARGETS.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1700
     * @tc.name      testDeviceApiMonotonic0001
     * @tc.desc      Verify the isApiAtLeast verdict is monotonic: a true row is never followed by a false row.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceApiMonotonic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceApiMonotonic0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seed the previous verdict from the lowest target of the ordered matrix.
      let previous: boolean = DeviceUtils.isApiAtLeast(API_TARGETS[0]);
      // Count the monotonic transitions observed while walking the matrix.
      let transitions: number = 0;
      // Walk the remainder of the ordered matrix.
      for (let i: number = 1; i < API_TARGETS.length; i++) {
        // Resolve the verdict for the current, higher target.
        const current: boolean = DeviceUtils.isApiAtLeast(API_TARGETS[i]);
        // Log the transition between the two neighbouring targets.
        logCase(TAG, 'target=' + API_TARGETS[i].toString() + ', previous=' + boolText(previous) +
          ', current=' + boolText(current));
        // Once a target fails, no higher target may pass.
        expect(previous === false && current === true).assertFalse();
        // Track the transition for the counter assertion below.
        transitions = transitions + 1;
        // Carry the current verdict into the next iteration.
        previous = current;
      }
      // One transition is observed per matrix step.
      expect(transitions).assertEqual(API_TARGETS.length - 1);
      // The lowest target of the matrix always passes on a booted system.
      expect(DeviceUtils.isApiAtLeast(API_TARGETS[0])).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1800
     * @tc.name      testDeviceApiEqualBoundary0001
     * @tc.desc      Verify isApiAtLeast treats the live API level itself as reached, proving the >= comparison.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDeviceApiEqualBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceApiEqualBoundary0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the live API level so the boundary probes are relative to it.
      const apiVersion: number = DeviceUtils.sdkApiVersion();
      // The live level must count as reached, which only holds for a greater-than-or-equal comparison.
      const equalVerdict: boolean = DeviceUtils.isApiAtLeast(apiVersion);
      // Log the verdict of the equality probe.
      logCase(TAG, 'isApiAtLeast(' + apiVersion.toString() + ')=' + boolText(equalVerdict));
      // Equality counts as reached.
      expect(equalVerdict).assertTrue();
      // One level above the live value must not count as reached.
      const aboveVerdict: boolean = DeviceUtils.isApiAtLeast(apiVersion + 1);
      // Log the verdict of the level-above probe.
      logCase(TAG, 'isApiAtLeast(' + (apiVersion + 1).toString() + ')=' + boolText(aboveVerdict));
      // One level above is beyond the running system.
      expect(aboveVerdict).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_1900
     * @tc.name      testDeviceTypeAllowList0001
     * @tc.desc      Verify deviceType resolves to one of the documented form factor identifiers of the sample.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceTypeAllowList0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceTypeAllowList0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the live form factor identifier.
      const deviceType: string = DeviceUtils.deviceType();
      // Track whether the live identifier appears in the documented allow list.
      let known: boolean = false;
      // Walk the documented allow list.
      for (let i: number = 0; i < KNOWN_DEVICE_TYPES.length; i++) {
        // Mark the identifier when it matches the current allow list entry.
        if (KNOWN_DEVICE_TYPES[i] === deviceType) {
          // The identifier is a documented form factor.
          known = true;
        }
      }
      // Log the live identifier and the allow list verdict.
      logCase(TAG, 'deviceType=' + deviceType + ', known=' + boolText(known));
      // The live identifier belongs to the documented allow list.
      expect(known).assertTrue();
      // The allow list is not accidentally empty.
      expect(KNOWN_DEVICE_TYPES.length).assertLarger(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2000
     * @tc.name      testDevicePrintableFields0001
     * @tc.desc      Verify the text device fields contain no unprintable characters so they can be logged verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDevicePrintableFields0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDevicePrintableFields0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect the four text fields that are printed verbatim into support logs.
      const fields: string[] = [DeviceUtils.marketName(), DeviceUtils.productModel(), DeviceUtils.osFullName(),
        DeviceUtils.deviceType()];
      // Count the fields that are entirely printable.
      let cleanFields: number = 0;
      // Walk the collected fields.
      for (let i: number = 0; i < fields.length; i++) {
        // Count the characters outside the printable ranges.
        const unprintable: number = countUnprintable(fields[i]);
        // Log the field index, its length and the unprintable count.
        logCase(TAG, 'field ' + i.toString() + ' length=' + fields[i].length.toString() +
          ', unprintable=' + unprintable.toString());
        // A printable field carries no control characters at all.
        expect(unprintable).assertEqual(0);
        // Count the clean field.
        if (unprintable === 0) {
          // Advance the clean field counter.
          cleanFields = cleanFields + 1;
        }
      }
      // Every collected field must be printable.
      expect(cleanFields).assertEqual(fields.length);
      // Log the documented printable ranges for traceability.
      logCase(TAG, 'printable ranges=' + PRINTABLE_CODE_RANGES.join(','));
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2100
     * @tc.name      testDeviceReportLine0001
     * @tc.desc      Verify a device report line composed by the test carries the summary plus every version field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceReportLine0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceReportLine0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Compose a report line the way the sample support tooling would.
      const report: string = DeviceUtils.summaryText() + REPORT_SEPARATOR +
        'display=' + DeviceUtils.displayVersion() + REPORT_SEPARATOR +
        'patch=' + DeviceUtils.securityPatch() + REPORT_SEPARATOR +
        'major=' + DeviceUtils.majorVersion().toString();
      // Log the composed report line.
      logCase(TAG, 'report=' + report);
      // The report line keeps the summary segment intact.
      expect(report.indexOf(DeviceUtils.summaryText())).assertEqual(0);
      // The display version segment is present.
      expect(report.indexOf('display=' + DeviceUtils.displayVersion())).assertLarger(-1);
      // The patch label segment is present.
      expect(report.indexOf('patch=' + DeviceUtils.securityPatch())).assertLarger(-1);
      // The major version segment is present.
      expect(report.indexOf('major=' + DeviceUtils.majorVersion().toString())).assertLarger(-1);
      // The report joins four segments with the documented separator.
      expect(report.split(REPORT_SEPARATOR).length).assertEqual(4);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2200
     * @tc.name      testDeviceSummaryWrapper0001
     * @tc.desc      Verify the summary can be wrapped by caller supplied decoration without losing the API level.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceSummaryWrapper0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSummaryWrapper0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Compose the plain summary first.
      const plain: string = DeviceUtils.summaryText();
      // Wrap the summary the way a page header would.
      const wrapped: string = 'device' + WRAPPER_SEPARATOR + plain + WRAPPER_SEPARATOR + 'ready';
      // Log the wrapped line.
      logCase(TAG, 'wrapped=' + wrapped);
      // The wrapper preserves the plain summary as an inner segment.
      expect(wrapped.indexOf(plain)).assertLarger(-1);
      // The wrapper contributes exactly two extra segments around the summary.
      expect(wrapped.split(WRAPPER_SEPARATOR).length).assertEqual(3);
      // The wrapped line still ends with the API level before the trailing marker.
      expect(wrapped.substring(wrapped.length - 'ready'.length)).assertEqual('ready');
      // Stripping the prefix and suffix restores the plain summary exactly.
      const stripped: string = wrapped.substring(('device' + WRAPPER_SEPARATOR).length,
        wrapped.length - (WRAPPER_SEPARATOR + 'ready').length);
      // The stripped segment equals the plain summary.
      expect(stripped).assertEqual(plain);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2300
     * @tc.name      testDeviceApiBoundParity0001
     * @tc.desc      Verify the two documented always-true targets both report true on the running system.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDeviceApiBoundParity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceApiBoundParity0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Count the always-true targets that resolved to true.
      let trueCount: number = 0;
      // Walk the always-true target table.
      for (let i: number = 0; i < API_BOUND_TARGETS.length; i++) {
        // Resolve the verdict for the current always-true target.
        const verdict: boolean = DeviceUtils.isApiAtLeast(API_BOUND_TARGETS[i]);
        // Log the verdict of the current target.
        logCase(TAG, 'target=' + API_BOUND_TARGETS[i].toString() + ', verdict=' + boolText(verdict));
        // Every documented always-true target must report true.
        expect(verdict).assertTrue();
        // Count the true verdict.
        trueCount = trueCount + 1;
      }
      // Every target of the table must have reported true.
      expect(trueCount).assertEqual(API_BOUND_TARGETS.length);
      // The API bound matrix itself is never empty.
      expect(API_ALWAYS_TRUE_TARGETS.length).assertLarger(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2400
     * @tc.name      testDeviceApiMatrixRepeat0001
     * @tc.desc      Verify the boundary matrix resolves identically across repeated passes in one process.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceApiMatrixRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceApiMatrixRepeat0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the reference verdict table of the first pass.
      const reference: boolean[] = [];
      // Fill the reference table by walking the matrix once.
      for (let i: number = 0; i < API_TARGETS.length; i++) {
        // Record the verdict of the current target.
        reference.push(DeviceUtils.isApiAtLeast(API_TARGETS[i]));
      }
      // Count the passes that reproduced the reference table.
      let matchingPasses: number = 0;
      // Re-run the whole matrix several times.
      for (let pass: number = 0; pass < API_MATRIX_ROUNDS; pass++) {
        // Track whether this pass matched the reference on every row.
        let same: boolean = true;
        // Walk the matrix again for this pass.
        for (let i: number = 0; i < API_TARGETS.length; i++) {
          // Compare the current verdict against the reference row.
          if (DeviceUtils.isApiAtLeast(API_TARGETS[i]) !== reference[i]) {
            // Record the divergence for the final assertion.
            same = false;
          }
        }
        // Log the pass verdict.
        logCase(TAG, 'pass ' + pass.toString() + ' matching=' + boolText(same));
        // Count the matching pass.
        if (same) {
          // Advance the matching pass counter.
          matchingPasses = matchingPasses + 1;
        }
      }
      // Every repeated pass must reproduce the reference table.
      expect(matchingPasses).assertEqual(API_MATRIX_ROUNDS);
      // The reference table holds one verdict per matrix target.
      expect(reference.length).assertEqual(API_TARGETS.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2500
     * @tc.name      testDeviceIdentityPair0001
     * @tc.desc      Verify the model name and OS name pair is unique enough to identify one device build.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceIdentityPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceIdentityPair0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Compose the identity pair from the model name and the OS name.
      const pair: string = DeviceUtils.productModel() + '/' + DeviceUtils.osFullName();
      // Log the identity pair.
      logCase(TAG, 'pair=' + pair);
      // Both halves of the pair are present, separated by exactly one slash.
      expect(pair.split('/').length).assertEqual(2);
      // The first half is the technical model name.
      expect(pair.split('/')[0]).assertEqual(DeviceUtils.productModel());
      // The second half is the OS full name.
      expect(pair.split('/')[1]).assertEqual(DeviceUtils.osFullName());
      // A stable identity pair is never empty.
      expect(pair.length).assertLarger(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2600
     * @tc.name      testDeviceSummaryLengthBound0001
     * @tc.desc      Verify the summary stays inside a sane length bound so it fits a single support log line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceSummaryLengthBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceSummaryLengthBound0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Compose the summary whose length is verified here.
      const summary: string = DeviceUtils.summaryText();
      // Compute the shortest possible summary for this device.
      const minimumLength: number = DeviceUtils.marketName().length + SUMMARY_MODEL_SEPARATOR.length +
        DeviceUtils.deviceType().length + SUMMARY_OS_SEPARATOR.length + DeviceUtils.osFullName().length +
        SUMMARY_API_PREFIX.length + DeviceUtils.sdkApiVersion().toString().length;
      // Log the measured and the minimum length.
      logCase(TAG, 'length=' + summary.length.toString() + ', minimum=' + minimumLength.toString());
      // The summary is never shorter than its mandatory segments.
      expect(summary.length).assertLargerOrEqual(minimumLength);
      // The summary fits comfortably into one hilog line.
      expect(summary.length).assertLess(1024);
      // The summary carries one separator per joined segment.
      expect(summary.split(SUMMARY_MODEL_SEPARATOR).length).assertEqual(2);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DEV_2700
     * @tc.name      testDeviceApiVersionDiff0001
     * @tc.desc      Verify isApiAtLeast accepts fractional targets and compares them numerically without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testDeviceApiVersionDiff0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDeviceApiVersionDiff0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Read the live API level so the fractional probes are relative to it.
      const apiVersion: number = DeviceUtils.sdkApiVersion();
      // A fractional target below the live level must still count as reached.
      const belowVerdict: boolean = DeviceUtils.isApiAtLeast(apiVersion - 0.5);
      // A fractional target above the live level must not count as reached.
      const aboveVerdict: boolean = DeviceUtils.isApiAtLeast(apiVersion + 0.5);
      // Log both fractional verdicts.
      logCase(TAG, 'below=' + boolText(belowVerdict) + ', above=' + boolText(aboveVerdict));
      // A target strictly below the live level is reached.
      expect(belowVerdict).assertTrue();
      // A target strictly above the live level is not reached.
      expect(aboveVerdict).assertFalse();
      // The two fractional verdicts must differ.
      expect(belowVerdict === aboveVerdict).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
