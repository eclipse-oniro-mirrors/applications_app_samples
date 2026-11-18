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
 * @tc.number EXP_V2_DATA_024
 * @tc.name EXP_V2_DATA_024
 * @tc.desc length=1; listeners=1; remove-rejoin; index=2147483647; container isolation and unregister/rejoin replay
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const files0: string[] = ['uri://remove-rejoin/0'];
    const item0 = new FileModel('remove-rejoin_0.jpg', false, files0);
    const input: FileModel[] = [item0];
    const source = new CustomDataSource(input);
    const calls: string[] = [];
    const listener0 = new RecordingDataChangeListener('L0', calls);
    const outsider = new RecordingDataChangeListener('OUT', calls);
    expect(source.totalCount()).assertEqual(1);
    expect(source.dataArray === input).assertEqual(false);
    expect(source.getData(-1)).assertUndefined();
    expect(source.getData(1)).assertUndefined();
    expect(source.getData(0).name).assertEqual('remove-rejoin_0.jpg');
    expect(source.getData(0).isFolder).assertEqual(false);
    expect(source.getData(0).fileType).assertEqual('image');
    expect(source.getData(0).files).assertDeepEquals(['uri://remove-rejoin/0']);
    expect(source.getData(0) === item0).assertEqual(true);
    expect(source.getData(0).files === files0).assertEqual(true);
    try {
      source.registerDataChangeListener(listener0);
      source.unregisterDataChangeListener(listener0);
      source.registerDataChangeListener(listener0);
      source.unregisterDataChangeListener(outsider);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L0:reload']);
      calls.splice(0, calls.length);
      source.notifyDataAdd(2147483647);
      expect(calls).assertDeepEquals(['L0:add:2147483647']);
      calls.splice(0, calls.length);
      expect(source.totalCount()).assertEqual(1);
      input.splice(0, input.length);
      expect(input.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(1);
      item0.name = 'shared-renamed-remove-rejoin.bin';
      files0.push('uri://shared/extra');
      expect(source.getData(0).name).assertEqual('shared-renamed-remove-rejoin.bin');
      expect(source.getData(0).isFolder).assertEqual(false);
      expect(source.getData(0).fileType).assertEqual('image');
      expect(source.getData(0).files).assertDeepEquals(['uri://remove-rejoin/0', 'uri://shared/extra']);
      expect(source.getData(0) === item0).assertEqual(true);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.getData(0).name).assertEqual('shared-renamed-remove-rejoin.bin');
      expect(source.getData(0).isFolder).assertEqual(false);
      expect(source.getData(0).fileType).assertEqual('image');
      expect(source.getData(0).files).assertDeepEquals(['uri://remove-rejoin/0', 'uri://shared/extra']);
      expect(source.getData(0) === item0).assertEqual(true);
      expect(source.totalCount()).assertEqual(1);
      expect(calls).assertDeepEquals([]);
      source.unregisterDataChangeListener(listener0);
      source.unregisterDataChangeListener(listener0);
      source.notifyDataChange(2147483647);
      expect(calls).assertDeepEquals([]);
      calls.splice(0, calls.length);
      source.registerDataChangeListener(listener0);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L0:reload']);
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
      expect(source.getData(1).name).assertEqual('shared-renamed-remove-rejoin.bin');
      expect(source.getData(1).isFolder).assertEqual(false);
      expect(source.getData(1).fileType).assertEqual('image');
      expect(source.getData(1).files).assertDeepEquals(['uri://remove-rejoin/0', 'uri://shared/extra']);
      expect(source.getData(1) === item0).assertEqual(true);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(2)).assertUndefined();
      expect(calls).assertDeepEquals([]);
    } finally {
      source.unregisterDataChangeListener(listener0);
      source.unregisterDataChangeListener(outsider);
    }
    calls.splice(0, calls.length);
    source.notifyDataReload();
    source.notifyDataAdd(2147483647);
    source.notifyDataChange(2147483647);
    expect(calls).assertDeepEquals([]);
  };

export default runExpansionCase;
