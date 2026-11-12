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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FileUtils } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * FileUtils file operation utility test suite.
 * Covers all public methods including getFileExtension/getFileName/getFileSize/isImageFile/isDocumentFile/
 * isAudioFile/isVideoFile/getMimeType/sanitizeFileName/generateTempFileName/
 * getFileTypeDescription.
 */
export default function FileUtilsTest(): void {
  describe('FileUtilsTest', () => {

    // ========================================
    // getFileExtension
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0100
     * @tc.name testDeviceFileUtils0001
     * @tc.desc Verify the file extension (lowercased) is extracted from a file name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0001 begin');
      expect(FileUtils.getFileExtension('photo.JPG')).assertEqual('jpg');
      expect(FileUtils.getFileExtension('document.PDF')).assertEqual('pdf');
      expect(FileUtils.getFileExtension('archive.tar.gz')).assertEqual('gz');
      expect(FileUtils.getFileExtension('noext')).assertEqual('');
      expect(FileUtils.getFileExtension('')).assertEqual('');
      expect(FileUtils.getFileExtension('file.')).assertEqual('');
    });

    // ========================================
    // getFileName
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0200
     * @tc.name testDeviceFileUtils0002
     * @tc.desc Verify the file name is extracted from a path.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0002 begin');
      expect(FileUtils.getFileName('/data/user/photo.jpg')).assertEqual('photo.jpg');
      expect(FileUtils.getFileName('C:\\Users\\file.txt')).assertEqual('file.txt');
      expect(FileUtils.getFileName('filename.txt')).assertEqual('filename.txt');
      expect(FileUtils.getFileName('')).assertEqual('');
      expect(FileUtils.getFileName('/path/to/')).assertEqual('');
    });

    // ========================================
    // getFileSize
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0300
     * @tc.name testDeviceFileUtils0003
     * @tc.desc Verify file size formatting is correct across magnitudes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0003 begin');
      expect(FileUtils.getFileSize(0)).assertEqual('0 B');
      expect(FileUtils.getFileSize(-1)).assertEqual('0 B');
      expect(FileUtils.getFileSize(500)).assertEqual('500.00 B');
      const kbResult: string = FileUtils.getFileSize(1024);
      expect(kbResult.indexOf('KB')).assertLarger(-1);
      const mbResult: string = FileUtils.getFileSize(1048576);
      expect(mbResult.indexOf('MB')).assertLarger(-1);
      const gbResult: string = FileUtils.getFileSize(1073741824);
      expect(gbResult.indexOf('GB')).assertLarger(-1);
    });

    // ========================================
    // File type detection
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0400
     * @tc.name testDeviceFileUtils0004
     * @tc.desc Verify isImageFile recognizes image extensions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0004 begin');
      expect(FileUtils.isImageFile('jpg')).assertTrue();
      expect(FileUtils.isImageFile('PNG')).assertTrue();
      expect(FileUtils.isImageFile('gif')).assertTrue();
      expect(FileUtils.isImageFile('txt')).assertFalse();
      expect(FileUtils.isImageFile('mp3')).assertFalse();
      expect(FileUtils.isImageFile('')).assertFalse();
    });

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0500
     * @tc.name testDeviceFileUtils0005
     * @tc.desc Verify isDocumentFile recognizes document extensions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0005 begin');
      expect(FileUtils.isDocumentFile('pdf')).assertTrue();
      expect(FileUtils.isDocumentFile('DOCX')).assertTrue();
      expect(FileUtils.isDocumentFile('xlsx')).assertTrue();
      expect(FileUtils.isDocumentFile('jpg')).assertFalse();
      expect(FileUtils.isDocumentFile('mp3')).assertFalse();
      expect(FileUtils.isDocumentFile('')).assertFalse();
    });

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0600
     * @tc.name testDeviceFileUtils0006
     * @tc.desc Verify isAudioFile recognizes audio extensions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0006 begin');
      expect(FileUtils.isAudioFile('mp3')).assertTrue();
      expect(FileUtils.isAudioFile('WAV')).assertTrue();
      expect(FileUtils.isAudioFile('flac')).assertTrue();
      expect(FileUtils.isAudioFile('jpg')).assertFalse();
      expect(FileUtils.isAudioFile('mp4')).assertFalse();
      expect(FileUtils.isAudioFile('')).assertFalse();
    });

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0700
     * @tc.name testDeviceFileUtils0007
     * @tc.desc Verify isVideoFile recognizes video extensions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0007 begin');
      expect(FileUtils.isVideoFile('mp4')).assertTrue();
      expect(FileUtils.isVideoFile('AVI')).assertTrue();
      expect(FileUtils.isVideoFile('mkv')).assertTrue();
      expect(FileUtils.isVideoFile('jpg')).assertFalse();
      expect(FileUtils.isVideoFile('mp3')).assertFalse();
      expect(FileUtils.isVideoFile('')).assertFalse();
    });

    // ========================================
    // getMimeType
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0800
     * @tc.name testDeviceFileUtils0008
     * @tc.desc Verify known extensions return the correct MIME type.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0008 begin');
      expect(FileUtils.getMimeType('jpg')).assertEqual('image/jpeg');
      expect(FileUtils.getMimeType('png')).assertEqual('image/png');
      expect(FileUtils.getMimeType('pdf')).assertEqual('application/pdf');
      expect(FileUtils.getMimeType('json')).assertEqual('application/json');
      expect(FileUtils.getMimeType('xyz')).assertEqual('application/octet-stream');
      expect(FileUtils.getMimeType('')).assertEqual('application/octet-stream');
    });

    // ========================================
    // sanitizeFileName
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_0900
     * @tc.name testDeviceFileUtils0009
     * @tc.desc Verify illegal characters are removed and safe file names are kept.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0009 begin');
      expect(FileUtils.sanitizeFileName('normal_file.txt')).assertEqual('normal_file.txt');
      const sanitized: string = FileUtils.sanitizeFileName('file<>:"/\\|?*.txt');
      expect(sanitized.indexOf('<')).assertEqual(-1);
      expect(sanitized.indexOf('>')).assertEqual(-1);
      expect(sanitized.length).assertLarger(0);
      expect(FileUtils.sanitizeFileName('')).assertEqual('unnamed_file');
      expect(FileUtils.sanitizeFileName('***').length).assertLarger(0);
    });

    // ========================================
    // generateTempFileName
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_1000
     * @tc.name testDeviceFileUtils0010
     * @tc.desc Verify generated temp file names contain the prefix and the .tmp suffix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0010 begin');
      const name1: string = FileUtils.generateTempFileName('test');
      expect(name1.indexOf('test')).assertEqual(0);
      expect(name1.indexOf('.tmp')).assertLarger(-1);
      const name2: string = FileUtils.generateTempFileName('test');
      expect(name1 === name2).assertEqual(false);
      const name3: string = FileUtils.generateTempFileName('');
      expect(name3.indexOf('tmp')).assertEqual(0);
      expect(name3.indexOf('.tmp')).assertLarger(-1);
    });

    // ========================================
    // getFileTypeDescription
    // ========================================

    /**
     * @tc.number SUB_DEVICE_FILE_UTILS_1100
     * @tc.name testDeviceFileUtils0011
     * @tc.desc Verify each extension category returns the correct Chinese description.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDeviceFileUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDeviceFileUtils0011 begin');
      expect(FileUtils.getFileTypeDescription('jpg')).assertEqual('图片文件');
      expect(FileUtils.getFileTypeDescription('pdf')).assertEqual('文档文件');
      expect(FileUtils.getFileTypeDescription('mp3')).assertEqual('音频文件');
      expect(FileUtils.getFileTypeDescription('mp4')).assertEqual('视频文件');
      expect(FileUtils.getFileTypeDescription('xyz')).assertEqual('其他文件');
      expect(FileUtils.getFileTypeDescription('')).assertEqual('其他文件');
    });
  });
}
