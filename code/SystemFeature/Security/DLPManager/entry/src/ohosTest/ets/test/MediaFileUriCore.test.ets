/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, it, expect, beforeAll, afterEach, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import MediaFileUri from '../../../main/ets/media/MediaFileUri';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF814;
const TAG: string = 'MediaFileUriTest';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

const SMILE: string = String.fromCharCode(0xD83D, 0xDE00);

let testDir: string = '';
const currentFiles: string[] = [];

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function utf8ByteLength(content: string): number {
  let bytes: number = 0;
  for (let i = 0; i < content.length; i++) {
    const code: number = content.charCodeAt(i);
    if (code < 0x80) {
      bytes += 1;
    } else if (code < 0x800) {
      bytes += 2;
    } else if (code >= 0xD800 && code <= 0xDBFF) {
      bytes += 4;
      i++;
    } else {
      bytes += 3;
    }
  }
  return bytes;
}

function padTo4096Bytes(content: string): string {
  let result: string = content;
  const padding: number = 4096 - utf8ByteLength(content);
  for (let i = 0; i < padding; i++) {
    result += '\u0000';
  }
  return result;
}

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let i = 0; i < count; i++) {
    result += ch;
  }
  return result;
}

function newFile(caseNo: string): string {
  const path: string = testDir + '/dlp_mfu_' + caseNo + '.txt';
  currentFiles.push(path);
  return path;
}

function ensureSeedFile(path: string, content: string): void {
  const file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, content);
  fs.closeSync(file);
}

function removeQuietly(path: string): void {
  try {
    fs.unlinkSync(path);
  } catch (error) {
    log('unlink skip: ' + String(error));
  }
}

function accessExists(path: string): boolean {
  let ok: boolean = false;
  try {
    ok = fs.accessSync(path);
  } catch (error) {
    log('access failed: ' + String(error));
  }
  return ok;
}

export default function mediaFileUriCoreTest(): void {
  describe('MediaFileUriCoreTest', () => {
    beforeAll(async () => {
      log('suite start');
      testDir = delegator.getAppContext().filesDir;
      log('testDir: ' + testDir);
    });

    afterEach(async () => {
      while (currentFiles.length > 0) {
        const path: string = currentFiles.pop() as string;
        removeQuietly(path);
      }
    });

    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0301
     * @tc.name      testMediaFileUri0301
     * @tc.desc      Verify the controller instantiates as a non null object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0301 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst).assertEqual('object');
      expect(inst !== null && inst !== undefined).assertTrue();
      log('testMediaFileUri0301 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0302
     * @tc.name      testMediaFileUri0302
     * @tc.desc      Verify two controller instances are distinct objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0302 begin');
      const first: MediaFileUri = new MediaFileUri();
      const second: MediaFileUri = new MediaFileUri();
      expect(first === second).assertFalse();
      log('testMediaFileUri0302 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0303
     * @tc.name      testMediaFileUri0303
     * @tc.desc      Verify readFileContent is exposed as a function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0303 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst.readFileContent).assertEqual('function');
      log('testMediaFileUri0303 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0304
     * @tc.name      testMediaFileUri0304
     * @tc.desc      Verify writeFileContent is exposed as a function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0304 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst.writeFileContent).assertEqual('function');
      log('testMediaFileUri0304 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0305
     * @tc.name      testMediaFileUri0305
     * @tc.desc      Verify myWriteSync is exposed as a function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0305 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst.myWriteSync).assertEqual('function');
      log('testMediaFileUri0305 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0306
     * @tc.name      testMediaFileUri0306
     * @tc.desc      Verify closeSync is exposed as a function member.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0306 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst.closeSync).assertEqual('function');
      log('testMediaFileUri0306 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0307
     * @tc.name      testMediaFileUri0307
     * @tc.desc      Verify the expected string builder pads empty content to 4096 chars.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0307 begin');
      expect(padTo4096Bytes('').length).assertEqual(4096);
      log('testMediaFileUri0307 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0308
     * @tc.name      testMediaFileUri0308
     * @tc.desc      Verify the expected string builder pads one ASCII char correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0308 begin');
      const padded: string = padTo4096Bytes('a');
      expect(padded.length).assertEqual(4096);
      expect(padded.charAt(0)).assertEqual('a');
      expect(padded.charCodeAt(1)).assertEqual(0);
      log('testMediaFileUri0308 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0309
     * @tc.name      testMediaFileUri0309
     * @tc.desc      Verify the expected string builder pads CJK content by byte size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0309 begin');
      const padded: string = padTo4096Bytes('你好世界');
      expect(padded.length).assertEqual(4088);
      log('testMediaFileUri0309 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0310
     * @tc.name      testMediaFileUri0310
     * @tc.desc      Verify the expected string builder pads emoji content by byte size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0310 begin');
      const padded: string = padTo4096Bytes(SMILE);
      expect(padded.length).assertEqual(4094);
      log('testMediaFileUri0310 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0311
     * @tc.name      testMediaFileUri0311
     * @tc.desc      Verify the byte length helper measures empty and ASCII strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0311 begin');
      expect(utf8ByteLength('')).assertEqual(0);
      expect(utf8ByteLength('a')).assertEqual(1);
      log('testMediaFileUri0311 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0312
     * @tc.name      testMediaFileUri0312
     * @tc.desc      Verify the byte length helper measures CJK and emoji strings.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0312 begin');
      expect(utf8ByteLength('中')).assertEqual(3);
      expect(utf8ByteLength(SMILE)).assertEqual(4);
      log('testMediaFileUri0312 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0335
     * @tc.name      testMediaFileUri0335
     * @tc.desc      Verify reading a nonexistent path returns an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0335 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const actual: string = inst.readFileContent(testDir + '/dlp_mfu_missing.txt');
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      log('testMediaFileUri0335 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0336
     * @tc.name      testMediaFileUri0336
     * @tc.desc      Verify reading a directory path returns an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0336 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const actual: string = inst.readFileContent(testDir);
      expect(actual).assertEqual('');
      log('testMediaFileUri0336 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0346
     * @tc.name      testMediaFileUri0346
     * @tc.desc      Verify two sequential fresh reads return identical content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0346 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0346');
      ensureSeedFile(path, 'hello');
      const first: string = inst.readFileContent(path);
      const second: string = inst.readFileContent(path);
      expect(first === second).assertTrue();
      log('testMediaFileUri0346 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0347
     * @tc.name      testMediaFileUri0347
     * @tc.desc      Verify a nonexistent path read with isRead false stays empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0347 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(inst.readFileContent(testDir + '/dlp_mfu_missing2.txt', false)).assertEqual('');
      log('testMediaFileUri0347 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0348
     * @tc.name      testMediaFileUri0348
     * @tc.desc      Verify a directory read with isRead false stays empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0348 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(inst.readFileContent(testDir, false)).assertEqual('');
      log('testMediaFileUri0348 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0352
     * @tc.name      testMediaFileUri0352
     * @tc.desc      Verify reading a missing nested path returns an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0352 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(inst.readFileContent(testDir + '/missing_dir/x.txt')).assertEqual('');
      log('testMediaFileUri0352 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0370
     * @tc.name      testMediaFileUri0370
     * @tc.desc      Verify closing an already closed descriptor does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0370 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0370');
      const file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      inst.closeSync(file.fd);
      inst.closeSync(file.fd);
      expect(typeof inst.closeSync(file.fd)).assertEqual('undefined');
      log('testMediaFileUri0370 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0371
     * @tc.name      testMediaFileUri0371
     * @tc.desc      Verify closing an invalid descriptor does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0371 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst.closeSync(-1)).assertEqual('undefined');
      log('testMediaFileUri0371 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0372
     * @tc.name      testMediaFileUri0372
     * @tc.desc      Verify writing through an invalid descriptor does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0372 begin');
      const inst: MediaFileUri = new MediaFileUri();
      expect(typeof inst.myWriteSync(-1, 'x', false)).assertEqual('undefined');
      log('testMediaFileUri0372 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0378
     * @tc.name      testMediaFileUri0378
     * @tc.desc      Verify the write helpers return undefined results.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0378 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0378');
      const file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      expect(typeof inst.myWriteSync(file.fd, 'x', true)).assertEqual('undefined');
      expect(typeof inst.closeSync(file.fd)).assertEqual('undefined');
      log('testMediaFileUri0378 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0379
     * @tc.name      testMediaFileUri0379
     * @tc.desc      Verify a 4096 byte open write fills the read buffer exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0379 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0379');
      const file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      inst.myWriteSync(file.fd, repeatChar('a', 4096), false);
      inst.closeSync(file.fd);
      expect(inst.readFileContent(path)).assertEqual(repeatChar('a', 4096));
      log('testMediaFileUri0379 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0381
     * @tc.name      testMediaFileUri0381
     * @tc.desc      Verify writing through a closed descriptor does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0381 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0381');
      const file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      const fd: number = file.fd;
      fs.closeSync(file);
      expect(typeof inst.myWriteSync(fd, 'x', false)).assertEqual('undefined');
      log('testMediaFileUri0381 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0387
     * @tc.name      testMediaFileUri0387
     * @tc.desc      Verify a 4096 byte file reads back without padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0387 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0387');
      const content: string = repeatChar('a', 4096);
      ensureSeedFile(path, content);
      expect(inst.readFileContent(path)).assertEqual(content);
      log('testMediaFileUri0387 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0388
     * @tc.name      testMediaFileUri0388
     * @tc.desc      Verify a 4097 byte file is truncated to the buffer size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0388 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0388');
      ensureSeedFile(path, repeatChar('a', 4097));
      expect(inst.readFileContent(path)).assertEqual(repeatChar('a', 4096));
      log('testMediaFileUri0388 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0389
     * @tc.name      testMediaFileUri0389
     * @tc.desc      Verify a 5000 byte file is truncated to 4096 characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0389 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0389');
      ensureSeedFile(path, repeatChar('a', 5000));
      expect(inst.readFileContent(path)).assertEqual(repeatChar('a', 4096));
      log('testMediaFileUri0389 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0390
     * @tc.name      testMediaFileUri0390
     * @tc.desc      Verify an 8192 byte file is truncated to 4096 characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0390 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0390');
      ensureSeedFile(path, repeatChar('z', 8192));
      expect(inst.readFileContent(path)).assertEqual(repeatChar('z', 4096));
      log('testMediaFileUri0390 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0398
     * @tc.name      testMediaFileUri0398
     * @tc.desc      Verify distinct instances expose the same function members.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0398 begin');
      const first: MediaFileUri = new MediaFileUri();
      const second: MediaFileUri = new MediaFileUri();
      expect(typeof first.readFileContent).assertEqual('function');
      expect(typeof second.readFileContent).assertEqual('function');
      log('testMediaFileUri0398 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0400
     * @tc.name      testMediaFileUri0400
     * @tc.desc      Verify the seed helper creates an accessible file.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0400 begin');
      const path: string = newFile('0400');
      ensureSeedFile(path, 'x');
      expect(accessExists(path)).assertTrue();
      log('testMediaFileUri0400 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0401
     * @tc.name      testMediaFileUri0401
     * @tc.desc      Verify access fails after the test file is removed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0401 begin');
      const path: string = newFile('0401');
      ensureSeedFile(path, 'x');
      removeQuietly(path);
      expect(accessExists(path)).assertFalse();
      log('testMediaFileUri0401 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0402
     * @tc.name      testMediaFileUri0402
     * @tc.desc      Verify reading a removed file returns an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0402 begin');
      const inst: MediaFileUri = new MediaFileUri();
      const path: string = newFile('0402');
      ensureSeedFile(path, 'x');
      removeQuietly(path);
      expect(inst.readFileContent(path)).assertEqual('');
      log('testMediaFileUri0402 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0403
     * @tc.name      testMediaFileUri0403
     * @tc.desc      Verify removing the same file twice does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0403 begin');
      const path: string = newFile('0403');
      ensureSeedFile(path, 'x');
      removeQuietly(path);
      removeQuietly(path);
      expect(true).assertTrue();
      log('testMediaFileUri0403 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_MEDIAFILEURI_0404
     * @tc.name      testMediaFileUri0404
     * @tc.desc      Verify the sandbox test directory itself is accessible.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMediaFileUri0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMediaFileUri0404 begin');
      expect(accessExists(testDir)).assertTrue();
      log('testMediaFileUri0404 end');
    })
  })
}
