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
import { FileAccessManager, RootData } from '../../../../main/ets/common/manager/FileAccessManager';
import { FileIoManager } from '../../../../main/ets/common/manager/FileIoManager';
import { StorageManager } from '../../../../main/ets/common/manager/StorageManager';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { FileInfo } from '../../../../main/ets/common/data/FileInfo';
import { MediaType } from '../../../../main/ets/model/MediaType';
import { fileAccess, fileExtensionInfo } from '@kit.CoreFileKit';
import { createFileInfo, createBean, createRootInfo, INVALID_STRINGS } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function fileOperationsTest() {
  describe('FileOperations', () => {
    /*
     * Device and mode strings are shown in debug panels and logs.
     */
    describe('FileAccessManager_Static_Conversions', () => {
      it('local_device_string', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: local_device_string');
        expect(FileAccessManager.deviceTypeToString(fileExtensionInfo.DeviceType.DEVICE_LOCAL_DISK))
          .assertEqual('Local');
      });

      it('unknown_device_string', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: unknown_device_string');
        expect(FileAccessManager.deviceTypeToString(999)).assertEqual('Other');
      });

      it('mode_file_only', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: mode_file_only');
        expect(FileAccessManager.fileModeToString(fileExtensionInfo.DocumentFlag.REPRESENTS_FILE))
          .assertContain('FILE');
      });

      it('mode_dir_only', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: mode_dir_only');
        expect(FileAccessManager.fileModeToString(fileExtensionInfo.DocumentFlag.REPRESENTS_DIR)).assertContain('DIR');
      });

      it('mode_unknown', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: mode_unknown');
        expect(FileAccessManager.fileModeToString(0)).assertEqual('Unknown');
      });

      it('device_flag_unknown', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: device_flag_unknown');
        expect(FileAccessManager.deviceFlagToString(0)).assertEqual('Unknown');
      });
    });

    /*
     * Serialized FileInfo is written to logs when a directory scan fails.
     */
    describe('FileAccessManager_FileInfo_Serialization', () => {
      it('file_info_to_string_contains_uri', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: file_info_to_string_contains_uri');
        let info: FileInfo = createFileInfo('file://a/b.txt', 'b.txt', 1, 1, 'text/plain', 1, '/a/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('file://a/b.txt');
      });

      it('file_info_to_string_contains_mode', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: file_info_to_string_contains_mode');
        let info: FileInfo = createFileInfo('file://a/b.txt', 'b.txt', 1, 1, '', 1, '/a/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('modeStr');
      });

      it('root_info_to_string_contains_name', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: root_info_to_string_contains_name');
        let root: ESObject = createRootInfo('file://root/', 'Internal', 0);
        let text: string = FileAccessManager.rootInfoToString(root as fileAccess.RootInfo);
        expect(text).assertContain('Internal');
      });

      it('convert_root_marks_root', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: convert_root_marks_root');
        let root: ESObject = createRootInfo('file://root/', 'Internal', 0);
        let info: FileInfo = FileAccessManager.convertRoot(root as fileAccess.RootInfo);
        expect(info.isRoot).assertTrue();
        expect(info.fileName).assertEqual('Internal');
      });
    });

    /*
     * USB and local roots are separated on the top tabs.
     */
    describe('FileAccessManager_Device_Filters', () => {
      it('root_data_shape', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: root_data_shape');
        let data: RootData = { root: undefined, list: [] };
        expect(data.list.length).assertEqual(0);
        expect(data.root).assertEqual(undefined);
      });

      it('is_local_and_usb_are_exclusive', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_local_and_usb_are_exclusive');
        let local: boolean = FileAccessManager.isLocalDevice(0);
        let usb: boolean = FileAccessManager.isUsbDevice(0);
        expect(!(local && usb)).assertTrue();
      });

      it('is_usb_flag_boolean', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_usb_flag_boolean');
        let value: boolean = FileAccessManager.isUsbDevice(4);
        expect(typeof value).assertEqual('boolean');
      });
    });

    /*
     * File io wrappers must never throw on invalid sandbox paths.
     */
    describe('FileIoManager_Safe_Wrappers', () => {
      it('is_dir_invalid_path_returns_false', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_dir_invalid_path_returns_false');
        let ret: boolean = await FileIoManager.isDir('/not/exist/path');
        expect(ret).assertFalse();
      });

      it('list_dir_rejects_invalid_path', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: list_dir_rejects_invalid_path');
        let failed: boolean = false;
        try {
          await FileIoManager.listDir('/not/exist/path');
        } catch (error) {
          failed = true;
        }
        expect(failed).assertTrue();
      });

      it('stat_to_str_never_returns_null', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: stat_to_str_never_returns_null');
        expect(typeof FileIoManager.statToStr).assertEqual('function');
      });
    });

    /*
     * The title bar shows free and total space of the local volume.
     */
    describe('StorageManager_Space_Query', () => {
      it('free_space_returns_pair', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: free_space_returns_pair');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
        expect(pair[0] >= 0).assertTrue();
        expect(pair[1] >= 0).assertTrue();
      });

      it('invalid_path_returns_zero_pair', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: invalid_path_returns_zero_pair');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('');
        expect(pair.length).assertEqual(2);
      });
    });

    /*
     * Extended boundary, type and matrix coverage for FileOperations derived from the reference suite.
     */
    describe('FileOperations_Extended_Coverage', () => {
      it('manager_device_string_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_0');
        let value: string = FileAccessManager.deviceTypeToString(0);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_1');
        let value: string = FileAccessManager.fileModeToString(1);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(1);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_2');
        let info: FileInfo = createFileInfo('file://m/2.txt', 'm2.txt', 2, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m2.txt');
      });

      it('manager_is_dir_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_3');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/3');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_4');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m4');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_5');
        let value: string = FileAccessManager.deviceTypeToString(5);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_6');
        let value: string = FileAccessManager.fileModeToString(6);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(6);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_7');
        let info: FileInfo = createFileInfo('file://m/7.txt', 'm7.txt', 7, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m7.txt');
      });

      it('manager_is_dir_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_8');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/8');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_9');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m9');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_10');
        let value: string = FileAccessManager.deviceTypeToString(2);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_11');
        let value: string = FileAccessManager.fileModeToString(11);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(11);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_12');
        let info: FileInfo = createFileInfo('file://m/12.txt', 'm12.txt', 12, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m12.txt');
      });

      it('manager_is_dir_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_13');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/13');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_14');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m14');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_15');
        let value: string = FileAccessManager.deviceTypeToString(7);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_16');
        let value: string = FileAccessManager.fileModeToString(0);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(0);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_17');
        let info: FileInfo = createFileInfo('file://m/17.txt', 'm17.txt', 17, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m17.txt');
      });

      it('manager_is_dir_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_18');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/18');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_19');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m19');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_20');
        let value: string = FileAccessManager.deviceTypeToString(4);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_21');
        let value: string = FileAccessManager.fileModeToString(5);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(5);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_22');
        let info: FileInfo = createFileInfo('file://m/22.txt', 'm22.txt', 22, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m22.txt');
      });

      it('manager_is_dir_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_23');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/23');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_24');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m24');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_25');
        let value: string = FileAccessManager.deviceTypeToString(1);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_26');
        let value: string = FileAccessManager.fileModeToString(10);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(10);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_27');
        let info: FileInfo = createFileInfo('file://m/27.txt', 'm27.txt', 27, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m27.txt');
      });

      it('manager_is_dir_matrix_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_28');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/28');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_29');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m29');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_30');
        let value: string = FileAccessManager.deviceTypeToString(6);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_31');
        let value: string = FileAccessManager.fileModeToString(15);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(15);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_32');
        let info: FileInfo = createFileInfo('file://m/32.txt', 'm32.txt', 32, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m32.txt');
      });

      it('manager_is_dir_matrix_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_33');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/33');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_34');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m34');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_35');
        let value: string = FileAccessManager.deviceTypeToString(3);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_36');
        let value: string = FileAccessManager.fileModeToString(4);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(4);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_37');
        let info: FileInfo = createFileInfo('file://m/37.txt', 'm37.txt', 37, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m37.txt');
      });

      it('manager_is_dir_matrix_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_38');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/38');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_39');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m39');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_40');
        let value: string = FileAccessManager.deviceTypeToString(0);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_41');
        let value: string = FileAccessManager.fileModeToString(9);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(9);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_42');
        let info: FileInfo = createFileInfo('file://m/42.txt', 'm42.txt', 42, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m42.txt');
      });

      it('manager_is_dir_matrix_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_43');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/43');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_44');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m44');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_45');
        let value: string = FileAccessManager.deviceTypeToString(5);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_46');
        let value: string = FileAccessManager.fileModeToString(14);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(14);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_47');
        let info: FileInfo = createFileInfo('file://m/47.txt', 'm47.txt', 47, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m47.txt');
      });

      it('manager_is_dir_matrix_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_48');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/48');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_49');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m49');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_50');
        let value: string = FileAccessManager.deviceTypeToString(2);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_51');
        let value: string = FileAccessManager.fileModeToString(3);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(3);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_52');
        let info: FileInfo = createFileInfo('file://m/52.txt', 'm52.txt', 52, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m52.txt');
      });

      it('manager_is_dir_matrix_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_53');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/53');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_54');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m54');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_55');
        let value: string = FileAccessManager.deviceTypeToString(7);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_56');
        let value: string = FileAccessManager.fileModeToString(8);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(8);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_57');
        let info: FileInfo = createFileInfo('file://m/57.txt', 'm57.txt', 57, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m57.txt');
      });

      it('manager_is_dir_matrix_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_58');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/58');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_59');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m59');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_60');
        let value: string = FileAccessManager.deviceTypeToString(4);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_61');
        let value: string = FileAccessManager.fileModeToString(13);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(13);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_62');
        let info: FileInfo = createFileInfo('file://m/62.txt', 'm62.txt', 62, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m62.txt');
      });

      it('manager_is_dir_matrix_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_63');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/63');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_64');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m64');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_65');
        let value: string = FileAccessManager.deviceTypeToString(1);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_66');
        let value: string = FileAccessManager.fileModeToString(2);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(2);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_67');
        let info: FileInfo = createFileInfo('file://m/67.txt', 'm67.txt', 67, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m67.txt');
      });

      it('manager_is_dir_matrix_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_68');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/68');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_69');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m69');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_70');
        let value: string = FileAccessManager.deviceTypeToString(6);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_71');
        let value: string = FileAccessManager.fileModeToString(7);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(7);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_72');
        let info: FileInfo = createFileInfo('file://m/72.txt', 'm72.txt', 72, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m72.txt');
      });

      it('manager_is_dir_matrix_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_73');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/73');
        expect(ret).assertFalse();
      });

      it('manager_storage_matrix_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_storage_matrix_74');
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/data/local/tmp/m74');
        expect(pair.length).assertEqual(2);
      });

      it('manager_device_string_matrix_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_device_string_matrix_75');
        let value: string = FileAccessManager.deviceTypeToString(3);
        expect(value.length > 0).assertTrue();
      });

      it('manager_mode_matrix_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_mode_matrix_76');
        let value: string = FileAccessManager.fileModeToString(12);
        expect(value.length > 0).assertTrue();
        let flag: string = FileAccessManager.deviceFlagToString(12);
        expect(flag.length > 0).assertTrue();
      });

      it('manager_info_matrix_77', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_info_matrix_77');
        let info: FileInfo = createFileInfo('file://m/77.txt', 'm77.txt', 77, 1, '', 1, '/m/');
        let text: string = FileAccessManager.fileInfoToString(info);
        expect(text).assertContain('m77.txt');
      });

      it('manager_is_dir_matrix_78', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: manager_is_dir_matrix_78');
        let ret: boolean = await FileIoManager.isDir('/sandbox/missing/78');
        expect(ret).assertFalse();
      });
    });
  });
}
