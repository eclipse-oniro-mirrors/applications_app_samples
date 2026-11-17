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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { bufferToString } from '../../../main/ets/media/MediaFileUri';

const DOMAIN: number = 0xF814;
const TAG: string = 'BufferToStringTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function bytesToBuffer(codes: number[]): ArrayBuffer {
  const buffer: ArrayBuffer = new ArrayBuffer(codes.length);
  const view: Uint8Array = new Uint8Array(buffer);
  for (let i = 0; i < codes.length; i++) {
    view[i] = codes[i];
  }
  return buffer;
}

function asciiCodes(text: string): number[] {
  const codes: number[] = [];
  for (let i = 0; i < text.length; i++) {
    codes.push(text.charCodeAt(i));
  }
  return codes;
}

function repeatedCodes(code: number, count: number): number[] {
  const codes: number[] = [];
  for (let i = 0; i < count; i++) {
    codes.push(code);
  }
  return codes;
}

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let i = 0; i < count; i++) {
    result += ch;
  }
  return result;
}

const SMILE: string = String.fromCharCode(0xD83D, 0xDE00);
const ROCKET: string = String.fromCharCode(0xD83D, 0xDE80);
const THUMB: string = String.fromCharCode(0xD83D, 0xDC4D);
const PARTY: string = String.fromCharCode(0xD83C, 0xDF89);
const FIRE: string = String.fromCharCode(0xD83D, 0xDD25);
const GLOW: string = String.fromCharCode(0xD83C, 0xDF1F);

export default function bufferToStringCoreTest(): void {
  describe('BufferToStringCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0201
     * @tc.name      testBufferToString0201
     * @tc.desc      Verify single ASCII byte decodes to the same character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0201 begin');
      const actual: string = bufferToString(bytesToBuffer([65]));
      expect(actual).assertEqual('A');
      expect(typeof actual).assertEqual('string');
      log('testBufferToString0201 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0202
     * @tc.name      testBufferToString0202
     * @tc.desc      Verify a short ASCII word decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0202 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('hello')));
      expect(actual).assertEqual('hello');
      expect(typeof actual).assertEqual('string');
      log('testBufferToString0202 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0203
     * @tc.name      testBufferToString0203
     * @tc.desc      Verify an ASCII sentence with spaces decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0203 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('hello world')));
      expect(actual).assertEqual('hello world');
      log('testBufferToString0203 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0204
     * @tc.name      testBufferToString0204
     * @tc.desc      Verify a mixed case product word decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0204 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('OpenHarmony')));
      expect(actual).assertEqual('OpenHarmony');
      log('testBufferToString0204 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0205
     * @tc.name      testBufferToString0205
     * @tc.desc      Verify letters and digits mix decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0205 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('abc123XYZ')));
      expect(actual).assertEqual('abc123XYZ');
      log('testBufferToString0205 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0206
     * @tc.name      testBufferToString0206
     * @tc.desc      Verify a digit sequence decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0206 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('0123456789')));
      expect(actual).assertEqual('0123456789');
      log('testBufferToString0206 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0207
     * @tc.name      testBufferToString0207
     * @tc.desc      Verify punctuation characters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0207 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('!@#$%^&*()_+-=[]{};:,.<>?/|')));
      expect(actual).assertEqual('!@#$%^&*()_+-=[]{};:,.<>?/|');
      log('testBufferToString0207 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0208
     * @tc.name      testBufferToString0208
     * @tc.desc      Verify a single space decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0208 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes(' ')));
      expect(actual).assertEqual(' ');
      log('testBufferToString0208 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0209
     * @tc.name      testBufferToString0209
     * @tc.desc      Verify multiple spaces decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0209 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('   ')));
      expect(actual).assertEqual('   ');
      log('testBufferToString0209 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0210
     * @tc.name      testBufferToString0210
     * @tc.desc      Verify a tab byte decodes to the tab character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0210 begin');
      const actual: string = bufferToString(bytesToBuffer([9]));
      expect(actual).assertEqual('\t');
      log('testBufferToString0210 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0211
     * @tc.name      testBufferToString0211
     * @tc.desc      Verify a newline between letters decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0211 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('a\nb')));
      expect(actual).assertEqual('a\nb');
      log('testBufferToString0211 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0212
     * @tc.name      testBufferToString0212
     * @tc.desc      Verify two text lines separated by newline decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0212 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('line1\nline2')));
      expect(actual).assertEqual('line1\nline2');
      log('testBufferToString0212 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0214
     * @tc.name      testBufferToString0214
     * @tc.desc      Verify a single lowercase letter decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0214 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('x')));
      expect(actual).assertEqual('x');
      log('testBufferToString0214 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0215
     * @tc.name      testBufferToString0215
     * @tc.desc      Verify repeated identical letters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0215 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('zz')));
      expect(actual).assertEqual('zz');
      log('testBufferToString0215 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0216
     * @tc.name      testBufferToString0216
     * @tc.desc      Verify four identical letters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0216 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('aaaa')));
      expect(actual).assertEqual('aaaa');
      log('testBufferToString0216 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0217
     * @tc.name      testBufferToString0217
     * @tc.desc      Verify a repeating group pattern decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0217 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('ab ab ab')));
      expect(actual).assertEqual('ab ab ab');
      log('testBufferToString0217 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0218
     * @tc.name      testBufferToString0218
     * @tc.desc      Verify a JSON like payload decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0218 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('{"k":"v"}')));
      expect(actual).assertEqual('{"k":"v"}');
      log('testBufferToString0218 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0219
     * @tc.name      testBufferToString0219
     * @tc.desc      Verify a sandbox file URI decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0219 begin');
      const actual: string = bufferToString(bytesToBuffer(
        asciiCodes('file://com.sample.dlpmanager/data/storage/el2/base/haps/entry/files')));
      expect(actual).assertEqual('file://com.sample.dlpmanager/data/storage/el2/base/haps/entry/files');
      log('testBufferToString0219 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0220
     * @tc.name      testBufferToString0220
     * @tc.desc      Verify a sandbox file path decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0220 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('data/storage/el2/base/files/a.txt')));
      expect(actual).assertEqual('data/storage/el2/base/files/a.txt');
      log('testBufferToString0220 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0221
     * @tc.name      testBufferToString0221
     * @tc.desc      Verify a hyphenated sample seed text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0221 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('UITEST-CONTENT-SEED')));
      expect(actual).assertEqual('UITEST-CONTENT-SEED');
      log('testBufferToString0221 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0222
     * @tc.name      testBufferToString0222
     * @tc.desc      Verify every printable ASCII code decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0222 begin');
      const codes: number[] = [];
      let expected: string = '';
      for (let code = 32; code <= 126; code++) {
        codes.push(code);
        expected += String.fromCharCode(code);
      }
      const actual: string = bufferToString(bytesToBuffer(codes));
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(95);
      log('testBufferToString0222 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0223
     * @tc.name      testBufferToString0223
     * @tc.desc      Verify a dotted address string decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0223 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('192.168.1.1')));
      expect(actual).assertEqual('192.168.1.1');
      log('testBufferToString0223 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0224
     * @tc.name      testBufferToString0224
     * @tc.desc      Verify an alternating pattern decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0224 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('a1!a1!a1!')));
      expect(actual).assertEqual('a1!a1!a1!');
      log('testBufferToString0224 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0225
     * @tc.name      testBufferToString0225
     * @tc.desc      Verify the tilde byte decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0225 begin');
      const actual: string = bufferToString(bytesToBuffer([126]));
      expect(actual).assertEqual('~');
      log('testBufferToString0225 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0226
     * @tc.name      testBufferToString0226
     * @tc.desc      Verify edge spaced punctuation decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0226 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes(' !!! ')));
      expect(actual).assertEqual(' !!! ');
      log('testBufferToString0226 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0227
     * @tc.name      testBufferToString0227
     * @tc.desc      Verify alternating case letters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0227 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('AbCdEfG')));
      expect(actual).assertEqual('AbCdEfG');
      log('testBufferToString0227 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0228
     * @tc.name      testBufferToString0228
     * @tc.desc      Verify a 200 byte ASCII payload decodes completely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0228 begin');
      const actual: string = bufferToString(bytesToBuffer(repeatedCodes(120, 200)));
      expect(actual).assertEqual(repeatChar('x', 200));
      expect(actual.length).assertEqual(200);
      log('testBufferToString0228 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0229
     * @tc.name      testBufferToString0229
     * @tc.desc      Verify a 256 byte ASCII payload decodes completely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0229 begin');
      const actual: string = bufferToString(bytesToBuffer(repeatedCodes(121, 256)));
      expect(actual.length).assertEqual(256);
      log('testBufferToString0229 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0230
     * @tc.name      testBufferToString0230
     * @tc.desc      Verify the sample bundle keyword decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0230 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('dlpmanager')));
      expect(actual).assertEqual('dlpmanager');
      log('testBufferToString0230 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0231
     * @tc.name      testBufferToString0231
     * @tc.desc      Verify a version label decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0231 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('Version 26.0.0')));
      expect(actual).assertEqual('Version 26.0.0');
      log('testBufferToString0231 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0232
     * @tc.name      testBufferToString0232
     * @tc.desc      Verify a UUID like text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0232 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('550e8400-e29b-41d4-a716-446655440000')));
      expect(actual).assertEqual('550e8400-e29b-41d4-a716-446655440000');
      log('testBufferToString0232 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0233
     * @tc.name      testBufferToString0233
     * @tc.desc      Verify a boolean keyword decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0233 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('true')));
      expect(actual).assertEqual('true');
      log('testBufferToString0233 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0234
     * @tc.name      testBufferToString0234
     * @tc.desc      Verify a semantic version text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0234 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('0.0.1')));
      expect(actual).assertEqual('0.0.1');
      log('testBufferToString0234 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0235
     * @tc.name      testBufferToString0235
     * @tc.desc      Verify an uppercase hex text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0235 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('DEADBEEF')));
      expect(actual).assertEqual('DEADBEEF');
      log('testBufferToString0235 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0236
     * @tc.name      testBufferToString0236
     * @tc.desc      Verify an account style text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0236 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('user@host')));
      expect(actual).assertEqual('user@host');
      log('testBufferToString0236 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0237
     * @tc.name      testBufferToString0237
     * @tc.desc      Verify an XML snippet decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0237 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('<tag>value</tag>')));
      expect(actual).assertEqual('<tag>value</tag>');
      log('testBufferToString0237 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0238
     * @tc.name      testBufferToString0238
     * @tc.desc      Verify a query string decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0238 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('key=value&x=1')));
      expect(actual).assertEqual('key=value&x=1');
      log('testBufferToString0238 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0239
     * @tc.name      testBufferToString0239
     * @tc.desc      Verify a color code text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0239 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('#FFAABB')));
      expect(actual).assertEqual('#FFAABB');
      log('testBufferToString0239 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0240
     * @tc.name      testBufferToString0240
     * @tc.desc      Verify a formatted timestamp text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0240 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('2026/06/15 09:05:03')));
      expect(actual).assertEqual('2026/06/15 09:05:03');
      log('testBufferToString0240 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0241
     * @tc.name      testBufferToString0241
     * @tc.desc      Verify text with an ampersand decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0241 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('Tom & Jerry')));
      expect(actual).assertEqual('Tom & Jerry');
      log('testBufferToString0241 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0242
     * @tc.name      testBufferToString0242
     * @tc.desc      Verify text with an apostrophe decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0242 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes("it's fine")));
      expect(actual).assertEqual("it's fine");
      log('testBufferToString0242 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0243
     * @tc.name      testBufferToString0243
     * @tc.desc      Verify a windows style path text decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0243 begin');
      const actual: string = bufferToString(bytesToBuffer(asciiCodes('C:\\path\\file')));
      expect(actual).assertEqual('C:\\path\\file');
      log('testBufferToString0243 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0244
     * @tc.name      testBufferToString0244
     * @tc.desc      Verify an empty buffer decodes to an empty string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0244 begin');
      const actual: string = bufferToString(bytesToBuffer([]));
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      log('testBufferToString0244 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0245
     * @tc.name      testBufferToString0245
     * @tc.desc      Verify a two byte accented letter decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0245 begin');
      const actual: string = bufferToString(bytesToBuffer([0xC3, 0xA9]));
      expect(actual).assertEqual('\u00E9');
      log('testBufferToString0245 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0246
     * @tc.name      testBufferToString0246
     * @tc.desc      Verify a two byte tilde n letter decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0246 begin');
      const actual: string = bufferToString(bytesToBuffer([0xC3, 0xB1]));
      expect(actual).assertEqual('\u00F1');
      log('testBufferToString0246 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0247
     * @tc.name      testBufferToString0247
     * @tc.desc      Verify a two byte u umlaut decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0247 begin');
      const actual: string = bufferToString(bytesToBuffer([0xC3, 0xBC]));
      expect(actual).assertEqual('\u00FC');
      log('testBufferToString0247 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0248
     * @tc.name      testBufferToString0248
     * @tc.desc      Verify three accented letters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0248 begin');
      const actual: string = bufferToString(bytesToBuffer([0xC3, 0xA9, 0xC3, 0xA9, 0xC3, 0xA9]));
      expect(actual).assertEqual('\u00E9\u00E9\u00E9');
      log('testBufferToString0248 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0249
     * @tc.name      testBufferToString0249
     * @tc.desc      Verify five accented vowels decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0249 begin');
      const actual: string = bufferToString(bytesToBuffer(
        [0xC3, 0xA1, 0xC3, 0xA9, 0xC3, 0xAD, 0xC3, 0xB3, 0xC3, 0xBA]));
      expect(actual).assertEqual('\u00E1\u00E9\u00ED\u00F3\u00FA');
      log('testBufferToString0249 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0250
     * @tc.name      testBufferToString0250
     * @tc.desc      Verify a two byte Greek capital decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0250 begin');
      const actual: string = bufferToString(bytesToBuffer([0xCE, 0xA9]));
      expect(actual).assertEqual('\u03A9');
      log('testBufferToString0250 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0251
     * @tc.name      testBufferToString0251
     * @tc.desc      Verify a two byte Cyrillic capital decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0251 begin');
      const actual: string = bufferToString(bytesToBuffer([0xD0, 0xAF]));
      expect(actual).assertEqual('\u042F');
      log('testBufferToString0251 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0252
     * @tc.name      testBufferToString0252
     * @tc.desc      Verify a two byte oe ligature decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0252 begin');
      const actual: string = bufferToString(bytesToBuffer([0xC5, 0x93]));
      expect(actual).assertEqual('\u0153');
      log('testBufferToString0252 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0253
     * @tc.name      testBufferToString0253
     * @tc.desc      Verify cafe with accent decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0253 begin');
      const actual: string = bufferToString(bytesToBuffer([99, 97, 102, 0xC3, 0xA9]));
      expect(actual).assertEqual('caf\u00E9');
      log('testBufferToString0253 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0254
     * @tc.name      testBufferToString0254
     * @tc.desc      Verify naive with diaeresis decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0254 begin');
      const actual: string = bufferToString(bytesToBuffer([110, 97, 0xC3, 0xAF, 118, 101]));
      expect(actual).assertEqual('na\u00EFve');
      log('testBufferToString0254 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0255
     * @tc.name      testBufferToString0255
     * @tc.desc      Verify strasse with sharp s decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0255 begin');
      const actual: string = bufferToString(bytesToBuffer([83, 116, 114, 97, 0xC3, 0x9F, 101]));
      expect(actual).assertEqual('Stra\u00DFe');
      log('testBufferToString0255 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0256
     * @tc.name      testBufferToString0256
     * @tc.desc      Verify an accented letter between ASCII decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0256 begin');
      const actual: string = bufferToString(bytesToBuffer([120, 0xC3, 0xA9, 121]));
      expect(actual).assertEqual('x\u00E9y');
      log('testBufferToString0256 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0257
     * @tc.name      testBufferToString0257
     * @tc.desc      Verify the CJK character zhong decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0257 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE4, 0xB8, 0xAD]));
      expect(actual).assertEqual('中');
      log('testBufferToString0257 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0258
     * @tc.name      testBufferToString0258
     * @tc.desc      Verify the CJK character wen decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0258 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE6, 0x96, 0x87]));
      expect(actual).assertEqual('文');
      log('testBufferToString0258 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0259
     * @tc.name      testBufferToString0259
     * @tc.desc      Verify the CJK word for test decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0259 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE6, 0xB5, 0x8B, 0xE8, 0xAF, 0x95]));
      expect(actual).assertEqual('测试');
      log('testBufferToString0259 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0260
     * @tc.name      testBufferToString0260
     * @tc.desc      Verify the CJK word for HarmonyOS decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0260 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE9, 0xB8, 0xBF, 0xE8, 0x92, 0x99]));
      expect(actual).assertEqual('鸿蒙');
      log('testBufferToString0260 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0261
     * @tc.name      testBufferToString0261
     * @tc.desc      Verify the CJK greeting decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0261 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
      expect(actual).assertEqual('你好');
      log('testBufferToString0261 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0262
     * @tc.name      testBufferToString0262
     * @tc.desc      Verify a four character CJK phrase decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0262 begin');
      const actual: string = bufferToString(bytesToBuffer(
        [0xE4, 0xB8, 0xAD, 0xE6, 0x96, 0x87, 0xE6, 0xB5, 0x8B, 0xE8, 0xAF, 0x95]));
      expect(actual).assertEqual('中文测试');
      log('testBufferToString0262 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0263
     * @tc.name      testBufferToString0263
     * @tc.desc      Verify the CJK word for open source decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0263 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE5, 0xBC, 0x80, 0xE6, 0xBA, 0x90]));
      expect(actual).assertEqual('开源');
      log('testBufferToString0263 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0264
     * @tc.name      testBufferToString0264
     * @tc.desc      Verify CJK characters interleaved with ASCII decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0264 begin');
      const actual: string = bufferToString(bytesToBuffer([97, 0xE4, 0xB8, 0xAD, 98, 0xE6, 0x96, 0x87, 99]));
      expect(actual).assertEqual('a中b文c');
      log('testBufferToString0264 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0265
     * @tc.name      testBufferToString0265
     * @tc.desc      Verify two CJK characters with a space decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0265 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE4, 0xB8, 0xAD, 32, 0xE6, 0x96, 0x87]));
      expect(actual).assertEqual('中 文');
      log('testBufferToString0265 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0266
     * @tc.name      testBufferToString0266
     * @tc.desc      Verify the CJK full stop decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0266 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE3, 0x80, 0x82]));
      expect(actual).assertEqual('。');
      log('testBufferToString0266 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0267
     * @tc.name      testBufferToString0267
     * @tc.desc      Verify the CJK enumeration comma decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0267 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE3, 0x80, 0x81]));
      expect(actual).assertEqual('、');
      log('testBufferToString0267 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0268
     * @tc.name      testBufferToString0268
     * @tc.desc      Verify CJK angle brackets decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0268 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE3, 0x80, 0x8A, 0xE3, 0x80, 0x8B]));
      expect(actual).assertEqual('《》');
      log('testBufferToString0268 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0269
     * @tc.name      testBufferToString0269
     * @tc.desc      Verify fifty repeated CJK characters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0269 begin');
      const codes: number[] = [];
      for (let i = 0; i < 50; i++) {
        codes.push(0xE4, 0xB8, 0xAD);
      }
      const actual: string = bufferToString(bytesToBuffer(codes));
      expect(actual).assertEqual(repeatChar('中', 50));
      expect(actual.length).assertEqual(50);
      log('testBufferToString0269 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0270
     * @tc.name      testBufferToString0270
     * @tc.desc      Verify one hundred repeated CJK characters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0270 begin');
      const codes: number[] = [];
      for (let i = 0; i < 100; i++) {
        codes.push(0xE6, 0xB5, 0x8B);
      }
      const actual: string = bufferToString(bytesToBuffer(codes));
      expect(actual.length).assertEqual(100);
      log('testBufferToString0270 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0271
     * @tc.name      testBufferToString0271
     * @tc.desc      Verify the CJK words for sample file decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0271 begin');
      const actual: string = bufferToString(bytesToBuffer(
        [0xE6, 0xA0, 0xB7, 0xE6, 0x9C, 0xAC, 0xE6, 0x96, 0x87, 0xE4, 0xBB, 0xB6]));
      expect(actual).assertEqual('样本文件');
      log('testBufferToString0271 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0272
     * @tc.name      testBufferToString0272
     * @tc.desc      Verify the CJK word for log decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0272 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE6, 0x97, 0xA5, 0xE5, 0xBF, 0x97]));
      expect(actual).assertEqual('日志');
      log('testBufferToString0272 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0273
     * @tc.name      testBufferToString0273
     * @tc.desc      Verify the CJK words for file management decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0273 begin');
      const actual: string = bufferToString(bytesToBuffer(
        [0xE6, 0x96, 0x87, 0xE4, 0xBB, 0xB6, 0xE7, 0xAE, 0xA1, 0xE7, 0x90, 0x86]));
      expect(actual).assertEqual('文件管理');
      log('testBufferToString0273 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0274
     * @tc.name      testBufferToString0274
     * @tc.desc      Verify the CJK word for secure decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0274 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE5, 0xAE, 0x89, 0xE5, 0x85, 0xA8]));
      expect(actual).assertEqual('安全');
      log('testBufferToString0274 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0275
     * @tc.name      testBufferToString0275
     * @tc.desc      Verify the CJK words for secrecy level decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0275 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE5, 0xAF, 0x86, 0xE7, 0xBA, 0xA7]));
      expect(actual).assertEqual('密级');
      log('testBufferToString0275 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0276
     * @tc.name      testBufferToString0276
     * @tc.desc      Verify three repeated CJK characters decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0276 begin');
      const actual: string = bufferToString(bytesToBuffer(
        [0xE4, 0xB8, 0xAD, 0xE4, 0xB8, 0xAD, 0xE4, 0xB8, 0xAD]));
      expect(actual).assertEqual('中中中');
      log('testBufferToString0276 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0277
     * @tc.name      testBufferToString0277
     * @tc.desc      Verify an ASCII letter between CJK characters decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0277 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE4, 0xB8, 0xAD, 97, 0xE4, 0xB8, 0xAD]));
      expect(actual).assertEqual('中a中');
      log('testBufferToString0277 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0278
     * @tc.name      testBufferToString0278
     * @tc.desc      Verify the CJK word for Hong Kong decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0278 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE9, 0xA6, 0x99, 0xE6, 0xB8, 0xAF]));
      expect(actual).assertEqual('香港');
      log('testBufferToString0278 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0279
     * @tc.name      testBufferToString0279
     * @tc.desc      Verify a four byte smiling emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0279 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x98, 0x80]));
      expect(actual).assertEqual(SMILE);
      log('testBufferToString0279 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0280
     * @tc.name      testBufferToString0280
     * @tc.desc      Verify a four byte rocket emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0280 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x9A, 0x80]));
      expect(actual).assertEqual(ROCKET);
      log('testBufferToString0280 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0281
     * @tc.name      testBufferToString0281
     * @tc.desc      Verify a four byte thumbs up emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0281 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x91, 0x8D]));
      expect(actual).assertEqual(THUMB);
      log('testBufferToString0281 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0282
     * @tc.name      testBufferToString0282
     * @tc.desc      Verify two consecutive emojis decode correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0282 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x98, 0x80, 0xF0, 0x9F, 0x98, 0x80]));
      expect(actual).assertEqual(SMILE + SMILE);
      log('testBufferToString0282 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0283
     * @tc.name      testBufferToString0283
     * @tc.desc      Verify an emoji between ASCII letters decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0283 begin');
      const actual: string = bufferToString(bytesToBuffer([97, 0xF0, 0x9F, 0x98, 0x80, 98]));
      expect(actual).assertEqual('a' + SMILE + 'b');
      log('testBufferToString0283 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0284
     * @tc.name      testBufferToString0284
     * @tc.desc      Verify an emoji followed by punctuation decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0284 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x98, 0x80, 33]));
      expect(actual).assertEqual(SMILE + '!');
      log('testBufferToString0284 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0285
     * @tc.name      testBufferToString0285
     * @tc.desc      Verify a four byte party emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0285 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x8E, 0x89]));
      expect(actual).assertEqual(PARTY);
      log('testBufferToString0285 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0286
     * @tc.name      testBufferToString0286
     * @tc.desc      Verify a four byte fire emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0286 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x94, 0xA5]));
      expect(actual).assertEqual(FIRE);
      log('testBufferToString0286 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0287
     * @tc.name      testBufferToString0287
     * @tc.desc      Verify a four byte glowing star emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0287 begin');
      const actual: string = bufferToString(bytesToBuffer([0xF0, 0x9F, 0x8C, 0x9F]));
      expect(actual).assertEqual(GLOW);
      log('testBufferToString0287 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0288
     * @tc.name      testBufferToString0288
     * @tc.desc      Verify CJK text with an emoji decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0288 begin');
      const actual: string = bufferToString(bytesToBuffer(
        [0xE6, 0x96, 0x87, 0xE4, 0xBB, 0xB6, 0xF0, 0x9F, 0x98, 0x80, 0xE4, 0xB8, 0xAD]));
      expect(actual).assertEqual('文件' + SMILE + '中');
      log('testBufferToString0288 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0289
     * @tc.name      testBufferToString0289
     * @tc.desc      Verify a byte order mark decodes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0289 begin');
      const actual: string = bufferToString(bytesToBuffer([0xEF, 0xBB, 0xBF]));
      expect(typeof actual).assertEqual('string');
      expect(actual === '\uFEFF' || actual === '').assertTrue();
      log('testBufferToString0289 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0290
     * @tc.name      testBufferToString0290
     * @tc.desc      Verify an invalid byte decodes to the replacement character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0290 begin');
      const actual: string = bufferToString(bytesToBuffer([0xFF]));
      expect(actual.length).assertEqual(1);
      expect(actual.charCodeAt(0)).assertEqual(0xFFFD);
      log('testBufferToString0290 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0291
     * @tc.name      testBufferToString0291
     * @tc.desc      Verify valid text plus an invalid byte decodes with replacement.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0291 begin');
      const actual: string = bufferToString(bytesToBuffer([97, 0xFF]));
      expect(actual.length).assertEqual(2);
      expect(actual.charCodeAt(0)).assertEqual(97);
      expect(actual.charCodeAt(1)).assertEqual(0xFFFD);
      log('testBufferToString0291 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0292
     * @tc.name      testBufferToString0292
     * @tc.desc      Verify an invalid byte plus valid text decodes with replacement.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0292 begin');
      const actual: string = bufferToString(bytesToBuffer([0xFF, 97]));
      expect(actual.length).assertEqual(2);
      expect(actual.charCodeAt(0)).assertEqual(0xFFFD);
      expect(actual.charCodeAt(1)).assertEqual(97);
      log('testBufferToString0292 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0293
     * @tc.name      testBufferToString0293
     * @tc.desc      Verify a lone continuation byte decodes to replacement.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0293 begin');
      const actual: string = bufferToString(bytesToBuffer([0x80]));
      expect(actual.length).assertEqual(1);
      expect(actual.charCodeAt(0)).assertEqual(0xFFFD);
      log('testBufferToString0293 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0294
     * @tc.name      testBufferToString0294
     * @tc.desc      Verify a two byte control codepoint decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0294 begin');
      const actual: string = bufferToString(bytesToBuffer([0xC2, 0x80]));
      expect(actual.length).assertEqual(1);
      expect(actual.charCodeAt(0)).assertEqual(0x80);
      log('testBufferToString0294 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0295
     * @tc.name      testBufferToString0295
     * @tc.desc      Verify the DEL control byte decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0295 begin');
      const actual: string = bufferToString(bytesToBuffer([0x7F]));
      expect(actual.length).assertEqual(1);
      expect(actual.charCodeAt(0)).assertEqual(0x7F);
      log('testBufferToString0295 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0296
     * @tc.name      testBufferToString0296
     * @tc.desc      Verify an incomplete three byte sequence stays buffered or replaced.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0296 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE4]));
      expect(typeof actual).assertEqual('string');
      expect(actual.length <= 1).assertTrue();
      log('testBufferToString0296 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0297
     * @tc.name      testBufferToString0297
     * @tc.desc      Verify a truncated two byte prefix stays buffered or replaced.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0297 begin');
      const actual: string = bufferToString(bytesToBuffer([0xE4, 0xB8]));
      expect(typeof actual).assertEqual('string');
      expect(actual.length <= 1).assertTrue();
      log('testBufferToString0297 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0298
     * @tc.name      testBufferToString0298
     * @tc.desc      Verify a 4096 byte ASCII payload decodes completely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0298 begin');
      const actual: string = bufferToString(bytesToBuffer(repeatedCodes(97, 4096)));
      expect(actual).assertEqual(repeatChar('a', 4096));
      expect(actual.length).assertEqual(4096);
      log('testBufferToString0298 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0301
     * @tc.name      testBufferToString0301
     * @tc.desc      Verify decoding the same buffer twice is deterministic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0301 begin');
      const buffer: ArrayBuffer = bytesToBuffer(asciiCodes('hello world'));
      const first: string = bufferToString(buffer);
      const second: string = bufferToString(buffer);
      expect(first === second).assertTrue();
      log('testBufferToString0301 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0302
     * @tc.name      testBufferToString0302
     * @tc.desc      Verify sequential decodes stay independent without state leaks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0302 begin');
      const cjk: string = bufferToString(bytesToBuffer([0xE4, 0xB8, 0xAD]));
      const ascii: string = bufferToString(bytesToBuffer([65]));
      expect(cjk).assertEqual('中');
      expect(ascii).assertEqual('A');
      log('testBufferToString0302 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0303
     * @tc.name      testBufferToString0303
     * @tc.desc      Verify a 1000 byte payload keeps first and last characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0303 begin');
      const actual: string = bufferToString(bytesToBuffer(repeatedCodes(122, 1000)));
      expect(actual.length).assertEqual(1000);
      expect(actual.charAt(0)).assertEqual('z');
      expect(actual.charAt(999)).assertEqual('z');
      log('testBufferToString0303 end');
    })
    /**
     * @tc.number    SUB_DLP_MANAGER_BUFFERTOSTRING_0304
     * @tc.name      testBufferToString0304
     * @tc.desc      Verify ASCII, CJK and emoji mixed content decodes correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBufferToString0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBufferToString0304 begin');
      const codes: number[] = asciiCodes('OpenHarmony');
      codes.push(0xE9, 0xB8, 0xBF, 0xE8, 0x92, 0x99, 0xF0, 0x9F, 0x98, 0x80);
      const actual: string = bufferToString(bytesToBuffer(codes));
      expect(actual).assertEqual('OpenHarmony鸿蒙' + SMILE);
      log('testBufferToString0304 end');
    })
  })
}
