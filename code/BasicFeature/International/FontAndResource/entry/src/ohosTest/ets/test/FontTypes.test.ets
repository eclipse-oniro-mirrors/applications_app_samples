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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the font domain models and the default asset factory under test from the library HAR.
import { CapabilityCheck, createDefaultFontAsset, ErrorExplain, FontAsset, FontOperation } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The family name the default asset factory must report.
const DEFAULT_FAMILY: string = 'Droid Serif';
// The bundled raw file name the default asset factory must report.
const DEFAULT_RAW_FILE: string = 'fonts/DroidSerif-Regular.ttf';
// The file extension shared by every bundled font fixture.
const FONT_EXT: string = '.ttf';
// The fonts directory segment reused by the bundled path fixtures.
const FONT_DIR_SEGMENT: string = 'fonts';
// The sandbox fonts directory used by the prepared asset fixtures.
const SANDBOX_DIR: string = '/data/storage/el2/base/haps/entry/files/fonts';
// The file name of the regular weight font used by the prepared asset fixtures.
const REGULAR_FILE: string = '/DroidSerif-Regular.ttf';
// The file name of the bold weight font used by the prepared asset fixtures.
const BOLD_FILE: string = '/DroidSerif-Bold.ttf';
// The file name of the italic weight font used by the prepared asset fixtures.
const ITALIC_FILE: string = '/DroidSerif-Italic.ttf';
// The file name of the monospace font used by the prepared asset fixtures.
const MONO_FILE: string = '/DroidSansMono-Regular.ttf';
// The display name of the monospace family fixture.
const MONO_FAMILY: string = 'Droid Sans Mono';
// The display name of the bold family fixture.
const BOLD_FAMILY: string = 'Droid Serif Bold';
// The display name of the italic family fixture.
const ITALIC_FAMILY: string = 'Droid Serif Italic';

// The install action name reused by the operation fixtures.
const ACTION_INSTALL: string = 'Install';
// The uninstall action name reused by the operation fixtures.
const ACTION_UNINSTALL: string = 'Uninstall';
// The register preview action name reused by the operation fixtures.
const ACTION_PREVIEW: string = 'Preview';
// The prepare action name reused by the operation fixtures.
const ACTION_PREPARE: string = 'Prepare';
// The success result code reported by the font manager on the happy path.
const CODE_SUCCESS: number = 0;
// The permission denied code reported when the update-font permission is missing.
const CODE_PERMISSION: number = 201;
// The internal parameter check code reported for malformed arguments.
const CODE_INTERNAL: number = 202;
// The native font service failure code reported by the font manager.
const CODE_NATIVE: number = 31100110;
// The font not found code reported when the source file is missing.
const CODE_NOT_FOUND: number = 31100101;
// The font already installed code reported on the idempotent install path.
const CODE_ALREADY: number = 31100104;

// The severity bucket name expected for hard errors.
const SEVERITY_ERROR: string = 'error';
// The severity bucket name expected for warnings.
const SEVERITY_WARNING: string = 'warning';
// The severity bucket name expected for informational entries.
const SEVERITY_INFO: string = 'info';
// The localized plain string title reused by the explanation fixtures.
const PLAIN_TITLE: string = 'Font error';
// The localized plain string reason reused by the explanation fixtures.
const PLAIN_REASON: string = 'The font operation could not be completed.';
// The localized plain string suggestion reused by the explanation fixtures.
const PLAIN_SUGGESTION: string = 'Declare the permission and retry the operation.';
// The short outcome message stored on the operation fixtures.
const SHORT_OK: string = 'install ok';
// The raw platform message stored on the failed operation fixtures.
const RAW_PLATFORM_MESSAGE: string = 'permission denied by the font service';

// The fixed start timestamp reused by the operation fixtures.
const FIXED_STAMP: number = 1700000000000;
// The second fixed start timestamp used by the ordering fixtures, one hour after the first.
const FIXED_STAMP_ALT: number = FIXED_STAMP + 3600000;
// The third fixed start timestamp used by the ordering fixtures, ten hours after the first.
const FIXED_STAMP_LATE: number = FIXED_STAMP + 36000000;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Builds one fully prepared font asset pointing at the regular sandbox file.
function buildPreparedAsset(): FontAsset {
  // Compose the absolute sandbox path of the regular weight file.
  const sandboxPath: string = SANDBOX_DIR + REGULAR_FILE;
  // Return the ready asset used by the prepared fixtures.
  return new FontAsset(DEFAULT_FAMILY, DEFAULT_RAW_FILE, sandboxPath, true);
}

// Builds one prepared font asset for the requested family, raw file and sandbox name.
function buildAsset(familyName: string, rawFileName: string, sandboxName: string): FontAsset {
  // Compose the absolute sandbox path from the shared directory and the file name.
  const sandboxPath: string = SANDBOX_DIR + sandboxName;
  // Return the ready asset for the requested fixture.
  return new FontAsset(familyName, rawFileName, sandboxPath, true);
}

// Counts how many fields of the asset differ from the default asset produced by the factory.
function countAssetDiff(asset: FontAsset): number {
  // Build the reference default asset for the field comparison.
  const reference: FontAsset = createDefaultFontAsset();
  // Track the number of differing fields.
  let diff: number = 0;
  // Compare the family name field.
  if (asset.familyName !== reference.familyName) {
    // Register the differing family name.
    diff += 1;
  }
  // Compare the raw file name field.
  if (asset.rawFileName !== reference.rawFileName) {
    // Register the differing raw file name.
    diff += 1;
  }
  // Compare the sandbox path field.
  if (asset.sandboxPath !== reference.sandboxPath) {
    // Register the differing sandbox path.
    diff += 1;
  }
  // Compare the readiness flag.
  if (asset.ready !== reference.ready) {
    // Register the differing readiness flag.
    diff += 1;
  }
  // Return the differing field count.
  return diff;
}

// Returns true when the severity text belongs to the three known buckets.
function isKnownSeverity(severity: string): boolean {
  // Accept the hard error bucket.
  if (severity === SEVERITY_ERROR) {
    // The hard error bucket is known.
    return true;
  }
  // Accept the warning bucket.
  if (severity === SEVERITY_WARNING) {
    // The warning bucket is known.
    return true;
  }
  // Accept the informational bucket.
  return severity === SEVERITY_INFO;
}

// Registers every on-device logic test case of the font domain models.
export default function fontTypesTest() {
  // Group the cases under the "FontTypesSuite" describe block.
  describe('FontTypesSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'FontTypesSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0100
     * @tc.name      testFontAssetDefaultFactory0001
     * @tc.desc      Verify createDefaultFontAsset returns the Droid Serif fixture with the bundled raw file name, an empty sandbox path and the not prepared flag.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFontAssetDefaultFactory0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetDefaultFactory0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Ask the factory for the default asset.
      const asset: FontAsset = createDefaultFontAsset();
      // Log the produced family name.
      logCase(TAG, 'familyName: ' + asset.familyName);
      // Expect the factory to select the Droid Serif display family.
      expect(asset.familyName).assertEqual(DEFAULT_FAMILY);
      // Expect the factory to point at the bundled regular weight file.
      expect(asset.rawFileName).assertEqual(DEFAULT_RAW_FILE);
      // Expect the factory to start with an empty sandbox path.
      expect(asset.sandboxPath).assertEqual('');
      // Expect the factory to mark the asset as not prepared yet.
      expect(asset.ready).assertFalse();
      // Expect the bundled path to keep the fonts directory segment.
      expect(asset.rawFileName.startsWith(FONT_DIR_SEGMENT + '/')).assertTrue();
      // Expect the bundled path to end with the font file extension.
      expect(asset.rawFileName.endsWith(FONT_EXT)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0200
     * @tc.name      testFontAssetDefaultFactory0002
     * @tc.desc      Verify two calls of createDefaultFontAsset return equal but independent asset instances so a caller mutation cannot leak into the factory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontAssetDefaultFactory0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetDefaultFactory0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Ask the factory twice for fresh default assets.
      const first: FontAsset = createDefaultFontAsset();
      const second: FontAsset = createDefaultFontAsset();
      // Log whether both calls produced distinct objects.
      logCase(TAG, 'distinct instances: ' + (first !== second));
      // Expect the factory to hand back a fresh instance on every call.
      expect(first !== second).assertTrue();
      // Expect both instances to agree on the family name.
      expect(first.familyName).assertEqual(second.familyName);
      // Expect both instances to agree on the raw file name.
      expect(first.rawFileName).assertEqual(second.rawFileName);
      // Expect both instances to agree on the readiness flag.
      expect(first.ready).assertEqual(second.ready);

      // Mutate the first instance so the isolation is observable.
      first.familyName = 'Mutated Family';
      // Expect the second instance to keep the factory family name.
      expect(second.familyName).assertEqual(DEFAULT_FAMILY);
      // Expect the mutation to be counted as one field difference.
      expect(countAssetDiff(first)).assertEqual(1);
      // Expect the untouched instance to keep the factory defaults.
      expect(countAssetDiff(second)).assertEqual(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0300
     * @tc.name      testFontAssetConstructor0001
     * @tc.desc      Verify the FontAsset constructor stores all four supplied fields verbatim for a prepared asset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFontAssetConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetConstructor0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compose the expected sandbox path of the regular weight file.
      const expectedPath: string = SANDBOX_DIR + REGULAR_FILE;
      // Build one fully prepared asset through the constructor.
      const asset: FontAsset = new FontAsset(DEFAULT_FAMILY, DEFAULT_RAW_FILE, expectedPath, true);
      // Log the stored sandbox path.
      logCase(TAG, 'sandboxPath: ' + asset.sandboxPath);
      // Expect the constructor to store the family name verbatim.
      expect(asset.familyName).assertEqual(DEFAULT_FAMILY);
      // Expect the constructor to store the raw file name verbatim.
      expect(asset.rawFileName).assertEqual(DEFAULT_RAW_FILE);
      // Expect the constructor to store the sandbox path verbatim.
      expect(asset.sandboxPath).assertEqual(expectedPath);
      // Expect the constructor to store the readiness flag verbatim.
      expect(asset.ready).assertTrue();
      // Expect the prepared path to differ from the factory default in all fields but the family and raw name.
      expect(countAssetDiff(asset)).assertEqual(2);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0400
     * @tc.name      testFontAssetConstructor0002
     * @tc.desc      Verify the FontAsset constructor accepts an empty sandbox path and the not ready flag, which models the pre-copy state of a fresh asset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontAssetConstructor0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetConstructor0002';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build the pre-copy asset of the monospace family.
      const asset: FontAsset = new FontAsset(MONO_FAMILY, FONT_DIR_SEGMENT + MONO_FILE, '', false);
      // Log the stored readiness flag.
      logCase(TAG, 'ready: ' + asset.ready);
      // Expect the empty sandbox path to be preserved verbatim.
      expect(asset.sandboxPath).assertEqual('');
      // Expect the empty sandbox path to report the zero length.
      expect(asset.sandboxPath.length).assertEqual(0);
      // Expect the constructor to keep the not ready flag.
      expect(asset.ready).assertFalse();
      // Expect the custom family name to be preserved.
      expect(asset.familyName).assertEqual(MONO_FAMILY);
      // Expect the custom raw file name to keep the fonts directory segment.
      expect(asset.rawFileName).assertEqual(FONT_DIR_SEGMENT + MONO_FILE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0500
     * @tc.name      testFontAssetPreparedMatrix0001
     * @tc.desc      Verify the prepared asset matrix keeps every weight fixture ready with its own sandbox file name and a shared sandbox directory prefix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontAssetPreparedMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetPreparedMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the weight matrix of the prepared asset fixtures.
      const assets: FontAsset[] = [
        buildPreparedAsset(),
        buildAsset(BOLD_FAMILY, FONT_DIR_SEGMENT + BOLD_FILE, BOLD_FILE),
        buildAsset(ITALIC_FAMILY, FONT_DIR_SEGMENT + ITALIC_FILE, ITALIC_FILE),
        buildAsset(MONO_FAMILY, FONT_DIR_SEGMENT + MONO_FILE, MONO_FILE)
      ];
      // Prepare the sandbox file names that must appear in the matrix order.
      const expectedFiles: string[] = [REGULAR_FILE, BOLD_FILE, ITALIC_FILE, MONO_FILE];
      // Walk the prepared asset matrix.
      for (let i: number = 0; i < assets.length; i++) {
        // Read the current asset of the matrix.
        const asset: FontAsset = assets[i];
        // Log the current matrix row.
        logCase(TAG, 'row[' + i + '] family ' + asset.familyName + ', file ' + expectedFiles[i]);
        // Expect every prepared fixture to be marked ready.
        expect(asset.ready).assertTrue();
        // Expect the sandbox path to start with the shared sandbox directory.
        expect(asset.sandboxPath.startsWith(SANDBOX_DIR)).assertTrue();
        // Expect the sandbox path to end with the row specific file name.
        expect(asset.sandboxPath.endsWith(expectedFiles[i])).assertTrue();
        // Expect the raw file name to end with the font file extension.
        expect(asset.rawFileName.endsWith(FONT_EXT)).assertTrue();
        // Expect the raw file name to differ from the sandbox path.
        expect(asset.rawFileName === asset.sandboxPath).assertFalse();
      }
      // Log the matrix size.
      logCase(TAG, 'matrix size ' + assets.length);
      // Expect the matrix to hold four weight fixtures.
      expect(assets.length).assertEqual(4);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0600
     * @tc.name      testFontAssetReadyFlagMatrix0001
     * @tc.desc      Verify the readiness flag is the only field that separates the pre-copy asset from the prepared asset of the same family.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontAssetReadyFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetReadyFlagMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build the pre-copy asset of the regular weight family.
      const pending: FontAsset = new FontAsset(DEFAULT_FAMILY, DEFAULT_RAW_FILE, '', false);
      // Build the matching prepared asset of the same family.
      const prepared: FontAsset = buildPreparedAsset();
      // Log the readiness pair.
      logCase(TAG, 'pending ready ' + pending.ready + ', prepared ready ' + prepared.ready);
      // Expect the pre-copy asset to report not ready.
      expect(pending.ready).assertFalse();
      // Expect the prepared asset to report ready.
      expect(prepared.ready).assertTrue();
      // Expect the two fixtures to agree on the family name.
      expect(pending.familyName).assertEqual(prepared.familyName);
      // Expect the two fixtures to agree on the raw file name.
      expect(pending.rawFileName).assertEqual(prepared.rawFileName);
      // Expect the pre-copy asset to carry the empty sandbox path.
      expect(pending.sandboxPath).assertEqual('');
      // Expect the prepared asset to carry a non-empty sandbox path.
      expect(prepared.sandboxPath.length > 0).assertTrue();
      // Expect the readiness flag to differ between the two fixtures.
      expect(pending.ready === prepared.ready).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0700
     * @tc.name      testFontAssetPathShape0001
     * @tc.desc      Verify the bundled raw file names of the asset matrix all use the fonts directory prefix and the ttf suffix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontAssetPathShape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetPathShape0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the raw file names of the asset matrix.
      const rawNames: string[] = [DEFAULT_RAW_FILE, FONT_DIR_SEGMENT + BOLD_FILE,
        FONT_DIR_SEGMENT + ITALIC_FILE, FONT_DIR_SEGMENT + MONO_FILE];
      // Walk the raw file name matrix.
      for (let i: number = 0; i < rawNames.length; i++) {
        // Read the current raw file name.
        const rawName: string = rawNames[i];
        // Run the shape checks on the current raw file name.
        const hasDir: boolean = rawName.startsWith(FONT_DIR_SEGMENT + '/');
        const hasExt: boolean = rawName.endsWith(FONT_EXT);
        const hasAbsolutePrefix: boolean = rawName.startsWith('/');
        // Log the shape verdicts of the current row.
        logCase(TAG, 'row[' + i + '] dir ' + hasDir + ', ext ' + hasExt + ', absolute ' + hasAbsolutePrefix);
        // Expect the raw file name to carry the fonts directory prefix.
        expect(hasDir).assertTrue();
        // Expect the raw file name to carry the font file extension.
        expect(hasExt).assertTrue();
        // Expect the raw file name to stay bundle relative without a leading slash.
        expect(hasAbsolutePrefix).assertFalse();
        // Expect the raw file name to hold exactly one directory separator.
        expect(rawName.split('/').length).assertEqual(2);
      }
      // Log the matrix size.
      logCase(TAG, 'raw name matrix size ' + rawNames.length);
      // Expect the raw file name matrix to hold four rows.
      expect(rawNames.length).assertEqual(4);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0800
     * @tc.name      testFontOperationInstall0001
     * @tc.desc      Verify the FontOperation constructor stores all six fields verbatim for one completed install record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFontOperationInstall0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontOperationInstall0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compose the installed sandbox path of the regular weight file.
      const target: string = SANDBOX_DIR + REGULAR_FILE;
      // Build one completed install record.
      const operation: FontOperation = new FontOperation(ACTION_INSTALL, target, CODE_SUCCESS, SHORT_OK, '',
        FIXED_STAMP);
      // Log the recorded action name.
      logCase(TAG, 'action: ' + operation.action);
      // Expect the action name to be stored verbatim.
      expect(operation.action).assertEqual(ACTION_INSTALL);
      // Expect the target path to be stored verbatim.
      expect(operation.target).assertEqual(target);
      // Expect the success result code to be stored verbatim.
      expect(operation.code).assertEqual(CODE_SUCCESS);
      // Expect the short outcome message to be stored verbatim.
      expect(operation.message).assertEqual(SHORT_OK);
      // Expect the raw platform message to stay empty on success.
      expect(operation.rawMessage).assertEqual('');
      // Expect the start timestamp to be stored verbatim.
      expect(operation.timestamp).assertEqual(FIXED_STAMP);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_0900
     * @tc.name      testFontOperationFailure0001
     * @tc.desc      Verify a failed install record keeps the permission code, the short message and the raw platform message together.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontOperationFailure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontOperationFailure0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build one failed install record carrying the permission code.
      const operation: FontOperation = new FontOperation(ACTION_INSTALL, SANDBOX_DIR + REGULAR_FILE, CODE_PERMISSION,
        'permission denied', RAW_PLATFORM_MESSAGE, FIXED_STAMP);
      // Log the recorded failure code.
      logCase(TAG, 'code: ' + operation.code);
      // Expect the failed record to keep the permission denied code.
      expect(operation.code).assertEqual(CODE_PERMISSION);
      // Expect the failed record to differ from the success code.
      expect(operation.code === CODE_SUCCESS).assertFalse();
      // Expect the short message to be stored verbatim.
      expect(operation.message).assertEqual('permission denied');
      // Expect the raw platform message to be stored verbatim.
      expect(operation.rawMessage).assertEqual(RAW_PLATFORM_MESSAGE);
      // Expect the raw platform message to be non-empty on the failure path.
      expect(operation.rawMessage.length > 0).assertTrue();
      // Expect the raw platform message to mention the font service.
      expect(operation.rawMessage.indexOf('font service') >= 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1000
     * @tc.name      testFontOperationUninstall0001
     * @tc.desc      Verify an uninstall record targets the registered family name instead of a sandbox file path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontOperationUninstall0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontOperationUninstall0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build one completed uninstall record keyed by the family name.
      const operation: FontOperation = new FontOperation(ACTION_UNINSTALL, DEFAULT_FAMILY, CODE_SUCCESS,
        'uninstall ok', '', FIXED_STAMP_ALT);
      // Log the recorded target.
      logCase(TAG, 'target: ' + operation.target);
      // Expect the uninstall action name to be stored verbatim.
      expect(operation.action).assertEqual(ACTION_UNINSTALL);
      // Expect the uninstall target to be the family name.
      expect(operation.target).assertEqual(DEFAULT_FAMILY);
      // Expect the uninstall target to avoid the sandbox directory prefix.
      expect(operation.target.startsWith('/')).assertFalse();
      // Expect the uninstall target to avoid the font file extension.
      expect(operation.target.endsWith(FONT_EXT)).assertFalse();
      // Expect the uninstall record to carry the alternate timestamp.
      expect(operation.timestamp).assertEqual(FIXED_STAMP_ALT);
      // Expect the alternate timestamp to be later than the fixed one.
      expect(operation.timestamp > FIXED_STAMP).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1100
     * @tc.name      testFontOperationCodeMatrix0001
     * @tc.desc      Verify the operation history matrix keeps the success code on the happy path rows and the non zero codes on the failure rows.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontOperationCodeMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontOperationCodeMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the operation history matrix with alternating outcome rows.
      const operations: FontOperation[] = [
        new FontOperation(ACTION_PREPARE, DEFAULT_RAW_FILE, CODE_SUCCESS, 'copy ok', '', FIXED_STAMP),
        new FontOperation(ACTION_INSTALL, SANDBOX_DIR + REGULAR_FILE, CODE_PERMISSION, 'permission denied',
          RAW_PLATFORM_MESSAGE, FIXED_STAMP_ALT),
        new FontOperation(ACTION_PREVIEW, DEFAULT_FAMILY, CODE_INTERNAL, 'invalid argument', '', FIXED_STAMP_ALT),
        new FontOperation(ACTION_UNINSTALL, DEFAULT_FAMILY, CODE_NATIVE, 'service failure', '', FIXED_STAMP_LATE),
        new FontOperation(ACTION_INSTALL, SANDBOX_DIR + BOLD_FILE, CODE_ALREADY, 'already installed', '',
          FIXED_STAMP_LATE)
      ];
      // Prepare the expected code per matrix row.
      const expectedCodes: number[] = [CODE_SUCCESS, CODE_PERMISSION, CODE_INTERNAL, CODE_NATIVE, CODE_ALREADY];
      // Walk the operation history matrix.
      for (let i: number = 0; i < operations.length; i++) {
        // Read the current operation record.
        const operation: FontOperation = operations[i];
        // Log the current matrix row.
        logCase(TAG, 'row[' + i + '] ' + operation.action + ' code ' + operation.code);
        // Expect the row code to match the prepared expectation.
        expect(operation.code).assertEqual(expectedCodes[i]);
        // Expect only the first row to carry the success code.
        expect(operation.code === CODE_SUCCESS).assertEqual(i === 0);
        // Expect every failure row to use a positive code.
        if (i > 0) {
          // Expect the non zero failure code to be positive.
          expect(operation.code > 0).assertTrue();
        }
        // Expect the target of the row to be non-empty.
        expect(operation.target.length > 0).assertTrue();
        // Expect the short message of the row to be non-empty.
        expect((operation.message as string).length > 0).assertTrue();
      }
      // Log the matrix size.
      logCase(TAG, 'operation matrix size ' + operations.length);
      // Expect the operation matrix to hold five rows.
      expect(operations.length).assertEqual(5);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1200
     * @tc.name      testFontOperationTimestamp0001
     * @tc.desc      Verify the operation history stays ordered by its epoch millisecond timestamps from the earliest to the latest record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFontOperationTimestamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontOperationTimestamp0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build the chronological history of three records.
      const oldest: FontOperation = new FontOperation(ACTION_PREPARE, DEFAULT_RAW_FILE, CODE_SUCCESS, 'copy ok', '',
        FIXED_STAMP);
      const middle: FontOperation = new FontOperation(ACTION_INSTALL, SANDBOX_DIR + REGULAR_FILE, CODE_SUCCESS,
        'install ok', '', FIXED_STAMP_ALT);
      const latest: FontOperation = new FontOperation(ACTION_UNINSTALL, DEFAULT_FAMILY, CODE_SUCCESS, 'uninstall ok',
        '', FIXED_STAMP_LATE);
      // Log the timestamp triple.
      logCase(TAG, 'timestamps ' + oldest.timestamp + ', ' + middle.timestamp + ', ' + latest.timestamp);
      // Expect the oldest record to carry the smallest timestamp.
      expect(oldest.timestamp < middle.timestamp).assertTrue();
      // Expect the middle record to precede the latest record.
      expect(middle.timestamp < latest.timestamp).assertTrue();
      // Expect the timestamp gap between the first two records to be one hour.
      expect(middle.timestamp - oldest.timestamp).assertEqual(3600000);
      // Expect the timestamp gap between the last two records to be nine hours.
      expect(latest.timestamp - middle.timestamp).assertEqual(32400000);
      // Expect every timestamp to stay inside the epoch millisecond range.
      expect(oldest.timestamp > 0).assertTrue();
      expect(latest.timestamp > 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1300
     * @tc.name      testCapabilityCheckConstructor0001
     * @tc.desc      Verify the CapabilityCheck constructor stores the name, the support flag and the detail text verbatim for a supported row.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCapabilityCheckConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testCapabilityCheckConstructor0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build one supported capability row with plain string texts.
      const check: CapabilityCheck = new CapabilityCheck('Font manager', true, 'Supported on this device');
      // Log the stored support flag.
      logCase(TAG, 'supported: ' + check.supported);
      // Expect the support flag to be stored verbatim.
      expect(check.supported).assertTrue();
      // Expect the stored name to survive as a plain string.
      expect(typeof check.name === 'string').assertTrue();
      // Expect the stored detail to survive as a plain string.
      expect(typeof check.detail === 'string').assertTrue();
      // Expect the plain name text to be kept verbatim.
      expect(check.name as string).assertEqual('Font manager');
      // Expect the plain detail text to be kept verbatim.
      expect(check.detail as string).assertEqual('Supported on this device');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1400
     * @tc.name      testCapabilityCheckMatrix0001
     * @tc.desc      Verify the capability row matrix stores one distinct support flag per row and keeps the detail text non-empty for both outcomes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testCapabilityCheckMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the capability row matrix with one row per probe.
      const checks: CapabilityCheck[] = [
        new CapabilityCheck('Font manager', true, 'System capability is supported'),
        new CapabilityCheck('Update font', false, 'Permission is not declared'),
        new CapabilityCheck('Preview registration', true, 'API level supports registration')
      ];
      // Prepare the expected support flags in the matrix order.
      const expectedFlags: boolean[] = [true, false, true];
      // Prepare the expected row names in the matrix order.
      const expectedNames: string[] = ['Font manager', 'Update font', 'Preview registration'];
      // Walk the capability row matrix.
      for (let i: number = 0; i < checks.length; i++) {
        // Read the current capability row.
        const check: CapabilityCheck = checks[i];
        // Log the current matrix row.
        logCase(TAG, 'row[' + i + '] ' + (check.name as string) + ' supported ' + check.supported);
        // Expect the support flag to match the prepared expectation.
        expect(check.supported).assertEqual(expectedFlags[i]);
        // Expect the row name to match the prepared expectation.
        expect(check.name as string).assertEqual(expectedNames[i]);
        // Expect the detail text to be non-empty.
        expect((check.detail as string).length > 0).assertTrue();
      }
      // Count the supported rows of the matrix.
      let supportedCount: number = 0;
      // Walk the matrix again to count the supported rows.
      for (let i: number = 0; i < checks.length; i++) {
        // Register one more supported row.
        if (checks[i].supported) {
          // Count the supported row.
          supportedCount += 1;
        }
      }
      // Log the supported row count.
      logCase(TAG, 'supported rows ' + supportedCount);
      // Expect exactly two rows of the matrix to be supported.
      expect(supportedCount).assertEqual(2);
      // Expect the unsupported rows to equal the matrix size minus the supported ones.
      expect(checks.length - supportedCount).assertEqual(1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1500
     * @tc.name      testErrorExplainConstructor0001
     * @tc.desc      Verify the ErrorExplain constructor stores the code, the three texts and the severity bucket verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testErrorExplainConstructor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testErrorExplainConstructor0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build one error explanation entry for the permission code.
      const explain: ErrorExplain = new ErrorExplain(CODE_PERMISSION, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION,
        SEVERITY_ERROR);
      // Log the stored code.
      logCase(TAG, 'code: ' + explain.code);
      // Expect the numeric code to be stored verbatim.
      expect(explain.code).assertEqual(CODE_PERMISSION);
      // Expect the title text to be kept verbatim.
      expect(explain.title as string).assertEqual(PLAIN_TITLE);
      // Expect the reason text to be kept verbatim.
      expect(explain.reason as string).assertEqual(PLAIN_REASON);
      // Expect the suggestion text to be kept verbatim.
      expect(explain.suggestion as string).assertEqual(PLAIN_SUGGESTION);
      // Expect the severity bucket to be stored verbatim.
      expect(explain.severity).assertEqual(SEVERITY_ERROR);
      // Expect the severity bucket to belong to the known set.
      expect(isKnownSeverity(explain.severity)).assertTrue();
      // Expect the suggestion text to be non-empty so the UI can always render a fix hint.
      expect((explain.suggestion as string).length > 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1600
     * @tc.name      testErrorExplainSeverityMatrix0001
     * @tc.desc      Verify the error explanation matrix keeps the hard error, warning and informational buckets per prepared row.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainSeverityMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testErrorExplainSeverityMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the error code matrix with one row per severity bucket.
      const explains: ErrorExplain[] = [
        new ErrorExplain(CODE_PERMISSION, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION, SEVERITY_ERROR),
        new ErrorExplain(CODE_NOT_FOUND, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION, SEVERITY_WARNING),
        new ErrorExplain(CODE_ALREADY, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION, SEVERITY_INFO),
        new ErrorExplain(CODE_NATIVE, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION, SEVERITY_ERROR)
      ];
      // Prepare the expected severity bucket per matrix row.
      const expectedSeverities: string[] = [SEVERITY_ERROR, SEVERITY_WARNING, SEVERITY_INFO, SEVERITY_ERROR];
      // Walk the error explanation matrix.
      for (let i: number = 0; i < explains.length; i++) {
        // Read the current explanation row.
        const explain: ErrorExplain = explains[i];
        // Log the current matrix row.
        logCase(TAG, 'row[' + i + '] code ' + explain.code + ' severity ' + explain.severity);
        // Expect the severity bucket to match the prepared expectation.
        expect(explain.severity).assertEqual(expectedSeverities[i]);
        // Expect the severity bucket to belong to the known set.
        expect(isKnownSeverity(explain.severity)).assertTrue();
        // Expect the row to keep a non-empty title.
        expect((explain.title as string).length > 0).assertTrue();
        // Expect the row to keep a non-empty reason.
        expect((explain.reason as string).length > 0).assertTrue();
      }
      // Prepare the severity tally of the matrix.
      let errorCount: number = 0;
      let warningCount: number = 0;
      let infoCount: number = 0;
      // Walk the matrix again to tally the severity buckets.
      for (let i: number = 0; i < explains.length; i++) {
        // Read the severity bucket of the row.
        const severity: string = explains[i].severity;
        // Tally the hard error bucket.
        if (severity === SEVERITY_ERROR) {
          // Count one more hard error row.
          errorCount += 1;
        }
        // Tally the warning bucket.
        if (severity === SEVERITY_WARNING) {
          // Count one more warning row.
          warningCount += 1;
        }
        // Tally the informational bucket.
        if (severity === SEVERITY_INFO) {
          // Count one more informational row.
          infoCount += 1;
        }
      }
      // Log the severity tally.
      logCase(TAG, 'tally error ' + errorCount + ', warning ' + warningCount + ', info ' + infoCount);
      // Expect two hard error rows in the matrix.
      expect(errorCount).assertEqual(2);
      // Expect one warning row in the matrix.
      expect(warningCount).assertEqual(1);
      // Expect one informational row in the matrix.
      expect(infoCount).assertEqual(1);
      // Expect the tally to cover every matrix row.
      expect(errorCount + warningCount + infoCount).assertEqual(explains.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1700
     * @tc.name      testErrorExplainCodeEcho0001
     * @tc.desc      Verify the error explanation matrix echoes the requested numeric code even for negative and zero inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testErrorExplainCodeEcho0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testErrorExplainCodeEcho0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the code echo matrix including the edge values.
      const codes: number[] = [CODE_SUCCESS, CODE_PERMISSION, CODE_NOT_FOUND, CODE_NATIVE, -1];
      // Walk the code echo matrix.
      for (let i: number = 0; i < codes.length; i++) {
        // Build one explanation entry for the current code.
        const explain: ErrorExplain = new ErrorExplain(codes[i], PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION,
          SEVERITY_WARNING);
        // Log the code echo of the current row.
        logCase(TAG, 'row[' + i + '] request ' + codes[i] + ' echo ' + explain.code);
        // Expect the explanation to echo the requested code.
        expect(explain.code).assertEqual(codes[i]);
        // Expect the echoed code to keep the requested sign.
        expect(explain.code >= 0).assertEqual(codes[i] >= 0);
      }
      // Expect the zero code row to echo a zero.
      expect(new ErrorExplain(0, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION, SEVERITY_WARNING).code).assertEqual(0);
      // Expect the negative code row to echo a negative value.
      expect(new ErrorExplain(-1, PLAIN_TITLE, PLAIN_REASON, PLAIN_SUGGESTION, SEVERITY_WARNING).code < 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1800
     * @tc.name      testSeverityBucketGuard0001
     * @tc.desc      Verify the severity guard accepts the three known buckets and rejects empty, upper case and unknown bucket names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSeverityBucketGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testSeverityBucketGuard0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted severity buckets.
      const accepts: string[] = [SEVERITY_ERROR, SEVERITY_WARNING, SEVERITY_INFO];
      // Walk the accepted severity buckets.
      for (let i: number = 0; i < accepts.length; i++) {
        // Check the accepted bucket against the guard.
        const verdict: boolean = isKnownSeverity(accepts[i]);
        // Log the accepted bucket verdict.
        logCase(TAG, 'accept row[' + i + '] ' + accepts[i] + ' -> ' + verdict);
        // Expect the known bucket to be accepted.
        expect(verdict).assertTrue();
      }
      // Prepare the refused severity bucket names.
      const rejects: string[] = ['', 'ERROR', 'Error', 'warning ', 'fatal', 'debug'];
      // Walk the refused severity buckets.
      for (let i: number = 0; i < rejects.length; i++) {
        // Check the refused bucket against the guard.
        const verdict: boolean = isKnownSeverity(rejects[i]);
        // Log the refused bucket verdict.
        logCase(TAG, 'reject row[' + i + '] "' + rejects[i] + '" -> ' + verdict);
        // Expect the unknown bucket to be refused.
        expect(verdict).assertFalse();
      }
      // Expect the guard to accept exactly the three known buckets.
      expect(accepts.length).assertEqual(3);
      // Expect the guard to refuse every prepared unknown bucket.
      expect(rejects.length).assertEqual(6);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_1900
     * @tc.name      testFontAssetSandboxJoin0001
     * @tc.desc      Verify joining the sandbox directory with the font file name produces one separator only and keeps the ttf suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFontAssetSandboxJoin0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetSandboxJoin0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the file names joined onto the shared sandbox directory.
      const fileNames: string[] = [REGULAR_FILE, BOLD_FILE, ITALIC_FILE, MONO_FILE];
      // Walk the joined sandbox path matrix.
      for (let i: number = 0; i < fileNames.length; i++) {
        // Compose the joined sandbox path of the current file name.
        const joined: string = SANDBOX_DIR + fileNames[i];
        // Count the separator occurrences of the joined path.
        const separatorCount: number = joined.split('/').length - 1;
        // Log the joined path and its separator count.
        logCase(TAG, 'row[' + i + '] ' + joined + ' separators ' + separatorCount);
        // Expect the joined path to start with the sandbox directory.
        expect(joined.startsWith(SANDBOX_DIR)).assertTrue();
        // Expect the joined path to end with the current file name.
        expect(joined.endsWith(fileNames[i].substring(1))).assertTrue();
        // Expect the joined path to keep the font file extension.
        expect(joined.endsWith(FONT_EXT)).assertTrue();
        // Expect the joined path to contain no doubled separator.
        expect(joined.indexOf('//') < 0).assertTrue();
        // Expect the separator count to equal the directory depth of the shared prefix.
        expect(separatorCount >= 4).assertTrue();
      }
      // Expect the joined path to be reproducible for the same inputs.
      expect(SANDBOX_DIR + REGULAR_FILE).assertEqual(buildPreparedAsset().sandboxPath);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_2000
     * @tc.name      testFontAssetFieldIsolation0001
     * @tc.desc      Verify mutating the ready flag and the raw file name of one asset never affects a second asset built from the same constants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFontAssetFieldIsolation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontAssetFieldIsolation0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build the asset under mutation.
      const mutated: FontAsset = buildPreparedAsset();
      // Build the untouched control asset from the same constants.
      const control: FontAsset = buildPreparedAsset();
      // Flip the readiness flag of the mutated asset.
      mutated.ready = false;
      // Replace the raw file name of the mutated asset.
      mutated.rawFileName = FONT_DIR_SEGMENT + MONO_FILE;
      // Empty the sandbox path of the mutated asset.
      mutated.sandboxPath = '';
      // Log the field difference count of both assets.
      logCase(TAG, 'mutated diff ' + countAssetDiff(mutated) + ', control diff ' + countAssetDiff(control));
      // Expect the mutated asset to differ from the factory default in the raw file name only.
      expect(countAssetDiff(mutated)).assertEqual(1);
      // Expect the control asset to differ from the factory default in two fields only.
      expect(countAssetDiff(control)).assertEqual(2);
      // Expect the control ready flag to stay untouched.
      expect(control.ready).assertTrue();
      // Expect the control raw file name to stay untouched.
      expect(control.rawFileName).assertEqual(DEFAULT_RAW_FILE);
      // Expect the control sandbox path to stay untouched.
      expect(control.sandboxPath).assertEqual(SANDBOX_DIR + REGULAR_FILE);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_2100
     * @tc.name      testFontOperationTimestampText0001
     * @tc.desc      Verify the operation timestamps convert into ISO-8601 date texts whose day and hour fields match the fixed fixture values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFontOperationTimestampText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontOperationTimestampText0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build one install record carrying the fixed timestamp.
      const operation: FontOperation = new FontOperation(ACTION_INSTALL, SANDBOX_DIR + REGULAR_FILE, CODE_SUCCESS,
        SHORT_OK, '', FIXED_STAMP);
      // Convert the stored timestamp into an ISO-8601 text.
      const isoText: string = new Date(operation.timestamp).toISOString();
      // Log the produced ISO text.
      logCase(TAG, 'iso text: ' + isoText);
      // Expect the ISO text to start with a four digit year.
      expect(isoText.length >= 20).assertTrue();
      // Expect the ISO text to separate the date and the time with the T marker.
      expect(isoText.indexOf('T')).assertEqual(10);
      // Expect the ISO text to end with the UTC zone marker.
      expect(isoText.endsWith('Z')).assertTrue();
      // Expect the stored timestamp to round trip through the Date constructor.
      expect(new Date(operation.timestamp).getTime()).assertEqual(FIXED_STAMP);
      // Expect the timestamp to be smaller than the next fixture timestamp.
      expect(operation.timestamp < FIXED_STAMP_ALT).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MODEL_FONT_2200
     * @tc.name      testFontModelCrossCheck0001
     * @tc.desc      Verify the asset, the operation and the explanation models agree on the same family name and sandbox path when they describe one install.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFontModelCrossCheck0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFontModelCrossCheck0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build the prepared asset that feeds the install flow.
      const asset: FontAsset = buildPreparedAsset();
      // Build the install record produced by the flow.
      const operation: FontOperation = new FontOperation(ACTION_INSTALL, asset.sandboxPath, CODE_SUCCESS, SHORT_OK, '',
        FIXED_STAMP);
      // Build the explanation attached to the success code.
      const explain: ErrorExplain = new ErrorExplain(operation.code, 'Success', 'The font was installed.',
        'Toggle the preview switch to use the font.', SEVERITY_INFO);
      // Log the cross checked family name and path.
      logCase(TAG, 'family ' + asset.familyName + ', path ' + asset.sandboxPath);
      // Expect the install record to target the sandbox path of the asset.
      expect(operation.target).assertEqual(asset.sandboxPath);
      // Expect the install record to carry the success code.
      expect(operation.code).assertEqual(CODE_SUCCESS);
      // Expect the explanation to echo the operation code.
      expect(explain.code).assertEqual(operation.code);
      // Expect the explanation to use the informational bucket.
      expect(explain.severity).assertEqual(SEVERITY_INFO);
      // Expect the asset to be ready before the install record is produced.
      expect(asset.ready).assertTrue();
      // Expect the family name to be non-empty so the preview registration can use it.
      expect(asset.familyName.length > 0).assertTrue();
      // Expect the asset raw file name to be a bundle relative path.
      expect(asset.rawFileName.startsWith('/')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { fontTypesTest };
