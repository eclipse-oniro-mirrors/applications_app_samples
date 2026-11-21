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
 * File operations beyond open and read.
 * A cached media payload may be renamed, copied or truncated on disk. The
 * cases pin those operations and the directory listing used to clean a cache
 * folder, always inside a case specific temporary folder.
 */
const BASE_DIR: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir +
  '/publish_fs_cases';
export default function fileIoExtendedTest() {
  describe('FileIoExtendedTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      ensureDir(BASE_DIR);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0100
     * @tc.name TextRoundTrip001
     * @tc.desc Verify text written to a file is returned by readTextSync
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextRoundTrip_001', 0, (): void => {
      Logger.info(TAG, 'TextRoundTrip_001 begin');
      const path: string = ensureDir(BASE_DIR) + '/text_rt.txt';
      writeTextFile(path, 'publish text');
      expect(fs.readTextSync(path)).assertEqual('publish text');
      fs.unlinkSync(path);
      Logger.info(TAG, 'TextRoundTrip_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0200
     * @tc.name RenameMovesFile002
     * @tc.desc Verify renaming a file keeps its content under the new name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RenameMovesFile_002', 0, (): void => {
      Logger.info(TAG, 'RenameMovesFile_002 begin');
      const source: string = ensureDir(BASE_DIR) + '/rename_src.txt';
      const target: string = ensureDir(BASE_DIR) + '/rename_dst.txt';
      writeTextFile(source, 'moved');
      fs.renameSync(source, target);
      expect(fs.accessSync(source)).assertFalse();
      expect(fs.readTextSync(target)).assertEqual('moved');
      fs.unlinkSync(target);
      Logger.info(TAG, 'RenameMovesFile_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0300
     * @tc.name CopyDuplicatesContent003
     * @tc.desc Verify copying a file produces an independent file with the same content
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CopyDuplicatesContent_003', 0, (): void => {
      Logger.info(TAG, 'CopyDuplicatesContent_003 begin');
      const source: string = ensureDir(BASE_DIR) + '/copy_src.txt';
      const target: string = ensureDir(BASE_DIR) + '/copy_dst.txt';
      writeTextFile(source, 'copied body');
      fs.copyFileSync(source, target);
      expect(fs.readTextSync(target)).assertEqual('copied body');
      expect(fs.statSync(source).size).assertEqual(fs.statSync(target).size);
      fs.unlinkSync(source);
      fs.unlinkSync(target);
      Logger.info(TAG, 'CopyDuplicatesContent_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0400
     * @tc.name TruncateShrinksFile004
     * @tc.desc Verify truncating a file reduces its size to the requested length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TruncateShrinksFile_004', 0, (): void => {
      Logger.info(TAG, 'TruncateShrinksFile_004 begin');
      const path: string = ensureDir(BASE_DIR) + '/truncate.txt';
      writeTextFile(path, '0123456789');
      fs.truncateSync(path, 4);
      expect(fs.statSync(path).size).assertEqual(4);
      fs.unlinkSync(path);
      Logger.info(TAG, 'TruncateShrinksFile_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0500
     * @tc.name ListingContainsFile005
     * @tc.desc Verify a created file appears in the directory listing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListingContainsFile_005', 0, (): void => {
      Logger.info(TAG, 'ListingContainsFile_005 begin');
      const path: string = ensureDir(BASE_DIR) + '/listed.txt';
      writeTextFile(path, 'listed');
      const entries: Array<string> = fs.listFileSync(ensureDir(BASE_DIR));
      const present: boolean = entries.indexOf('listed.txt') !== -1;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      fs.unlinkSync(path);
      Logger.info(TAG, 'ListingContainsFile_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0600
     * @tc.name CreatedDirectoryRecognized006
     * @tc.desc Verify a created directory is reported as a directory by stat
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CreatedDirectoryRecognized_006', 0, (): void => {
      Logger.info(TAG, 'CreatedDirectoryRecognized_006 begin');
      const dir: string = ensureDir(BASE_DIR) + '/nested';
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      expect(fs.statSync(dir).isDirectory()).assertTrue();
      fs.rmdirSync(dir);
      Logger.info(TAG, 'CreatedDirectoryRecognized_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0700
     * @tc.name RemovedDirectoryAbsent007
     * @tc.desc Verify a removed directory is no longer accessible
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RemovedDirectoryAbsent_007', 0, (): void => {
      Logger.info(TAG, 'RemovedDirectoryAbsent_007 begin');
      const dir: string = ensureDir(BASE_DIR) + '/removable';
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      fs.rmdirSync(dir);
      expect(fs.accessSync(dir)).assertFalse();
      Logger.info(TAG, 'RemovedDirectoryAbsent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0800
     * @tc.name SizeMatchesContent008
     * @tc.desc Verify the file size equals the byte length of the written text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SizeMatchesContent_008', 0, (): void => {
      Logger.info(TAG, 'SizeMatchesContent_008 begin');
      const path: string = ensureDir(BASE_DIR) + '/sized.txt';
      writeTextFile(path, 'sixteen bytes!!');
      expect(fs.statSync(path).size).assertEqual(15);
      fs.unlinkSync(path);
      Logger.info(TAG, 'SizeMatchesContent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_0900
     * @tc.name DeletedFileAbsent009
     * @tc.desc Verify a deleted file is no longer accessible
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeletedFileAbsent_009', 0, (): void => {
      Logger.info(TAG, 'DeletedFileAbsent_009 begin');
      const path: string = ensureDir(BASE_DIR) + '/deleted.txt';
      writeTextFile(path, 'gone');
      fs.unlinkSync(path);
      expect(fs.accessSync(path)).assertFalse();
      Logger.info(TAG, 'DeletedFileAbsent_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_1000
     * @tc.name TwoFilesIndependent010
     * @tc.desc Verify content of one file is not affected by rewriting another
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoFilesIndependent_010', 0, (): void => {
      Logger.info(TAG, 'TwoFilesIndependent_010 begin');
      const first: string = ensureDir(BASE_DIR) + '/first.txt';
      const second: string = ensureDir(BASE_DIR) + '/second.txt';
      writeTextFile(first, 'first body');
      writeTextFile(second, 'second body');
      writeTextFile(second, 'rewritten');
      expect(fs.readTextSync(first)).assertEqual('first body');
      expect(fs.readTextSync(second)).assertEqual('rewritten');
      fs.unlinkSync(first);
      fs.unlinkSync(second);
      Logger.info(TAG, 'TwoFilesIndependent_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_1100
     * @tc.name LineIteratorCountsLines011
     * @tc.desc Verify the line iterator yields each stored line in file order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LineIteratorCountsLines_011', 0, (): void => {
      Logger.info(TAG, 'LineIteratorCountsLines_011 begin');
      const path: string = ensureDir(BASE_DIR) + '/three_lines.txt';
      writeTextFile(path, 'alpha' + String.fromCharCode(10) + 'beta' + String.fromCharCode(10) + 'gamma');
      const iterator: fs.ReaderIterator = fs.readLinesSync(path);
      const lines: Array<string> = [];
      let result = iterator.next();
      while (!result.done) {
        lines.push(result.value.trim());
        result = iterator.next();
      }
      expect(lines.length).assertEqual(3);
      expect(lines[1]).assertEqual('beta');
      fs.unlinkSync(path);
      Logger.info(TAG, 'LineIteratorCountsLines_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_1200
     * @tc.name LineIteratorEmptyFileDone012
     * @tc.desc Verify the line iterator reports completion at once for an empty file
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LineIteratorEmptyFileDone_012', 0, (): void => {
      Logger.info(TAG, 'LineIteratorEmptyFileDone_012 begin');
      const path: string = ensureDir(BASE_DIR) + '/empty_lines.txt';
      writeTextFile(path, '');
      const iterator: fs.ReaderIterator = fs.readLinesSync(path);
      const result = iterator.next();
      expect(result.done).assertTrue();
      fs.unlinkSync(path);
      Logger.info(TAG, 'LineIteratorEmptyFileDone_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_FILEIOEXT_1300
     * @tc.name LineIteratorKeepsCjk013
     * @tc.desc Verify a CJK line arrives intact from the line iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LineIteratorKeepsCjk_013', 0, (): void => {
      Logger.info(TAG, 'LineIteratorKeepsCjk_013 begin');
      const path: string = ensureDir(BASE_DIR) + '/cjk_lines.txt';
      writeTextFile(path, '来杯香槟' + String.fromCharCode(10) + '第二行');
      const iterator: fs.ReaderIterator = fs.readLinesSync(path);
      expect(iterator.next().value.trim()).assertEqual('来杯香槟');
      fs.unlinkSync(path);
      Logger.info(TAG, 'LineIteratorKeepsCjk_013 end');
    });
  });
}
