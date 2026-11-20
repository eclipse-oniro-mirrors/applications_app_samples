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
 * @tc.number EXP_V2_DATA_014
 * @tc.name EXP_V2_DATA_014
 * @tc.desc length=0; listeners=4; reverse; index=0; container isolation and unregister/rejoin replay
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: FileModel[] = [];
    const source = new CustomDataSource(input);
    const calls: string[] = [];
    const listener0 = new RecordingDataChangeListener('L0', calls);
    const listener1 = new RecordingDataChangeListener('L1', calls);
    const listener2 = new RecordingDataChangeListener('L2', calls);
    const listener3 = new RecordingDataChangeListener('L3', calls);
    const outsider = new RecordingDataChangeListener('OUT', calls);
    expect(source.totalCount()).assertEqual(0);
    expect(source.dataArray === input).assertEqual(false);
    expect(source.getData(-1)).assertUndefined();
    expect(source.getData(0)).assertUndefined();
    try {
      source.registerDataChangeListener(listener3);
      source.registerDataChangeListener(listener2);
      source.registerDataChangeListener(listener1);
      source.registerDataChangeListener(listener0);
      source.unregisterDataChangeListener(outsider);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L3:reload', 'L2:reload', 'L1:reload', 'L0:reload']);
      calls.splice(0, calls.length);
      source.notifyDataAdd(0);
      expect(calls).assertDeepEquals(['L3:add:0', 'L2:add:0', 'L1:add:0', 'L0:add:0']);
      calls.splice(0, calls.length);
      expect(source.totalCount()).assertEqual(0);
      input.splice(0, input.length);
      expect(input.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(0);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.totalCount()).assertEqual(0);
      expect(calls).assertDeepEquals([]);
      source.unregisterDataChangeListener(listener3);
      source.unregisterDataChangeListener(listener3);
      source.notifyDataChange(0);
      expect(calls).assertDeepEquals(['L2:change:0', 'L1:change:0', 'L0:change:0']);
      calls.splice(0, calls.length);
      source.registerDataChangeListener(listener3);
      source.notifyDataReload();
      expect(calls).assertDeepEquals(['L2:reload', 'L1:reload', 'L0:reload', 'L3:reload']);
      calls.splice(0, calls.length);
      const appendedFiles: string[] = ['uri://appended'];
      const appended = new FileModel('appended-folder.mp4', true, appendedFiles);
      source.dataArray.push(appended);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).name).assertEqual('appended-folder.mp4');
      expect(source.getData(0).isFolder).assertEqual(true);
      expect(source.getData(0).fileType).assertEqual('folder');
      expect(source.getData(0).files).assertDeepEquals(['uri://appended']);
      expect(source.getData(0) === appended).assertEqual(true);
      expect(source.getData(0).files === appendedFiles).assertEqual(true);
      expect(input.length).assertEqual(0);
      expect(calls).assertDeepEquals([]);
      source.dataArray.reverse();
      expect(source.getData(0) === appended).assertEqual(true);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(1)).assertUndefined();
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
    source.notifyDataAdd(0);
    source.notifyDataChange(0);
    expect(calls).assertDeepEquals([]);
  };

export default runExpansionCase;
