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
import { yieldToEventLoop } from '../common/TestYield';
import url from '@ohos.url';
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Media reference and file primitives.
 * A published update stores either a resource reference or the URI returned by
 * the picker, and the picker result is a file URI. These cases pin the URI
 * parser and the file primitives the sample may use to inspect such results.
 */
const BASE_DIR: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir +
  '/publish_io_cases';
function ensureBaseDir(): string {
  if (!fs.accessSync(BASE_DIR)) {
    fs.mkdirSync(BASE_DIR);
  }
  return BASE_DIR;
}
export default function urlFileContractTest() {
  describe('UrlFileContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0100
     * @tc.name UrlSchemeVisible001
     * @tc.desc Verify the scheme is exposed both as a field and inside the address text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UrlSchemeVisible_001', 0, (): void => {
      Logger.info(TAG, 'UrlSchemeVisible_001 begin');
      const address: string = 'https://example.com/path?q=1';
      const parsed: url.URL = new url.URL(address);
      expect(parsed.protocol).assertEqual('https:');
      expect(parsed.href).assertContain('https://');
      Logger.info(TAG, 'UrlSchemeVisible_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0200
     * @tc.name OriginComposedFromParts002
     * @tc.desc Verify the origin equals the scheme combined with the host
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'OriginComposedFromParts_002', 0, (): void => {
      Logger.info(TAG, 'OriginComposedFromParts_002 begin');
      const parsed: url.URL = new url.URL('https://example.com/path?q=1');
      const composed: string = parsed.protocol + '//' + parsed.host;
      expect(parsed.origin).assertEqual(composed);
      Logger.info(TAG, 'OriginComposedFromParts_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0300
     * @tc.name PathSegmentsDescribeFile003
     * @tc.desc Verify the path keeps its folder prefix and file suffix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PathSegmentsDescribeFile_003', 0, (): void => {
      Logger.info(TAG, 'PathSegmentsDescribeFile_003 begin');
      const parsed: url.URL = new url.URL('https://example.com/album/photo.jpg?q=1');
      expect(parsed.pathname.startsWith('/album/')).assertTrue();
      expect(parsed.pathname.endsWith('.jpg')).assertTrue();
      Logger.info(TAG, 'PathSegmentsDescribeFile_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0400
     * @tc.name QueryPairReadable004
     * @tc.desc Verify a query pair is readable from both the container and the text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QueryPairReadable_004', 0, (): void => {
      Logger.info(TAG, 'QueryPairReadable_004 begin');
      const parsed: url.URL = new url.URL('https://example.com/path?source=album&size=1');
      expect(parsed.searchParams.getAll('source').length).assertEqual(1);
      expect(parsed.searchParams.get('source')).assertEqual('album');
      expect(parsed.search).assertContain('source=album');
      Logger.info(TAG, 'QueryPairReadable_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0500
     * @tc.name PortDiffersFromDefault005
     * @tc.desc Verify an explicit port is reported while the default address has none
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PortDiffersFromDefault_005', 0, (): void => {
      Logger.info(TAG, 'PortDiffersFromDefault_005 begin');
      const explicit: url.URL = new url.URL('https://example.com:8080/path');
      const plain: url.URL = new url.URL('https://example.com/path');
      expect(explicit.port).assertEqual('8080');
      expect(plain.port).assertEqual('');
      Logger.info(TAG, 'PortDiffersFromDefault_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0600
     * @tc.name FragmentBodyAfterMarker006
     * @tc.desc Verify the fragment body follows its leading marker
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FragmentBodyAfterMarker_006', 0, (): void => {
      Logger.info(TAG, 'FragmentBodyAfterMarker_006 begin');
      const parsed: url.URL = new url.URL('https://example.com/path#section');
      expect(parsed.hash.startsWith('#')).assertTrue();
      expect(parsed.hash.substring(1)).assertEqual('section');
      Logger.info(TAG, 'FragmentBodyAfterMarker_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0700
     * @tc.name LocalSchemeShape007
     * @tc.desc Verify a picked local address uses the file scheme and a double slash
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LocalSchemeShape_007', 0, (): void => {
      Logger.info(TAG, 'LocalSchemeShape_007 begin');
      const parsed: url.URL = new url.URL('file://media/Photo/1/IMG_001.jpg');
      expect(parsed.protocol).assertEqual('file:');
      expect(parsed.href.startsWith('file://')).assertTrue();
      Logger.info(TAG, 'LocalSchemeShape_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0800
     * @tc.name LocalPathLastSegment008
     * @tc.desc Verify the last path segment of a local media address is the file name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LocalPathLastSegment_008', 0, (): void => {
      Logger.info(TAG, 'LocalPathLastSegment_008 begin');
      const parsed: url.URL = new url.URL('file://media/Photo/1/IMG_001.jpg');
      const segments: Array<string> = parsed.pathname.split('/');
      expect(segments[segments.length - 1]).assertEqual('IMG_001.jpg');
      Logger.info(TAG, 'LocalPathLastSegment_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_0900
     * @tc.name TempDirCreated009
     * @tc.desc Verify temp dir created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TempDirCreated_009', 0, (): void => {
      Logger.info(TAG, 'TempDirCreated_009 begin');
      const dir: string = ensureBaseDir();
      const exists: boolean = fs.accessSync(dir);
      Logger.info(TAG, 'exists=' + JSON.stringify(exists));
      expect(exists).assertTrue();
      Logger.info(TAG, 'TempDirCreated_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1000
     * @tc.name FileWriteThenSize010
     * @tc.desc Verify file write then size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FileWriteThenSize_010', 0, (): void => {
      Logger.info(TAG, 'FileWriteThenSize_010 begin');
      const dir: string = ensureBaseDir();
      const path: string = dir + '/size_probe.txt';
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'publish-sample');
      fs.closeSync(file);
      const stat: fs.Stat = fs.statSync(path);
      expect(stat.size).assertEqual(14);
      fs.unlinkSync(path);
      Logger.info(TAG, 'FileWriteThenSize_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1100
     * @tc.name FileReadBackLength011
     * @tc.desc Verify file read back length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FileReadBackLength_011', 0, (): void => {
      Logger.info(TAG, 'FileReadBackLength_011 begin');
      const dir: string = ensureBaseDir();
      const path: string = dir + '/read_probe.txt';
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'abcdef');
      fs.closeSync(file);
      const reader: fs.File = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const readLength: number = fs.readSync(reader.fd, buffer);
      fs.closeSync(reader);
      expect(readLength).assertEqual(6);
      fs.unlinkSync(path);
      Logger.info(TAG, 'FileReadBackLength_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1200
     * @tc.name AccessMissingIsFalse012
     * @tc.desc Verify access missing is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AccessMissingIsFalse_012', 0, (): void => {
      Logger.info(TAG, 'AccessMissingIsFalse_012 begin');
      const dir: string = ensureBaseDir();
      const exists: boolean = fs.accessSync(dir + '/never_written.bin');
      expect(exists).assertFalse();
      Logger.info(TAG, 'AccessMissingIsFalse_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1300
     * @tc.name UnlinkRemovesFile013
     * @tc.desc Verify unlink removes file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnlinkRemovesFile_013', 0, (): void => {
      Logger.info(TAG, 'UnlinkRemovesFile_013 begin');
      const dir: string = ensureBaseDir();
      const path: string = dir + '/removable.txt';
      const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'x');
      fs.closeSync(file);
      fs.unlinkSync(path);
      const exists: boolean = fs.accessSync(path);
      expect(exists).assertFalse();
      Logger.info(TAG, 'UnlinkRemovesFile_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1400
     * @tc.name TwoFilesIndependent014
     * @tc.desc Verify two files independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoFilesIndependent_014', 0, (): void => {
      Logger.info(TAG, 'TwoFilesIndependent_014 begin');
      const dir: string = ensureBaseDir();
      const firstPath: string = dir + '/first.txt';
      const secondPath: string = dir + '/second.txt';
      const first: fs.File = fs.openSync(firstPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.TRUNC);
      fs.writeSync(first.fd, 'one');
      fs.closeSync(first);
      const second: fs.File = fs.openSync(secondPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE |
        fs.OpenMode.TRUNC);
      fs.writeSync(second.fd, 'three');
      fs.closeSync(second);
      expect(fs.statSync(firstPath).size).assertEqual(3);
      expect(fs.statSync(secondPath).size).assertEqual(5);
      fs.unlinkSync(firstPath);
      fs.unlinkSync(secondPath);
      Logger.info(TAG, 'TwoFilesIndependent_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1500
     * @tc.name Base64Ascii015
     * @tc.desc Verify ascii text encodes to the standard base64 form
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Base64Ascii_015', 0, (): void => {
      Logger.info(TAG, 'Base64Ascii_015 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      expect(helper.encodeToStringSync(encoder.encodeInto('hello'))).assertEqual('aGVsbG8=');
      Logger.info(TAG, 'Base64Ascii_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1600
     * @tc.name Base64RoundTrip016
     * @tc.desc Verify multi byte text survives a base64 round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Base64RoundTrip_016', 0, (): void => {
      Logger.info(TAG, 'Base64RoundTrip_016 begin');
      const helper: util.Base64Helper = new util.Base64Helper();
      const encoder: util.TextEncoder = new util.TextEncoder('utf-8');
      const source: Uint8Array = encoder.encodeInto('来杯香槟');
      const decoded: Uint8Array = helper.decodeSync(helper.encodeToStringSync(source));
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      expect(decoder.decodeToString(decoded)).assertEqual('来杯香槟');
      Logger.info(TAG, 'Base64RoundTrip_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1700
     * @tc.name UriSpaceEncoding017
     * @tc.desc Verify a space is percent encoded and restored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UriSpaceEncoding_017', 0, (): void => {
      Logger.info(TAG, 'UriSpaceEncoding_017 begin');
      expect(encodeURIComponent('a b')).assertEqual('a%20b');
      expect(decodeURIComponent('a%20b')).assertEqual('a b');
      Logger.info(TAG, 'UriSpaceEncoding_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1800
     * @tc.name JsonDeepRoundTrip018
     * @tc.desc Verify three levels of nesting survive a JSON round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonDeepRoundTrip_018', 0, (): void => {
      Logger.info(TAG, 'JsonDeepRoundTrip_018 begin');
      const payload: string = '[[[1]]]';
      expect(JSON.stringify(JSON.parse(payload))).assertEqual(payload);
      Logger.info(TAG, 'JsonDeepRoundTrip_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_1900
     * @tc.name JsonCloneIndependent019
     * @tc.desc Verify a JSON clone does not share storage with its source
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonCloneIndependent_019', 0, (): void => {
      Logger.info(TAG, 'JsonCloneIndependent_019 begin');
      const source: Array<number> = [1, 2];
      const copy: Array<number> = JSON.parse(JSON.stringify(source)) as Array<number>;
      copy[0] = 9;
      expect(source[0]).assertEqual(1);
      Logger.info(TAG, 'JsonCloneIndependent_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2000
     * @tc.name JsonExponentParsed020
     * @tc.desc Verify scientific notation parses to the expanded value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonExponentParsed_020', 0, (): void => {
      Logger.info(TAG, 'JsonExponentParsed_020 begin');
      expect(JSON.parse('1e3')).assertEqual(1000);
      Logger.info(TAG, 'JsonExponentParsed_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2100
     * @tc.name JsonLeadingZeroRejects021
     * @tc.desc Verify a number with a leading zero is rejected
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonLeadingZeroRejects_021', 0, (): void => {
      Logger.info(TAG, 'JsonLeadingZeroRejects_021 begin');
      let threw: boolean = false;
      try {
        JSON.parse('01');
      }
      catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
      Logger.info(TAG, 'JsonLeadingZeroRejects_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2200
     * @tc.name JsonNewlineEscaped022
     * @tc.desc Verify a line break is escaped and restored by the codec
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'JsonNewlineEscaped_022', 0, (): void => {
      Logger.info(TAG, 'JsonNewlineEscaped_022 begin');
      const text: string = 'a\nb';
      expect(JSON.stringify(text)).assertContain('\\n');
      expect(JSON.parse(JSON.stringify(text))).assertEqual(text);
      Logger.info(TAG, 'JsonNewlineEscaped_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2300
     * @tc.name DateUtcEpoch023
     * @tc.desc Verify the UTC constructor maps the epoch components to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DateUtcEpoch_023', 0, (): void => {
      Logger.info(TAG, 'DateUtcEpoch_023 begin');
      expect(Date.UTC(1970, 0, 1, 0, 0, 0)).assertEqual(0);
      Logger.info(TAG, 'DateUtcEpoch_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2400
     * @tc.name DateIsoRoundTrip024
     * @tc.desc Verify an ISO timestamp survives a parse and format cycle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DateIsoRoundTrip_024', 0, (): void => {
      Logger.info(TAG, 'DateIsoRoundTrip_024 begin');
      const text: string = '2026-01-05T09:08:07.000Z';
      expect(new Date(text).toISOString()).assertEqual(text);
      Logger.info(TAG, 'DateIsoRoundTrip_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2500
     * @tc.name DateMonthRollover025
     * @tc.desc Verify adding days across a month boundary advances the month
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DateMonthRollover_025', 0, (): void => {
      Logger.info(TAG, 'DateMonthRollover_025 begin');
      const date: Date = new Date(Date.UTC(2026, 0, 30));
      date.setUTCDate(date.getUTCDate() + 3);
      expect(date.getUTCMonth()).assertEqual(1);
      Logger.info(TAG, 'DateMonthRollover_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2600
     * @tc.name StringPadding026
     * @tc.desc Verify both padding directions fill the string to the requested length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringPadding_026', 0, (): void => {
      Logger.info(TAG, 'StringPadding_026 begin');
      expect('7'.padStart(3, '0')).assertEqual('007');
      expect('ab'.padEnd(4, '.')).assertEqual('ab..');
      Logger.info(TAG, 'StringPadding_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2700
     * @tc.name StringRepeatCount027
     * @tc.desc Verify a unit string repeats the requested number of times
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringRepeatCount_027', 0, (): void => {
      Logger.info(TAG, 'StringRepeatCount_027 begin');
      expect('ab'.repeat(3)).assertEqual('ababab');
      Logger.info(TAG, 'StringRepeatCount_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2800
     * @tc.name StringCodePointBuild028
     * @tc.desc Verify a supplementary code point builds the expected symbol
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringCodePointBuild_028', 0, (): void => {
      Logger.info(TAG, 'StringCodePointBuild_028 begin');
      expect(String.fromCodePoint(127912)).assertEqual('🎨');
      Logger.info(TAG, 'StringCodePointBuild_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_2900
     * @tc.name ArrayNumericTextSort029
     * @tc.desc Verify numeric text sorts lexicographically without a comparator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayNumericTextSort_029', 0, (): void => {
      Logger.info(TAG, 'ArrayNumericTextSort_029 begin');
      const values: Array<string> = ['2', '10'];
      values.sort();
      expect(values.join(',')).assertEqual('10,2');
      Logger.info(TAG, 'ArrayNumericTextSort_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_3000
     * @tc.name MapIterationOrder030
     * @tc.desc Verify map iteration visits entries in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MapIterationOrder_030', 0, (): void => {
      Logger.info(TAG, 'MapIterationOrder_030 begin');
      const index: Map<string, string> = new Map<string, string>();
      index.set('a', '1');
      index.set('b', '2');
      let order: string = '';
      index.forEach((value: string, key: string): void => {
        order += key;
      });
      expect(order).assertEqual('ab');
      Logger.info(TAG, 'MapIterationOrder_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URLFILE_3100
     * @tc.name SetDeduplicatesValues031
     * @tc.desc Verify a set keeps one entry for a repeated value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SetDeduplicatesValues_031', 0, (): void => {
      Logger.info(TAG, 'SetDeduplicatesValues_031 begin');
      const seen: Set<string> = new Set<string>(['a', 'a', 'b']);
      expect(seen.size).assertEqual(2);
      Logger.info(TAG, 'SetDeduplicatesValues_031 end');
    });
  });
}
