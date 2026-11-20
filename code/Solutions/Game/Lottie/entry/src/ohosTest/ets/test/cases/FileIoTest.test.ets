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


import { describe, it, expect } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.FILE_IO;

function baseDir(): string {
  const dir: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir + '/lottie_io_cases';
  if (!fs.accessSync(dir)) {
    fs.mkdirSync(dir);
  }
  return dir;
}

function pathOf(name: string): string {
  return baseDir() + '/' + name;
}

function removeIfExists(path: string): void {
  if (fs.accessSync(path)) {
    fs.unlinkSync(path);
  }
}

function removeDirIfExists(dir: string): void {
  if (!fs.accessSync(dir)) {
    return;
  }
  const names: Array<string> = fs.listFileSync(dir);
  for (let i: number = 0; i < names.length; i++) {
    fs.unlinkSync(dir + '/' + names[i]);
  }
  fs.rmdirSync(dir);
}

function freshDir(name: string): string {
  const dir: string = pathOf(name);
  removeDirIfExists(dir);
  fs.mkdirSync(dir);
  return dir;
}

function writeInDir(dir: string, name: string, text: string): void {
  const path: string = dir + '/' + name;
  const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, text);
  fs.closeSync(file);
}

function writeText(name: string, text: string): string {
  const path: string = pathOf(name);
  removeIfExists(path);
  const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, text);
  fs.closeSync(file);
  return path;
}

function appendText(name: string, text: string): string {
  const path: string = pathOf(name);
  const file: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND | fs.OpenMode.CREATE);
  fs.writeSync(file.fd, text);
  fs.closeSync(file);
  return path;
}

export default function fileIoTest(): void {
  describe('FileIoTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0100
     * @tc.name fileWriteCreates001
     * @tc.desc Verify writing text creates the target file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileWriteCreates_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileWriteCreates_001 begin');
      const path: string = writeText('write_basic.txt', 'alpha');
      Logger.info(TAG, 'fileWriteCreates_001, check01=' + JSON.stringify(fs.accessSync(path)));
      expect(fs.accessSync(path)).assertTrue();
      Logger.info(TAG, 'fileWriteCreates_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0200
     * @tc.name fileReadTextMatches002
     * @tc.desc Verify readTextSync returns the written text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileReadTextMatches_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileReadTextMatches_002 begin');
      const path: string = writeText('read_basic.txt', 'alpha');
      const text: string = fs.readTextSync(path);
      Logger.info(TAG, 'fileReadTextMatches_002, check01=' + JSON.stringify(text));
      expect(text).assertEqual('alpha');
      Logger.info(TAG, 'fileReadTextMatches_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0300
     * @tc.name fileStatSize003
     * @tc.desc Verify the file size matches the written byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileStatSize_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileStatSize_003 begin');
      const path: string = writeText('stat_size.txt', 'abc');
      const size: number = fs.statSync(path).size;
      Logger.info(TAG, 'fileStatSize_003, check01=' + JSON.stringify(size));
      expect(size).assertEqual(3);
      Logger.info(TAG, 'fileStatSize_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0400
     * @tc.name fileStatIsFile004
     * @tc.desc Verify a written path is reported as a file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileStatIsFile_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileStatIsFile_004 begin');
      const path: string = writeText('stat_file.txt', 'abc');
      const isFile: boolean = fs.statSync(path).isFile();
      Logger.info(TAG, 'fileStatIsFile_004, check01=' + JSON.stringify(isFile));
      expect(isFile).assertTrue();
      Logger.info(TAG, 'fileStatIsFile_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0500
     * @tc.name fileStatNotDirectory005
     * @tc.desc Verify a written path is not reported as a directory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileStatNotDirectory_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileStatNotDirectory_005 begin');
      const path: string = writeText('stat_not_dir.txt', 'abc');
      const isDir: boolean = fs.statSync(path).isDirectory();
      Logger.info(TAG, 'fileStatNotDirectory_005, check01=' + JSON.stringify(isDir));
      expect(isDir).assertFalse();
      Logger.info(TAG, 'fileStatNotDirectory_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0600
     * @tc.name fileStatMtime006
     * @tc.desc Verify the modification time is populated after writing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileStatMtime_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileStatMtime_006 begin');
      const path: string = writeText('stat_mtime.txt', 'abc');
      const mtime: number = fs.statSync(path).mtime;
      Logger.info(TAG, 'fileStatMtime_006, check01=' + JSON.stringify(mtime > 0));
      expect(mtime > 0).assertTrue();
      Logger.info(TAG, 'fileStatMtime_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0700
     * @tc.name fileAppendIncreases007
     * @tc.desc Verify append mode extends the file length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileAppendIncreases_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileAppendIncreases_007 begin');
      const path: string = writeText('append_size.txt', 'ab');
      appendText('append_size.txt', 'cd');
      const size: number = fs.statSync(path).size;
      Logger.info(TAG, 'fileAppendIncreases_007, check01=' + JSON.stringify(size));
      expect(size).assertEqual(4);
      Logger.info(TAG, 'fileAppendIncreases_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0800
     * @tc.name fileAppendKeepsContent008
     * @tc.desc Verify append mode keeps the existing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileAppendKeepsContent_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileAppendKeepsContent_008 begin');
      writeText('append_text.txt', 'ab');
      const path: string = appendText('append_text.txt', 'cd');
      const text: string = fs.readTextSync(path);
      Logger.info(TAG, 'fileAppendKeepsContent_008, check01=' + JSON.stringify(text));
      expect(text).assertEqual('abcd');
      Logger.info(TAG, 'fileAppendKeepsContent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_0900
     * @tc.name fileTruncateZero009
     * @tc.desc Verify truncating to zero empties the file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileTruncateZero_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileTruncateZero_009 begin');
      const path: string = writeText('trunc_zero.txt', 'abcdef');
      fs.truncateSync(path, 0);
      Logger.info(TAG, 'fileTruncateZero_009, check01=' + JSON.stringify(fs.statSync(path).size));
      expect(fs.statSync(path).size).assertEqual(0);
      Logger.info(TAG, 'fileTruncateZero_009, check02=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('');
      Logger.info(TAG, 'fileTruncateZero_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1000
     * @tc.name fileTruncatePartial010
     * @tc.desc Verify truncating keeps the requested prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileTruncatePartial_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileTruncatePartial_010 begin');
      const path: string = writeText('trunc_part.txt', 'abcdef');
      fs.truncateSync(path, 2);
      Logger.info(TAG, 'fileTruncatePartial_010, check01=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('ab');
      Logger.info(TAG, 'fileTruncatePartial_010, check02=' + JSON.stringify(fs.statSync(path).size));
      expect(fs.statSync(path).size).assertEqual(2);
      Logger.info(TAG, 'fileTruncatePartial_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1100
     * @tc.name fileRenameMoves011
     * @tc.desc Verify rename removes the source path and creates the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileRenameMoves_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileRenameMoves_011 begin');
      const source: string = writeText('rename_src.txt', 'move');
      const target: string = pathOf('rename_dst.txt');
      removeIfExists(target);
      fs.renameSync(source, target);
      Logger.info(TAG, 'fileRenameMoves_011, check01=' + JSON.stringify(fs.accessSync(source)));
      expect(fs.accessSync(source)).assertFalse();
      Logger.info(TAG, 'fileRenameMoves_011, check02=' + JSON.stringify(fs.accessSync(target)));
      expect(fs.accessSync(target)).assertTrue();
      Logger.info(TAG, 'fileRenameMoves_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1200
     * @tc.name fileRenameKeepsContent012
     * @tc.desc Verify rename preserves the file content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileRenameKeepsContent_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileRenameKeepsContent_012 begin');
      const source: string = writeText('rename_keep_src.txt', 'move');
      const target: string = pathOf('rename_keep_dst.txt');
      removeIfExists(target);
      fs.renameSync(source, target);
      Logger.info(TAG, 'fileRenameKeepsContent_012, check01=' + JSON.stringify(fs.readTextSync(target)));
      expect(fs.readTextSync(target)).assertEqual('move');
      Logger.info(TAG, 'fileRenameKeepsContent_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1300
     * @tc.name fileCopyCreates013
     * @tc.desc Verify copy creates the target path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileCopyCreates_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileCopyCreates_013 begin');
      const source: string = writeText('copy_src.txt', 'copy');
      const target: string = pathOf('copy_dst.txt');
      removeIfExists(target);
      fs.copyFileSync(source, target);
      Logger.info(TAG, 'fileCopyCreates_013, check01=' + JSON.stringify(fs.accessSync(target)));
      expect(fs.accessSync(target)).assertTrue();
      Logger.info(TAG, 'fileCopyCreates_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1400
     * @tc.name fileCopyKeepsContent014
     * @tc.desc Verify copy reproduces the source content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileCopyKeepsContent_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileCopyKeepsContent_014 begin');
      const source: string = writeText('copy_keep_src.txt', 'copy');
      const target: string = pathOf('copy_keep_dst.txt');
      removeIfExists(target);
      fs.copyFileSync(source, target);
      Logger.info(TAG, 'fileCopyKeepsContent_014, check01=' + JSON.stringify(fs.readTextSync(target)));
      expect(fs.readTextSync(target)).assertEqual('copy');
      Logger.info(TAG, 'fileCopyKeepsContent_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1500
     * @tc.name fileCopyKeepsSource015
     * @tc.desc Verify copy leaves the source file unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileCopyKeepsSource_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileCopyKeepsSource_015 begin');
      const source: string = writeText('copy_source_kept.txt', 'copy');
      const target: string = pathOf('copy_kept_dst.txt');
      removeIfExists(target);
      fs.copyFileSync(source, target);
      Logger.info(TAG, 'fileCopyKeepsSource_015, check01=' + JSON.stringify(fs.accessSync(source)));
      expect(fs.accessSync(source)).assertTrue();
      Logger.info(TAG, 'fileCopyKeepsSource_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1600
     * @tc.name fileUnlink016
     * @tc.desc Verify unlink removes the target file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileUnlink_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileUnlink_016 begin');
      const path: string = writeText('unlink_case.txt', 'x');
      fs.unlinkSync(path);
      Logger.info(TAG, 'fileUnlink_016, check01=' + JSON.stringify(fs.accessSync(path)));
      expect(fs.accessSync(path)).assertFalse();
      Logger.info(TAG, 'fileUnlink_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1700
     * @tc.name fileAccessMissing017
     * @tc.desc Verify access reports false for a path that was never created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileAccessMissing_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileAccessMissing_017 begin');
      const path: string = pathOf('never_created.txt');
      removeIfExists(path);
      Logger.info(TAG, 'fileAccessMissing_017, check01=' + JSON.stringify(fs.accessSync(path)));
      expect(fs.accessSync(path)).assertFalse();
      Logger.info(TAG, 'fileAccessMissing_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1800
     * @tc.name fileWriteEmpty018
     * @tc.desc Verify writing an empty string produces an empty file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileWriteEmpty_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileWriteEmpty_018 begin');
      const path: string = writeText('empty_file.txt', '');
      Logger.info(TAG, 'fileWriteEmpty_018, check01=' + JSON.stringify(fs.statSync(path).size));
      expect(fs.statSync(path).size).assertEqual(0);
      Logger.info(TAG, 'fileWriteEmpty_018, check02=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('');
      Logger.info(TAG, 'fileWriteEmpty_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_1900
     * @tc.name fileOverwriteTruncates019
     * @tc.desc Verify rewriting a file overwrites the previous content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileOverwriteTruncates_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileOverwriteTruncates_019 begin');
      writeText('overwrite_case.txt', 'old');
      const path: string = writeText('overwrite_case.txt', 'new');
      Logger.info(TAG, 'fileOverwriteTruncates_019, check01=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('new');
      Logger.info(TAG, 'fileOverwriteTruncates_019, check02=' + JSON.stringify(fs.statSync(path).size));
      expect(fs.statSync(path).size).assertEqual(3);
      Logger.info(TAG, 'fileOverwriteTruncates_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2000
     * @tc.name fileUnicodeSize020
     * @tc.desc Verify Chinese text is written as six UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileUnicodeSize_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileUnicodeSize_020 begin');
      const path: string = writeText('unicode_size.txt', '动画');
      Logger.info(TAG, 'fileUnicodeSize_020, check01=' + JSON.stringify(fs.statSync(path).size));
      expect(fs.statSync(path).size).assertEqual(6);
      Logger.info(TAG, 'fileUnicodeSize_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2100
     * @tc.name fileUnicodeRead021
     * @tc.desc Verify Chinese text reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileUnicodeRead_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileUnicodeRead_021 begin');
      const path: string = writeText('unicode_read.txt', '动画');
      Logger.info(TAG, 'fileUnicodeRead_021, check01=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('动画');
      Logger.info(TAG, 'fileUnicodeRead_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2200
     * @tc.name fileWriteReturnsBytes022
     * @tc.desc Verify writeSync reports the number of written bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileWriteReturnsBytes_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileWriteReturnsBytes_022 begin');
      const path: string = pathOf('write_return.txt');
      removeIfExists(path);
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      const written: number = fs.writeSync(file.fd, 'hello');
      fs.closeSync(file);
      Logger.info(TAG, 'fileWriteReturnsBytes_022, check01=' + JSON.stringify(written));
      expect(written).assertEqual(5);
      Logger.info(TAG, 'fileWriteReturnsBytes_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2300
     * @tc.name fileReopenRead023
     * @tc.desc Verify a reopened file still reads the written text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileReopenRead_023', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileReopenRead_023 begin');
      const path: string = pathOf('reopen_case.txt');
      removeIfExists(path);
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'reopen');
      fs.closeSync(file);
      Logger.info(TAG, 'fileReopenRead_023, check01=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('reopen');
      Logger.info(TAG, 'fileReopenRead_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2400
     * @tc.name fileAppendMode024
     * @tc.desc Verify the append open mode adds to existing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileAppendMode_024', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileAppendMode_024 begin');
      const path: string = writeText('append_mode.txt', 'first');
      const file: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
      fs.writeSync(file.fd, '-second');
      fs.closeSync(file);
      Logger.info(TAG, 'fileAppendMode_024, check01=' + JSON.stringify(fs.readTextSync(path)));
      expect(fs.readTextSync(path)).assertEqual('first-second');
      Logger.info(TAG, 'fileAppendMode_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2500
     * @tc.name fileListContains025
     * @tc.desc Verify listFileSync reports the two files of a fresh directory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileListContains_025', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileListContains_025 begin');
      const dir: string = freshDir('list_case');
      writeInDir(dir, 'a.txt', 'a');
      writeInDir(dir, 'b.txt', 'b');
      const names: Array<string> = fs.listFileSync(dir);
      Logger.info(TAG, 'fileListContains_025, check01=' + JSON.stringify(names.length));
      expect(names.length).assertEqual(2);
      Logger.info(TAG, 'fileListContains_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2600
     * @tc.name fileListNames026
     * @tc.desc Verify listFileSync returns the file names of a fresh directory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileListNames_026', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileListNames_026 begin');
      const dir: string = freshDir('list_names');
      writeInDir(dir, 'a.txt', 'a');
      writeInDir(dir, 'b.txt', 'b');
      const names: Array<string> = fs.listFileSync(dir);
      Logger.info(TAG, 'fileListNames_026, check01=' + JSON.stringify(names.indexOf('a.txt') >= 0));
      expect(names.indexOf('a.txt') >= 0).assertTrue();
      Logger.info(TAG, 'fileListNames_026, check02=' + JSON.stringify(names.indexOf('b.txt') >= 0));
      expect(names.indexOf('b.txt') >= 0).assertTrue();
      Logger.info(TAG, 'fileListNames_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2700
     * @tc.name fileMkdir027
     * @tc.desc Verify mkdirSync creates a directory path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileMkdir_027', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileMkdir_027 begin');
      const dir: string = pathOf('created_dir');
      removeDirIfExists(dir);
      fs.mkdirSync(dir);
      Logger.info(TAG, 'fileMkdir_027, check01=' + JSON.stringify(fs.accessSync(dir)));
      expect(fs.accessSync(dir)).assertTrue();
      Logger.info(TAG, 'fileMkdir_027, check02=' + JSON.stringify(fs.statSync(dir).isDirectory()));
      expect(fs.statSync(dir).isDirectory()).assertTrue();
      Logger.info(TAG, 'fileMkdir_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2800
     * @tc.name fileRmdir028
     * @tc.desc Verify rmdirSync removes an empty directory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileRmdir_028', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileRmdir_028 begin');
      const dir: string = freshDir('rmdir_case');
      fs.rmdirSync(dir);
      Logger.info(TAG, 'fileRmdir_028, check01=' + JSON.stringify(fs.accessSync(dir)));
      expect(fs.accessSync(dir)).assertFalse();
      Logger.info(TAG, 'fileRmdir_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_2900
     * @tc.name fileListEmpty029
     * @tc.desc Verify a fresh directory has no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileListEmpty_029', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileListEmpty_029 begin');
      const dir: string = freshDir('empty_dir');
      const names: Array<string> = fs.listFileSync(dir);
      Logger.info(TAG, 'fileListEmpty_029, check01=' + JSON.stringify(names.length));
      expect(names.length).assertEqual(0);
      Logger.info(TAG, 'fileListEmpty_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_FILEIO_3000
     * @tc.name fileLongText030
     * @tc.desc Verify a long text payload keeps its full byte length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'fileLongText_030', 0, async (): Promise<void> => {
      Logger.info(TAG, 'fileLongText_030 begin');
      const text: string = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      const path: string = writeText('long_text.txt', text);
      Logger.info(TAG, 'fileLongText_030, check01=' + JSON.stringify(fs.statSync(path).size));
      expect(fs.statSync(path).size).assertEqual(256);
      Logger.info(TAG, 'fileLongText_030, check02=' + JSON.stringify(fs.readTextSync(path).length));
      expect(fs.readTextSync(path).length).assertEqual(256);
      Logger.info(TAG, 'fileLongText_030 end');
    });

  });
}
