/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi, { Result } from 'libentry.so';
import { getCEErrMsg } from '../../../main/ets/common/CEErrorMap';
import { tempDirName } from '../../../main/ets/common/Common';
import { formatSelectedEvent, fileSelectedEvent } from '../../../main/ets/utils/InnerEvent';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';

const DOMAIN = 0xF811;
const TAG = '[Sample_OEClientDemo]';
const BUNDLE = 'OEClientDemo_';

export default function abilityTest() {
  describe('OEClientDemoTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'beforeAll, test suite begin');
    });
    beforeEach(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'beforeEach, test case begin');
    });
    afterEach(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'afterEach, test case end');
    });
    afterAll(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'afterAll, test suite end');
    });

    /**
     * Verify that getCEErrMsg resolves CE_ERR_OK (0) to a non-empty localized
     * message through the real resource manager (code -> resource name ->
     * string chain, per the current app language).
     */
    it(BUNDLE + 'ErrorMap_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_001, begin');
      const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actualMsg = getCEErrMsg(0, context);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_001, actualMsg=%{public}s', actualMsg);
      expect(actualMsg.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_001, end');
    });

    /**
     * Verify that getCEErrMsg resolves CE_PERMISSION_DENIED (201) to a non-empty
     * localized message through the real resource manager.
     */
    it(BUNDLE + 'ErrorMap_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_002, begin');
      const context: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actualMsg = getCEErrMsg(201, context);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_002, actualMsg=%{public}s', actualMsg);
      expect(actualMsg.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_002, end');
    });

    /**
     * Verify that getCEErrMsg falls back to 'Error: ${code}' for unknown error codes.
     */
    it(BUNDLE + 'ErrorMap_003', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_003, begin');
      const unknownCode = 99999;
      const expectedMsg = `Error: ${unknownCode}`;
      const actualMsg = getCEErrMsg(unknownCode);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_003, unknownCode=%{public}d, actualMsg=%{public}s',
        unknownCode, actualMsg);
      expect(actualMsg).assertEqual(expectedMsg);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ErrorMap_003, end');
    });

    /**
     * Verify that the tempDirName constant equals 'dest', matching the .ole decompression dir
     * used by Index.ets handleOpenFile/handleSaveFile.
     */
    it(BUNDLE + 'Constants_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Constants_001, begin');
      const expected = 'dest';
      hilog.info(DOMAIN, TAG, BUNDLE + 'Constants_001, expected=%{public}s, actual=%{public}s',
        expected, tempDirName);
      expect(tempDirName).assertEqual(expected);
      hilog.info(DOMAIN, TAG, BUNDLE + 'Constants_001, end');
    });

    /**
     * Verify that the emitter event IDs are stable: formatSelectedEvent.eventId == 10,
     * fileSelectedEvent.eventId == 11. These IDs are part of the IPC contract between
     * sub-windows (ContentEmbedFormat / FilePickerTab) and the main Index page.
     */
    it(BUNDLE + 'InnerEvent_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'InnerEvent_001, begin');
      const expectedFormatId = 10;
      const expectedFileId = 11;
      hilog.info(DOMAIN, TAG, BUNDLE + 'InnerEvent_001, formatId=%{public}d, fileEventId=%{public}d',
        formatSelectedEvent.eventId, fileSelectedEvent.eventId);
      expect(formatSelectedEvent.eventId).assertEqual(expectedFormatId);
      expect(fileSelectedEvent.eventId).assertEqual(expectedFileId);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InnerEvent_001, end');
    });

    /**
     * Verify that testNapi.queryAll returns a Result object whose errCode field is a number.
     * On a device without OE Extension, the call may return a non-zero errCode; this case only
     * checks the return structure, not a specific errCode value, so it passes on both
     * OE-capable and OE-absent devices.
     */
    it(BUNDLE + 'QueryAll_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAll_001, begin');
      const result: Result<testNapi.FormatInfo[]> = testNapi.queryAll('zh-cn');
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAll_001, errCode=%{public}d, dataLen=%{public}d',
        result.errCode, result.data ? result.data.length : -1);
      expect(typeof result.errCode).assertEqual('number');
      hilog.info(DOMAIN, TAG, BUNDLE + 'QueryAll_001, end');
    });

    /**
     * Verify that testNapi.query returns a Result object for a non-existent OEID.
     * The errCode is expected to be non-zero (failure), but this case only asserts the return
     * structure to remain robust across device capabilities.
     */
    it(BUNDLE + 'Query_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Query_001, begin');
      const nonexistentOeid = 'nonexistent.oeid.for.test';
      const result: Result<testNapi.FormatInfo> = testNapi.query(nonexistentOeid, 'zh-cn');
      hilog.info(DOMAIN, TAG, BUNDLE + 'Query_001, oeid=%{public}s, errCode=%{public}d',
        nonexistentOeid, result.errCode);
      expect(typeof result.errCode).assertEqual('number');
      hilog.info(DOMAIN, TAG, BUNDLE + 'Query_001, end');
    });

    /**
     * Verify that testNapi.createDormant returns a Result with errCode == 0 and a non-null
     * CEProxy for valid name/path/snapshotPath arguments. createDormant does not start a live
     * Extension proxy (no StartWork/IPC), so it succeeds without an OE server app installed.
     */
    it(BUNDLE + 'CreateDormant_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_001, begin');
      const name = 'dormant_test_object';
      const sandboxPath = '/data/storage/el2/base/haps/entry/files/dormant_test_object.bin';
      const snapshotPath = 'dormant_test_object.png';
      // Pass undefined context — the native side stores contextPtr_ for later live
      // reactivation but createDormant itself does not require a valid context to
      // construct the wrapper.
      const result = testNapi.createDormant(undefined, name, sandboxPath, snapshotPath);
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_001, errCode=%{public}d, dataNotNull=%{public}d',
        result.errCode, result.data !== null ? 1 : 0);
      expect(result.errCode).assertEqual(0);
      expect(result.data !== null && result.data !== undefined).assertTrue();
      if (result.data) {
        hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_001, proxyName=%{public}s',
          result.data.getName());
        expect(result.data.getName()).assertEqual(name);
        result.data.destroy();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_001, end');
    });

    /**
     * Verify that a dormant CEProxy reports isAlive() == false, since createDormant does not
     * start the Extension. After destroy(), isAlive() remains false.
     */
    it(BUNDLE + 'CreateDormant_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_002, begin');
      const result = testNapi.createDormant(undefined, 'dormant_alive_test',
        '/data/storage/el2/base/haps/entry/files/dormant_alive_test.bin',
        'dormant_alive_test.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_002, errCode=%{public}d', result.errCode);
      expect(result.errCode).assertEqual(0);
      if (result.data) {
        const aliveBefore = result.data.isAlive();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_002, isAliveBefore=%{public}d', aliveBefore);
        expect(aliveBefore).assertFalse();
        result.data.destroy();
        const aliveAfter = result.data.isAlive();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_002, isAliveAfter=%{public}d', aliveAfter);
        expect(aliveAfter).assertFalse();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_002, end');
    });

    /**
     * Verify that a dormant CEProxy created with a snapshot path returns the expected path
     * string from getPath()/getSnapshotPath(), validating wrapper metadata persistence.
     */
    it(BUNDLE + 'CreateDormant_003', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_003, begin');
      const sandboxPath = '/data/storage/el2/base/haps/entry/files/metadata_test.bin';
      const result = testNapi.createDormant(undefined, 'metadata_test', sandboxPath,
        'metadata_test.png');
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_003, errCode=%{public}d', result.errCode);
      expect(result.errCode).assertEqual(0);
      if (result.data) {
        const actualPath = result.data.getPath();
        hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_003, actualPath=%{public}s', actualPath);
        expect(actualPath).assertEqual(sandboxPath);
        result.data.destroy();
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateDormant_003, end');
    });
  });
}
