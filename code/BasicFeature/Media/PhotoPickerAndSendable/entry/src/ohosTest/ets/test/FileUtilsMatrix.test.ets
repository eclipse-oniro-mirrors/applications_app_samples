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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { FileUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers the matrix cases of the pure string helpers of FileUtils. Only
 * the synchronous path helpers getFileName, getExtension and joinPath are
 * exercised here; every case runs on plain strings without touching the
 * sandbox file system, so no ability context is required.
 */
export default function fileUtilsMatrixTest() {
  describe('FileUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0100
     * @tc.name      testFileMatrix0001
     * @tc.desc      Verify getFileName returns the last path segment with the
     *               extension and an empty tail for trailing separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A nested path hands back the last segment including the extension.
      expect(FileUtils.getFileName('a/b/c.jpg')).assertEqual('c.jpg');
      // A bare name without separator is returned unchanged.
      expect(FileUtils.getFileName('photo.png')).assertEqual('photo.png');
      // An absolute path hands back the name after the last separator.
      expect(FileUtils.getFileName('/root/file.txt')).assertEqual('file.txt');
      // A trailing separator produces the empty name.
      expect(FileUtils.getFileName('dir/sub/')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0200
     * @tc.name      testFileMatrix0002
     * @tc.desc      Verify getFileName resolves deeply nested paths, a root
     *               level name and single level folders.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five levels of nesting still resolve to the last segment.
      expect(FileUtils.getFileName('a/b/c/d/e.mp4')).assertEqual('e.mp4');
      // A root level name after the leading separator is resolved.
      expect(FileUtils.getFileName('/a')).assertEqual('a');
      // A single trailing separator yields the empty name.
      expect(FileUtils.getFileName('a/')).assertEqual('');
      // Two segments resolve to the second one.
      expect(FileUtils.getFileName('one/two')).assertEqual('two');
      // Repeated separators only count the last one.
      expect(FileUtils.getFileName('a//b')).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0300
     * @tc.name      testFileMatrix0003
     * @tc.desc      Verify getFileName ignores dots inside directory names
     *               and returns the final segment only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Dots inside the directory part do not confuse the name extraction.
      expect(FileUtils.getFileName('my.folder.v2/notes.txt')).assertEqual('notes.txt');
      // A dotted hidden directory hands back the visible file name.
      expect(FileUtils.getFileName('.hidden/file')).assertEqual('file');
      // Every segment may carry dots; only the last one counts.
      expect(FileUtils.getFileName('a.b/c.d')).assertEqual('c.d');
      // A versioned directory with dots resolves to its file.
      expect(FileUtils.getFileName('backup.v1.2/photo.jpg')).assertEqual('photo.jpg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0400
     * @tc.name      testFileMatrix0004
     * @tc.desc      Verify getFileName keeps blanks and non ascii characters
     *               of the file name untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Inner blanks of a file name are part of the name.
      expect(FileUtils.getFileName('/dir/my file.txt')).assertEqual('my file.txt');
      // A unicode file name is handed back unchanged.
      expect(FileUtils.getFileName('相册/照片.png')).assertEqual('照片.png');
      // A camera style upper case name is preserved.
      expect(FileUtils.getFileName('dir/IMG_0001.JPG')).assertEqual('IMG_0001.JPG');
      // A name with parentheses and copies marker is preserved.
      expect(FileUtils.getFileName('下载/副本 (1).png')).assertEqual('副本 (1).png');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0500
     * @tc.name      testFileMatrix0005
     * @tc.desc      Verify getExtension returns the lower case suffix of
     *               common media extensions without the leading dot.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lower case jpg extension is returned as is.
      expect(FileUtils.getExtension('photo.jpg')).assertEqual('jpg');
      // An upper case JPG extension folds to lower case.
      expect(FileUtils.getExtension('photo.JPG')).assertEqual('jpg');
      // A video extension folds the same way.
      expect(FileUtils.getExtension('video.mp4')).assertEqual('mp4');
      // Only the last extension of a double suffix is reported.
      expect(FileUtils.getExtension('archive.tar.gz')).assertEqual('gz');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0600
     * @tc.name      testFileMatrix0006
     * @tc.desc      Verify getExtension returns the empty string for missing,
     *               leading and trailing dot names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A name without any dot has no extension.
      expect(FileUtils.getExtension('noext')).assertEqual('');
      // A leading dot is treated as a hidden name without extension.
      expect(FileUtils.getExtension('.hidden')).assertEqual('');
      // A trailing dot carries no extension text.
      expect(FileUtils.getExtension('file.')).assertEqual('');
      // The empty path has no extension.
      expect(FileUtils.getExtension('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0700
     * @tc.name      testFileMatrix0007
     * @tc.desc      Verify getExtension works on full paths, folds the case
     *               of dotted directories and ignores hidden dotfiles.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The extension is taken from the name after the last separator.
      expect(FileUtils.getExtension('/a/b/file.txt')).assertEqual('txt');
      // An upper case extension inside a dotted directory folds.
      expect(FileUtils.getExtension('dir.dots/file.TXT')).assertEqual('txt');
      // A multi dot name reports the last suffix only.
      expect(FileUtils.getExtension('a.b.c.PDF')).assertEqual('pdf');
      // A hidden dotfile has no extension after its leading dot.
      expect(FileUtils.getExtension('/x/.gitignore')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0800
     * @tc.name      testFileMatrix0008
     * @tc.desc      Verify getExtension keeps numeric and multi character
     *               suffixes and reports the last one of a long chain.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A numeric suffix is reported unchanged.
      expect(FileUtils.getExtension('scan.0001')).assertEqual('0001');
      // A four character suffix is reported unchanged.
      expect(FileUtils.getExtension('file.jpeg')).assertEqual('jpeg');
      // A long single suffix is reported unchanged.
      expect(FileUtils.getExtension('name.extension')).assertEqual('extension');
      // A two level suffix reports the last part.
      expect(FileUtils.getExtension('data.tar.bzip2')).assertEqual('bzip2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_0900
     * @tc.name      testFileMatrix0009
     * @tc.desc      Verify joinPath inserts exactly one separator between
     *               bare segments and degrades empty segments gracefully.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two bare segments are joined with one separator.
      expect(FileUtils.joinPath('a', 'b')).assertEqual('a/b');
      // Two multi character segments are joined the same way.
      expect(FileUtils.joinPath('base', 'sub')).assertEqual('base/sub');
      // An empty right segment leaves the left segment plus separator.
      expect(FileUtils.joinPath('a', '')).assertEqual('a/');
      // An empty left segment returns the right segment untouched.
      expect(FileUtils.joinPath('', 'b')).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1000
     * @tc.name      testFileMatrix0010
     * @tc.desc      Verify joinPath accepts a left segment that already ends
     *               with a separator without doubling it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing separator of the left segment is reused.
      expect(FileUtils.joinPath('a/', 'b')).assertEqual('a/b');
      // An absolute left segment keeps its trailing separator.
      expect(FileUtils.joinPath('/root/', 'file.txt')).assertEqual('/root/file.txt');
      // An empty right segment keeps the left segment as it was.
      expect(FileUtils.joinPath('x/', '')).assertEqual('x/');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1100
     * @tc.name      testFileMatrix0011
     * @tc.desc      Verify joinPath accepts a right segment that already
     *               starts with a separator without doubling it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading separator of the right segment is reused.
      expect(FileUtils.joinPath('a', '/b')).assertEqual('a/b');
      // Two absolute segments join on the shared separator.
      expect(FileUtils.joinPath('/root', '/tmp')).assertEqual('/root/tmp');
      // An empty left segment returns the absolute right segment.
      expect(FileUtils.joinPath('', '/b')).assertEqual('/b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1200
     * @tc.name      testFileMatrix0012
     * @tc.desc      Verify joinPath collapses the double separator that
     *               appears when both segments carry boundary separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both boundary separators collapse into one.
      expect(FileUtils.joinPath('a/', '/b')).assertEqual('a/b');
      // The same collapse applies to absolute segments.
      expect(FileUtils.joinPath('/root/', '/sub')).assertEqual('/root/sub');
      // The root separator joins with any right segment without doubling.
      expect(FileUtils.joinPath('/', '/x')).assertEqual('/x');
      // The root separator with a bare name produces the absolute path.
      expect(FileUtils.joinPath('/', 'x')).assertEqual('/x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1300
     * @tc.name      testFileMatrix0013
     * @tc.desc      Verify joinPath can be chained to build deeper paths and
     *               preserves trailing separators of the right segment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two step chain builds the full path.
      expect(FileUtils.joinPath(FileUtils.joinPath('base', 'photos'), 'img.jpg'))
        .assertEqual('base/photos/img.jpg');
      // A single call with a multi segment right part keeps its separators.
      expect(FileUtils.joinPath('a/b', 'c/d')).assertEqual('a/b/c/d');
      // A trailing separator of the right segment survives the join.
      expect(FileUtils.joinPath('/a/', 'b/')).assertEqual('/a/b/');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1400
     * @tc.name      testFileMatrix0014
     * @tc.desc      Verify joinPath joins dotted directories with dotted
     *               file names without touching the dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A hidden file joins after the directory.
      expect(FileUtils.joinPath('/data/export', '.hidden')).assertEqual('/data/export/.hidden');
      // A dotted directory and a double suffix name join cleanly.
      expect(FileUtils.joinPath('dir.v2', 'file.tar.gz')).assertEqual('dir.v2/file.tar.gz');
      // A versioned directory joins with a plain name.
      expect(FileUtils.joinPath('backup.v1.2', 'photo.jpg')).assertEqual('backup.v1.2/photo.jpg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1500
     * @tc.name      testFileMatrix0015
     * @tc.desc      Verify getFileName and getExtension compose with joinPath
     *               results exactly as on hand written paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The joined path resolves back to the appended file name.
      expect(FileUtils.getFileName(FileUtils.joinPath('base', 'photo.png'))).assertEqual('photo.png');
      // The joined path resolves to the folded extension.
      expect(FileUtils.getExtension(FileUtils.joinPath('a/b', 'IMG.HEIC'))).assertEqual('heic');
      // A directory style join resolves to the empty name.
      expect(FileUtils.getFileName(FileUtils.joinPath('a/', 'b/'))).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1600
     * @tc.name      testFileMatrix0016
     * @tc.desc      Verify getExtension folds upper case suffixes of the
     *               media formats the sample works with.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The image format folds to lower case.
      expect(FileUtils.getExtension('IMG_0001.HEIC')).assertEqual('heic');
      // The video format folds to lower case.
      expect(FileUtils.getExtension('VIDEO.MOV')).assertEqual('mov');
      // The raw format folds to lower case.
      expect(FileUtils.getExtension('photo.DNG')).assertEqual('dng');
      // The document format folds to lower case.
      expect(FileUtils.getExtension('doc.PDF')).assertEqual('pdf');
      // The audio format folds to lower case.
      expect(FileUtils.getExtension('track.FLAC')).assertEqual('flac');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1700
     * @tc.name      testFileMatrix0017
     * @tc.desc      Verify getFileName handles the root path, bare names and
     *               repeated separator runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bare root path has no name.
      expect(FileUtils.getFileName('/')).assertEqual('');
      // A bare name without separators is returned unchanged.
      expect(FileUtils.getFileName('file')).assertEqual('file');
      // A doubled separator resolves to the last segment.
      expect(FileUtils.getFileName('a//b')).assertEqual('b');
      // A run of separators yields the empty name.
      expect(FileUtils.getFileName('///')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1800
     * @tc.name      testFileMatrix0018
     * @tc.desc      Verify getFileName and getExtension work on the media
     *               uri forms the picker and the share kit grant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The picker uri resolves to its extension.
      expect(FileUtils.getExtension('file://media/photo/1.jpg')).assertEqual('jpg');
      // An upper case extension inside a picker uri folds.
      expect(FileUtils.getExtension('file://media/Photo.PNG')).assertEqual('png');
      // A datashare uri without a dot has no extension.
      expect(FileUtils.getExtension('datashare://media/album/12')).assertEqual('');
      // The picker uri resolves to its file name.
      expect(FileUtils.getFileName('file://media/photo/1.jpg')).assertEqual('1.jpg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_1900
     * @tc.name      testFileMatrix0019
     * @tc.desc      Verify joinPath builds sandbox export paths with the
     *               separators the file share kit expects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A sandbox directory joins with the export file name.
      expect(FileUtils.joinPath('/data/storage/el2/base/files', 'export.jpg'))
        .assertEqual('/data/storage/el2/base/files/export.jpg');
      // A padded sandbox base joins with a trailing separator directory.
      expect(FileUtils.joinPath('/data/storage/el2/base/', 'cache/'))
        .assertEqual('/data/storage/el2/base/cache/');
      // A two level chain builds the sandbox sub directory path.
      expect(FileUtils.joinPath(FileUtils.joinPath('/data/storage/el2/base', 'files'), 'log.txt'))
        .assertEqual('/data/storage/el2/base/files/log.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2000
     * @tc.name      testFileMatrix0020
     * @tc.desc      Verify getFileName and getExtension preserve trailing
     *               blanks of a name and fold the case of the rest.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing blank of the name is not trimmed away.
      expect(FileUtils.getFileName('/dir/name ')).assertEqual('name ');
      // The extension keeps the trailing blank and folds the letters.
      expect(FileUtils.getExtension('file.TXT ')).assertEqual('txt ');
      // A name with a leading blank after the separator is preserved.
      expect(FileUtils.getFileName('/dir/ note.txt')).assertEqual(' note.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2100
     * @tc.name      testFileMatrix0021
     * @tc.desc      Verify getExtension reports the last suffix of multi dot
     *               names and rejects trailing and leading dot variants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A four part name reports the last suffix.
      expect(FileUtils.getExtension('a.b.c.d')).assertEqual('d');
      // A trailing dot yields no extension.
      expect(FileUtils.getExtension('x.y.')).assertEqual('');
      // A leading dot before a dotted name still resolves the last suffix.
      expect(FileUtils.getExtension('.a.b')).assertEqual('b');
      // A three part name reports the last suffix.
      expect(FileUtils.getExtension('archive.old.tar')).assertEqual('tar');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2200
     * @tc.name      testFileMatrix0022
     * @tc.desc      Verify getFileName returns the untouched camera and
     *               screenshot style names of the media library.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFileMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testFileMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A camera time stamp name is returned unchanged.
      expect(FileUtils.getFileName('IMG_20260101_123456.jpg')).assertEqual('IMG_20260101_123456.jpg');
      // A screenshot name is returned unchanged.
      expect(FileUtils.getFileName('screenshot_01.png')).assertEqual('screenshot_01.png');
      // A deep library path resolves to its camera file.
      expect(FileUtils.getFileName('/storage/emulated/0/DCIM/Camera/IMG_001.jpg'))
        .assertEqual('IMG_001.jpg');
      // The same path resolves to its extension.
      expect(FileUtils.getExtension('/storage/emulated/0/DCIM/Camera/IMG_001.jpg'))
        .assertEqual('jpg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2300
     * @tc.name      testFileMatrix0023
     * @tc.desc      Verify the joined sandbox path of a mixed separator pair
     *               still resolves to its file name and extension.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A left segment with trailing separator joins with the clip name.
      const joined: string = FileUtils.joinPath('/base/sub/', 'clip.mp4');
      expect(joined).assertEqual('/base/sub/clip.mp4');
      // The joined path resolves to its file name.
      expect(FileUtils.getFileName(joined)).assertEqual('clip.mp4');
      // The joined path resolves to its extension.
      expect(FileUtils.getExtension(joined)).assertEqual('mp4');
      // A right segment with leading separator joins to the same shape.
      const mirrored: string = FileUtils.joinPath('/base/sub', '/clip.mp4');
      expect(mirrored).assertEqual('/base/sub/clip.mp4');
      // Both separator styles produce one canonical path.
      expect(FileUtils.joinPath('/base/sub/', '/clip.mp4')).assertEqual('/base/sub/clip.mp4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2400
     * @tc.name      testFileMatrix0024
     * @tc.desc      Verify getExtension folds every upper case media format
     *               suffix the picker can hand out.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The image format folds to lower case.
      expect(FileUtils.getExtension('IMG_0001.HEIC')).assertEqual('heic');
      // The video format folds to lower case.
      expect(FileUtils.getExtension('CLIP_0001.MOV')).assertEqual('mov');
      // The raw format folds to lower case.
      expect(FileUtils.getExtension('RAW_0001.DNG')).assertEqual('dng');
      // The audio format folds to lower case.
      expect(FileUtils.getExtension('TRACK_01.FLAC')).assertEqual('flac');
      // The document format folds to lower case.
      expect(FileUtils.getExtension('doc.PDF')).assertEqual('pdf');
      // A mixed case suffix folds every letter.
      expect(FileUtils.getExtension('note.Mp4')).assertEqual('mp4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2500
     * @tc.name      testFileMatrix0025
     * @tc.desc      Verify a four level joinPath chain inserts exactly one
     *               separator per level.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four bare segments chain into one path.
      const chained: string = FileUtils.joinPath(FileUtils.joinPath(FileUtils.joinPath('a', 'b'), 'c'), 'd');
      expect(chained).assertEqual('a/b/c/d');
      // The chain tail resolves to the last segment.
      expect(FileUtils.getFileName(chained)).assertEqual('d');
      // A chain started with a separator keeps the leading slash.
      const rooted: string = FileUtils.joinPath(FileUtils.joinPath('/a', 'b'), 'c');
      expect(rooted).assertEqual('/a/b/c');
      // The rooted chain resolves to the tail name.
      expect(FileUtils.getFileName(rooted)).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2600
     * @tc.name      testFileMatrix0026
     * @tc.desc      Verify getExtension reports the final suffix for media
     *               names that carry several dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A converted photo reports the final suffix.
      expect(FileUtils.getExtension('photo.jpg.orf')).assertEqual('orf');
      // A versioned video reports the final suffix.
      expect(FileUtils.getExtension('clip.v2.m4v')).assertEqual('m4v');
      // A stamped image reports the final suffix.
      expect(FileUtils.getExtension('IMG.2026.01.01.jpg')).assertEqual('jpg');
      // The last suffix of a bare dotted name resolves as well.
      expect(FileUtils.getExtension('backup.7z')).assertEqual('7z');
      // A dotted name inside a directory resolves from the name part.
      expect(FileUtils.getExtension('my.files/backup.7z')).assertEqual('7z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEMAT_2700
     * @tc.name      testFileMatrix0027
     * @tc.desc      Verify the empty left segment shortcut of joinPath makes
     *               the right segment the whole path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileMatrix0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty left segment hands back the bare right segment.
      expect(FileUtils.joinPath('', 'file.txt')).assertEqual('file.txt');
      // An empty left segment hands back the rooted right segment.
      expect(FileUtils.joinPath('', '/file.txt')).assertEqual('/file.txt');
      // The bare result still resolves to its extension.
      expect(FileUtils.getExtension(FileUtils.joinPath('', 'file.txt'))).assertEqual('txt');
      // The rooted result still resolves to its file name.
      expect(FileUtils.getFileName(FileUtils.joinPath('', '/file.txt'))).assertEqual('file.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
