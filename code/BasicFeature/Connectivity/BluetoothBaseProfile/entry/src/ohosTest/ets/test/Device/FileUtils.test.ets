/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
    // ==================== expand extend name decode parse (3 cases) ====================

    /*
     * @tc.number: SUB_FILE_UTILS_0100
     * @tc.name: testFileUtils0001
     * @tc.desc: Extract the trailing extension of ordinary and multi dotted file names.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0001', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0001',
        '#1 assert ' + "expect(FileUtils.getExtension('a.txt')).assertEqual('txt')");
      expect(FileUtils.getExtension('a.txt')).assertEqual('txt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0001',
        '#2 assert ' + "expect(FileUtils.getExtension('A.TXt')).assertEqual('txt')");
      expect(FileUtils.getExtension('A.TXt')).assertEqual('txt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0001',
        '#3 assert ' + "expect(FileUtils.getExtension('archive.tar.gz')).assertEqual('gz')");
      expect(FileUtils.getExtension('archive.tar.gz')).assertEqual('gz');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0001',
        '#4 assert ' + "expect(FileUtils.getExtension('a.b.c.d')).assertEqual('d')");
      expect(FileUtils.getExtension('a.b.c.d')).assertEqual('d');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0001',
        '#5 assert ' + "expect(FileUtils.getExtension('photo.JPG')).assertEqual('jpg')");
      expect(FileUtils.getExtension('photo.JPG')).assertEqual('jpg');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0001',
        '#6 assert ' + "expect(FileUtils.getExtension('report.pdf')).assertEqual('pdf')");
      expect(FileUtils.getExtension('report.pdf')).assertEqual('pdf');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0002', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0002',
        '#1 assert ' + "expect(FileUtils.getExtension('')).assertEqual('')");
      expect(FileUtils.getExtension('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0002',
        '#2 assert ' + "expect(FileUtils.getExtension('noext')).assertEqual('')");
      expect(FileUtils.getExtension('noext')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0002',
        '#3 assert ' + "expect(FileUtils.getExtension('.hidden')).assertEqual('hidden')");
      expect(FileUtils.getExtension('.hidden')).assertEqual('hidden');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0002',
        '#4 assert ' + "expect(FileUtils.getExtension('x.')).assertEqual('')");
      expect(FileUtils.getExtension('x.')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0002',
        '#5 assert ' + "expect(FileUtils.getExtension('dir/')).assertEqual('')");
      expect(FileUtils.getExtension('dir/')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0002',
        '#6 assert ' + "expect(FileUtils.getExtension('/data/local/tmp')).assertEqual('')");
      expect(FileUtils.getExtension('/data/local/tmp')).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0003', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0003',
        '#1 assert ' + "expect(FileUtils.getFileName('/data/local/tmp/a.txt')).assertEqual('a.txt')");
      expect(FileUtils.getFileName('/data/local/tmp/a.txt')).assertEqual('a.txt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0003',
        '#2 assert ' + "expect(FileUtils.getFileName('a.txt')).assertEqual('a.txt')");
      expect(FileUtils.getFileName('a.txt')).assertEqual('a.txt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0003',
        '#3 assert ' + "expect(FileUtils.getFileName('a/b/c/audio.mp3')).assertEqual('audio.mp3')");
      expect(FileUtils.getFileName('a/b/c/audio.mp3')).assertEqual('audio.mp3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0003',
        '#4 assert ' + "expect(FileUtils.getFileName('a/b/')).assertEqual('')");
      expect(FileUtils.getFileName('a/b/')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0003',
        '#5 assert ' + "expect(FileUtils.getFileName('/')).assertEqual('')");
      expect(FileUtils.getFileName('/')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0003',
        '#6 assert ' + "expect(FileUtils.getFileName('')).assertEqual('')");
      expect(FileUtils.getFileName('')).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0004', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0004',
        '#1 assert ' + "expect(FileUtils.getFileNameWithoutExtension('a.txt')).assertEqual('a')");
      expect(FileUtils.getFileNameWithoutExtension('a.txt')).assertEqual('a');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0004',
        '#2 assert ' + "expect(FileUtils.getFileNameWithoutExtension('archive.tar.gz')).assertEqual('archive.tar')");
      expect(FileUtils.getFileNameWithoutExtension('archive.tar.gz')).assertEqual('archive.tar');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0004',
        '#3 assert ' + "expect(FileUtils.getFileNameWithoutExtension('noext')).assertEqual('noext')");
      expect(FileUtils.getFileNameWithoutExtension('noext')).assertEqual('noext');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0004',
        '#4 assert ' + "expect(FileUtils.getFileNameWithoutExtension('.hidden')).assertEqual('')");
      expect(FileUtils.getFileNameWithoutExtension('.hidden')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0004',
        '#5 assert ' + "expect(FileUtils.getFileNameWithoutExtension('')).assertEqual('')");
      expect(FileUtils.getFileNameWithoutExtension('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0004',
        '#6 assert ' + "expect(FileUtils.getFileNameWithoutExtension('song.mp3')).assertEqual('song')");
      expect(FileUtils.getFileNameWithoutExtension('song.mp3')).assertEqual('song');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0005', 'begin');
      const path: string = '/storage/emulated/0/music/audio.mp3';
      const name: string = FileUtils.getFileName(path);
      const extension: string = FileUtils.getExtension(name);
      const base: string = FileUtils.getFileNameWithoutExtension(name);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0005',
        '#1 ' + "name" + ' = ' + JSON.stringify(name));
      expect(name).assertEqual('audio.mp3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0005',
        '#2 ' + "extension" + ' = ' + JSON.stringify(extension));
      expect(extension).assertEqual('mp3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0005',
        '#3 ' + "base" + ' = ' + JSON.stringify(base));
      expect(base).assertEqual('audio');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0005',
        '#4 ' + "base + '.' + extension" + ' = ' + JSON.stringify(base + '.' + extension));
      expect(base + '.' + extension).assertEqual(name);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0005',
        '#5 assert ' + "expect(FileUtils.getParentPath(path)).assertEqual('/storage/emulated/0/music')");
      expect(FileUtils.getParentPath(path)).assertEqual('/storage/emulated/0/music');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0005',
        '#6 assert ' + "expect(FileUtils.getFileName(FileUtils.getParentPath(path))).assertEqual('music')");
      expect(FileUtils.getFileName(FileUtils.getParentPath(path))).assertEqual('music');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0005', 'end');
    });

    // ==================== size format (2 cases) ====================

    /*
     * @tc.number: SUB_FILE_UTILS_0600
     * @tc.name: testFileUtils0006
     * @tc.desc: Format byte level sizes with two decimals and the raw byte unit.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0006', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0006',
        '#1 assert ' + "expect(FileUtils.formatFileSize(0)).assertEqual('0 B')");
      expect(FileUtils.formatFileSize(0)).assertEqual('0 B');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0006',
        '#2 assert ' + "expect(FileUtils.formatFileSize(1)).assertEqual('1.00 B')");
      expect(FileUtils.formatFileSize(1)).assertEqual('1.00 B');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0006',
        '#3 assert ' + "expect(FileUtils.formatFileSize(512)).assertEqual('512.00 B')");
      expect(FileUtils.formatFileSize(512)).assertEqual('512.00 B');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0006',
        '#4 assert ' + "expect(FileUtils.formatFileSize(999)).assertEqual('999.00 B')");
      expect(FileUtils.formatFileSize(999)).assertEqual('999.00 B');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0006',
        '#5 assert ' + "expect(FileUtils.formatFileSize(KILOBYTE - 1)).assertEqual('1023.00 B')");
      expect(FileUtils.formatFileSize(KILOBYTE - 1)).assertEqual('1023.00 B');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0006',
        '#6 assert ' + "expect(FileUtils.formatFileSize(10)).assertEqual('10.00 B')");
      expect(FileUtils.formatFileSize(10)).assertEqual('10.00 B');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0007', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#1 assert ' + "expect(FileUtils.formatFileSize(KILOBYTE)).assertEqual('1.00 KB')");
      expect(FileUtils.formatFileSize(KILOBYTE)).assertEqual('1.00 KB');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#2 assert ' + "expect(FileUtils.formatFileSize(1536)).assertEqual('1.50 KB')");
      expect(FileUtils.formatFileSize(1536)).assertEqual('1.50 KB');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#3 assert ' + "expect(FileUtils.formatFileSize(12345)).assertEqual('12.06 KB')");
      expect(FileUtils.formatFileSize(12345)).assertEqual('12.06 KB');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#4 assert ' + "expect(FileUtils.formatFileSize(MEGABYTE)).assertEqual('1.00 MB')");
      expect(FileUtils.formatFileSize(MEGABYTE)).assertEqual('1.00 MB');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#5 assert ' + "expect(FileUtils.formatFileSize(GIGABYTE)).assertEqual('1.00 GB')");
      expect(FileUtils.formatFileSize(GIGABYTE)).assertEqual('1.00 GB');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#6 assert ' + "expect(FileUtils.formatFileSize(TERABYTE)).assertEqual('1.00 TB')");
      expect(FileUtils.formatFileSize(TERABYTE)).assertEqual('1.00 TB');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0007',
        '#7 assert ' + "expect(FileUtils.formatFileSize(KILOBYTE + 1)).assertEqual('1.00 KB')");
      expect(FileUtils.formatFileSize(KILOBYTE + 1)).assertEqual('1.00 KB');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0007', 'end');
    });

    // ==================== text item category judge specify (5 cases) ====================

    /*
     * @tc.number: SUB_FILE_UTILS_0800
     * @tc.name: testFileUtils0008
     * @tc.desc: Recognize every supported image extension and reject the remaining types.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0008', 'begin');
      const images: string[] = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg', 'ico'];
      let imageCount: number = 0;
      for (const extension of images) {
        if (FileUtils.isImageFile(extension)) {
          imageCount++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#1 ' + "imageCount" + ' = ' + JSON.stringify(imageCount));
      expect(imageCount).assertEqual(images.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#2 assert ' + "expect(FileUtils.isImageFile('PNG')).assertTrue()");
      expect(FileUtils.isImageFile('PNG')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#3 assert ' + "expect(FileUtils.isImageFile('Jpeg')).assertTrue()");
      expect(FileUtils.isImageFile('Jpeg')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#4 assert ' + "expect(FileUtils.isImageFile('mp3')).assertFalse()");
      expect(FileUtils.isImageFile('mp3')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#5 assert ' + "expect(FileUtils.isImageFile('mp4')).assertFalse()");
      expect(FileUtils.isImageFile('mp4')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#6 assert ' + "expect(FileUtils.isImageFile('doc')).assertFalse()");
      expect(FileUtils.isImageFile('doc')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0008',
        '#7 assert ' + "expect(FileUtils.isImageFile('')).assertFalse()");
      expect(FileUtils.isImageFile('')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0009', 'begin');
      const audios: string[] = ['mp3', 'wav', 'aac', 'flac', 'ogg', 'wma', 'm4a'];
      let audioCount: number = 0;
      for (const extension of audios) {
        if (FileUtils.isAudioFile(extension)) {
          audioCount++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#1 ' + "audioCount" + ' = ' + JSON.stringify(audioCount));
      expect(audioCount).assertEqual(audios.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#2 assert ' + "expect(FileUtils.isAudioFile('M4A')).assertTrue()");
      expect(FileUtils.isAudioFile('M4A')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#3 assert ' + "expect(FileUtils.isAudioFile('Flac')).assertTrue()");
      expect(FileUtils.isAudioFile('Flac')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#4 assert ' + "expect(FileUtils.isAudioFile('jpg')).assertFalse()");
      expect(FileUtils.isAudioFile('jpg')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#5 assert ' + "expect(FileUtils.isAudioFile('mp4')).assertFalse()");
      expect(FileUtils.isAudioFile('mp4')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#6 assert ' + "expect(FileUtils.isAudioFile('txt')).assertFalse()");
      expect(FileUtils.isAudioFile('txt')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0009',
        '#7 assert ' + "expect(FileUtils.isAudioFile('aac ')).assertFalse()");
      expect(FileUtils.isAudioFile('aac ')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0010', 'begin');
      const videos: string[] = ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', '3gp'];
      let videoCount: number = 0;
      for (const extension of videos) {
        if (FileUtils.isVideoFile(extension)) {
          videoCount++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#1 ' + "videoCount" + ' = ' + JSON.stringify(videoCount));
      expect(videoCount).assertEqual(videos.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#2 assert ' + "expect(FileUtils.isVideoFile('WEBM')).assertTrue()");
      expect(FileUtils.isVideoFile('WEBM')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#3 assert ' + "expect(FileUtils.isVideoFile('Mkv')).assertTrue()");
      expect(FileUtils.isVideoFile('Mkv')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#4 assert ' + "expect(FileUtils.isVideoFile('mp3')).assertFalse()");
      expect(FileUtils.isVideoFile('mp3')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#5 assert ' + "expect(FileUtils.isVideoFile('png')).assertFalse()");
      expect(FileUtils.isVideoFile('png')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#6 assert ' + "expect(FileUtils.isVideoFile('pdf')).assertFalse()");
      expect(FileUtils.isVideoFile('pdf')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0010',
        '#7 assert ' + "expect(FileUtils.isVideoFile('3g')).assertFalse()");
      expect(FileUtils.isVideoFile('3g')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0011', 'begin');
      const documents: string[] = ['doc', 'docx', 'pdf', 'txt', 'xls', 'xlsx', 'ppt', 'pptx'];
      let documentCount: number = 0;
      for (const extension of documents) {
        if (FileUtils.isDocumentFile(extension)) {
          documentCount++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0011',
        '#1 ' + "documentCount" + ' = ' + JSON.stringify(documentCount));
      expect(documentCount).assertEqual(documents.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0011',
        '#2 assert ' + "expect(FileUtils.isDocumentFile('PDF')).assertTrue()");
      expect(FileUtils.isDocumentFile('PDF')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0011',
        '#3 assert ' + "expect(FileUtils.isDocumentFile('Xlsx')).assertTrue()");
      expect(FileUtils.isDocumentFile('Xlsx')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0011',
        '#4 assert ' + "expect(FileUtils.isDocumentFile('jpg')).assertFalse()");
      expect(FileUtils.isDocumentFile('jpg')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0011',
        '#5 assert ' + "expect(FileUtils.isDocumentFile('json')).assertFalse()");
      expect(FileUtils.isDocumentFile('json')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0011',
        '#6 assert ' + "expect(FileUtils.isDocumentFile('md')).assertFalse()");
      expect(FileUtils.isDocumentFile('md')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0012', 'begin');
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
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testFileUtils0012',
          '#1 ' + "matches <= 1" + ' = ' + JSON.stringify(matches <= 1));
        expect(matches <= 1).assertTrue();
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0012',
        '#2 ' + "exclusiveCount" + ' = ' + JSON.stringify(exclusiveCount));
      expect(exclusiveCount).assertEqual(samples.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0012',
        '#3 assert ' + "expect(FileUtils.getFileIconName('json')).assertEqual('file')");
      expect(FileUtils.getFileIconName('json')).assertEqual('file');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0012',
        '#4 assert ' + "expect(FileUtils.getFileIconName('bin')).assertEqual('file')");
      expect(FileUtils.getFileIconName('bin')).assertEqual('file');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0012',
        '#5 assert ' + "expect(FileUtils.getFileIconName('')).assertEqual('file')");
      expect(FileUtils.getFileIconName('')).assertEqual('file');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0012',
        '#6 assert ' + "expect(FileUtils.getFileIconName('jpg')).assertEqual('image')");
      expect(FileUtils.getFileIconName('jpg')).assertEqual('image');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0012', 'end');
    });

    // ==================== MIME and icon (2 cases) ====================

    /*
     * @tc.number: SUB_FILE_UTILS_1300
     * @tc.name: testFileUtils0013
     * @tc.desc: Map known extensions to their MIME types case insensitively.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0013', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#1 assert ' + "expect(FileUtils.getMimeType('jpg')).assertEqual('image/jpeg')");
      expect(FileUtils.getMimeType('jpg')).assertEqual('image/jpeg');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#2 assert ' + "expect(FileUtils.getMimeType('jpeg')).assertEqual('image/jpeg')");
      expect(FileUtils.getMimeType('jpeg')).assertEqual('image/jpeg');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#3 assert ' + "expect(FileUtils.getMimeType('PNG')).assertEqual('image/png')");
      expect(FileUtils.getMimeType('PNG')).assertEqual('image/png');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#4 assert ' + "expect(FileUtils.getMimeType('mp3')).assertEqual('audio/mpeg')");
      expect(FileUtils.getMimeType('mp3')).assertEqual('audio/mpeg');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#5 assert ' + "expect(FileUtils.getMimeType('mp4')).assertEqual('video/mp4')");
      expect(FileUtils.getMimeType('mp4')).assertEqual('video/mp4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#6 assert ' + "expect(FileUtils.getMimeType('pdf')).assertEqual('application/pdf')");
      expect(FileUtils.getMimeType('pdf')).assertEqual('application/pdf');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#7 assert ' + "expect(FileUtils.getMimeType('json')).assertEqual('application/json')");
      expect(FileUtils.getMimeType('json')).assertEqual('application/json');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0013',
        '#8 assert ' + "expect(FileUtils.getMimeType('ts')).assertEqual('application/typescript')");
      expect(FileUtils.getMimeType('ts')).assertEqual('application/typescript');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0014', 'begin');
      const unmapped: string[] = ['svg', 'ico', 'doc', 'flac', 'txt2', ''];
      let fallbackCount: number = 0;
      for (const extension of unmapped) {
        if (FileUtils.getMimeType(extension) === FALLBACK_MIME) {
          fallbackCount++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#1 ' + "fallbackCount" + ' = ' + JSON.stringify(fallbackCount));
      expect(fallbackCount).assertEqual(unmapped.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#2 assert ' + "expect(FileUtils.getMimeType('svg')).assertEqual(FALLBACK_MIME)");
      expect(FileUtils.getMimeType('svg')).assertEqual(FALLBACK_MIME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#3 assert ' + "expect(FileUtils.getMimeType('ICO')).assertEqual(FALLBACK_MIME)");
      expect(FileUtils.getMimeType('ICO')).assertEqual(FALLBACK_MIME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#4 assert ' + "expect(FileUtils.getMimeType('txt')).assertEqual('text/plain')");
      expect(FileUtils.getMimeType('txt')).assertEqual('text/plain');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#5 assert ' + "expect(FileUtils.getMimeType('html')).assertEqual('text/html')");
      expect(FileUtils.getMimeType('html')).assertEqual('text/html');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#6 assert ' + "expect(FileUtils.getMimeType('css')).assertEqual('text/css')");
      expect(FileUtils.getMimeType('css')).assertEqual('text/css');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0014',
        '#7 assert ' + "expect(FileUtils.getMimeType('wav')).assertEqual('audio/wav')");
      expect(FileUtils.getMimeType('wav')).assertEqual('audio/wav');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0015', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#1 assert ' + "expect(FileUtils.getFileIconName('jpeg')).assertEqual('image')");
      expect(FileUtils.getFileIconName('jpeg')).assertEqual('image');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#2 assert ' + "expect(FileUtils.getFileIconName('WEBP')).assertEqual('image')");
      expect(FileUtils.getFileIconName('WEBP')).assertEqual('image');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#3 assert ' + "expect(FileUtils.getFileIconName('wav')).assertEqual('audio')");
      expect(FileUtils.getFileIconName('wav')).assertEqual('audio');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#4 assert ' + "expect(FileUtils.getFileIconName('mov')).assertEqual('video')");
      expect(FileUtils.getFileIconName('mov')).assertEqual('video');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#5 assert ' + "expect(FileUtils.getFileIconName('pptx')).assertEqual('document')");
      expect(FileUtils.getFileIconName('pptx')).assertEqual('document');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#6 assert ' + "expect(FileUtils.getFileIconName('zip')).assertEqual('file')");
      expect(FileUtils.getFileIconName('zip')).assertEqual('file');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0015',
        '#7 assert ' + "expect(FileUtils.getFileIconName('Mp4')).assertEqual('video')");
      expect(FileUtils.getFileIconName('Mp4')).assertEqual('video');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0015', 'end');
    });

    // ==================== path handle (3 cases) ====================

    /*
     * @tc.number: SUB_FILE_UTILS_1600
     * @tc.name: testFileUtils0016
     * @tc.desc: Normalize backslashes and repeated separators into single forward slashes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testFileUtils0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0016', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#1 assert ' + "expect(FileUtils.normalizePath('a\\\\b')).assertEqual('a/b')");
      expect(FileUtils.normalizePath('a\\b')).assertEqual('a/b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#2 assert ' + "expect(FileUtils.normalizePath('a\\\\\\\\b')).assertEqual('a/b')");
      expect(FileUtils.normalizePath('a\\\\b')).assertEqual('a/b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#3 assert ' + "expect(FileUtils.normalizePath('a//b')).assertEqual('a/b')");
      expect(FileUtils.normalizePath('a//b')).assertEqual('a/b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#4 assert ' + "expect(FileUtils.normalizePath('/data//local///a.txt')).assertEqual('/data/local/a.txt')");
      expect(FileUtils.normalizePath('/data//local///a.txt')).assertEqual('/data/local/a.txt');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#5 assert ' + "expect(FileUtils.normalizePath('plain')).assertEqual('plain')");
      expect(FileUtils.normalizePath('plain')).assertEqual('plain');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#6 assert ' + "expect(FileUtils.normalizePath('')).assertEqual('')");
      expect(FileUtils.normalizePath('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0016',
        '#7 assert ' + "expect(FileUtils.normalizePath('/data/local/a.txt')).assertEqual('/data/local/a.txt')");
      expect(FileUtils.normalizePath('/data/local/a.txt')).assertEqual('/data/local/a.txt');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0017', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#1 assert ' + "expect(FileUtils.getParentPath('/data/local/a.txt')).assertEqual('/data/local')");
      expect(FileUtils.getParentPath('/data/local/a.txt')).assertEqual('/data/local');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#2 assert ' + "expect(FileUtils.getParentPath('a/b/c.txt')).assertEqual('a/b')");
      expect(FileUtils.getParentPath('a/b/c.txt')).assertEqual('a/b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#3 assert ' + "expect(FileUtils.getParentPath('a/b/')).assertEqual('a/b')");
      expect(FileUtils.getParentPath('a/b/')).assertEqual('a/b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#4 assert ' + "expect(FileUtils.getParentPath('/a')).assertEqual('')");
      expect(FileUtils.getParentPath('/a')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#5 assert ' + "expect(FileUtils.getParentPath('noSlash')).assertEqual('')");
      expect(FileUtils.getParentPath('noSlash')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#6 assert ' + "expect(FileUtils.getParentPath('')).assertEqual('')");
      expect(FileUtils.getParentPath('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0017',
        '#7 assert ' + "expect(FileUtils.getParentPath('C:\\\\x\\\\y.txt')).assertEqual('C:/x')");
      expect(FileUtils.getParentPath('C:\\x\\y.txt')).assertEqual('C:/x');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0018', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#1 assert ' + "expect(FileUtils.isValidPath('/data/local/tmp/x.txt')).assertTrue()");
      expect(FileUtils.isValidPath('/data/local/tmp/x.txt')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#2 assert ' + "expect(FileUtils.isValidPath('a/b/c')).assertTrue()");
      expect(FileUtils.isValidPath('a/b/c')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#3 assert ' + "expect(FileUtils.isValidPath('')).assertFalse()");
      expect(FileUtils.isValidPath('')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#4 assert ' + "expect(FileUtils.isValidPath('a\\\\b')).assertFalse()");
      expect(FileUtils.isValidPath('a\\b')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#5 assert ' + "expect(FileUtils.isValidPath('a<b')).assertFalse()");
      expect(FileUtils.isValidPath('a<b')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#6 assert ' + "expect(FileUtils.isValidPath('a>b')).assertFalse()");
      expect(FileUtils.isValidPath('a>b')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#7 assert ' + "expect(FileUtils.isValidPath('a|b')).assertFalse()");
      expect(FileUtils.isValidPath('a|b')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#8 assert ' + "expect(FileUtils.isValidPath('a*b')).assertFalse()");
      expect(FileUtils.isValidPath('a*b')).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0018',
        '#9 assert ' + "expect(FileUtils.isValidPath('a?b')).assertFalse()");
      expect(FileUtils.isValidPath('a?b')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0019', 'begin');
      const path: string = '/data/local/tmp/voice_call.mp3';
      const name: string = FileUtils.getFileName(path);
      const extension: string = FileUtils.getExtension(name);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#1 assert ' + "expect(FileUtils.isValidPath(path)).assertTrue()");
      expect(FileUtils.isValidPath(path)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#2 ' + "name" + ' = ' + JSON.stringify(name));
      expect(name).assertEqual('voice_call.mp3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#3 ' + "extension" + ' = ' + JSON.stringify(extension));
      expect(extension).assertEqual('mp3');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#4 assert ' + "expect(FileUtils.isAudioFile(extension)).assertTrue()");
      expect(FileUtils.isAudioFile(extension)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#5 assert ' + "expect(FileUtils.getMimeType(extension)).assertEqual('audio/mpeg')");
      expect(FileUtils.getMimeType(extension)).assertEqual('audio/mpeg');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#6 assert ' + "expect(FileUtils.getFileIconName(extension)).assertEqual('audio')");
      expect(FileUtils.getFileIconName(extension)).assertEqual('audio');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#7 assert ' + "expect(FileUtils.getParentPath(path) + '/' + name).assertEqual(path)");
      expect(FileUtils.getParentPath(path) + '/' + name).assertEqual(path);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testFileUtils0019',
        '#8 assert ' + "expect(FileUtils.normalizePath(FileUtils.getParentPath(path))).assertEqual('/data/local/tmp')");
      expect(FileUtils.normalizePath(FileUtils.getParentPath(path))).assertEqual('/data/local/tmp');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testFileUtils0019', 'end');
    });
  });
}
