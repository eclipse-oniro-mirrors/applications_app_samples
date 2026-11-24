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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { appContext, errorCode, ERR_NO_SUCH_FILE, writeText, appendText } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function cacheIoMatrixTest() {
  describe('CacheIoMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0001
     * @tc.name      testCacheIo0001
     * @tc.desc      filesDir write and read exact bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_0_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0001', 'file ' + name);
      const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
      const written: number = fs.writeSync(file.fd, 'payload-filesDir-1-alpha');
      fs.closeSync(file);
      expect(written).assertEqual(24);
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.statSync(path).isFile()).assertTrue();
      expect(fs.statSync(path).size).assertEqual(24);
      expect(fs.readTextSync(path)).assertEqual('payload-filesDir-1-alpha');
      fs.unlinkSync(path);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0002
     * @tc.name      testCacheIo0002
     * @tc.desc      filesDir append grows the file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_1_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0002', 'file ' + name);
      writeText(path, 'seed-filesDir-2');
      expect(fs.statSync(path).size).assertEqual(15);
      appendText(path, '|add-one-filesDir-2');
      expect(fs.statSync(path).size).assertEqual(34);
      appendText(path, '|add-two-filesDir-2');
      expect(fs.statSync(path).size).assertEqual(53);
      expect(fs.readTextSync(path)).assertEqual('seed-filesDir-2|add-one-filesDir-2|add-two-filesDir-2');
      expect(fs.readTextSync(path).endsWith('|add-two-filesDir-2')).assertTrue();
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0003
     * @tc.name      testCacheIo0003
     * @tc.desc      filesDir truncate drops old body
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_2_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0003', 'file ' + name);
      writeText(path, 'first-version-filesDir-3-with-tail');
      expect(fs.readTextSync(path)).assertEqual('first-version-filesDir-3-with-tail');
      const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'second-filesDir-3');
      fs.closeSync(file);
      expect(fs.statSync(path).size).assertEqual(17);
      expect(fs.readTextSync(path)).assertEqual('second-filesDir-3');
      expect(fs.readTextSync(path).includes('first-version')).assertFalse();
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0004
     * @tc.name      testCacheIo0004
     * @tc.desc      filesDir multiline content keeps rows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_3_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0004', 'file ' + name);
      const rows: string[] = [
        'row-one-filesDir-4',
        'row-two-filesDir-4',
        'row-three-filesDir-4',
        'row-four-filesDir-4'];
      const body: string = rows.join('\n');
      writeText(path, body);
      const text: string = fs.readTextSync(path);
      const parts: string[] = text.split('\n');
      expect(parts.length).assertEqual(4);
      expect(parts[0]).assertEqual(rows[0]);
      expect(parts[3]).assertEqual(rows[3]);
      expect(text.indexOf('\n')).assertEqual(rows[0].length);
      expect(fs.statSync(path).size).assertEqual(body.length);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0005
     * @tc.name      testCacheIo0005
     * @tc.desc      filesDir padded content trims clean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_4_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0005', 'file ' + name);
      writeText(path, '   padded-filesDir-5   ');
      const text: string = fs.readTextSync(path);
      expect(text.length).assertEqual(23);
      expect(text.trim()).assertEqual('padded-filesDir-5');
      expect(text.trim().length).assertEqual(17);
      expect(text.startsWith('   ')).assertTrue();
      expect(text.endsWith('   ')).assertTrue();
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0006
     * @tc.name      testCacheIo0006
     * @tc.desc      filesDir long content stays intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_5_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0006', 'file ' + name);
      const chunk: string = 'long-content-filesDir-6-';
      writeText(path, chunk.repeat(16));
      const text: string = fs.readTextSync(path);
      expect(text.length).assertEqual(384);
      expect(fs.statSync(path).size).assertEqual(384);
      expect(text.startsWith(chunk)).assertTrue();
      expect(text.endsWith(chunk)).assertTrue();
      expect(text.split('long-content').length).assertEqual(17);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0007
     * @tc.name      testCacheIo0007
     * @tc.desc      filesDir nested directory holds file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_6_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0007', 'file ' + name);
      const sub: string = dir + '/nested-filesDir-7';
      fs.mkdirSync(sub);
      expect(fs.accessSync(sub)).assertTrue();
      expect(fs.statSync(sub).isDirectory()).assertTrue();
      const inner: string = sub + '/inner.txt';
      writeText(inner, 'inside-filesDir-7');
      expect(fs.readTextSync(inner)).assertEqual('inside-filesDir-7');
      expect(fs.statSync(sub).isDirectory()).assertTrue();
      fs.unlinkSync(inner);
      fs.rmdirSync(sub);
      expect(fs.accessSync(sub)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0008
     * @tc.name      testCacheIo0008
     * @tc.desc      filesDir rename moves the file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_7_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0008', 'file ' + name);
      writeText(path, 'rename-body-filesDir-8');
      const target: string = dir + '/renamed-filesDir-8.txt';
      fs.renameSync(path, target);
      expect(fs.accessSync(path)).assertFalse();
      expect(fs.accessSync(target)).assertTrue();
      expect(fs.readTextSync(target)).assertEqual('rename-body-filesDir-8');
      expect(fs.statSync(target).size).assertEqual(22);
      fs.unlinkSync(target);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0009
     * @tc.name      testCacheIo0009
     * @tc.desc      filesDir copy duplicates the body
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_8_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0009', 'file ' + name);
      writeText(path, 'copy-body-filesDir-9');
      const target: string = dir + '/copy-target-filesDir-9.txt';
      fs.copyFileSync(path, target);
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.accessSync(target)).assertTrue();
      expect(fs.readTextSync(target)).assertEqual('copy-body-filesDir-9');
      expect(fs.readTextSync(target)).assertEqual(fs.readTextSync(path));
      expect(fs.statSync(target).size).assertEqual(fs.statSync(path).size);
      fs.unlinkSync(target);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0010
     * @tc.name      testCacheIo0010
     * @tc.desc      filesDir stat reports file metrics
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_9_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0010', 'file ' + name);
      writeText(path, 'stat-body-filesDir-10');
      const stat: fs.Stat = fs.statSync(path);
      expect(stat.isFile()).assertTrue();
      expect(stat.isDirectory()).assertFalse();
      expect(stat.size).assertEqual(21);
      expect(stat.size > 0).assertTrue();
      expect(fs.readTextSync(path).length).assertEqual(stat.size);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0011
     * @tc.name      testCacheIo0011
     * @tc.desc      filesDir two files stay independent
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_10_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0011', 'file ' + name);
      const second: string = dir + '/second-filesDir-11.txt';
      writeText(path, 'pair-a-filesDir-11');
      writeText(second, 'pair-b-filesDir-11');
      expect(fs.readTextSync(path)).assertEqual('pair-a-filesDir-11');
      expect(fs.readTextSync(second)).assertEqual('pair-b-filesDir-11');
      expect(fs.statSync(path).size).assertEqual(18);
      expect(fs.statSync(second).size).assertEqual(18);
      expect(fs.readTextSync(path) === fs.readTextSync(second)).assertFalse();
      fs.unlinkSync(path);
      fs.unlinkSync(second);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0012
     * @tc.name      testCacheIo0012
     * @tc.desc      filesDir unlink removes the file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_11_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0012', 'file ' + name);
      writeText(path, 'remove-me-filesDir-12');
      expect(fs.accessSync(path)).assertTrue();
      fs.unlinkSync(path);
      expect(fs.accessSync(path)).assertFalse();
      expect(fs.statSync(dir).isDirectory()).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0013
     * @tc.name      testCacheIo0013
     * @tc.desc      filesDir empty file reads empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_12_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0013', 'file ' + name);
      writeText(path, '');
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.statSync(path).size).assertEqual(0);
      expect(fs.readTextSync(path)).assertEqual('');
      expect(fs.readTextSync(path).length).assertEqual(0);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0014
     * @tc.name      testCacheIo0014
     * @tc.desc      filesDir case conversion is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_13_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0014', 'file ' + name);
      writeText(path, 'MixedCase-filesDir-14');
      const text: string = fs.readTextSync(path);
      expect(text).assertEqual('MixedCase-filesDir-14');
      expect(text.toUpperCase()).assertEqual('MIXEDCASE-FILESDIR-14');
      expect(text.toLowerCase()).assertEqual('mixedcase-filesdir-14');
      expect(text.toUpperCase().length).assertEqual(text.length);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0015
     * @tc.name      testCacheIo0015
     * @tc.desc      filesDir character sum survives disk
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_14_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0015', 'file ' + name);
      writeText(path, 'sum-body-filesDir-15');
      const text: string = fs.readTextSync(path);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1826);
      expect(text.charCodeAt(0)).assertEqual(115);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0016
     * @tc.name      testCacheIo0016
     * @tc.desc      filesDir repeated characters persist
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_15_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0016', 'file ' + name);
      writeText(path, 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-filesDir-16');
      const text: string = fs.readTextSync(path);
      expect(text.length).assertEqual(76);
      expect(text.startsWith('zzzz')).assertTrue();
      expect(text.endsWith('filesDir-16')).assertTrue();
      expect(text.split('z').length).assertEqual(65);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0017
     * @tc.name      testCacheIo0017
     * @tc.desc      filesDir digit sequence survives disk
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_16_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0017', 'file ' + name);
      writeText(path, '0123456789-filesDir-17');
      const text: string = fs.readTextSync(path);
      expect(text.substring(0, 10)).assertEqual('0123456789');
      expect(text.indexOf('5')).assertEqual(5);
      expect(text.includes('filesDir-17')).assertTrue();
      expect(text.length).assertEqual(22);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0018
     * @tc.name      testCacheIo0018
     * @tc.desc      filesDir tab separated content holds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_17_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0018', 'file ' + name);
      writeText(path, 'col-a-filesDir-18\tcol-b-filesDir-18');
      const text: string = fs.readTextSync(path);
      expect(text.indexOf('\t')).assertEqual(17);
      expect(text.split('\t').length).assertEqual(2);
      expect(text.split('\t')[1]).assertEqual('col-b-filesDir-18');
      expect(fs.statSync(path).size).assertEqual(text.length);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0019
     * @tc.name      testCacheIo0019
     * @tc.desc      filesDir newline append splits rows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_18_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0019', 'file ' + name);
      writeText(path, 'header-filesDir-19');
      appendText(path, '\nfooter-filesDir-19');
      const text: string = fs.readTextSync(path);
      expect(text.split('\n').length).assertEqual(2);
      expect(text.split('\n')[1]).assertEqual('footer-filesDir-19');
      expect(text.startsWith('header-filesDir-19')).assertTrue();
      expect(fs.statSync(path).size).assertEqual(37);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0020
     * @tc.name      testCacheIo0020
     * @tc.desc      filesDir substring windows match
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_19_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0020', 'file ' + name);
      writeText(path, 'abcdefghijklmnop-filesDir-20');
      const text: string = fs.readTextSync(path);
      expect(text.substring(0, 4)).assertEqual('abcd');
      expect(text.substring(4, 8)).assertEqual('efgh');
      expect(text.substring(8, 12)).assertEqual('ijkl');
      expect(text.substring(12, 16)).assertEqual('mnop');
      expect(text.substring(16)).assertEqual('-filesDir-20');
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0021
     * @tc.name      testCacheIo0021
     * @tc.desc      filesDir sibling directory coexists
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_20_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0021', 'file ' + name);
      const sibling: string = dir + '/sibling-filesDir-21';
      fs.mkdirSync(sibling);
      writeText(path, 'sibling-body-filesDir-21');
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.statSync(sibling).isDirectory()).assertTrue();
      expect(fs.statSync(path).isFile()).assertTrue();
      expect(fs.readTextSync(path)).assertEqual('sibling-body-filesDir-21');
      fs.unlinkSync(path);
      fs.rmdirSync(sibling);
      expect(fs.accessSync(sibling)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0022
     * @tc.name      testCacheIo0022
     * @tc.desc      filesDir parent path stays prefix
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_21_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0022', 'file ' + name);
      writeText(path, 'parent-body-filesDir-22');
      expect(path.startsWith(dir + '/')).assertTrue();
      expect(path.substring(0, path.length - name.length)).assertEqual(dir + '/');
      expect(name.indexOf('/')).assertEqual(-1);
      expect(fs.readTextSync(path)).assertEqual('parent-body-filesDir-22');
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0023
     * @tc.name      testCacheIo0023
     * @tc.desc      filesDir unlink one keeps the other
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_22_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0023', 'file ' + name);
      const second: string = dir + '/drop-filesDir-23.txt';
      writeText(path, 'keep-filesDir-23');
      writeText(second, 'drop-filesDir-23');
      fs.unlinkSync(second);
      expect(fs.accessSync(second)).assertFalse();
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.readTextSync(path)).assertEqual('keep-filesDir-23');
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0024
     * @tc.name      testCacheIo0024
     * @tc.desc      filesDir cleanup leaves no residue
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().filesDir;
      const name: string = 'io_filesDir_23_files.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0024', 'file ' + name);
      writeText(path, 'leftover-filesDir-24');
      fs.unlinkSync(path);
      expect(fs.accessSync(path)).assertFalse();
      expect(fs.accessSync(dir)).assertTrue();
      expect(fs.statSync(dir).isDirectory()).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0025
     * @tc.name      testCacheIo0025
     * @tc.desc      cacheDir write and read exact bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().cacheDir;
      const name: string = 'io_cacheDir_100_cache.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0025', 'file ' + name);
      const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
      const written: number = fs.writeSync(file.fd, 'payload-cacheDir-1-alpha');
      fs.closeSync(file);
      expect(written).assertEqual(24);
      expect(fs.accessSync(path)).assertTrue();
      expect(fs.statSync(path).isFile()).assertTrue();
      expect(fs.statSync(path).size).assertEqual(24);
      expect(fs.readTextSync(path)).assertEqual('payload-cacheDir-1-alpha');
      fs.unlinkSync(path);
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0026
     * @tc.name      testCacheIo0026
     * @tc.desc      cacheDir append grows the file
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().cacheDir;
      const name: string = 'io_cacheDir_101_cache.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0026', 'file ' + name);
      writeText(path, 'seed-cacheDir-2');
      expect(fs.statSync(path).size).assertEqual(15);
      appendText(path, '|add-one-cacheDir-2');
      expect(fs.statSync(path).size).assertEqual(34);
      appendText(path, '|add-two-cacheDir-2');
      expect(fs.statSync(path).size).assertEqual(53);
      expect(fs.readTextSync(path)).assertEqual('seed-cacheDir-2|add-one-cacheDir-2|add-two-cacheDir-2');
      expect(fs.readTextSync(path).endsWith('|add-two-cacheDir-2')).assertTrue();
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0027
     * @tc.name      testCacheIo0027
     * @tc.desc      cacheDir truncate drops old body
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().cacheDir;
      const name: string = 'io_cacheDir_102_cache.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0027', 'file ' + name);
      writeText(path, 'first-version-cacheDir-3-with-tail');
      expect(fs.readTextSync(path)).assertEqual('first-version-cacheDir-3-with-tail');
      const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'second-cacheDir-3');
      fs.closeSync(file);
      expect(fs.statSync(path).size).assertEqual(17);
      expect(fs.readTextSync(path)).assertEqual('second-cacheDir-3');
      expect(fs.readTextSync(path).includes('first-version')).assertFalse();
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0028
     * @tc.name      testCacheIo0028
     * @tc.desc      cacheDir multiline content keeps rows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().cacheDir;
      const name: string = 'io_cacheDir_103_cache.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0028', 'file ' + name);
      const rows: string[] = [
        'row-one-cacheDir-4',
        'row-two-cacheDir-4',
        'row-three-cacheDir-4',
        'row-four-cacheDir-4'];
      const body: string = rows.join('\n');
      writeText(path, body);
      const text: string = fs.readTextSync(path);
      const parts: string[] = text.split('\n');
      expect(parts.length).assertEqual(4);
      expect(parts[0]).assertEqual(rows[0]);
      expect(parts[3]).assertEqual(rows[3]);
      expect(text.indexOf('\n')).assertEqual(rows[0].length);
      expect(fs.statSync(path).size).assertEqual(body.length);
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0029
     * @tc.name      testCacheIo0029
     * @tc.desc      cacheDir padded content trims clean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().cacheDir;
      const name: string = 'io_cacheDir_104_cache.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0029', 'file ' + name);
      writeText(path, '   padded-cacheDir-5   ');
      const text: string = fs.readTextSync(path);
      expect(text.length).assertEqual(23);
      expect(text.trim()).assertEqual('padded-cacheDir-5');
      expect(text.trim().length).assertEqual(17);
      expect(text.startsWith('   ')).assertTrue();
      expect(text.endsWith('   ')).assertTrue();
      fs.unlinkSync(path);
    });
    /**
     * @tc.number    SUB_IHSP_CIO_0030
     * @tc.name      testCacheIo0030
     * @tc.desc      cacheDir long content stays intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCacheIo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const dir: string = appContext().cacheDir;
      const name: string = 'io_cacheDir_105_cache.txt';
      const path: string = dir + '/' + name;
      logCase('testCacheIo0030', 'file ' + name);
      const chunk: string = 'long-content-cacheDir-6-';
      writeText(path, chunk.repeat(16));
      const text: string = fs.readTextSync(path);
      expect(text.length).assertEqual(384);
      expect(fs.statSync(path).size).assertEqual(384);
      expect(text.startsWith(chunk)).assertTrue();
      expect(text.endsWith(chunk)).assertTrue();
      expect(text.split('long-content').length).assertEqual(17);
      fs.unlinkSync(path);
    });
;
  });
}
