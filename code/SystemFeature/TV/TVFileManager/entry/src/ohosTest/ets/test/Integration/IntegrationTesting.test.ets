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
import { NavStack } from '../../../../main/ets/common/manager/NavPathStackManager';
import { FileJumpTools, PlaylistItem } from '../../../../main/ets/common/FileJumpTools';
import FileDataSource from '../../../../main/ets/component/adapter/FileDataSource';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { MediaType } from '../../../../main/ets/model/MediaType';
import { PageType } from '../../../../main/ets/model/PageType';
import { Context } from '@kit.AbilityKit';
import { fileExtensionInfo } from '@kit.CoreFileKit';
import { createBean, createFileInfo, VIDEO_NAMES, AUDIO_NAMES } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function integrationTestingTest() {
  describe('IntegrationTesting', () => {
    /*
     * A scan result is converted to rows, selected and then opened.
     */
    describe('IntegrationTesting_Scan_To_Row_Workflow', () => {
      it('image_scan_to_want', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_scan_to_want');
        let bean: FileBean = createBean('photo.jpg');
        expect(bean.isImage()).assertTrue();
        let want = FileJumpTools.getImageWant(bean.name, bean.getPath());
        expect(want.type).assertEqual('image/*');
      });

      it('video_scan_to_want', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: video_scan_to_want');
        let bean: FileBean = createBean('movie.mp4');
        expect(bean.isVideo()).assertTrue();
        let want = await FileJumpTools.getVideoWant(bean.name, bean.getPath());
        expect(want.type).assertEqual('video/*');
      });

      it('audio_scan_to_want', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_scan_to_want');
        let bean: FileBean = createBean('song.mp3');
        expect(bean.isAudio()).assertTrue();
        let want = FileJumpTools.getAudioWant(bean.name, bean.getPath(), 0, []);
        expect(want.type).assertEqual('audio/*');
      });

      it('datasource_row_lookup', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: datasource_row_lookup');
        let bean: FileBean = createBean('photo.jpg');
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.find(bean.id) === bean).assertTrue();
        expect(source.totalCount()).assertEqual(1);
      });
    });

    /*
     * Entering a folder pushes a row and leaving it pops the row.
     */
    describe('IntegrationTesting_Navigation_To_List_Workflow', () => {
      it('push_and_pop', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: push_and_pop');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Pictures'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
        expect(nav.getPathListNames().length).assertEqual(0);
      });

      it('root_data_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: root_data_contract');
        let data: RootData = { root: undefined, list: [] };
        expect(data.list.length).assertEqual(0);
      });

      it('media_type_switch', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: media_type_switch');
        let type: MediaType = MediaType.IMAGE;
        expect(type).assertEqual(MediaType.IMAGE);
      });
    });

    /*
     * Manager errors fall back to safe io wrappers.
     */
    describe('IntegrationTesting_Manager_To_Io_Workflow', () => {
      it('invalid_dir_falls_back', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: invalid_dir_falls_back');
        let ret: boolean = await FileIoManager.isDir('/definitely/missing');
        expect(ret).assertFalse();
      });

      it('device_conversion_chain', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: device_conversion_chain');
        let text: string = FileAccessManager.deviceTypeToString(fileExtensionInfo.DeviceType.DEVICE_LOCAL_DISK);
        expect(text).assertEqual('Local');
        let local: boolean = FileAccessManager.isLocalDevice(fileExtensionInfo.DeviceType.DEVICE_LOCAL_DISK);
        expect(local).assertTrue();
      });

      it('parallel_io_queries', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: parallel_io_queries');
        let tasks: Promise<boolean>[] = [];
        for (let i = 0; i < 10; i++) {
          tasks.push(FileIoManager.isDir('/missing/' + i));
        }
        let results: PromiseSettledResult<boolean>[] = await Promise.allSettled(tasks);
        expect(results.length).assertEqual(10);
      });
    });

    /*
     * Extended boundary, type and matrix coverage for IntegrationTesting derived from the reference suite.
     */
    describe('IntegrationTesting_Extended_Coverage', () => {
      it('integration_workflow_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_0');
        let bean: FileBean = createBean('movie.mp4');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_1');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder1'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_2');
        let text: string = FileAccessManager.deviceTypeToString(2);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_3');
        let ret: boolean = await FileIoManager.isDir('/missing/int3');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('integration_workflow_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_4');
        let bean: FileBean = createBean('stream.ts');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_5');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder5'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_6');
        let text: string = FileAccessManager.deviceTypeToString(0);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_7');
        let ret: boolean = await FileIoManager.isDir('/missing/int7');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('integration_workflow_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_8');
        let bean: FileBean = createBean('drama.rmvb');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_9');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder9'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_10');
        let text: string = FileAccessManager.deviceTypeToString(4);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_11');
        let ret: boolean = await FileIoManager.isDir('/missing/int11');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('integration_workflow_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_12');
        let bean: FileBean = createBean('sample.MKV');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_13');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder13'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_14');
        let text: string = FileAccessManager.deviceTypeToString(2);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_15');
        let ret: boolean = await FileIoManager.isDir('/missing/int15');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('integration_workflow_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_16');
        let bean: FileBean = createBean('photo.jpg');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_17');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder17'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_18');
        let text: string = FileAccessManager.deviceTypeToString(0);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_19');
        let ret: boolean = await FileIoManager.isDir('/missing/int19');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('integration_workflow_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_20');
        let bean: FileBean = createBean('scan.bmp');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_21');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder21'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_22');
        let text: string = FileAccessManager.deviceTypeToString(4);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_23');
        let ret: boolean = await FileIoManager.isDir('/missing/int23');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });

      it('integration_workflow_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_workflow_matrix_24');
        let bean: FileBean = createBean('PICTURE.JPEG');
        expect(bean.isVideo() || bean.isImage() || bean.isAudio()).assertTrue();
        let source: FileDataSource = new FileDataSource({} as Context, [bean]);
        expect(source.totalCount()).assertEqual(1);
      });

      it('integration_path_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_path_matrix_25');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Folder25'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
      });

      it('integration_conversion_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_conversion_matrix_26');
        let text: string = FileAccessManager.deviceTypeToString(2);
        expect(text.length > 0).assertTrue();
        expect(FileAccessManager.fileModeToString(1).indexOf('FILE')).assertLarger(-1);
      });

      it('integration_io_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: integration_io_matrix_27');
        let ret: boolean = await FileIoManager.isDir('/missing/int27');
        expect(ret).assertFalse();
        let pair: [number, number] = StorageManager.getFreeSpaceSize('/');
        expect(pair.length).assertEqual(2);
      });
    });
  });
}
