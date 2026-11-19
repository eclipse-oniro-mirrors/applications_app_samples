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
import {
  FileModel,
  FileType
} from '@ohos/uploaddownload';
import { CustomDataSource } from '../../../../../main/ets/components/CustomDataSource';
import { RecordingDataChangeListener } from '../fixtures/RecordingDataChangeListener';

/**
 * @tc.number EXP_DS_INDEX_FORWARD_005
 * @tc.name EXP_DS_INDEX_FORWARD_005
 * @tc.desc 通知索引原样透传 — DS_INDEX_FORWARD_005. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: FileModel[] = [new FileModel('one', false, [])];
    const source = new CustomDataSource(input);
    const calls: string[] = [];
    const listenerA = new RecordingDataChangeListener('A', calls);
    const listenerB = new RecordingDataChangeListener('B', calls);
    const listenerX = new RecordingDataChangeListener('X', calls);
    try {
      source.registerDataChangeListener(listenerA);
      source.notifyDataChange(0);
      expect(calls).assertDeepEquals(['A:change:0']);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === input[0]).assertEqual(true);
      expect(source.getData(0).name).assertEqual('one');
    } finally {
      source.unregisterDataChangeListener(listenerA);
      source.unregisterDataChangeListener(listenerB);
      source.unregisterDataChangeListener(listenerX);
    }
  };

export default runExpansionCase;
