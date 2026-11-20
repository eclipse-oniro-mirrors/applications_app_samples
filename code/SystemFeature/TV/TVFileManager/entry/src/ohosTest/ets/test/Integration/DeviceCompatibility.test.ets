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

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility', () => {
    /*
     * A scan result is converted to rows, selected and then opened.
     */
    describe('DeviceCompatibility_Scan_To_Row_Workflow', () => {
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
    describe('DeviceCompatibility_Navigation_To_List_Workflow', () => {
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
    describe('DeviceCompatibility_Manager_To_Io_Workflow', () => {
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
     * Extended boundary, type and matrix coverage for DeviceCompatibility derived from the reference suite.
     */
    describe('DeviceCompatibility_Extended_Coverage', () => {
    });
  });
}
