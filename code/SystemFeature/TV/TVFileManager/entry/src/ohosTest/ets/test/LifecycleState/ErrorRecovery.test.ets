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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FileIoManager, SandboxFileInfo } from '../../../../main/ets/common/manager/FileIoManager';
import { CompressManager } from '../../../../main/ets/common/manager/CompressManager';
import { StorageManager } from '../../../../main/ets/common/manager/StorageManager';
import { SubtitleHelper } from '../../../../main/ets/common/utils/SubtitleHelper';
import { DateTools } from '../../../../main/ets/common/utils/DateTools';
import { FileJumpTools } from '../../../../main/ets/common/FileJumpTools';
import { INVALID_STRINGS } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function errorRecoveryTest() {
  describe('ErrorRecovery', () => {
    /*
     * Subtitle discovery strips the video extension and scans sibling files.
     */
    describe('ErrorRecovery_Subtitle_Path_Helpers', () => {
      it('directory_from_path', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: directory_from_path');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/data/video/a.mp4')).assertEqual('/data/video');
      });

      it('file_name_without_extension', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: file_name_without_extension');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/data/video/a.mp4')).assertEqual('a');
      });

      it('extension_of_srt', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: extension_of_srt');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('a.SRT')).assertEqual('.srt');
      });

      it('extension_without_dot', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: extension_without_dot');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('noext')).assertEqual('');
      });

      it('directory_of_relative_path', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: directory_of_relative_path');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('a/b/c.mkv')).assertEqual('a/b');
      });
    });

    /*
     * All wrappers are safe to call from recovery paths.
     */
    describe('ErrorRecovery_FileIoManager_Contract', () => {
      it('is_dir_missing_path', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_dir_missing_path');
        let ret: boolean = await FileIoManager.isDir('/missing/path');
        expect(ret).assertFalse();
      });

      it('list_dir_missing_path_throws', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: list_dir_missing_path_throws');
        let failed: boolean = false;
        try {
          await FileIoManager.listDir('/missing/path');
        } catch (error) {
          failed = true;
        }
        expect(failed).assertTrue();
      });

      it('stat_to_str_is_function', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stat_to_str_is_function');
        expect(typeof FileIoManager.statToStr).assertEqual('function');
      });

      it('compress_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: compress_contract');
        expect(typeof CompressManager.compress).assertEqual('function');
        expect(typeof CompressManager.decompress).assertEqual('function');
      });
    });

    /*
     * Footer information combines storage size and modification time.
     */
    describe('ErrorRecovery_Storage_And_Date_Contract', () => {
      it('storage_pair', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: storage_pair');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('date_format', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: date_format');
        expect(DateTools.formatDate(1700000000000, 'yyyy-MM-dd').length).assertEqual(10);
      });

      it('jump_tool_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: jump_tool_contract');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
      });

      it('invalid_strings_are_not_paths', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: invalid_strings_are_not_paths');
        for (let i = 0; i < INVALID_STRINGS.length; i++) {
          let helper: SubtitleHelper = new SubtitleHelper();
          expect(helper.getFileExtension(INVALID_STRINGS[i]) === '' || INVALID_STRINGS[i].indexOf('.') >= 0)
            .assertTrue();
        }
      });
    });

    /*
     * Extended boundary, type and matrix coverage for ErrorRecovery derived from the reference suite.
     */
    describe('ErrorRecovery_Extended_Coverage', () => {
      it('fileio_path_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_0');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/0/clip.mp4')).assertEqual('/videos/0');
      });

      it('fileio_name_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_1');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip1.mkv')).assertEqual('clip1');
      });

      it('fileio_ext_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_2');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file2.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_3');
        let ret: boolean = await FileIoManager.isDir('/missing/m3');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_4');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/4/clip.mp4')).assertEqual('/videos/4');
      });

      it('fileio_name_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_5');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip5.mkv')).assertEqual('clip5');
      });

      it('fileio_ext_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_6');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file6.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_7');
        let ret: boolean = await FileIoManager.isDir('/missing/m7');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_8');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/8/clip.mp4')).assertEqual('/videos/8');
      });

      it('fileio_name_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_9');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip9.mkv')).assertEqual('clip9');
      });

      it('fileio_ext_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_10');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file10.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_11');
        let ret: boolean = await FileIoManager.isDir('/missing/m11');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_12');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/12/clip.mp4')).assertEqual('/videos/12');
      });

      it('fileio_name_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_13');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip13.mkv')).assertEqual('clip13');
      });

      it('fileio_ext_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_14');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file14.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_15');
        let ret: boolean = await FileIoManager.isDir('/missing/m15');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_16');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/16/clip.mp4')).assertEqual('/videos/16');
      });

      it('fileio_name_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_17');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip17.mkv')).assertEqual('clip17');
      });

      it('fileio_ext_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_18');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file18.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_19');
        let ret: boolean = await FileIoManager.isDir('/missing/m19');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_20');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/20/clip.mp4')).assertEqual('/videos/20');
      });

      it('fileio_name_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_21');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip21.mkv')).assertEqual('clip21');
      });

      it('fileio_ext_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_22');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file22.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_23');
        let ret: boolean = await FileIoManager.isDir('/missing/m23');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_24');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/24/clip.mp4')).assertEqual('/videos/24');
      });

      it('fileio_name_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_25');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip25.mkv')).assertEqual('clip25');
      });

      it('fileio_ext_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_26');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file26.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_27');
        let ret: boolean = await FileIoManager.isDir('/missing/m27');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_28');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/28/clip.mp4')).assertEqual('/videos/28');
      });

      it('fileio_name_matrix_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_29');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip29.mkv')).assertEqual('clip29');
      });

      it('fileio_ext_matrix_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_30');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file30.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_31');
        let ret: boolean = await FileIoManager.isDir('/missing/m31');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_32');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/32/clip.mp4')).assertEqual('/videos/32');
      });

      it('fileio_name_matrix_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_33');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip33.mkv')).assertEqual('clip33');
      });

      it('fileio_ext_matrix_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_34');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file34.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_35');
        let ret: boolean = await FileIoManager.isDir('/missing/m35');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_36');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/36/clip.mp4')).assertEqual('/videos/36');
      });

      it('fileio_name_matrix_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_37');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip37.mkv')).assertEqual('clip37');
      });

      it('fileio_ext_matrix_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_38');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file38.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_39');
        let ret: boolean = await FileIoManager.isDir('/missing/m39');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_40');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/40/clip.mp4')).assertEqual('/videos/40');
      });

      it('fileio_name_matrix_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_41');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip41.mkv')).assertEqual('clip41');
      });

      it('fileio_ext_matrix_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_42');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file42.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_43');
        let ret: boolean = await FileIoManager.isDir('/missing/m43');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_44');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/44/clip.mp4')).assertEqual('/videos/44');
      });

      it('fileio_name_matrix_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_45');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip45.mkv')).assertEqual('clip45');
      });

      it('fileio_ext_matrix_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_46');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file46.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_47');
        let ret: boolean = await FileIoManager.isDir('/missing/m47');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_48');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/48/clip.mp4')).assertEqual('/videos/48');
      });

      it('fileio_name_matrix_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_49');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip49.mkv')).assertEqual('clip49');
      });

      it('fileio_ext_matrix_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_50');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file50.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_51');
        let ret: boolean = await FileIoManager.isDir('/missing/m51');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_52');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/52/clip.mp4')).assertEqual('/videos/52');
      });

      it('fileio_name_matrix_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_53');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip53.mkv')).assertEqual('clip53');
      });

      it('fileio_ext_matrix_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_54');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file54.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_55');
        let ret: boolean = await FileIoManager.isDir('/missing/m55');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_56');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/56/clip.mp4')).assertEqual('/videos/56');
      });

      it('fileio_name_matrix_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_57');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip57.mkv')).assertEqual('clip57');
      });

      it('fileio_ext_matrix_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_58');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file58.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_59');
        let ret: boolean = await FileIoManager.isDir('/missing/m59');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_60');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/60/clip.mp4')).assertEqual('/videos/60');
      });

      it('fileio_name_matrix_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_61');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip61.mkv')).assertEqual('clip61');
      });

      it('fileio_ext_matrix_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_62');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file62.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_63');
        let ret: boolean = await FileIoManager.isDir('/missing/m63');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_64');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/64/clip.mp4')).assertEqual('/videos/64');
      });

      it('fileio_name_matrix_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_65');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip65.mkv')).assertEqual('clip65');
      });

      it('fileio_ext_matrix_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_66');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file66.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_67');
        let ret: boolean = await FileIoManager.isDir('/missing/m67');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_68');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/68/clip.mp4')).assertEqual('/videos/68');
      });

      it('fileio_name_matrix_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_69');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip69.mkv')).assertEqual('clip69');
      });

      it('fileio_ext_matrix_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_70');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file70.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_71');
        let ret: boolean = await FileIoManager.isDir('/missing/m71');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_72');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/72/clip.mp4')).assertEqual('/videos/72');
      });

      it('fileio_name_matrix_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_73');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip73.mkv')).assertEqual('clip73');
      });

      it('fileio_ext_matrix_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_74');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file74.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_75');
        let ret: boolean = await FileIoManager.isDir('/missing/m75');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_76');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/76/clip.mp4')).assertEqual('/videos/76');
      });

      it('fileio_name_matrix_77', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_77');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip77.mkv')).assertEqual('clip77');
      });

      it('fileio_ext_matrix_78', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_78');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file78.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_79', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_79');
        let ret: boolean = await FileIoManager.isDir('/missing/m79');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_80', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_80');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/80/clip.mp4')).assertEqual('/videos/80');
      });

      it('fileio_name_matrix_81', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_81');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip81.mkv')).assertEqual('clip81');
      });

      it('fileio_ext_matrix_82', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_82');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file82.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_83', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_83');
        let ret: boolean = await FileIoManager.isDir('/missing/m83');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_84', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_84');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/84/clip.mp4')).assertEqual('/videos/84');
      });

      it('fileio_name_matrix_85', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_85');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip85.mkv')).assertEqual('clip85');
      });

      it('fileio_ext_matrix_86', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_86');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file86.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_87', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_87');
        let ret: boolean = await FileIoManager.isDir('/missing/m87');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_88', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_88');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/88/clip.mp4')).assertEqual('/videos/88');
      });

      it('fileio_name_matrix_89', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_89');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip89.mkv')).assertEqual('clip89');
      });

      it('fileio_ext_matrix_90', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_90');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file90.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_91', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_91');
        let ret: boolean = await FileIoManager.isDir('/missing/m91');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_92', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_92');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/92/clip.mp4')).assertEqual('/videos/92');
      });

      it('fileio_name_matrix_93', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_93');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip93.mkv')).assertEqual('clip93');
      });

      it('fileio_ext_matrix_94', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_94');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file94.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_95', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_95');
        let ret: boolean = await FileIoManager.isDir('/missing/m95');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_96', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_96');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/96/clip.mp4')).assertEqual('/videos/96');
      });

      it('fileio_name_matrix_97', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_97');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip97.mkv')).assertEqual('clip97');
      });

      it('fileio_ext_matrix_98', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_98');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file98.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_99', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_99');
        let ret: boolean = await FileIoManager.isDir('/missing/m99');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_100', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_100');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/100/clip.mp4')).assertEqual('/videos/100');
      });

      it('fileio_name_matrix_101', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_101');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip101.mkv')).assertEqual('clip101');
      });

      it('fileio_ext_matrix_102', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_102');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file102.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_103', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_103');
        let ret: boolean = await FileIoManager.isDir('/missing/m103');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_104', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_104');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/104/clip.mp4')).assertEqual('/videos/104');
      });

      it('fileio_name_matrix_105', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_105');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip105.mkv')).assertEqual('clip105');
      });

      it('fileio_ext_matrix_106', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_106');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file106.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_107', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_107');
        let ret: boolean = await FileIoManager.isDir('/missing/m107');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_108', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_108');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/108/clip.mp4')).assertEqual('/videos/108');
      });

      it('fileio_name_matrix_109', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_109');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip109.mkv')).assertEqual('clip109');
      });

      it('fileio_ext_matrix_110', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_110');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file110.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_111', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_111');
        let ret: boolean = await FileIoManager.isDir('/missing/m111');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_112', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_112');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/112/clip.mp4')).assertEqual('/videos/112');
      });

      it('fileio_name_matrix_113', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_113');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip113.mkv')).assertEqual('clip113');
      });

      it('fileio_ext_matrix_114', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_114');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file114.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_115', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_115');
        let ret: boolean = await FileIoManager.isDir('/missing/m115');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_116', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_116');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/116/clip.mp4')).assertEqual('/videos/116');
      });

      it('fileio_name_matrix_117', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_117');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip117.mkv')).assertEqual('clip117');
      });

      it('fileio_ext_matrix_118', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_118');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file118.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_119', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_119');
        let ret: boolean = await FileIoManager.isDir('/missing/m119');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_120', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_120');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/120/clip.mp4')).assertEqual('/videos/120');
      });

      it('fileio_name_matrix_121', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_121');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip121.mkv')).assertEqual('clip121');
      });

      it('fileio_ext_matrix_122', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_122');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file122.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_123', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_123');
        let ret: boolean = await FileIoManager.isDir('/missing/m123');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_124', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_124');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/124/clip.mp4')).assertEqual('/videos/124');
      });

      it('fileio_name_matrix_125', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_125');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip125.mkv')).assertEqual('clip125');
      });

      it('fileio_ext_matrix_126', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_126');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file126.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_127', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_127');
        let ret: boolean = await FileIoManager.isDir('/missing/m127');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_128', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_128');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/128/clip.mp4')).assertEqual('/videos/128');
      });

      it('fileio_name_matrix_129', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_129');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip129.mkv')).assertEqual('clip129');
      });

      it('fileio_ext_matrix_130', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_130');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file130.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_131', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_131');
        let ret: boolean = await FileIoManager.isDir('/missing/m131');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_132', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_132');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/132/clip.mp4')).assertEqual('/videos/132');
      });

      it('fileio_name_matrix_133', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_133');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip133.mkv')).assertEqual('clip133');
      });

      it('fileio_ext_matrix_134', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_134');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file134.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_135', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_135');
        let ret: boolean = await FileIoManager.isDir('/missing/m135');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_136', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_136');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/136/clip.mp4')).assertEqual('/videos/136');
      });

      it('fileio_name_matrix_137', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_137');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip137.mkv')).assertEqual('clip137');
      });

      it('fileio_ext_matrix_138', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_138');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file138.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_139', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_139');
        let ret: boolean = await FileIoManager.isDir('/missing/m139');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_140', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_140');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/140/clip.mp4')).assertEqual('/videos/140');
      });

      it('fileio_name_matrix_141', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_141');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip141.mkv')).assertEqual('clip141');
      });

      it('fileio_ext_matrix_142', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_142');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file142.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_143', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_143');
        let ret: boolean = await FileIoManager.isDir('/missing/m143');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_144', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_144');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/144/clip.mp4')).assertEqual('/videos/144');
      });

      it('fileio_name_matrix_145', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_145');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip145.mkv')).assertEqual('clip145');
      });

      it('fileio_ext_matrix_146', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_146');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file146.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_147', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_147');
        let ret: boolean = await FileIoManager.isDir('/missing/m147');
        expect(ret).assertFalse();
      });

      it('fileio_path_matrix_148', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_path_matrix_148');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getDirectoryFromPath('/videos/148/clip.mp4')).assertEqual('/videos/148');
      });

      it('fileio_name_matrix_149', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_name_matrix_149');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileNameWithoutExtension('/videos/clip149.mkv')).assertEqual('clip149');
      });

      it('fileio_ext_matrix_150', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_ext_matrix_150');
        let helper: SubtitleHelper = new SubtitleHelper();
        expect(helper.getFileExtension('file150.mp4')).assertEqual('.mp4');
      });

      it('fileio_safe_matrix_151', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: fileio_safe_matrix_151');
        let ret: boolean = await FileIoManager.isDir('/missing/m151');
        expect(ret).assertFalse();
      });
    });
  });
}
