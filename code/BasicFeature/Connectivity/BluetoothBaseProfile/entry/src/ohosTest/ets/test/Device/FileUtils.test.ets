/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { FileUtils } from 'library';

/**
 * Test suite for FileUtils.
 * @since 26.0.0
 */
const FALLBACK_MIME: string = 'application/octet-stream';
const KILOBYTE: number = 1024;
const MEGABYTE: number = 1048576;
const GIGABYTE: number = 1073741824;
const TERABYTE: number = 1099511627776;

export default function fileUtilsTest(): void {
  describe('FileUtilsTest', () => {
    // ==================== 扩展名解析（3 条） ====================

    /*
     * @tc.number: SUB_FILE_UTILS_0100
     * @tc.name: testFileUtils0001
     * @tc.desc: Extract the trailing extension of ordinary and multi dotted file names.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0001', 0, () => {
      expect(FileUtils.getExtension('a.txt')).assertEqual('txt');
      expect(FileUtils.getExtension('A.TXt')).assertEqual('txt');
      expect(FileUtils.getExtension('archive.tar.gz')).assertEqual('gz');
      expect(FileUtils.getExtension('a.b.c.d')).assertEqual('d');
      expect(FileUtils.getExtension('photo.JPG')).assertEqual('jpg');
      expect(FileUtils.getExtension('report.pdf')).assertEqual('pdf');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_0200
     * @tc.name: testFileUtils0002
     * @tc.desc: Return an empty extension for names without a usable dot separator.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0002', 0, () => {
      expect(FileUtils.getExtension('')).assertEqual('');
      expect(FileUtils.getExtension('noext')).assertEqual('');
      expect(FileUtils.getExtension('.hidden')).assertEqual('hidden');
      expect(FileUtils.getExtension('x.')).assertEqual('');
      expect(FileUtils.getExtension('dir/')).assertEqual('');
      expect(FileUtils.getExtension('/data/local/tmp')).assertEqual('');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_0300
     * @tc.name: testFileUtils0003
     * @tc.desc: Strip the directory part from absolute, relative and trailing slash paths.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0003', 0, () => {
      expect(FileUtils.getFileName('/data/local/tmp/a.txt')).assertEqual('a.txt');
      expect(FileUtils.getFileName('a.txt')).assertEqual('a.txt');
      expect(FileUtils.getFileName('a/b/c/audio.mp3')).assertEqual('audio.mp3');
      expect(FileUtils.getFileName('a/b/')).assertEqual('');
      expect(FileUtils.getFileName('/')).assertEqual('');
      expect(FileUtils.getFileName('')).assertEqual('');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_0400
     * @tc.name: testFileUtils0004
     * @tc.desc: Remove only the last extension from a file name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0004', 0, () => {
      expect(FileUtils.getFileNameWithoutExtension('a.txt')).assertEqual('a');
      expect(FileUtils.getFileNameWithoutExtension('archive.tar.gz')).assertEqual('archive.tar');
      expect(FileUtils.getFileNameWithoutExtension('noext')).assertEqual('noext');
      expect(FileUtils.getFileNameWithoutExtension('.hidden')).assertEqual('');
      expect(FileUtils.getFileNameWithoutExtension('')).assertEqual('');
      expect(FileUtils.getFileNameWithoutExtension('song.mp3')).assertEqual('song');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_0500
     * @tc.name: testFileUtils0005
     * @tc.desc: Chain the name, extension and base name helpers on one path.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0005', 0, () => {
      const path: string = '/storage/emulated/0/music/audio.mp3';
      const name: string = FileUtils.getFileName(path);
      const extension: string = FileUtils.getExtension(name);
      const base: string = FileUtils.getFileNameWithoutExtension(name);

      expect(name).assertEqual('audio.mp3');
      expect(extension).assertEqual('mp3');
      expect(base).assertEqual('audio');
      expect(base + '.' + extension).assertEqual(name);
      expect(FileUtils.getParentPath(path)).assertEqual('/storage/emulated/0/music');
      expect(FileUtils.getFileName(FileUtils.getParentPath(path))).assertEqual('music');
    });

    // ==================== 体积格式化（2 条） ====================

    /*
     * @tc.number: SUB_FILE_UTILS_0600
     * @tc.name: testFileUtils0006
     * @tc.desc: Format byte level sizes with two decimals and the raw byte unit.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0006', 0, () => {
      expect(FileUtils.formatFileSize(0)).assertEqual('0 B');
      expect(FileUtils.formatFileSize(1)).assertEqual('1.00 B');
      expect(FileUtils.formatFileSize(512)).assertEqual('512.00 B');
      expect(FileUtils.formatFileSize(999)).assertEqual('999.00 B');
      expect(FileUtils.formatFileSize(KILOBYTE - 1)).assertEqual('1023.00 B');
      expect(FileUtils.formatFileSize(10)).assertEqual('10.00 B');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_0700
     * @tc.name: testFileUtils0007
     * @tc.desc: Format sizes at every unit boundary from kilobyte to terabyte.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0007', 0, () => {
      expect(FileUtils.formatFileSize(KILOBYTE)).assertEqual('1.00 KB');
      expect(FileUtils.formatFileSize(1536)).assertEqual('1.50 KB');
      expect(FileUtils.formatFileSize(12345)).assertEqual('12.06 KB');
      expect(FileUtils.formatFileSize(MEGABYTE)).assertEqual('1.00 MB');
      expect(FileUtils.formatFileSize(GIGABYTE)).assertEqual('1.00 GB');
      expect(FileUtils.formatFileSize(TERABYTE)).assertEqual('1.00 TB');
      expect(FileUtils.formatFileSize(KILOBYTE + 1)).assertEqual('1.00 KB');
    });

    // ==================== 文件类别判定（5 条） ====================

    /*
     * @tc.number: SUB_FILE_UTILS_0800
     * @tc.name: testFileUtils0008
     * @tc.desc: Recognize every supported image extension and reject the remaining types.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0008', 0, () => {
      const images: string[] = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg', 'ico'];
      let imageCount: number = 0;
      for (const extension of images) {
        if (FileUtils.isImageFile(extension)) {
          imageCount++;
        }
      }

      expect(imageCount).assertEqual(images.length);
      expect(FileUtils.isImageFile('PNG')).assertTrue();
      expect(FileUtils.isImageFile('Jpeg')).assertTrue();
      expect(FileUtils.isImageFile('mp3')).assertFalse();
      expect(FileUtils.isImageFile('mp4')).assertFalse();
      expect(FileUtils.isImageFile('doc')).assertFalse();
      expect(FileUtils.isImageFile('')).assertFalse();
    });

    /*
     * @tc.number: SUB_FILE_UTILS_0900
     * @tc.name: testFileUtils0009
     * @tc.desc: Recognize every supported audio extension and reject the remaining types.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0009', 0, () => {
      const audios: string[] = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'wma', 'm4a'];
      let audioCount: number = 0;
      for (const extension of audios) {
        if (FileUtils.isAudioFile(extension)) {
          audioCount++;
        }
      }

      expect(audioCount).assertEqual(audios.length);
      expect(FileUtils.isAudioFile('M4A')).assertTrue();
      expect(FileUtils.isAudioFile('Flac')).assertTrue();
      expect(FileUtils.isAudioFile('jpg')).assertFalse();
      expect(FileUtils.isAudioFile('mp4')).assertFalse();
      expect(FileUtils.isAudioFile('txt')).assertFalse();
      expect(FileUtils.isAudioFile('aac ')).assertFalse();
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1000
     * @tc.name: testFileUtils0010
     * @tc.desc: Recognize every supported video extension and reject the remaining types.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0010', 0, () => {
      const videos: string[] = ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', '3gp'];
      let videoCount: number = 0;
      for (const extension of videos) {
        if (FileUtils.isVideoFile(extension)) {
          videoCount++;
        }
      }

      expect(videoCount).assertEqual(videos.length);
      expect(FileUtils.isVideoFile('WEBM')).assertTrue();
      expect(FileUtils.isVideoFile('Mkv')).assertTrue();
      expect(FileUtils.isVideoFile('mp3')).assertFalse();
      expect(FileUtils.isVideoFile('png')).assertFalse();
      expect(FileUtils.isVideoFile('pdf')).assertFalse();
      expect(FileUtils.isVideoFile('3g')).assertFalse();
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1100
     * @tc.name: testFileUtils0011
     * @tc.desc: Recognize every supported document extension and reject the remaining types.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0011', 0, () => {
      const documents: string[] = ['doc', 'docx', 'pdf', 'txt', 'xls', 'xlsx', 'ppt', 'pptx'];
      let documentCount: number = 0;
      for (const extension of documents) {
        if (FileUtils.isDocumentFile(extension)) {
          documentCount++;
        }
      }

      expect(documentCount).assertEqual(documents.length);
      expect(FileUtils.isDocumentFile('PDF')).assertTrue();
      expect(FileUtils.isDocumentFile('Xlsx')).assertTrue();
      expect(FileUtils.isDocumentFile('jpg')).assertFalse();
      expect(FileUtils.isDocumentFile('json')).assertFalse();
      expect(FileUtils.isDocumentFile('md')).assertFalse();
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1200
     * @tc.name: testFileUtils0012
     * @tc.desc: Keep the four file categories mutually exclusive for representative extensions.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0012', 0, () => {
      const samples: string[] = ['jpg', 'mp3', 'mp4', 'pdf', 'json', 'bin'];
      let exclusiveCount: number = 0;
      for (const extension of samples) {
        const matches: number = (FileUtils.isImageFile(extension) ? 1 : 0) +
          (FileUtils.isAudioFile(extension) ? 1 : 0) +
          (FileUtils.isVideoFile(extension) ? 1 : 0) +
          (FileUtils.isDocumentFile(extension) ? 1 : 0);
        if (matches <= 1) {
          exclusiveCount++;
        }
        expect(matches <= 1).assertTrue();
      }

      expect(exclusiveCount).assertEqual(samples.length);
      expect(FileUtils.getFileIconName('json')).assertEqual('file');
      expect(FileUtils.getFileIconName('bin')).assertEqual('file');
      expect(FileUtils.getFileIconName('')).assertEqual('file');
      expect(FileUtils.getFileIconName('jpg')).assertEqual('image');
    });

    // ==================== MIME 与图标（2 条） ====================

    /*
     * @tc.number: SUB_FILE_UTILS_1300
     * @tc.name: testFileUtils0013
     * @tc.desc: Map known extensions to their MIME types case insensitively.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0013', 0, () => {
      expect(FileUtils.getMimeType('jpg')).assertEqual('image/jpeg');
      expect(FileUtils.getMimeType('jpeg')).assertEqual('image/jpeg');
      expect(FileUtils.getMimeType('PNG')).assertEqual('image/png');
      expect(FileUtils.getMimeType('mp3')).assertEqual('audio/mpeg');
      expect(FileUtils.getMimeType('mp4')).assertEqual('video/mp4');
      expect(FileUtils.getMimeType('pdf')).assertEqual('application/pdf');
      expect(FileUtils.getMimeType('json')).assertEqual('application/json');
      expect(FileUtils.getMimeType('ts')).assertEqual('application/typescript');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1400
     * @tc.name: testFileUtils0014
     * @tc.desc: Fall back to the binary MIME type for unmapped extensions.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0014', 0, () => {
      const unmapped: string[] = ['svg', 'ico', 'doc', 'flac', 'txt2', ''];
      let fallbackCount: number = 0;
      for (const extension of unmapped) {
        if (FileUtils.getMimeType(extension) === FALLBACK_MIME) {
          fallbackCount++;
        }
      }

      expect(fallbackCount).assertEqual(unmapped.length);
      expect(FileUtils.getMimeType('svg')).assertEqual(FALLBACK_MIME);
      expect(FileUtils.getMimeType('ICO')).assertEqual(FALLBACK_MIME);
      expect(FileUtils.getMimeType('txt')).assertEqual('text/plain');
      expect(FileUtils.getMimeType('html')).assertEqual('text/html');
      expect(FileUtils.getMimeType('css')).assertEqual('text/css');
      expect(FileUtils.getMimeType('wav')).assertEqual('audio/wav');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1500
     * @tc.name: testFileUtils0015
     * @tc.desc: Resolve the icon name of each category and the generic fallback.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0015', 0, () => {
      expect(FileUtils.getFileIconName('jpeg')).assertEqual('image');
      expect(FileUtils.getFileIconName('WEBP')).assertEqual('image');
      expect(FileUtils.getFileIconName('wav')).assertEqual('audio');
      expect(FileUtils.getFileIconName('mov')).assertEqual('video');
      expect(FileUtils.getFileIconName('pptx')).assertEqual('document');
      expect(FileUtils.getFileIconName('zip')).assertEqual('file');
      expect(FileUtils.getFileIconName('Mp4')).assertEqual('video');
    });

    // ==================== 路径处理（3 条） ====================

    /*
     * @tc.number: SUB_FILE_UTILS_1600
     * @tc.name: testFileUtils0016
     * @tc.desc: Normalize backslashes and repeated separators into single forward slashes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0016', 0, () => {
      expect(FileUtils.normalizePath('a\\b')).assertEqual('a/b');
      expect(FileUtils.normalizePath('a\\\\b')).assertEqual('a/b');
      expect(FileUtils.normalizePath('a//b')).assertEqual('a/b');
      expect(FileUtils.normalizePath('/data//local///a.txt')).assertEqual('/data/local/a.txt');
      expect(FileUtils.normalizePath('plain')).assertEqual('plain');
      expect(FileUtils.normalizePath('')).assertEqual('');
      expect(FileUtils.normalizePath('/data/local/a.txt')).assertEqual('/data/local/a.txt');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1700
     * @tc.name: testFileUtils0017
     * @tc.desc: Resolve the parent directory of absolute, relative and root level paths.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0017', 0, () => {
      expect(FileUtils.getParentPath('/data/local/a.txt')).assertEqual('/data/local');
      expect(FileUtils.getParentPath('a/b/c.txt')).assertEqual('a/b');
      expect(FileUtils.getParentPath('a/b/')).assertEqual('a/b');
      expect(FileUtils.getParentPath('/a')).assertEqual('');
      expect(FileUtils.getParentPath('noSlash')).assertEqual('');
      expect(FileUtils.getParentPath('')).assertEqual('');
      expect(FileUtils.getParentPath('C:\\x\\y.txt')).assertEqual('C:/x');
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1800
     * @tc.name: testFileUtils0018
     * @tc.desc: Reject empty paths and every reserved path character while accepting valid paths.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0018', 0, () => {
      expect(FileUtils.isValidPath('/data/local/tmp/x.txt')).assertTrue();
      expect(FileUtils.isValidPath('a/b/c')).assertTrue();
      expect(FileUtils.isValidPath('')).assertFalse();
      expect(FileUtils.isValidPath('a\\b')).assertFalse();
      expect(FileUtils.isValidPath('a<b')).assertFalse();
      expect(FileUtils.isValidPath('a>b')).assertFalse();
      expect(FileUtils.isValidPath('a|b')).assertFalse();
      expect(FileUtils.isValidPath('a*b')).assertFalse();
      expect(FileUtils.isValidPath('a?b')).assertFalse();
    });

    /*
     * @tc.number: SUB_FILE_UTILS_1900
     * @tc.name: testFileUtils0019
     * @tc.desc: Run one path through the whole helper chain and keep the results consistent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testFileUtils0019', 0, () => {
      const path: string = '/data/local/tmp/voice_call.mp3';
      const name: string = FileUtils.getFileName(path);
      const extension: string = FileUtils.getExtension(name);

      expect(FileUtils.isValidPath(path)).assertTrue();
      expect(name).assertEqual('voice_call.mp3');
      expect(extension).assertEqual('mp3');
      expect(FileUtils.isAudioFile(extension)).assertTrue();
      expect(FileUtils.getMimeType(extension)).assertEqual('audio/mpeg');
      expect(FileUtils.getFileIconName(extension)).assertEqual('audio');
      expect(FileUtils.getParentPath(path) + '/' + name).assertEqual(path);
      expect(FileUtils.normalizePath(FileUtils.getParentPath(path))).assertEqual('/data/local/tmp');
    });
  });
}
