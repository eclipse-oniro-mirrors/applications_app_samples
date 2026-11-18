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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { FileDescriptor, FileKind, KindGroup, describeFile, detectByContent, groupByKind, isEditableText,
  isSampleSupported, kindLabel, kindOfExtension, kindPriority, kindResourceKey, matchesAnySuffix,
  mimeOfExtension } from '../main/ets/core/FileKindCore';

function toBytes(codes: number[]): Uint8Array {
  const output: Uint8Array = new Uint8Array(codes.length);
  for (let index = 0; index < codes.length; index++) {
    output[index] = codes[index];
  }
  return output;
}

function asciiBytes(text: string): Uint8Array {
  const output: Uint8Array = new Uint8Array(text.length);
  for (let index = 0; index < text.length; index++) {
    output[index] = text.charCodeAt(index);
  }
  return output;
}

function kindsOf(groups: KindGroup[]): string {
  const parts: string[] = [];
  for (let index = 0; index < groups.length; index++) {
    parts.push(groups[index].kind.toString());
  }
  return parts.join('|');
}

export default function fileKindMatrix2Test(): void {
  describe('FileKindMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0001
     * @tc.name      testMimeImageExtra0001
     * @tc.desc      extra image mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeImageExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(mimeOfExtension('heic')).assertEqual('image/heic');
      expect(mimeOfExtension('bmp')).assertEqual('image/bmp');
      expect(mimeOfExtension('gif')).assertEqual('image/gif');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0002
     * @tc.name      testMimeAudioExtra0002
     * @tc.desc      extra audio mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeAudioExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(mimeOfExtension('flac')).assertEqual('audio/flac');
      expect(mimeOfExtension('aac')).assertEqual('audio/aac');
      expect(mimeOfExtension('ogg')).assertEqual('audio/ogg');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0003
     * @tc.name      testMimeVideoExtra0003
     * @tc.desc      extra video mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeVideoExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(mimeOfExtension('3gp')).assertEqual('video/3gpp');
      expect(mimeOfExtension('mkv')).assertEqual('video/x-matroska');
      expect(mimeOfExtension('avi')).assertEqual('video/x-msvideo');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0004
     * @tc.name      testMimeDocumentExtra0004
     * @tc.desc      extra document and package mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeDocumentExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(mimeOfExtension('xlsx')).assertEqual(
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      expect(mimeOfExtension('pptx')).assertEqual(
        'application/vnd.openxmlformats-officedocument.presentationml.presentation');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0005
     * @tc.name      testKindCaseSweep0005
     * @tc.desc      uppercase extensions map to the same kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindCaseSweep0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(kindOfExtension('TXT')).assertEqual(FileKind.TEXT);
      expect(kindOfExtension('DOCX')).assertEqual(FileKind.DOCUMENT);
      expect(kindOfExtension('PNG')).assertEqual(FileKind.IMAGE);
      expect(kindOfExtension('MP4')).assertEqual(FileKind.VIDEO);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0006
     * @tc.name      testDescribePathName0006
     * @tc.desc      descriptors handle names with directory parts
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribePathName0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const descriptor: FileDescriptor = describeFile('docs/2026/report.docx', 10);
      expect(descriptor.extension).assertEqual('docx');
      expect(descriptor.kind).assertEqual(FileKind.DOCUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0007
     * @tc.name      testDescribeDlpPath0007
     * @tc.desc      dlp descriptors keep the inner path name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeDlpPath0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const descriptor: FileDescriptor = describeFile('docs/a.txt.dlp', 10);
      expect(descriptor.isDlp).assertTrue();
      expect(descriptor.displayName).assertEqual('docs/a.txt');
      expect(descriptor.extension).assertEqual('txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0008
     * @tc.name      testDescribeNegativeSize0008
     * @tc.desc      descriptors keep negative sizes for callers to handle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNegativeSize0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(describeFile('a.txt', -5).sizeBytes).assertEqual(-5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0009
     * @tc.name      testSampleSupportedCase0009
     * @tc.desc      sample support checks ignore case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSampleSupportedCase0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isSampleSupported('A.TXT')).assertTrue();
      expect(isSampleSupported('B.DOCX')).assertTrue();
      expect(isSampleSupported('C.PNG')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0010
     * @tc.name      testSuffixMultiDot0010
     * @tc.desc      multi dot names match single suffixes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixMultiDot0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(matchesAnySuffix('a.tar.gz', ['.gz'])).assertTrue();
      expect(matchesAnySuffix('a.tar.gz', ['.tar'])).assertFalse();
      expect(matchesAnySuffix('a.txt.dlp', ['.dlp'])).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0011
     * @tc.name      testDetectPartialPng0011
     * @tc.desc      partial png signatures are not detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectPartialPng0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(toBytes([0x89, 0x50, 0x4E]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0012
     * @tc.name      testDetectPartialPdf0012
     * @tc.desc      partial pdf signatures are not detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectPartialPdf0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(asciiBytes('%PD'))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0013
     * @tc.name      testDetectTabs0013
     * @tc.desc      tabbed content is still text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectTabs0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(asciiBytes('a\tb\tc\n\t'))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0014
     * @tc.name      testDetectUnicodeText0014
     * @tc.desc      unicode content is text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectUnicodeText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(toBytes([0xE5, 0xB9, 0xB4, 0xE5, 0xBA, 0xA6]))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0015
     * @tc.name      testDetectEmptyAndBinary0015
     * @tc.desc      empty and invalid content stay unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectEmptyAndBinary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(toBytes([]))).assertEqual(FileKind.UNKNOWN);
      expect(detectByContent(toBytes([0xC0, 0x00]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0016
     * @tc.name      testGroupAllKinds0016
     * @tc.desc      grouping orders text documents images and archives
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level    LEVEL0
     */
    it('testGroupAllKinds0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const groups: KindGroup[] = groupByKind([
        describeFile('a.zip', 1),
        describeFile('b.png', 1),
        describeFile('c.docx', 1),
        describeFile('d.txt', 1)
      ]);
      expect(kindsOf(groups)).assertEqual('text|document|image|archive');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0017
     * @tc.name      testPriorityOrder0017
     * @tc.desc      priorities ascend across all kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPriorityOrder0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const order: FileKind[] = [FileKind.TEXT, FileKind.DOCUMENT, FileKind.IMAGE, FileKind.VIDEO,
        FileKind.AUDIO, FileKind.ARCHIVE, FileKind.DATABASE, FileKind.PROGRAM, FileKind.UNKNOWN];
      for (let index = 1; index < order.length; index++) {
        expect(kindPriority(order[index - 1]) < kindPriority(order[index])).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0018
     * @tc.name      testLabelsAndKeys0018
     * @tc.desc      labels and resource keys cover all kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLabelsAndKeys0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(kindLabel(FileKind.ARCHIVE)).assertEqual('压缩包');
      expect(kindLabel(FileKind.DATABASE)).assertEqual('数据库');
      expect(kindResourceKey(FileKind.PROGRAM)).assertEqual('kind_program');
      expect(kindResourceKey(FileKind.AUDIO)).assertEqual('kind_audio');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0019
     * @tc.name      testEditableTypes0019
     * @tc.desc      editable types include text variants
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableTypes0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isEditableText(describeFile('a.md', 100))).assertTrue();
      expect(isEditableText(describeFile('a.log', 100))).assertTrue();
      expect(isEditableText(describeFile('a.csv', 100))).assertTrue();
      expect(isEditableText(describeFile('a.txt.dlp', 100))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0020
     * @tc.name      testMimeFallback0020
     * @tc.desc      unmapped extensions fall back to octet stream
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeFallback0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(mimeOfExtension('abcxyz')).assertEqual('application/octet-stream');
      expect(mimeOfExtension('dlp')).assertEqual('application/octet-stream');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0021
     * @tc.name      testDetectMp40021
     * @tc.desc      mp4 ftyp boxes are recognized at offset four
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectMp40021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(toBytes([0x00, 0x00, 0x00, 0x18, 0x66, 0x74, 0x79, 0x70])))
        .assertEqual(FileKind.VIDEO);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0022
     * @tc.name      testDetectWebp0022
     * @tc.desc      webp headers are recognized after the riff size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectWebp0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const bytes: Uint8Array = toBytes([82, 73, 70, 70, 16, 0, 0, 0, 87, 69, 66, 80, 86, 80]);
      expect(detectByContent(bytes)).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0023
     * @tc.name      testGroupSingleKind0023
     * @tc.desc      a single kind group holds every file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupSingleKind0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const groups: KindGroup[] = groupByKind([
        describeFile('a.txt', 1),
        describeFile('b.md', 1),
        describeFile('c.json', 1)
      ]);
      expect(groups.length).assertEqual(1);
      expect(groups[0].descriptors.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0024
     * @tc.name      testEditableSizeLimit0024
     * @tc.desc      editable text still honors the size limit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableSizeLimit0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(isEditableText(describeFile('a.md', 1048577))).assertFalse();
      expect(isEditableText(describeFile('a.md', 1048576))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX2_0025
     * @tc.name      testDescribeHap0025
     * @tc.desc      hap packages are programs with the harmony mime type
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeHap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const descriptor: FileDescriptor = describeFile('app.hap', 10);
      expect(descriptor.kind).assertEqual(FileKind.PROGRAM);
      expect(descriptor.mimeType).assertEqual('application/vnd.ohos.package');
    })
  });
}
