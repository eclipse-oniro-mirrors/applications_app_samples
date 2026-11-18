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
 * @tc.number EXP_DS_CONSTRUCT_003
 * @tc.name EXP_DS_CONSTRUCT_003
 * @tc.desc 数据源空单多元素构造 — DS_CONSTRUCT_003. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: FileModel[] = [
      new FileModel('one.txt', false, []),
      new FileModel('two.mp3', false, []),
      new FileModel('folder', false, [])
    ];
    const source = new CustomDataSource(input);
    expect(source.totalCount()).assertEqual(3);
    expect(source.dataArray === input).assertEqual(false);
    expect(source.getData(0) === input[0]).assertEqual(true);
    expect(source.getData(0).name).assertEqual('one.txt');
    expect(source.getData(1) === input[1]).assertEqual(true);
    expect(source.getData(1).name).assertEqual('two.mp3');
    expect(source.getData(2) === input[2]).assertEqual(true);
    expect(source.getData(2).name).assertEqual('folder');
    expect(source.dataArray.length).assertEqual(3);
  };

export default runExpansionCase;
