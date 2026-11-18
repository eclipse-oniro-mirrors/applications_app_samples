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
import { expect } from '@ohos/hypium';
import { FileModel } from '@ohos/uploaddownload';
import { CustomDataSource } from '../../../../../main/ets/components/CustomDataSource';
import { RecordingDataChangeListener } from '../fixtures/RecordingDataChangeListener';

/**
 * @tc.number EXP_V2_DATA_051
 * @tc.name EXP_V2_DATA_051
 * @tc.desc length=3; listeners=4; rotate; index=1; container isolation and unregister/rejoin replay
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const files0: string[] = ['uri://rotate/0'];
    const item0 = new FileModel('rotate_0.jpg', false, files0);
    const files1: string[] = ['uri://rotate/1'];
    const item1 = new FileModel('rotate_1.mp3', false, files1);
    const files2: string[] = ['uri://rotate/2'];
    const item2 = new FileModel('rotate_2.mp4', false, files2);
    const input: FileModel[] = [item0, item1, item2];
    const source = new CustomDataSource(input);
    const calls: string[] = [];
    const listener0 = new RecordingDataChangeListener('L0', calls);
    const listener1 = new RecordingDataChangeListener('L1', calls);
    const listener2 = new RecordingDataChangeListener('L2', calls);
    const listener3 = new RecordingDataChangeListener('L3', calls);
    const outsider = new RecordingDataChangeListener('OUT', calls);
    expect(source.totalCount()).assertEqual(3);
    expect(source.dataArray === input).assertEqual(false);
    expect(source.getData(-1)).assertUndefined();
    expect(source.getData(3)).assertUndefined();
    expect(source.getData(0).name).assertEqual('rotate_0.jpg');
    expect(source.getData(0).isFolder).assertEqual(false);
    expect(source.getData(0).fileType).assertEqual('image');
    expect(source.getData(0).files).assertDeepEquals(['uri://rotate/0']);
    expect(source.getData(0) === item0).assertEqual(true);
    expect(source.getData(0).files === files0).assertEqual(true);
    expect(source.getData(1).name).assertEqual('rotate_1.mp3');
    expect(source.getData(1).isFolder).assertEqual(false);
    expect(source.getData(1).fileType).assertEqual('music');
    expect(source.getData(1).files).assertDeepEquals(['uri://rotate/1']);
    expect(source.getData(1) === item1).assertEqual(true);
    expect(source.getData(1).files === files1).assertEqual(true);
    expect(source.getData(2).name).assertEqual('rotate_2.mp4');
    expect(source.getData(2).isFolder).assertEqual(false);
    expect(source.getData(2).fileType).assertEqual('video');
    expect(source.getData(2).files).assertDeepEquals(['uri://rotate/2']);
    expect(source.getData(2) === item2).assertEqual(true);
    expect(source.getData(2).files === files2).assertEqual(true);
    try {
      source.registerDataChangeListener(listener1);
      source.registerDataChangeListener(listener2);
      source.registerDataChangeListener(listener3);
      source.registerDataChangeListener(listener0);
      source.unregisterDataChangeListener(outsider);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L1:reload', 'L2:reload', 'L3:reload', 'L0:reload']);
      calls.splice(0, calls.length);
      source.notifyDataAdd(1);
      expect(calls).assertDeepEquals(['L1:add:1', 'L2:add:1', 'L3:add:1', 'L0:add:1']);
      calls.splice(0, calls.length);
      expect(source.totalCount()).assertEqual(3);
      input.splice(0, input.length);
      expect(input.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(3);
      item0.name = 'shared-renamed-rotate.bin';
      files0.push('uri://shared/extra');
      expect(source.getData(0).name).assertEqual('shared-renamed-rotate.bin');
      expect(source.getData(0).isFolder).assertEqual(false);
      expect(source.getData(0).fileType).assertEqual('image');
      expect(source.getData(0).files).assertDeepEquals(['uri://rotate/0', 'uri://shared/extra']);
      expect(source.getData(0) === item0).assertEqual(true);
      expect(source.getData(1).name).assertEqual('rotate_1.mp3');
      expect(source.getData(1).isFolder).assertEqual(false);
      expect(source.getData(1).fileType).assertEqual('music');
      expect(source.getData(1).files).assertDeepEquals(['uri://rotate/1']);
      expect(source.getData(1) === item1).assertEqual(true);
      expect(source.getData(2).name).assertEqual('rotate_2.mp4');
      expect(source.getData(2).isFolder).assertEqual(false);
      expect(source.getData(2).fileType).assertEqual('video');
      expect(source.getData(2).files).assertDeepEquals(['uri://rotate/2']);
      expect(source.getData(2) === item2).assertEqual(true);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.getData(0).name).assertEqual('rotate_2.mp4');
      expect(source.getData(0).isFolder).assertEqual(false);
      expect(source.getData(0).fileType).assertEqual('video');
      expect(source.getData(0).files).assertDeepEquals(['uri://rotate/2']);
      expect(source.getData(0) === item2).assertEqual(true);
      expect(source.getData(1).name).assertEqual('rotate_1.mp3');
      expect(source.getData(1).isFolder).assertEqual(false);
      expect(source.getData(1).fileType).assertEqual('music');
      expect(source.getData(1).files).assertDeepEquals(['uri://rotate/1']);
      expect(source.getData(1) === item1).assertEqual(true);
      expect(source.getData(2).name).assertEqual('shared-renamed-rotate.bin');
      expect(source.getData(2).isFolder).assertEqual(false);
      expect(source.getData(2).fileType).assertEqual('image');
      expect(source.getData(2).files).assertDeepEquals(['uri://rotate/0', 'uri://shared/extra']);
      expect(source.getData(2) === item0).assertEqual(true);
      expect(source.totalCount()).assertEqual(3);
      expect(calls).assertDeepEquals([]);
      source.unregisterDataChangeListener(listener1);
      source.unregisterDataChangeListener(listener1);
      source.notifyDataChange(1);
      expect(calls).assertDeepEquals(['L2:change:1', 'L3:change:1', 'L0:change:1']);
      calls.splice(0, calls.length);
      source.registerDataChangeListener(listener1);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L2:reload', 'L3:reload', 'L0:reload', 'L1:reload']);
      calls.splice(0, calls.length);
      const appendedFiles: string[] = ['uri://appended'];
      const appended = new FileModel('appended-folder.mp4', true, appendedFiles);
      source.dataArray.push(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3).name).assertEqual('appended-folder.mp4');
      expect(source.getData(3).isFolder).assertEqual(true);
      expect(source.getData(3).fileType).assertEqual('folder');
      expect(source.getData(3).files).assertDeepEquals(['uri://appended']);
      expect(source.getData(3) === appended).assertEqual(true);
      expect(source.getData(3).files === appendedFiles).assertEqual(true);
      expect(input.length).assertEqual(0);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.getData(0) === appended).assertEqual(true);
      expect(source.getData(1).name).assertEqual('shared-renamed-rotate.bin');
      expect(source.getData(1).isFolder).assertEqual(false);
      expect(source.getData(1).fileType).assertEqual('image');
      expect(source.getData(1).files).assertDeepEquals(['uri://rotate/0', 'uri://shared/extra']);
      expect(source.getData(1) === item0).assertEqual(true);
      expect(source.getData(2).name).assertEqual('rotate_1.mp3');
      expect(source.getData(2).isFolder).assertEqual(false);
      expect(source.getData(2).fileType).assertEqual('music');
      expect(source.getData(2).files).assertDeepEquals(['uri://rotate/1']);
      expect(source.getData(2) === item1).assertEqual(true);
      expect(source.getData(3).name).assertEqual('rotate_2.mp4');
      expect(source.getData(3).isFolder).assertEqual(false);
      expect(source.getData(3).fileType).assertEqual('video');
      expect(source.getData(3).files).assertDeepEquals(['uri://rotate/2']);
      expect(source.getData(3) === item2).assertEqual(true);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(4)).assertUndefined();
      expect(calls).assertDeepEquals([]);
    } finally {
      source.unregisterDataChangeListener(listener0);
      source.unregisterDataChangeListener(listener1);
      source.unregisterDataChangeListener(listener2);
      source.unregisterDataChangeListener(listener3);
      source.unregisterDataChangeListener(outsider);
    }
    calls.splice(0, calls.length);
    source.notifyDataReload();
    source.notifyDataAdd(1);
    source.notifyDataChange(1);
    expect(calls).assertDeepEquals([]);
  };

export default runExpansionCase;
