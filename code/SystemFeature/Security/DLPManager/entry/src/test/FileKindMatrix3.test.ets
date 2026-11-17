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
import { FileDescriptor, FileKind, describeFile, detectByContent, extensionOfName, kindOfExtension, kindPriority,
  mimeOfExtension, isSampleSupported, matchesAnySuffix } from '../main/ets/core/FileKindCore';

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

export default function fileKindMatrix3Test(): void {
  describe('FileKindMatrix3Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0001
     * @tc.name      testExtensionConsistency0001
     * @tc.desc      descriptor extensions agree with helpers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionConsistency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const names: Array<string> = ['a.txt', 'b.DOCX', 'c.tar.gz', 'd.txt.dlp', 'README', '.hidden'];
      for (let index = 0; index < names.length; index++) {
        const descriptor: FileDescriptor = describeFile(names[index], 1);
        expect(descriptor.extension).assertEqual(extensionOfName(names[index]));
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0002
     * @tc.name      testKindMimeAlignment0002
     * @tc.desc      mime prefixes align with kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindMimeAlignment0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(kindOfExtension('txt')).assertEqual(FileKind.TEXT);
      expect(mimeOfExtension('txt').startsWith('text/')).assertTrue();
      expect(kindOfExtension('png')).assertEqual(FileKind.IMAGE);
      expect(mimeOfExtension('png').startsWith('image/')).assertTrue();
      expect(kindOfExtension('mp4')).assertEqual(FileKind.VIDEO);
      expect(mimeOfExtension('mp4').startsWith('video/')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0003
     * @tc.name      testAudioMimeAlignment0003
     * @tc.desc      audio mime types align with the audio kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAudioMimeAlignment0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'm4a'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.AUDIO);
        expect(mimeOfExtension(extensions[index]).startsWith('audio/')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0004
     * @tc.name      testPriorityMonotonic0004
     * @tc.desc      priorities are strictly increasing across kinds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPriorityMonotonic0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const order: Array<FileKind> = [FileKind.TEXT, FileKind.DOCUMENT, FileKind.IMAGE, FileKind.VIDEO,
        FileKind.AUDIO, FileKind.ARCHIVE, FileKind.DATABASE, FileKind.PROGRAM, FileKind.UNKNOWN];
      for (let index = 1; index < order.length; index++) {
        expect(kindPriority(order[index]) > kindPriority(order[index - 1])).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0005
     * @tc.name      testSampleSupportedLoop0005
     * @tc.desc      sample support covers txt doc and docx variants
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSampleSupportedLoop0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const supported: Array<string> = ['a.txt', 'a.doc', 'a.docx', 'a.TXT', 'a.docx.dlp'];
      for (let index = 0; index < supported.length; index++) {
        expect(isSampleSupported(supported[index])).assertTrue();
      }
      expect(isSampleSupported('a.pdf')).assertFalse();
      expect(isSampleSupported('a.png')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0006
     * @tc.name      testSuffixLoop0006
     * @tc.desc      suffix matching is stable across case variants
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSuffixLoop0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const names: Array<string> = ['a.TXT', 'a.Txt', 'a.txt'];
      for (let index = 0; index < names.length; index++) {
        expect(matchesAnySuffix(names[index], ['.txt'])).assertTrue();
        expect(matchesAnySuffix(names[index], ['txt'])).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0007
     * @tc.name      testDetectLoop0007
     * @tc.desc      magic detection covers every supported signature
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectLoop0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(toBytes([0x89, 0x50, 0x4E, 0x47]))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(toBytes([0xFF, 0xD8, 0xFF]))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(asciiBytes('%PDF'))).assertEqual(FileKind.DOCUMENT);
      expect(detectByContent(toBytes([0x50, 0x4B, 0x03, 0x04]))).assertEqual(FileKind.ARCHIVE);
      expect(detectByContent(toBytes([0x1F, 0x8B]))).assertEqual(FileKind.ARCHIVE);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0008
     * @tc.name      testDetectMediaLoop0008
     * @tc.desc      media signatures are recognized consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectMediaLoop0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(asciiBytes('GIF87a'))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(asciiBytes('GIF89a'))).assertEqual(FileKind.IMAGE);
      expect(detectByContent(asciiBytes('OggS'))).assertEqual(FileKind.AUDIO);
      expect(detectByContent(toBytes([0, 0, 0, 0, 102, 116, 121, 112]))).assertEqual(FileKind.VIDEO);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0009
     * @tc.name      testDetectTextLoop0009
     * @tc.desc      text fallbacks cover ascii unicode and control mixes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetectTextLoop0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(detectByContent(asciiBytes('hello'))).assertEqual(FileKind.TEXT);
      expect(detectByContent(toBytes([0xE4, 0xBD, 0xA0]))).assertEqual(FileKind.TEXT);
      expect(detectByContent(toBytes([0x41, 0x01, 0x02, 0x03, 0x04, 0x05]))).assertEqual(FileKind.UNKNOWN);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0010
     * @tc.name      testDlpFlagLoop0010
     * @tc.desc      dlp flags follow the suffix rules
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level    LEVEL0
     */
    it('testDlpFlagLoop0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const names: Array<string> = ['a.txt.dlp', 'b.dlp', 'c.DLP', 'd.dlp.txt'];
      const expected: Array<boolean> = [true, true, true, false];
      for (let index = 0; index < names.length; index++) {
        expect(describeFile(names[index], 1).isDlp).assertEqual(expected[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0011
     * @tc.name      testSizePreserved0011
     * @tc.desc      sizes are preserved for every extension class
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizePreserved0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const names: Array<string> = ['a.txt', 'a.png', 'a.mp4', 'a.zip', 'a.apk'];
      for (let index = 0; index < names.length; index++) {
        expect(describeFile(names[index], 2048).sizeBytes).assertEqual(2048);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0012
     * @tc.name      testDisplayNameLoop0012
     * @tc.desc      display names strip only the dlp suffix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDisplayNameLoop0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const names: Array<string> = ['a.txt.dlp', 'a.tar.gz.dlp', 'a.dlp'];
      const expected: Array<string> = ['a.txt', 'a.tar.gz', 'a'];
      for (let index = 0; index < names.length; index++) {
        expect(describeFile(names[index], 1).displayName).assertEqual(expected[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0013
     * @tc.name      testMimeFallbackLoop0013
     * @tc.desc      every unmapped extension falls back to octet stream
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeFallbackLoop0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['xyz', 'unknown', '', 'dlp'];
      for (let index = 0; index < extensions.length; index++) {
        expect(mimeOfExtension(extensions[index])).assertEqual('application/octet-stream');
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0014
     * @tc.name      testKindUnknownFallback0014
     * @tc.desc      unknown extensions map to the unknown kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindUnknownFallback0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['xyz', 'zzz', '', 'dlp'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.UNKNOWN);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0015
     * @tc.name      testMimeCase0015
     * @tc.desc      mime lookups ignore extension case
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMimeCase0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(mimeOfExtension('TXT')).assertEqual('text/plain');
      expect(mimeOfExtension('PNG')).assertEqual('image/png');
      expect(mimeOfExtension('MP4')).assertEqual('video/mp4');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0016
     * @tc.name      testExtensionNames0016
     * @tc.desc      extension extraction handles edge names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExtensionNames0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(extensionOfName('a.b.c')).assertEqual('c');
      expect(extensionOfName('.a')).assertEqual('');
      expect(extensionOfName('a.')).assertEqual('');
      expect(extensionOfName('a')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0017
     * @tc.name      testZipAndTarKinds0017
     * @tc.desc      archive extensions share the archive kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testZipAndTarKinds0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['zip', 'rar', '7z', 'gz', 'tar', 'bz2', 'xz'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.ARCHIVE);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0018
     * @tc.name      testOfficeKinds0018
     * @tc.desc      office extensions share the document kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOfficeKinds0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.DOCUMENT);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0019
     * @tc.name      testImageKinds0019
     * @tc.desc      image extensions share the image kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testImageKinds0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp', 'svg', 'heic'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.IMAGE);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_KINDMATRIX3_0020
     * @tc.name      testProgramKinds0020
     * @tc.desc      program extensions share the program kind
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProgramKinds0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const extensions: Array<string> = ['apk', 'hap', 'exe', 'so', 'dll', 'bin'];
      for (let index = 0; index < extensions.length; index++) {
        expect(kindOfExtension(extensions[index])).assertEqual(FileKind.PROGRAM);
      }
    })
  });
}
