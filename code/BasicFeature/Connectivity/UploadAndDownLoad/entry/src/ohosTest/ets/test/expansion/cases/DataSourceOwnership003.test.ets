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
 * @tc.number EXP_DS_OWNERSHIP_003
 * @tc.name EXP_DS_OWNERSHIP_003
 * @tc.desc 数据源复制容器与公开数组状态 — DS_OWNERSHIP_003. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: FileModel[] = [new FileModel('a', false, [])];
    const source = new CustomDataSource(input);
    const calls: string[] = [];
    const listener = new RecordingDataChangeListener('A', calls);
    source.registerDataChangeListener(listener);
    try {
      source.dataArray.push(new FileModel('b', false, []));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).name).assertEqual('a');
      expect(source.getData(1).name).assertEqual('b');
      expect(calls).assertDeepEquals([]);
    } finally {
      source.unregisterDataChangeListener(listener);
    }
  };

export default runExpansionCase;
