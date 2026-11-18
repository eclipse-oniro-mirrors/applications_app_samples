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

// Import hilog so the pure logic cases leave traceable progress lines on device.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the font and resource domain models under test from the library HAR.
import { createDefaultFontAsset, createFailureSummary, FontAsset, FontOperation,
  ResourceEntry, ResourceSummary, RoundTripResult } from 'library';

// The suite-level hilog tag, shared by every case of this logic suite.
const SUITE_TAG: string = '[Sample_FontResource_Logic]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_Model_';
// The bundle name reused by the synthetic resource and summary fixtures.
const SAMPLE_BUNDLE: string = 'com.samples.fontandresource';
// The module name reused by the synthetic resource fixture.
const SAMPLE_MODULE: string = 'entry';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Builds the plain resource object handed to the entry constructor.
function buildResource(): Resource {
  // Construct a minimal but well-formed resource reference.
  const resource: Resource = {
    id: 1001,
    bundleName: SAMPLE_BUNDLE,
    moduleName: SAMPLE_MODULE
  };
  // Return the constructed resource.
  return resource;
}

// Registers every on-device logic test case of the font and resource models.
export default function modelTypesTest() {
  // Group the cases under the "ModelTypesSuite" describe block.
  describe('ModelTypesSuite', () => {
    // Log the suite start line once before all cases run.
    beforeAll(() => {
      // Print the suite begin marker into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ModelTypesSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_MODEL_0100
     * @tc.name      testFontAssetDefault0001
     * @tc.desc      Verify createDefaultFontAsset returns the exact Droid Serif fixture with an empty sandbox path and the not prepared flag.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFontAssetDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFontAssetDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Ask the factory for the default font asset.
      const asset: FontAsset = createDefaultFontAsset();
      // Log the produced family name.
      logCase(TAG, 'familyName: ' + asset.familyName);
      // Expect the factory to pick the Droid Serif display family.
      expect(asset.familyName).assertEqual('Droid Serif');
      // Expect the factory to point at the bundled regular weight file.
      expect(asset.rawFileName).assertEqual('fonts/DroidSerif-Regular.ttf');
      // Expect the factory to start with an empty sandbox path before preparation.
      expect(asset.sandboxPath).assertEqual('');
      // Expect the factory to mark the asset as not prepared yet.
      expect(asset.ready).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_MODEL_0200
     * @tc.name      testFontOperation0001
     * @tc.desc      Verify the FontOperation constructor stores all six fields verbatim for one completed install record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFontOperation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFontOperation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Fix the operation start timestamp for an exact field comparison.
      const startedAt: number = 1700000000000;
      // Build one completed install operation record.
      const operation: FontOperation = new FontOperation('Install', 'fonts/DroidSerif-Regular.ttf',
        0, 'install ok', '', startedAt);
      // Log the recorded action name.
      logCase(TAG, 'action: ' + operation.action);
      // Expect the action name to be stored verbatim.
      expect(operation.action).assertEqual('Install');
      // Expect the target path to be stored verbatim.
      expect(operation.target).assertEqual('fonts/DroidSerif-Regular.ttf');
      // Expect the success result code to be stored verbatim.
      expect(operation.code).assertEqual(0);
      // Expect the short outcome message to be stored verbatim.
      expect(operation.message).assertEqual('install ok');
      // Expect the raw platform message to stay empty on success.
      expect(operation.rawMessage).assertEqual('');
      // Expect the start timestamp to be stored verbatim.
      expect(operation.timestamp).assertEqual(startedAt);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_MODEL_0300
     * @tc.name      testResourceEntry0001
     * @tc.desc      Verify every fresh ResourceEntry starts in the idle status with an empty detail and keeps the supplied key and category.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testResourceEntry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testResourceEntry0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Build the resource reference carried by the entry.
      const resource: Resource = buildResource();
      // Build one resource list row with a color fixture.
      const entry: ResourceEntry = new ResourceEntry('entry_color_brand', 'Brand color', 'color', resource);
      // Log the produced status.
      logCase(TAG, 'status: ' + entry.status);
      // Expect every fresh row to start in the idle status.
      expect(entry.status).assertEqual('idle');
      // Expect every fresh row to start with an empty detail line.
      expect(entry.detail).assertEqual('');
      // Expect the stable list key to be preserved on the row.
      expect(entry.key).assertEqual('entry_color_brand');
      // Expect the category bucket to be preserved on the row.
      expect(entry.category).assertEqual('color');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_MODEL_0400
     * @tc.name      testRoundTripResult0001
     * @tc.desc      Verify the RoundTripResult constructor stores the path and success flag verbatim and carries the supplied summary object.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundTripResult0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundTripResult0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Build the conversion summary carried by the round trip outcome.
      const summary: ResourceSummary = {
        bundleName: SAMPLE_BUNDLE,
        moduleName: SAMPLE_MODULE,
        resourceId: 1001,
        type: 10003,
        paramsCount: 0,
        costMs: 12,
        success: true,
        errorMessage: ''
      };
      // Build one successful taskpool round trip outcome.
      const result: RoundTripResult = new RoundTripResult('taskpool', summary, true);
      // Log the recorded concurrency path.
      logCase(TAG, 'path: ' + result.path);
      // Expect the concurrency path to be stored verbatim.
      expect(result.path).assertEqual('taskpool');
      // Expect the outcome to carry the success flag verbatim.
      expect(result.success).assertTrue();
      // Expect the summary field to reference the supplied summary object itself.
      expect(result.summary === summary).assertTrue();
      // Expect the carried summary to keep the measured cost of the fixture.
      expect(result.summary.costMs).assertEqual(12);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_MODEL_0500
     * @tc.name      testFailureSummary0001
     * @tc.desc      Verify createFailureSummary returns a failed summary that passes the error message through and resets every measurement field.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFailureSummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFailureSummary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the case start line.
      // Fix the raw error message the factory must carry through.
      const failureMessage: string = 'convert failed: invalid resource';
      // Ask the factory for a failure shaped summary.
      const summary: ResourceSummary = createFailureSummary(failureMessage);
      // Log the produced success flag.
      logCase(TAG, 'success: ' + summary.success);
      // Expect the factory to mark the summary as failed.
      expect(summary.success).assertFalse();
      // Expect the factory to carry the raw error message through unchanged.
      expect(summary.errorMessage).assertEqual(failureMessage);
      // Expect the factory to reset the resource id on failure.
      expect(summary.resourceId).assertEqual(0);
      // Expect the factory to report no measured cost on failure.
      expect(summary.costMs).assertEqual(0);
      // Expect the factory to leave the owner bundle empty on failure.
      expect(summary.bundleName).assertEqual('');
      // Expect the factory to leave the owner module empty on failure.
      expect(summary.moduleName).assertEqual('');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
