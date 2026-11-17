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
import { FileDescriptor, FileKind, KindGroup, MAX_EDITABLE_BYTES, describeFile, detectByContent,
  extensionOfName, groupByKind, isDlpName, isEditableText, isSampleSupported, kindLabel, kindOfExtension,
  kindPriority, kindResourceKey, matchesAnySuffix, mimeOfExtension, stripDlpSuffix } from '../main/ets/core/FileKindCore';

function toBytes(codes: Array<number>): Uint8Array {
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

function joinTexts(values: Array<string>): string {
  return values.join('|');
}

export default function fileKindMatrixTest(): void {
  describe('FileKindMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0001
     * @tc.name      testTextKinds0001
     * @tc.desc      text extensions map to the text kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTextKinds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTextKinds0001 begin');
      const extensions: Array<string> = ['txt', 'md', 'log', 'csv', 'json', 'xml', 'html', 'css', 'js', 'ts',
        'ets', 'yml', 'yaml', 'ini', 'conf', 'sh', 'bat'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.TEXT);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0002
     * @tc.name      testImageKinds0002
     * @tc.desc      image extensions map to the image kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageKinds0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testImageKinds0002 begin');
      const extensions: Array<string> = ['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp', 'svg', 'heic'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.IMAGE);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0003
     * @tc.name      testAudioKinds0003
     * @tc.desc      audio extensions map to the audio kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAudioKinds0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAudioKinds0003 begin');
      const extensions: Array<string> = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'm4a'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.AUDIO);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0004
     * @tc.name      testVideoKinds0004
     * @tc.desc      video extensions map to the video kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVideoKinds0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testVideoKinds0004 begin');
      const extensions: Array<string> = ['mp4', 'mkv', 'mov', 'avi', 'webm', '3gp'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.VIDEO);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0005
     * @tc.name      testDocumentKinds0005
     * @tc.desc      document extensions map to the document kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDocumentKinds0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDocumentKinds0005 begin');
      const extensions: Array<string> = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'odt', 'rtf'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.DOCUMENT);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0006
     * @tc.name      testArchiveKinds0006
     * @tc.desc      archive extensions map to the archive kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testArchiveKinds0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testArchiveKinds0006 begin');
      const extensions: Array<string> = ['zip', 'rar', '7z', 'gz', 'tar', 'bz2', 'xz'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.ARCHIVE);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0007
     * @tc.name      testDatabaseKinds0007
     * @tc.desc      database extensions map to the database kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDatabaseKinds0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDatabaseKinds0007 begin');
      const extensions: Array<string> = ['db', 'sqlite', 'sqlite3', 'mdb'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.DATABASE);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0008
     * @tc.name      testProgramKinds0008
     * @tc.desc      program extensions map to the program kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProgramKinds0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testProgramKinds0008 begin');
      const extensions: Array<string> = ['apk', 'hap', 'exe', 'so', 'dll', 'bin', 'abc'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.PROGRAM);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0009
     * @tc.name      testUnknownKinds0009
     * @tc.desc      unknown extensions map to the unknown kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUnknownKinds0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUnknownKinds0009 begin');
      expect(kindOfExtension('')).assertEqual(FileKind.UNKNOWN);
      expect(kindOfExtension('xyz')).assertEqual(FileKind.UNKNOWN);
      expect(kindOfExtension('dlp')).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0010
     * @tc.name      testMimeTextSweep0010
     * @tc.desc      text mime types cover the common set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeTextSweep0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeTextSweep0010 begin');
      expect(mimeOfExtension('txt')).assertEqual('text/plain');
      expect(mimeOfExtension('csv')).assertEqual('text/csv');
      expect(mimeOfExtension('json')).assertEqual('application/json');
      expect(mimeOfExtension('xml')).assertEqual('application/xml');
      expect(mimeOfExtension('yaml')).assertEqual('application/yaml');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0011
     * @tc.name      testMimeMediaSweep0011
     * @tc.desc      media mime types cover the common set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeMediaSweep0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeMediaSweep0011 begin');
      expect(mimeOfExtension('gif')).assertEqual('image/gif');
      expect(mimeOfExtension('webp')).assertEqual('image/webp');
      expect(mimeOfExtension('wav')).assertEqual('audio/wav');
      expect(mimeOfExtension('m4a')).assertEqual('audio/mp4');
      expect(mimeOfExtension('mov')).assertEqual('video/quicktime');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0012
     * @tc.name      testMimeDocumentSweep0012
     * @tc.desc      office mime types cover the common set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeDocumentSweep0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeDocumentSweep0012 begin');
      expect(mimeOfExtension('xls')).assertEqual('application/vnd.ms-excel');
      expect(mimeOfExtension('ppt')).assertEqual('application/vnd.ms-powerpoint');
      expect(mimeOfExtension('rar')).assertEqual('application/vnd.rar');
      expect(mimeOfExtension('7z')).assertEqual('application/x-7z-compressed');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0013
     * @tc.name      testDescribePlain0013
     * @tc.desc      plain descriptors keep name extension and mime
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribePlain0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribePlain0013 begin');
      const descriptor: FileDescriptor = describeFile('note.md', 42);
      expect(descriptor.name).assertEqual('note.md');
      expect(descriptor.displayName).assertEqual('note.md');
      expect(descriptor.extension).assertEqual('md');
      expect(descriptor.isDlp).assertFalse();
      expect(descriptor.sizeBytes).assertEqual(42);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0014
     * @tc.name      testDescribeDlp0014
     * @tc.desc      dlp descriptors expose the inner file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeDlp0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeDlp0014 begin');
      const descriptor: FileDescriptor = describeFile('shared/report.docx.dlp', 100);
      expect(descriptor.isDlp).assertTrue();
      expect(descriptor.displayName).assertEqual('shared/report.docx');
      expect(descriptor.extension).assertEqual('docx');
      expect(descriptor.kind).assertEqual(FileKind.DOCUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0015
     * @tc.name      testDescribeUppercase0015
     * @tc.desc      uppercase extensions are normalized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeUppercase0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeUppercase0015 begin');
      const descriptor: FileDescriptor = describeFile('PHOTO.JPEG', 10);
      expect(descriptor.extension).assertEqual('jpeg');
      expect(descriptor.kind).assertEqual(FileKind.IMAGE);
      expect(descriptor.mimeType).assertEqual('image/jpeg');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0016
     * @tc.name      testDescribeDoubleDlp0016
     * @tc.desc      only the outer dlp suffix is stripped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeDoubleDlp0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeDoubleDlp0016 begin');
      const descriptor: FileDescriptor = describeFile('a.txt.dlp.dlp', 10);
      expect(descriptor.displayName).assertEqual('a.txt.dlp');
      expect(descriptor.extension).assertEqual('dlp');
      expect(descriptor.kind).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0017
     * @tc.name      testExtensionOfDlp0017
     * @tc.desc      extension helpers unwrap dlp containers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionOfDlp0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionOfDlp0017 begin');
      expect(extensionOfName('a.txt.dlp')).assertEqual('txt');
      expect(extensionOfName('a.PNG.dlp')).assertEqual('png');
      expect(extensionOfName('a.dlp')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0018
     * @tc.name      testDlpHelpers0018
     * @tc.desc      dlp name helpers follow the suffix rules
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpHelpers0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDlpHelpers0018 begin');
      expect(isDlpName('a.dlp')).assertTrue();
      expect(isDlpName('a.dlp.txt')).assertFalse();
      expect(stripDlpSuffix('A.DLP')).assertEqual('A');
      expect(stripDlpSuffix('plain.txt')).assertEqual('plain.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0019
     * @tc.name      testSampleSupported0019
     * @tc.desc      sample supported formats are txt doc and docx
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSampleSupported0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSampleSupported0019 begin');
      expect(isSampleSupported('a.txt')).assertTrue();
      expect(isSampleSupported('a.doc')).assertTrue();
      expect(isSampleSupported('a.docx')).assertTrue();
      expect(isSampleSupported('a.txt.dlp')).assertTrue();
      expect(isSampleSupported('a.pdf')).assertFalse();
      expect(isSampleSupported('a.dlp')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0020
     * @tc.name      testEditableBoundary0020
     * @tc.desc      editable text honors the size limit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableBoundary0020 begin');
      expect(isEditableText(describeFile('a.txt', 0))).assertTrue();
      expect(isEditableText(describeFile('a.txt', MAX_EDITABLE_BYTES))).assertTrue();
      expect(isEditableText(describeFile('a.txt', MAX_EDITABLE_BYTES + 1))).assertFalse();
      expect(isEditableText(describeFile('a.jpg', 10))).assertFalse();
      expect(isEditableText(describeFile('a.csv', 10))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0021
     * @tc.name      testSuffixMatrix0021
     * @tc.desc      suffix matching handles dots case and lists
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixMatrix0021 begin');
      expect(matchesAnySuffix('a.txt', ['.txt'])).assertTrue();
      expect(matchesAnySuffix('a.txt', ['txt'])).assertTrue();
      expect(matchesAnySuffix('A.TXT', ['Txt'])).assertTrue();
      expect(matchesAnySuffix('a.txt', ['.md', '.txt'])).assertTrue();
      expect(matchesAnySuffix('a.txt', ['.md'])).assertFalse();
      expect(matchesAnySuffix('a.txt', [])).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0022
     * @tc.name      testKindLabels0022
     * @tc.desc      every kind has a chinese label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindLabels0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindLabels0022 begin');
      expect(kindLabel(FileKind.TEXT)).assertEqual('文本');
      expect(kindLabel(FileKind.IMAGE)).assertEqual('图片');
      expect(kindLabel(FileKind.AUDIO)).assertEqual('音频');
      expect(kindLabel(FileKind.VIDEO)).assertEqual('视频');
      expect(kindLabel(FileKind.DOCUMENT)).assertEqual('文档');
      expect(kindLabel(FileKind.ARCHIVE)).assertEqual('压缩包');
      expect(kindLabel(FileKind.DATABASE)).assertEqual('数据库');
      expect(kindLabel(FileKind.PROGRAM)).assertEqual('程序');
      expect(kindLabel(FileKind.UNKNOWN)).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0023
     * @tc.name      testKindResourceKey0023
     * @tc.desc      resource keys follow the kind values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindResourceKey0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindResourceKey0023 begin');
      expect(kindResourceKey(FileKind.TEXT)).assertEqual('kind_text');
      expect(kindResourceKey(FileKind.DOCUMENT)).assertEqual('kind_document');
      expect(kindResourceKey(FileKind.UNKNOWN)).assertEqual('kind_unknown');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0024
     * @tc.name      testKindPriority0024
     * @tc.desc      kind priority orders text before media
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindPriority0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindPriority0024 begin');
      expect(kindPriority(FileKind.TEXT) < kindPriority(FileKind.DOCUMENT)).assertTrue();
      expect(kindPriority(FileKind.DOCUMENT) < kindPriority(FileKind.IMAGE)).assertTrue();
      expect(kindPriority(FileKind.IMAGE) < kindPriority(FileKind.VIDEO)).assertTrue();
      expect(kindPriority(FileKind.PROGRAM) < kindPriority(FileKind.UNKNOWN)).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0025
     * @tc.name      testGroupMatrix0025
     * @tc.desc      grouping collects and orders kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupMatrix0025 begin');
      const groups: Array<KindGroup> = groupByKind([
        describeFile('a.png', 1),
        describeFile('b.txt', 1),
        describeFile('c.md', 1),
        describeFile('d.xyz', 1)
      ]);
      expect(groups.length).assertEqual(3);
      expect(groups[0].kind).assertEqual(FileKind.TEXT);
      expect(groups[0].descriptors.length).assertEqual(2);
      expect(groups[2].kind).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0026
     * @tc.name      testGroupEmpty0026
     * @tc.desc      empty inputs produce no groups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupEmpty0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupEmpty0026 begin');
      expect(groupByKind([]).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0027
     * @tc.name      testDetectMatrix0027
     * @tc.desc      magic numbers identify common formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectMatrix0027 begin');
      expect(detectByContent(toBytes([0x89, 0x50, 0x4E, 0x47]))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(toBytes([0xFF, 0xD8, 0xFF]))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(asciiBytes('%PDF-1.4'))).assertEqual(FileKind.DOCUMENT);
      expect(detectByContent(toBytes([0x50, 0x4B, 0x03, 0x04]))).assertEqual(FileKind.ARCHIVE);
      expect(detectByContent(toBytes([0x1F, 0x8B]))).assertEqual(FileKind.ARCHIVE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0028
     * @tc.name      testDetectMedia0028
     * @tc.desc      media signatures are recognized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectMedia0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectMedia0028 begin');
      expect(detectByContent(asciiBytes('GIF89a'))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(asciiBytes('OggS....'))).assertEqual(FileKind.AUDIO);
      expect(detectByContent(toBytes([0, 0, 0, 0, 102, 116, 121, 112]))).assertEqual(FileKind.VIDEO);
      expect(detectByContent(toBytes([0x42, 0x4D, 0x00]))).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0029
     * @tc.name      testDetectTextMatrix0029
     * @tc.desc      text content is recognized by validity and printability
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectTextMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectTextMatrix0029 begin');
      expect(detectByContent(asciiBytes('plain text'))).assertEqual(FileKind.TEXT);
      expect(detectByContent(toBytes([0xE4, 0xBD, 0xA0]))).assertEqual(FileKind.TEXT);
      expect(detectByContent(toBytes([0x41, 0x00, 0x42]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0030
     * @tc.name      testDetectEdges0030
     * @tc.desc      empty and invalid content stay unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectEdges0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectEdges0030 begin');
      expect(detectByContent(toBytes([]))).assertEqual(FileKind.UNKNOWN);
      expect(detectByContent(toBytes([0xFF, 0xFE]))).assertEqual(FileKind.UNKNOWN);
      expect(detectByContent(toBytes([0x41]))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0031
     * @tc.name      testDetectControlRatio0031
     * @tc.desc      control heavy content falls back to unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectControlRatio0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectControlRatio0031 begin');
      const bytes: Uint8Array = toBytes([0x41, 0x01, 0x02, 0x03, 0x04, 0x05, 0x42]);
      expect(detectByContent(bytes)).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0032
     * @tc.name      testMimeFallback0032
     * @tc.desc      unknown extensions fall back to octet stream
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeFallback0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeFallback0032 begin');
      expect(mimeOfExtension('xyz')).assertEqual('application/octet-stream');
      expect(mimeOfExtension('')).assertEqual('application/octet-stream');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX_0033
     * @tc.name      testStringKindsDisplay0033
     * @tc.desc      kind values are stable strings
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStringKindsDisplay0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testStringKindsDisplay0033 begin');
      expect(FileKind.TEXT.toString()).assertEqual('text');
      expect(FileKind.DOCUMENT.toString()).assertEqual('document');
      expect(FileKind.UNKNOWN.toString()).assertEqual('unknown');
    })
  });
}
