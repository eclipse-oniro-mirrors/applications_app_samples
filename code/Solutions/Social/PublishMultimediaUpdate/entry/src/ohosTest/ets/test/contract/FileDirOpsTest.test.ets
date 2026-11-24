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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
import { ensureDir, writeTextFile } from '../common/FileTestHelper';
/**
 * Directory level operations used to keep a cache folder tidy.
 * A media session may copy a draft folder, move it into a cache area and clean
 * it up later. The cases pin the copy and move rules, the listing result, the
 * metadata a cleanup decision reads and the removal calls.
 */
const BASE_DIR: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir +
  '/publish_dir_cases';
function caseDir(name: string): string {
  return ensureDir(ensureDir(BASE_DIR) + '/' + name);
}
export default function fileDirOpsTest() {
  describe('FileDirOpsTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      ensureDir(BASE_DIR);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0100
     * @tc.name ListingReportsBothTypes001
     * @tc.desc Verify the directory listing returns files of every suffix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListingReportsBothTypes_001', 0, (): void => {
      Logger.info(TAG, 'ListingReportsBothTypes_001 begin');
      const dir: string = caseDir('listing_mixed');
      writeTextFile(dir + '/note.txt', 'text');
      writeTextFile(dir + '/blob.bin', 'bytes');
      const entries: Array<string> = fs.listFileSync(dir);
      expect(entries.indexOf('note.txt') !== -1).assertTrue();
      expect(entries.indexOf('blob.bin') !== -1).assertTrue();
      fs.unlinkSync(dir + '/note.txt');
      fs.unlinkSync(dir + '/blob.bin');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'ListingReportsBothTypes_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0200
     * @tc.name ListingCountsEveryEntry002
     * @tc.desc Verify the listing length equals the number of stored files
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListingCountsEveryEntry_002', 0, (): void => {
      Logger.info(TAG, 'ListingCountsEveryEntry_002 begin');
      const dir: string = caseDir('listing_count');
      writeTextFile(dir + '/one.txt', '1');
      writeTextFile(dir + '/two.txt', '2');
      writeTextFile(dir + '/three.txt', '3');
      expect(fs.listFileSync(dir).length).assertEqual(3);
      fs.unlinkSync(dir + '/one.txt');
      fs.unlinkSync(dir + '/two.txt');
      fs.unlinkSync(dir + '/three.txt');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'ListingCountsEveryEntry_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0300
     * @tc.name StatSizeMatchesBytes003
     * @tc.desc Verify the reported size equals the stored byte count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StatSizeMatchesBytes_003', 0, (): void => {
      Logger.info(TAG, 'StatSizeMatchesBytes_003 begin');
      const dir: string = caseDir('stat_size');
      writeTextFile(dir + '/sized.txt', '12345');
      expect(fs.statSync(dir + '/sized.txt').size).assertEqual(5);
      fs.unlinkSync(dir + '/sized.txt');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'StatSizeMatchesBytes_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0400
     * @tc.name StatModificationTimePositive004
     * @tc.desc Verify a written file reports a positive modification time
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StatModificationTimePositive_004', 0, (): void => {
      Logger.info(TAG, 'StatModificationTimePositive_004 begin');
      const dir: string = caseDir('stat_time');
      writeTextFile(dir + '/stamped.txt', 'body');
      expect(fs.statSync(dir + '/stamped.txt').mtime > 0).assertTrue();
      fs.unlinkSync(dir + '/stamped.txt');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'StatModificationTimePositive_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0500
     * @tc.name StatTellsFileFromDirectory005
     * @tc.desc Verify the file and directory predicates disagree for each kind
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StatTellsFileFromDirectory_005', 0, (): void => {
      Logger.info(TAG, 'StatTellsFileFromDirectory_005 begin');
      const dir: string = caseDir('stat_kind');
      writeTextFile(dir + '/kind.txt', 'body');
      const fileStat: fs.Stat = fs.statSync(dir + '/kind.txt');
      const dirStat: fs.Stat = fs.statSync(dir);
      expect(fileStat.isFile()).assertTrue();
      expect(fileStat.isDirectory()).assertFalse();
      expect(dirStat.isDirectory()).assertTrue();
      expect(dirStat.isFile()).assertFalse();
      fs.unlinkSync(dir + '/kind.txt');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'StatTellsFileFromDirectory_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0600
     * @tc.name AccessReflectsExistence006
     * @tc.desc Verify the access probe accepts a stored file and rejects an absent one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AccessReflectsExistence_006', 0, (): void => {
      Logger.info(TAG, 'AccessReflectsExistence_006 begin');
      const dir: string = caseDir('access_probe');
      writeTextFile(dir + '/probe.txt', 'body');
      expect(fs.accessSync(dir + '/probe.txt')).assertTrue();
      expect(fs.accessSync(dir + '/absent.txt')).assertFalse();
      fs.unlinkSync(dir + '/probe.txt');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'AccessReflectsExistence_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0700
     * @tc.name RmdirRemovesDirectory007
     * @tc.desc Verify a removed empty directory is no longer accessible
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RmdirRemovesDirectory_007', 0, (): void => {
      Logger.info(TAG, 'RmdirRemovesDirectory_007 begin');
      const dir: string = caseDir('removed_dir');
      fs.rmdirSync(dir);
      expect(fs.accessSync(dir)).assertFalse();
      Logger.info(TAG, 'RmdirRemovesDirectory_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DIROPS_0800
     * @tc.name UnlinkRemovesFile008
     * @tc.desc Verify a removed file leaves the directory listing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnlinkRemovesFile_008', 0, (): void => {
      Logger.info(TAG, 'UnlinkRemovesFile_008 begin');
      const dir: string = caseDir('unlink_dir');
      writeTextFile(dir + '/gone.txt', 'body');
      fs.unlinkSync(dir + '/gone.txt');
      expect(fs.listFileSync(dir).indexOf('gone.txt')).assertEqual(-1);
      fs.rmdirSync(dir);
      Logger.info(TAG, 'UnlinkRemovesFile_008 end');
    });
  });
}
