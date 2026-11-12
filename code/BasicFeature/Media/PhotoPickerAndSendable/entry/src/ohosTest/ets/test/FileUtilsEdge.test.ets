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
/** Length of the long name inputs built by the edge cases. */
const LONG_NAME: number = 300;
/** Length of the long extension inputs built by the edge cases. */
const LONG_EXT: number = 200;
/** Depth of the long directory chains built by the edge cases. */
const DEEP_CHAIN: number = 50;

/**
 * Registers the edge and extreme input cases of FileUtils. The pure string
 * helpers getFileName, getExtension and joinPath run against empty, long,
 * unicode and separator flooded inputs. The empty path guards of the file
 * system methods are also exercised: for an empty path every method returns
 * before any fileIo call, so no real file system access happens here.
 */
export default function fileUtilsEdgeTest() {
  describe('FileUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0100
     * @tc.name      testFileEdge0001
     * @tc.desc      Verify getFileName degrades the empty path, a bare name
     *               and the root separator to safe results.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path has no file name at all.
      expect(FileUtils.getFileName('')).assertEqual('');
      // A bare single letter is already a file name.
      expect(FileUtils.getFileName('x')).assertEqual('x');
      // The bare root separator yields the empty name.
      expect(FileUtils.getFileName('/')).assertEqual('');
      // A single dot is a name without separator.
      expect(FileUtils.getFileName('.')).assertEqual('.');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0200
     * @tc.name      testFileEdge0002
     * @tc.desc      Verify getFileName returns a three hundred character
     *               name completely without truncation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the long name with an index based loop.
      let longName: string = 'n';
      let index: number = 0;
      while (index < LONG_NAME) {
        longName = longName + 'a';
        index = index + 1;
      }
      // The whole long name is handed back unchanged.
      expect(FileUtils.getFileName(longName)).assertEqual(longName);
      // The name is still handed back when it sits behind a directory.
      expect(FileUtils.getFileName('/dir/' + longName)).assertEqual(longName);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0300
     * @tc.name      testFileEdge0003
     * @tc.desc      Verify getFileName resolves the tail of a fifty level
     *               directory chain.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the deep chain with an index based loop.
      let chain: string = '';
      let index: number = 0;
      while (index < DEEP_CHAIN) {
        chain = chain + '/d' + String(index);
        index = index + 1;
      }
      const deepPath: string = chain + '/leaf.txt';
      // The leaf of the fifty level chain is the file name.
      expect(FileUtils.getFileName(deepPath)).assertEqual('leaf.txt');
      // The leaf extension resolves from the deep path as well.
      expect(FileUtils.getExtension(deepPath)).assertEqual('txt');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0400
     * @tc.name      testFileEdge0004
     * @tc.desc      Verify backslash separated windows style paths keep the
     *           whole text as file name while the extension still folds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Backslashes are not separators for this helper.
      expect(FileUtils.getFileName('C:\\dir\\file.txt')).assertEqual('C:\\dir\\file.txt');
      // The extension still resolves from the last dot.
      expect(FileUtils.getExtension('C:\\dir\\file.txt')).assertEqual('txt');
      // A share style path is returned as one name too.
      expect(FileUtils.getFileName('\\\\server\\share\\a.png')).assertEqual('\\\\server\\share\\a.png');
      // The share style extension folds to lower case.
      expect(FileUtils.getExtension('\\\\server\\share\\a.png')).assertEqual('png');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0500
     * @tc.name      testFileEdge0005
     * @tc.desc      Verify getFileName preserves unicode directory and file
     *               names including blanks and brackets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A copy suffix name with blanks and brackets survives.
      expect(FileUtils.getFileName('相册/副本 (1).png')).assertEqual('副本 (1).png');
      // A nested year directory chain resolves to the photo name.
      expect(FileUtils.getFileName('图片/2026年/照片.jpg')).assertEqual('照片.jpg');
      // The unicode photo name carries its extension.
      expect(FileUtils.getExtension('相册/副本 (1).png')).assertEqual('png');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0600
     * @tc.name      testFileEdge0006
     * @tc.desc      Verify getExtension degrades dot only inputs and the
     *               empty path to the empty extension.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path has no extension.
      expect(FileUtils.getExtension('')).assertEqual('');
      // A single leading dot is rejected by the position guard.
      expect(FileUtils.getExtension('.')).assertEqual('');
      // A double dot ends on the marker and yields nothing.
      expect(FileUtils.getExtension('..')).assertEqual('');
      // A triple dot ends on the marker and yields nothing.
      expect(FileUtils.getExtension('...')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0700
     * @tc.name      testFileEdge0007
     * @tc.desc      Verify getExtension returns a two hundred character
     *               suffix completely and folds it to lower case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the long suffix with an index based loop.
      let longExt: string = '';
      let index: number = 0;
      while (index < LONG_EXT) {
        longExt = longExt + 'A';
        index = index + 1;
      }
      const padded: string = 'file.' + longExt;
      // The whole suffix folds to lower case without truncation.
      expect(FileUtils.getExtension(padded)).assertEqual(longExt.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0800
     * @tc.name      testFileEdge0008
     * @tc.desc      Verify getExtension resolves single character suffixes
     *               and reports none for a bare digit tail.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single letter suffix resolves.
      expect(FileUtils.getExtension('a.z')).assertEqual('z');
      // An upper case suffix inside a directory folds.
      expect(FileUtils.getExtension('/b/c.Q')).assertEqual('q');
      // A single digit suffix resolves.
      expect(FileUtils.getExtension('n.1')).assertEqual('1');
      // A bare tail without a dot has no extension.
      expect(FileUtils.getExtension('/x.y/9')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_0900
     * @tc.name      testFileEdge0009
     * @tc.desc      Verify getExtension folds upper, mixed and accented
     *               names to a lower case suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An all upper name folds the suffix.
      expect(FileUtils.getExtension('ABC.DEF')).assertEqual('def');
      // A mixed case name folds only the suffix.
      expect(FileUtils.getExtension('x.Yz')).assertEqual('yz');
      // An accented name folds the ascii suffix.
      expect(FileUtils.getExtension('Pícture.JPG')).assertEqual('jpg');
      // A double suffix name folds the last part.
      expect(FileUtils.getExtension('FILE.TAR.GZ')).assertEqual('gz');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1000
     * @tc.name      testFileEdge0010
     * @tc.desc      Verify getExtension keeps digit and symbol suffixes
     *               exactly as written.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A version tail resolves to the last digit group.
      expect(FileUtils.getExtension('v1.2.3')).assertEqual('3');
      // A hex like suffix is preserved.
      expect(FileUtils.getExtension('hash.a1b2c3')).assertEqual('a1b2c3');
      // A symbol suffix is preserved without mangling.
      expect(FileUtils.getExtension('weird.#$%')).assertEqual('#$%');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1100
     * @tc.name      testFileEdge0011
     * @tc.desc      Verify joinPath handles every empty and slash only
     *               segment combination of the matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two empty segments produce the empty path.
      expect(FileUtils.joinPath('', '')).assertEqual('');
      // An empty left segment hands back the rooted right segment.
      expect(FileUtils.joinPath('', '/a')).assertEqual('/a');
      // An empty right segment keeps the left segment and adds the separator.
      expect(FileUtils.joinPath('/a', '')).assertEqual('/a/');
      // A bare left segment with a separator right segment keeps one slash.
      expect(FileUtils.joinPath('a', '/')).assertEqual('a/');
      // Two slash only segments collapse to the bare root.
      expect(FileUtils.joinPath('/', '/')).assertEqual('/');
      // A slash only left segment with an empty right segment stays the root.
      expect(FileUtils.joinPath('/', '')).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1200
     * @tc.name      testFileEdge0012
     * @tc.desc      Verify joinPath concatenates two long segments with
     *               exactly one inserted separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the left segment with an index based loop.
      let left: string = 'L';
      let index: number = 0;
      while (index < LONG_NAME) {
        left = left + 'x';
        index = index + 1;
      }
      // Build the right segment with the same loop bounds.
      let right: string = 'R';
      index = 0;
      while (index < LONG_NAME) {
        right = right + 'y';
        index = index + 1;
      }
      // Exactly one separator sits between the two long segments.
      expect(FileUtils.joinPath(left, right)).assertEqual(left + '/' + right);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1300
     * @tc.name      testFileEdge0013
     * @tc.desc      Verify joinPath only normalises the boundary separators
     *               and keeps inner doubled separators untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Inner doubled separators of the left segment survive.
      expect(FileUtils.joinPath('a//b', 'c')).assertEqual('a//b/c');
      // A doubled boundary collapses and inner doubles survive.
      expect(FileUtils.joinPath('/a/', '/b//c')).assertEqual('/a/b//c');
      // A run of trailing separators only drops the boundary duplicate.
      expect(FileUtils.joinPath('a////', '/b')).assertEqual('a////b');
      // A doubled boundary pair produces exactly the three slashes.
      expect(FileUtils.joinPath('a//', '//b')).assertEqual('a///b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1400
     * @tc.name      testFileEdge0014
     * @tc.desc      Verify joinPath preserves unicode directory and file
     *               segments including blanks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two unicode segments join with one separator.
      expect(FileUtils.joinPath('相册', '照片.png')).assertEqual('相册/照片.png');
      // A unicode name with a blank joins to a padded storage path.
      expect(FileUtils.joinPath('/storage/', '照片 1.jpg')).assertEqual('/storage/照片 1.jpg');
      // The joined unicode path still resolves to its extension.
      expect(FileUtils.getExtension(FileUtils.joinPath('相册', '照片.png'))).assertEqual('png');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1500
     * @tc.name      testFileEdge0015
     * @tc.desc      Verify joinPath keeps exactly one separator for every
     *               boundary combination of bare and slash terminated parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A rooted right segment joins without doubling.
      expect(FileUtils.joinPath('a', '/b/c')).assertEqual('a/b/c');
      // A terminated left segment joins without doubling.
      expect(FileUtils.joinPath('/a/', 'b/c')).assertEqual('/a/b/c');
      // A terminated right segment keeps its trailing slash.
      expect(FileUtils.joinPath('a/', 'b/')).assertEqual('a/b/');
      // A bare pair gets exactly one inserted separator.
      expect(FileUtils.joinPath('a', 'b/')).assertEqual('a/b/');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1600
     * @tc.name      testFileEdge0016
     * @tc.desc      Verify the joined export path of two chained calls still
     *               resolves to its file name and extension.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chain two joins into the export directory path.
      const joined: string = FileUtils.joinPath(FileUtils.joinPath('/root/', 'dir'), 'file.txt');
      expect(joined).assertEqual('/root/dir/file.txt');
      // The joined path resolves to the tail name.
      expect(FileUtils.getFileName(joined)).assertEqual('file.txt');
      // The joined path resolves to the tail extension.
      expect(FileUtils.getExtension(joined)).assertEqual('txt');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1700
     * @tc.name      testFileEdge0017
     * @tc.desc      Verify blank padded names are preserved by the name and
     *               extension helpers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A name with inner blanks is handed back unchanged.
      expect(FileUtils.getFileName('/dir/my file.txt')).assertEqual('my file.txt');
      // The inner blank extension folds without touching the blank.
      expect(FileUtils.getExtension('/dir/my file.txt')).assertEqual('txt');
      // A trailing blank name is preserved.
      expect(FileUtils.getFileName('/dir/name ')).assertEqual('name ');
      // A trailing blank after the marker folds and keeps the blank.
      expect(FileUtils.getExtension('file.TXT ')).assertEqual('txt ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1800
     * @tc.name      testFileEdge0018
     * @tc.desc      Verify the empty path guards of exists, deleteFile and
     *               deleteDir answer deterministically before any fileIo
     *               call happens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path guard reports a missing path.
      expect(FileUtils.exists('')).assertFalse();
      // Deleting an empty path is treated as already deleted.
      expect(FileUtils.deleteFile('')).assertTrue();
      // Deleting an empty directory is treated as already deleted.
      expect(FileUtils.deleteDir('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_1900
     * @tc.name      testFileEdge0019
     * @tc.desc      Verify the empty path guards of writeText, appendText,
     *               createDir and ensureDir reject the operation before any
     *               fileIo call happens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Writing to an empty path is rejected.
      expect(FileUtils.writeText('', 'content')).assertFalse();
      // Appending to an empty path is rejected.
      expect(FileUtils.appendText('', 'content')).assertFalse();
      // Creating an empty directory is rejected.
      expect(FileUtils.createDir('')).assertFalse();
      // Ensuring an empty directory chain is rejected.
      expect(FileUtils.ensureDir('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_2000
     * @tc.name      testFileEdge0020
     * @tc.desc      Verify the empty source guard of copyFile and moveFile
     *               rejects the operation before any fileIo call happens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Copying from an empty source is rejected.
      expect(FileUtils.copyFile('', 'dest.txt')).assertFalse();
      // Moving from an empty source is rejected.
      expect(FileUtils.moveFile('', 'dest.txt')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_2100
     * @tc.name      testFileEdge0021
     * @tc.desc      Verify digit only directory tails and extensions resolve
     *               like letter based names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A digit tail of a directory chain resolves as the name.
      expect(FileUtils.getFileName('123/456')).assertEqual('456');
      // A digit suffix resolves as the extension.
      expect(FileUtils.getExtension('456.789')).assertEqual('789');
      // A zero padded camera name is returned unchanged.
      expect(FileUtils.getFileName('007.jpg')).assertEqual('007.jpg');
      // The zero padded name keeps its extension.
      expect(FileUtils.getExtension('007.jpg')).assertEqual('jpg');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_2200
     * @tc.name      testFileEdge0022
     * @tc.desc      Verify getFileName and getExtension resolve a leaf that
     *               sits behind fifty programmatically built directories.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the long directory chain with an index based loop.
      let chain: string = '';
      let index: number = 0;
      while (index < DEEP_CHAIN) {
        chain = chain + '/l' + String(index);
        index = index + 1;
      }
      const deepPath: string = chain + '/file.dat';
      // The leaf of the chain is the file name.
      expect(FileUtils.getFileName(deepPath)).assertEqual('file.dat');
      // The leaf extension resolves from the deep path.
      expect(FileUtils.getExtension(deepPath)).assertEqual('dat');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_2300
     * @tc.name      testFileEdge0023
     * @tc.desc      Verify getExtension keeps query and fragment suffixes of
     *               uri style inputs untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testFileEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A query suffix after the marker stays part of the extension.
      expect(FileUtils.getExtension('photo.jpg?width=200')).assertEqual('jpg?width=200');
      // A fragment suffix after the marker stays part of the extension.
      expect(FileUtils.getExtension('clip.mp4#t=10')).assertEqual('mp4#t=10');
      // The query suffix name is handed back unchanged.
      expect(FileUtils.getFileName('photo.jpg?width=200')).assertEqual('photo.jpg?width=200');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FILEEDGE_2400
     * @tc.name      testFileEdge0024
     * @tc.desc      Verify joinPath keeps dotted directory segments and the
     *               joined path still resolves name and extension.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFileEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFileEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A dotted directory joins with a double suffix archive.
      const joined: string = FileUtils.joinPath('dir.v2', 'file.tar.gz');
      expect(joined).assertEqual('dir.v2/file.tar.gz');
      // The joined path resolves to the archive name.
      expect(FileUtils.getFileName(joined)).assertEqual('file.tar.gz');
      // The joined path resolves to the last suffix.
      expect(FileUtils.getExtension(joined)).assertEqual('gz');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
