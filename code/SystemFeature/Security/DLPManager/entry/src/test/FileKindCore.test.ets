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
import { MAX_EDITABLE_BYTES, FileKind, FileDescriptor, KindGroup, isDlpName, stripDlpSuffix, effectiveName,
  extensionOfName, kindOfExtension, mimeOfExtension, describeFile, isSampleSupported, isEditableText,
  matchesAnySuffix, kindLabel, kindResourceKey, kindPriority, groupByKind, detectByContent
} from '../main/ets/core/FileKindCore';

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

function namesOf(descriptors: Array<FileDescriptor>): string {
  const parts: Array<string> = [];
  for (let index = 0; index < descriptors.length; index++) {
    parts.push(descriptors[index].name);
  }
  return parts.join('|');
}

const DOCX_MIME: string = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';

export default function fileKindCoreTest(): void {
  describe('FileKindCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0001
     * @tc.name      testIsDlpName0001
     * @tc.desc      dlp suffix is detected case insensitively
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsDlpName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsDlpName0001 begin');
      console.info('testIsDlpName0001 begin');
      expect(isDlpName('a.txt.dlp')).assertTrue();
      expect(isDlpName('a.DLP')).assertTrue();
      expect(isDlpName('a.dlp')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0002
     * @tc.name      testIsDlpName0002
     * @tc.desc      non dlp names are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testIsDlpName0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testIsDlpName0002 begin');
      console.info('testIsDlpName0002 begin');
      expect(isDlpName('a.dlp.txt')).assertFalse();
      expect(isDlpName('')).assertFalse();
      expect(isDlpName('a.txt')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0003
     * @tc.name      testStripDlpSuffix0003
     * @tc.desc      dlp suffix is removed from the name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStripDlpSuffix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testStripDlpSuffix0003 begin');
      console.info('testStripDlpSuffix0003 begin');
      expect(stripDlpSuffix('a.txt.dlp')).assertEqual('a.txt');
      expect(stripDlpSuffix('A.DLP')).assertEqual('A');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0004
     * @tc.name      testStripDlpSuffix0004
     * @tc.desc      plain names are unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStripDlpSuffix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testStripDlpSuffix0004 begin');
      console.info('testStripDlpSuffix0004 begin');
      expect(stripDlpSuffix('a.txt')).assertEqual('a.txt');
      expect(stripDlpSuffix('')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0005
     * @tc.name      testStripDlpSuffix0005
     * @tc.desc      suffix only name strips to empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStripDlpSuffix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testStripDlpSuffix0005 begin');
      console.info('testStripDlpSuffix0005 begin');
      expect(stripDlpSuffix('.dlp')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0006
     * @tc.name      testEffectiveName0006
     * @tc.desc      effective name unwraps the dlp container
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEffectiveName0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEffectiveName0006 begin');
      console.info('testEffectiveName0006 begin');
      expect(effectiveName('report.docx.dlp')).assertEqual('report.docx');
      expect(effectiveName('report.docx')).assertEqual('report.docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0007
     * @tc.name      testExtensionOfName0007
     * @tc.desc      extension uses the inner name for dlp files
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionOfName0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionOfName0007 begin');
      console.info('testExtensionOfName0007 begin');
      expect(extensionOfName('a.txt.dlp')).assertEqual('txt');
      expect(extensionOfName('a.tar.gz.dlp')).assertEqual('gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0008
     * @tc.name      testExtensionOfName0008
     * @tc.desc      extension is lowercased
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionOfName0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionOfName0008 begin');
      console.info('testExtensionOfName0008 begin');
      expect(extensionOfName('a.TXT')).assertEqual('txt');
      expect(extensionOfName('a')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0009
     * @tc.name      testExtensionOfName0009
     * @tc.desc      dlp only names have no inner extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionOfName0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExtensionOfName0009 begin');
      console.info('testExtensionOfName0009 begin');
      expect(extensionOfName('a.dlp')).assertEqual('');
      expect(extensionOfName('.gitignore')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0010
     * @tc.name      testKindText0010
     * @tc.desc      common text extensions map to text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindText0010 begin');
      console.info('testKindText0010 begin');
      expect(kindOfExtension('txt')).assertEqual(FileKind.TEXT);
      expect(kindOfExtension('md')).assertEqual(FileKind.TEXT);
      expect(kindOfExtension('json')).assertEqual(FileKind.TEXT);
      expect(kindOfExtension('ets')).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0011
     * @tc.name      testKindImage0011
     * @tc.desc      image extensions map to image
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindImage0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindImage0011 begin');
      console.info('testKindImage0011 begin');
      expect(kindOfExtension('png')).assertEqual(FileKind.IMAGE);
      expect(kindOfExtension('jpg')).assertEqual(FileKind.IMAGE);
      expect(kindOfExtension('svg')).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0012
     * @tc.name      testKindAudioVideo0012
     * @tc.desc      audio and video extensions are separated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindAudioVideo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindAudioVideo0012 begin');
      console.info('testKindAudioVideo0012 begin');
      expect(kindOfExtension('mp3')).assertEqual(FileKind.AUDIO);
      expect(kindOfExtension('ogg')).assertEqual(FileKind.AUDIO);
      expect(kindOfExtension('mp4')).assertEqual(FileKind.VIDEO);
      expect(kindOfExtension('mkv')).assertEqual(FileKind.VIDEO);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0013
     * @tc.name      testKindDocument0013
     * @tc.desc      office and pdf files map to document
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindDocument0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindDocument0013 begin');
      console.info('testKindDocument0013 begin');
      expect(kindOfExtension('pdf')).assertEqual(FileKind.DOCUMENT);
      expect(kindOfExtension('docx')).assertEqual(FileKind.DOCUMENT);
      expect(kindOfExtension('pptx')).assertEqual(FileKind.DOCUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0014
     * @tc.name      testKindArchive0014
     * @tc.desc      archive extensions map to archive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindArchive0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindArchive0014 begin');
      console.info('testKindArchive0014 begin');
      expect(kindOfExtension('zip')).assertEqual(FileKind.ARCHIVE);
      expect(kindOfExtension('gz')).assertEqual(FileKind.ARCHIVE);
      expect(kindOfExtension('7z')).assertEqual(FileKind.ARCHIVE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0015
     * @tc.name      testKindDatabaseProgram0015
     * @tc.desc      database and program extensions are distinct
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindDatabaseProgram0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindDatabaseProgram0015 begin');
      console.info('testKindDatabaseProgram0015 begin');
      expect(kindOfExtension('db')).assertEqual(FileKind.DATABASE);
      expect(kindOfExtension('apk')).assertEqual(FileKind.PROGRAM);
      expect(kindOfExtension('hap')).assertEqual(FileKind.PROGRAM);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0016
     * @tc.name      testKindUnknown0016
     * @tc.desc      unknown and empty extensions map to unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindUnknown0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindUnknown0016 begin');
      console.info('testKindUnknown0016 begin');
      expect(kindOfExtension('xyz')).assertEqual(FileKind.UNKNOWN);
      expect(kindOfExtension('')).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0017
     * @tc.name      testKindCaseInsensitive0017
     * @tc.desc      extension matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindCaseInsensitive0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindCaseInsensitive0017 begin');
      console.info('testKindCaseInsensitive0017 begin');
      expect(kindOfExtension('TXT')).assertEqual(FileKind.TEXT);
      expect(kindOfExtension('PDF')).assertEqual(FileKind.DOCUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0018
     * @tc.name      testMimeText0018
     * @tc.desc      text mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeText0018 begin');
      console.info('testMimeText0018 begin');
      expect(mimeOfExtension('txt')).assertEqual('text/plain');
      expect(mimeOfExtension('md')).assertEqual('text/markdown');
      expect(mimeOfExtension('json')).assertEqual('application/json');
      expect(mimeOfExtension('html')).assertEqual('text/html');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0019
     * @tc.name      testMimeImage0019
     * @tc.desc      image mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeImage0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeImage0019 begin');
      console.info('testMimeImage0019 begin');
      expect(mimeOfExtension('png')).assertEqual('image/png');
      expect(mimeOfExtension('jpeg')).assertEqual('image/jpeg');
      expect(mimeOfExtension('svg')).assertEqual('image/svg+xml');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0020
     * @tc.name      testMimeMedia0020
     * @tc.desc      audio and video mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeMedia0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeMedia0020 begin');
      console.info('testMimeMedia0020 begin');
      expect(mimeOfExtension('mp3')).assertEqual('audio/mpeg');
      expect(mimeOfExtension('mp4')).assertEqual('video/mp4');
      expect(mimeOfExtension('webm')).assertEqual('video/webm');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0021
     * @tc.name      testMimeDocuments0021
     * @tc.desc      document mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeDocuments0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeDocuments0021 begin');
      console.info('testMimeDocuments0021 begin');
      expect(mimeOfExtension('pdf')).assertEqual('application/pdf');
      expect(mimeOfExtension('doc')).assertEqual('application/msword');
      expect(mimeOfExtension('docx')).assertEqual(DOCX_MIME);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0022
     * @tc.name      testMimeArchive0022
     * @tc.desc      archive mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeArchive0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeArchive0022 begin');
      console.info('testMimeArchive0022 begin');
      expect(mimeOfExtension('zip')).assertEqual('application/zip');
      expect(mimeOfExtension('gz')).assertEqual('application/gzip');
      expect(mimeOfExtension('tar')).assertEqual('application/x-tar');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0023
     * @tc.name      testMimeOther0023
     * @tc.desc      database package and fallback mime types are reported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeOther0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMimeOther0023 begin');
      console.info('testMimeOther0023 begin');
      expect(mimeOfExtension('sqlite3')).assertEqual('application/vnd.sqlite3');
      expect(mimeOfExtension('hap')).assertEqual('application/vnd.harmonyos.package');
      expect(mimeOfExtension('unknown')).assertEqual('application/octet-stream');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0024
     * @tc.name      testDescribeText0024
     * @tc.desc      text descriptor reports extension kind and mime
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeText0024 begin');
      console.info('testDescribeText0024 begin');
      const descriptor: FileDescriptor = describeFile('note.txt', 10);
      expect(descriptor.extension).assertEqual('txt');
      expect(descriptor.kind).assertEqual(FileKind.TEXT);
      expect(descriptor.mimeType).assertEqual('text/plain');
      expect(descriptor.isDlp).assertFalse();
      expect(descriptor.sizeBytes).assertEqual(10);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0025
     * @tc.name      testDescribeDlp0025
     * @tc.desc      dlp descriptor unwraps the inner file
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeDlp0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeDlp0025 begin');
      console.info('testDescribeDlp0025 begin');
      const descriptor: FileDescriptor = describeFile('note.txt.dlp', 20);
      expect(descriptor.isDlp).assertTrue();
      expect(descriptor.displayName).assertEqual('note.txt');
      expect(descriptor.extension).assertEqual('txt');
      expect(descriptor.kind).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0026
     * @tc.name      testDescribeDlpOnly0026
     * @tc.desc      dlp container without an inner extension is unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeDlpOnly0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeDlpOnly0026 begin');
      console.info('testDescribeDlpOnly0026 begin');
      const descriptor: FileDescriptor = describeFile('note.dlp', 20);
      expect(descriptor.isDlp).assertTrue();
      expect(descriptor.displayName).assertEqual('note');
      expect(descriptor.extension).assertEqual('');
      expect(descriptor.kind).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0027
     * @tc.name      testDescribeUpperExtension0027
     * @tc.desc      upper case extensions are normalized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeUpperExtension0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeUpperExtension0027 begin');
      console.info('testDescribeUpperExtension0027 begin');
      const descriptor: FileDescriptor = describeFile('photo.JPG', 100);
      expect(descriptor.extension).assertEqual('jpg');
      expect(descriptor.kind).assertEqual(FileKind.IMAGE);
      expect(descriptor.mimeType).assertEqual('image/jpeg');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0028
     * @tc.name      testDescribeNoExtension0028
     * @tc.desc      names without extension are unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeNoExtension0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeNoExtension0028 begin');
      console.info('testDescribeNoExtension0028 begin');
      expect(describeFile('README', 5).kind).assertEqual(FileKind.UNKNOWN);
      expect(describeFile('.gitignore', 5).extension).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0029
     * @tc.name      testDescribeMultiDot0029
     * @tc.desc      multi dot names use the last extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeMultiDot0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeMultiDot0029 begin');
      console.info('testDescribeMultiDot0029 begin');
      const descriptor: FileDescriptor = describeFile('backup.tar.gz.dlp', 30);
      expect(descriptor.extension).assertEqual('gz');
      expect(descriptor.kind).assertEqual(FileKind.ARCHIVE);
      expect(descriptor.displayName).assertEqual('backup.tar.gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0030
     * @tc.name      testDescribeKeepName0030
     * @tc.desc      original name is kept untouched
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDescribeKeepName0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDescribeKeepName0030 begin');
      console.info('testDescribeKeepName0030 begin');
      expect(describeFile('A.Txt.DLP', 1).name).assertEqual('A.Txt.DLP');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0031
     * @tc.name      testSampleSupportedTxt0031
     * @tc.desc      txt doc and docx are supported by the sample
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSampleSupportedTxt0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSampleSupportedTxt0031 begin');
      console.info('testSampleSupportedTxt0031 begin');
      expect(isSampleSupported('a.txt')).assertTrue();
      expect(isSampleSupported('a.doc')).assertTrue();
      expect(isSampleSupported('a.docx')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0032
     * @tc.name      testSampleSupportedDlp0032
     * @tc.desc      dlp wrapped text is still supported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSampleSupportedDlp0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSampleSupportedDlp0032 begin');
      console.info('testSampleSupportedDlp0032 begin');
      expect(isSampleSupported('a.txt.dlp')).assertTrue();
      expect(isSampleSupported('a.docx.dlp')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0033
     * @tc.name      testSampleUnsupported0033
     * @tc.desc      images and bare dlp files are not supported
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSampleUnsupported0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSampleUnsupported0033 begin');
      console.info('testSampleUnsupported0033 begin');
      expect(isSampleSupported('a.png')).assertFalse();
      expect(isSampleSupported('a.dlp')).assertFalse();
      expect(isSampleSupported('a.tar.gz')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0034
     * @tc.name      testEditableTextEmpty0034
     * @tc.desc      zero byte text is editable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableTextEmpty0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableTextEmpty0034 begin');
      console.info('testEditableTextEmpty0034 begin');
      expect(isEditableText(describeFile('a.txt', 0))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0035
     * @tc.name      testEditableTextLimit0035
     * @tc.desc      exactly one megabyte is editable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableTextLimit0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableTextLimit0035 begin');
      console.info('testEditableTextLimit0035 begin');
      expect(isEditableText(describeFile('a.txt', MAX_EDITABLE_BYTES))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0036
     * @tc.name      testEditableTextOverLimit0036
     * @tc.desc      one byte above the limit is not editable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableTextOverLimit0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableTextOverLimit0036 begin');
      console.info('testEditableTextOverLimit0036 begin');
      expect(isEditableText(describeFile('a.txt', MAX_EDITABLE_BYTES + 1))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0037
     * @tc.name      testEditableNonText0037
     * @tc.desc      non text files are not editable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableNonText0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableNonText0037 begin');
      console.info('testEditableNonText0037 begin');
      expect(isEditableText(describeFile('a.png', 10))).assertFalse();
      expect(isEditableText(describeFile('a.pdf', 10))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0038
     * @tc.name      testEditableNegativeSize0038
     * @tc.desc      negative sizes are not editable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableNegativeSize0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableNegativeSize0038 begin');
      console.info('testEditableNegativeSize0038 begin');
      expect(isEditableText(describeFile('a.txt', -1))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0039
     * @tc.name      testEditableMarkdown0039
     * @tc.desc      markdown counts as editable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditableMarkdown0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEditableMarkdown0039 begin');
      console.info('testEditableMarkdown0039 begin');
      expect(isEditableText(describeFile('a.md', 100))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0040
     * @tc.name      testSuffixDot0040
     * @tc.desc      suffixes with dots match directly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixDot0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixDot0040 begin');
      console.info('testSuffixDot0040 begin');
      expect(matchesAnySuffix('a.txt', ['.txt'])).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0041
     * @tc.name      testSuffixNoDot0041
     * @tc.desc      suffixes without dots are normalized
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixNoDot0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixNoDot0041 begin');
      console.info('testSuffixNoDot0041 begin');
      expect(matchesAnySuffix('a.txt', ['txt'])).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0042
     * @tc.name      testSuffixCase0042
     * @tc.desc      suffix matching ignores case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixCase0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixCase0042 begin');
      console.info('testSuffixCase0042 begin');
      expect(matchesAnySuffix('A.TXT', ['.txt'])).assertTrue();
      expect(matchesAnySuffix('a.txt', ['TXT'])).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0043
     * @tc.name      testSuffixList0043
     * @tc.desc      any suffix in the list can match
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixList0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixList0043 begin');
      console.info('testSuffixList0043 begin');
      expect(matchesAnySuffix('a.txt', ['.png', '.txt'])).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0044
     * @tc.name      testSuffixMiss0044
     * @tc.desc      unmatched and empty suffix lists return false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixMiss0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixMiss0044 begin');
      console.info('testSuffixMiss0044 begin');
      expect(matchesAnySuffix('a.txt', ['.png'])).assertFalse();
      expect(matchesAnySuffix('a.txt', [])).assertFalse();
      expect(matchesAnySuffix('a.txt', [''])).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0045
     * @tc.name      testSuffixNotPartial0045
     * @tc.desc      suffix match requires the dot boundary
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixNotPartial0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSuffixNotPartial0045 begin');
      console.info('testSuffixNotPartial0045 begin');
      expect(matchesAnySuffix('atxt', ['txt'])).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0046
     * @tc.name      testKindLabelText0046
     * @tc.desc      text kind has a chinese label
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindLabelText0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindLabelText0046 begin');
      console.info('testKindLabelText0046 begin');
      expect(kindLabel(FileKind.TEXT)).assertEqual('文本');
      expect(kindLabel(FileKind.IMAGE)).assertEqual('图片');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0047
     * @tc.name      testKindLabelMedia0047
     * @tc.desc      media kinds have chinese labels
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindLabelMedia0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindLabelMedia0047 begin');
      console.info('testKindLabelMedia0047 begin');
      expect(kindLabel(FileKind.AUDIO)).assertEqual('音频');
      expect(kindLabel(FileKind.VIDEO)).assertEqual('视频');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0048
     * @tc.name      testKindLabelFiles0048
     * @tc.desc      document archive database labels are defined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindLabelFiles0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindLabelFiles0048 begin');
      console.info('testKindLabelFiles0048 begin');
      expect(kindLabel(FileKind.DOCUMENT)).assertEqual('文档');
      expect(kindLabel(FileKind.ARCHIVE)).assertEqual('压缩包');
      expect(kindLabel(FileKind.DATABASE)).assertEqual('数据库');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0049
     * @tc.name      testKindLabelRest0049
     * @tc.desc      program and unknown labels are defined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindLabelRest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindLabelRest0049 begin');
      console.info('testKindLabelRest0049 begin');
      expect(kindLabel(FileKind.PROGRAM)).assertEqual('程序');
      expect(kindLabel(FileKind.UNKNOWN)).assertEqual('未知');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0050
     * @tc.name      testKindResourceKey0050
     * @tc.desc      resource keys follow the kind value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindResourceKey0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindResourceKey0050 begin');
      console.info('testKindResourceKey0050 begin');
      expect(kindResourceKey(FileKind.TEXT)).assertEqual('kind_text');
      expect(kindResourceKey(FileKind.IMAGE)).assertEqual('kind_image');
      expect(kindResourceKey(FileKind.UNKNOWN)).assertEqual('kind_unknown');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0051
     * @tc.name      testKindPriorityOrder0051
     * @tc.desc      text and document have the highest priority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindPriorityOrder0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindPriorityOrder0051 begin');
      console.info('testKindPriorityOrder0051 begin');
      expect(kindPriority(FileKind.TEXT)).assertEqual(0);
      expect(kindPriority(FileKind.DOCUMENT)).assertEqual(1);
      expect(kindPriority(FileKind.IMAGE)).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0052
     * @tc.name      testKindPriorityTail0052
     * @tc.desc      unknown kinds sort last
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindPriorityTail0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKindPriorityTail0052 begin');
      console.info('testKindPriorityTail0052 begin');
      expect(kindPriority(FileKind.PROGRAM)).assertEqual(7);
      expect(kindPriority(FileKind.UNKNOWN)).assertEqual(9);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0053
     * @tc.name      testGroupEmpty0053
     * @tc.desc      empty input yields no groups
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupEmpty0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupEmpty0053 begin');
      console.info('testGroupEmpty0053 begin');
      expect(groupByKind([]).length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0054
     * @tc.name      testGroupSingleKind0054
     * @tc.desc      same kind files share one group
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupSingleKind0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupSingleKind0054 begin');
      console.info('testGroupSingleKind0054 begin');
      const groups: Array<KindGroup> = groupByKind([describeFile('a.txt', 1), describeFile('b.txt', 1)]);
      expect(groups.length).assertEqual(1);
      expect(groups[0].descriptors.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0055
     * @tc.name      testGroupOrder0055
     * @tc.desc      groups are ordered by kind priority
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupOrder0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupOrder0055 begin');
      console.info('testGroupOrder0055 begin');
      const groups: Array<KindGroup> = groupByKind([describeFile('a.png', 1), describeFile('b.txt', 1)]);
      expect(groups.length).assertEqual(2);
      expect(groups[0].kind).assertEqual(FileKind.TEXT);
      expect(groups[1].kind).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0056
     * @tc.name      testGroupUnknownLast0056
     * @tc.desc      unknown group sorts after known kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupUnknownLast0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupUnknownLast0056 begin');
      console.info('testGroupUnknownLast0056 begin');
      const groups: Array<KindGroup> = groupByKind([describeFile('a.xyz', 1), describeFile('b.docx', 1)]);
      expect(groups[0].kind).assertEqual(FileKind.DOCUMENT);
      expect(groups[1].kind).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0057
     * @tc.name      testGroupKeepsNames0057
     * @tc.desc      group members keep their original order
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGroupKeepsNames0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGroupKeepsNames0057 begin');
      console.info('testGroupKeepsNames0057 begin');
      const groups: Array<KindGroup> = groupByKind([describeFile('b.txt', 1), describeFile('a.txt', 1)]);
      expect(namesOf(groups[0].descriptors)).assertEqual('b.txt|a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0058
     * @tc.name      testDetectEmpty0058
     * @tc.desc      empty content is unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectEmpty0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectEmpty0058 begin');
      console.info('testDetectEmpty0058 begin');
      expect(detectByContent(toBytes([]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0059
     * @tc.name      testDetectPng0059
     * @tc.desc      png magic is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectPng0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectPng0059 begin');
      console.info('testDetectPng0059 begin');
      expect(detectByContent(toBytes([0x89, 0x50, 0x4E, 0x47, 0x0D]))).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0060
     * @tc.name      testDetectJpeg0060
     * @tc.desc      jpeg magic is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectJpeg0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectJpeg0060 begin');
      console.info('testDetectJpeg0060 begin');
      expect(detectByContent(toBytes([0xFF, 0xD8, 0xFF, 0xE0]))).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0061
     * @tc.name      testDetectGif0061
     * @tc.desc      gif signature is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectGif0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectGif0061 begin');
      console.info('testDetectGif0061 begin');
      expect(detectByContent(asciiBytes('GIF89a'))).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0062
     * @tc.name      testDetectBmp0062
     * @tc.desc      bmp signature is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectBmp0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectBmp0062 begin');
      console.info('testDetectBmp0062 begin');
      expect(detectByContent(toBytes([0x42, 0x4D, 0x00]))).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0063
     * @tc.name      testDetectWebp0063
     * @tc.desc      webp riff header is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectWebp0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectWebp0063 begin');
      console.info('testDetectWebp0063 begin');
      const bytes: Uint8Array = toBytes([82, 73, 70, 70, 0, 0, 0, 0, 87, 69, 66, 80]);
      expect(detectByContent(bytes)).assertEqual(FileKind.IMAGE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0064
     * @tc.name      testDetectPdf0064
     * @tc.desc      pdf header is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectPdf0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectPdf0064 begin');
      console.info('testDetectPdf0064 begin');
      expect(detectByContent(asciiBytes('%PDF-1.7'))).assertEqual(FileKind.DOCUMENT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0065
     * @tc.name      testDetectZip0065
     * @tc.desc      zip local header is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectZip0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectZip0065 begin');
      console.info('testDetectZip0065 begin');
      expect(detectByContent(toBytes([0x50, 0x4B, 0x03, 0x04, 0x14]))).assertEqual(FileKind.ARCHIVE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0066
     * @tc.name      testDetectGzip0066
     * @tc.desc      gzip magic is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectGzip0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectGzip0066 begin');
      console.info('testDetectGzip0066 begin');
      expect(detectByContent(toBytes([0x1F, 0x8B, 0x08]))).assertEqual(FileKind.ARCHIVE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0067
     * @tc.name      testDetectMp40067
     * @tc.desc      mp4 ftyp box is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectMp40067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectMp40067 begin');
      console.info('testDetectMp40067 begin');
      const bytes: Uint8Array = toBytes([0, 0, 0, 0, 102, 116, 121, 112]);
      expect(detectByContent(bytes)).assertEqual(FileKind.VIDEO);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0068
     * @tc.name      testDetectOgg0068
     * @tc.desc      ogg signature is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectOgg0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectOgg0068 begin');
      console.info('testDetectOgg0068 begin');
      expect(detectByContent(asciiBytes('OggS 0'))).assertEqual(FileKind.AUDIO);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0069
     * @tc.name      testDetectAscii0069
     * @tc.desc      plain ascii content is text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectAscii0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectAscii0069 begin');
      console.info('testDetectAscii0069 begin');
      expect(detectByContent(asciiBytes('hello world'))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0070
     * @tc.name      testDetectChinese0070
     * @tc.desc      utf8 chinese content is text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectChinese0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectChinese0070 begin');
      console.info('testDetectChinese0070 begin');
      const bytes: Uint8Array = toBytes([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      expect(detectByContent(bytes)).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0071
     * @tc.name      testDetectBinary0071
     * @tc.desc      invalid utf8 bytes are unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectBinary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectBinary0071 begin');
      console.info('testDetectBinary0071 begin');
      expect(detectByContent(toBytes([0xFF, 0xFE, 0x00, 0x02]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0072
     * @tc.name      testDetectControlHeavy0072
     * @tc.desc      mostly control characters are not text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectControlHeavy0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectControlHeavy0072 begin');
      console.info('testDetectControlHeavy0072 begin');
      const bytes: Uint8Array = toBytes([0x41, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x42, 0x43]);
      expect(detectByContent(bytes)).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0073
     * @tc.name      testDetectNewlines0073
     * @tc.desc      newlines and tabs count as printable text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectNewlines0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectNewlines0073 begin');
      console.info('testDetectNewlines0073 begin');
      expect(detectByContent(asciiBytes('a\nb\tc\r\n'))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0074
     * @tc.name      testDetectPngShort0074
     * @tc.desc      truncated magic shorter than four bytes stays unknown
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectPngShort0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectPngShort0074 begin');
      console.info('testDetectPngShort0074 begin');
      expect(detectByContent(toBytes([0x89, 0x50]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0075
     * @tc.name      testDetectSingleByte0075
     * @tc.desc      single printable byte is text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectSingleByte0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectSingleByte0075 begin');
      console.info('testDetectSingleByte0075 begin');
      expect(detectByContent(toBytes([0x41]))).assertEqual(FileKind.TEXT);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FILEKIND_0076
     * @tc.name      testDetectNul0076
     * @tc.desc      content with nul bytes is not recognized as text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectNul0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDetectNul0076 begin');
      console.info('testDetectNul0076 begin');
      expect(detectByContent(toBytes([0x41, 0x00, 0x42]))).assertEqual(FileKind.UNKNOWN);
    })
  });
}
