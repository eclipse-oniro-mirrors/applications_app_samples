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
 * @tc.number EXP_V2_DATA_035
 * @tc.name EXP_V2_DATA_035
 * @tc.desc length=1; listeners=4; duplicate-last; index=1.5; container isolation and unregister/rejoin replay
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const files0: string[] = ['uri://duplicate-last/0'];
    const item0 = new FileModel('duplicate-last_0.jpg', false, files0);
    const input: FileModel[] = [item0];
    const source = new CustomDataSource(input);
    const calls: string[] = [];
    const listener0 = new RecordingDataChangeListener('L0', calls);
    const listener1 = new RecordingDataChangeListener('L1', calls);
    const listener2 = new RecordingDataChangeListener('L2', calls);
    const listener3 = new RecordingDataChangeListener('L3', calls);
    const outsider = new RecordingDataChangeListener('OUT', calls);
    expect(source.totalCount()).assertEqual(1);
    expect(source.dataArray === input).assertEqual(false);
    expect(source.getData(-1)).assertUndefined();
    expect(source.getData(1)).assertUndefined();
    expect(source.getData(0).name).assertEqual('duplicate-last_0.jpg');
    expect(source.getData(0).isFolder).assertEqual(false);
    expect(source.getData(0).fileType).assertEqual('image');
    expect(source.getData(0).files).assertDeepEquals(['uri://duplicate-last/0']);
    expect(source.getData(0) === item0).assertEqual(true);
    expect(source.getData(0).files === files0).assertEqual(true);
    try {
      source.registerDataChangeListener(listener0);
      source.registerDataChangeListener(listener1);
      source.registerDataChangeListener(listener2);
      source.registerDataChangeListener(listener3);
      source.registerDataChangeListener(listener3);
      source.unregisterDataChangeListener(outsider);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L0:reload', 'L1:reload', 'L2:reload', 'L3:reload']);
      calls.splice(0, calls.length);
      source.notifyDataAdd(1.5);
      expect(calls).assertDeepEquals(['L0:add:1.5', 'L1:add:1.5', 'L2:add:1.5', 'L3:add:1.5']);
      calls.splice(0, calls.length);
      expect(source.totalCount()).assertEqual(1);
      input.splice(0, input.length);
      expect(input.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(1);
      item0.name = 'shared-renamed-duplicate-last.bin';
      files0.push('uri://shared/extra');
      expect(source.getData(0).name).assertEqual('shared-renamed-duplicate-last.bin');
      expect(source.getData(0).isFolder).assertEqual(false);
      expect(source.getData(0).fileType).assertEqual('image');
      expect(source.getData(0).files).assertDeepEquals(['uri://duplicate-last/0', 'uri://shared/extra']);
      expect(source.getData(0) === item0).assertEqual(true);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.getData(0).name).assertEqual('shared-renamed-duplicate-last.bin');
      expect(source.getData(0).isFolder).assertEqual(false);
      expect(source.getData(0).fileType).assertEqual('image');
      expect(source.getData(0).files).assertDeepEquals(['uri://duplicate-last/0', 'uri://shared/extra']);
      expect(source.getData(0) === item0).assertEqual(true);
      expect(source.totalCount()).assertEqual(1);
      expect(calls).assertDeepEquals([]);
      source.unregisterDataChangeListener(listener0);
      source.unregisterDataChangeListener(listener0);
      source.notifyDataChange(1.5);
      expect(calls).assertDeepEquals(['L1:change:1.5', 'L2:change:1.5', 'L3:change:1.5']);
      calls.splice(0, calls.length);
      source.registerDataChangeListener(listener0);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L1:reload', 'L2:reload', 'L3:reload', 'L0:reload']);
      calls.splice(0, calls.length);
      const appendedFiles: string[] = ['uri://appended'];
      const appended = new FileModel('appended-folder.mp4', true, appendedFiles);
      source.dataArray.push(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).name).assertEqual('appended-folder.mp4');
      expect(source.getData(1).isFolder).assertEqual(true);
      expect(source.getData(1).fileType).assertEqual('folder');
      expect(source.getData(1).files).assertDeepEquals(['uri://appended']);
      expect(source.getData(1) === appended).assertEqual(true);
      expect(source.getData(1).files === appendedFiles).assertEqual(true);
      expect(input.length).assertEqual(0);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.getData(0) === appended).assertEqual(true);
      expect(source.getData(1).name).assertEqual('shared-renamed-duplicate-last.bin');
      expect(source.getData(1).isFolder).assertEqual(false);
      expect(source.getData(1).fileType).assertEqual('image');
      expect(source.getData(1).files).assertDeepEquals(['uri://duplicate-last/0', 'uri://shared/extra']);
      expect(source.getData(1) === item0).assertEqual(true);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(2)).assertUndefined();
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
    source.notifyDataAdd(1.5);
    source.notifyDataChange(1.5);
    expect(calls).assertDeepEquals([]);
  };

export default runExpansionCase;
