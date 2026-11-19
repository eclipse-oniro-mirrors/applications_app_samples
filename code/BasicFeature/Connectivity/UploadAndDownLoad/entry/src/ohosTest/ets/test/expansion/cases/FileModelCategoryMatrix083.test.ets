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

/**
 * @tc.number EXP_V2_FILE_083
 * @tc.name EXP_V2_FILE_083
 * @tc.desc hidden .mp3; folder=False; input alias, reverse mutation, detach and fresh replay
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: string[] = ['uri://original/0'];
    const model = new FileModel('.mp3', false, input);
    expect(model.name).assertEqual('.mp3');
    expect(model.isFolder).assertEqual(false);
    expect(model.fileType).assertEqual('music');
    expect(model.files).assertDeepEquals(['uri://original/0']);
    expect(model.files === input).assertEqual(true);
    expect(input.length).assertEqual(1);
    input.push('uri://added/hidden');
    expect(model.name).assertEqual('.mp3');
    expect(model.isFolder).assertEqual(false);
    expect(model.fileType).assertEqual('music');
    expect(model.files).assertDeepEquals(['uri://original/0', 'uri://added/hidden']);
    expect(model.files === input).assertEqual(true);
    expect(input).assertDeepEquals(['uri://original/0', 'uri://added/hidden']);
    const removed = model.files.pop();
    expect(removed).assertEqual('uri://added/hidden');
    expect(model.name).assertEqual('.mp3');
    expect(model.isFolder).assertEqual(false);
    expect(model.fileType).assertEqual('music');
    expect(model.files).assertDeepEquals(['uri://original/0']);
    expect(input).assertDeepEquals(['uri://original/0']);
    const replacement: string[] = ['uri://replacement/hidden', 'uri://replacement/final'];
    model.files = replacement;
    input.push('uri://detached/hidden');
    expect(model.name).assertEqual('.mp3');
    expect(model.isFolder).assertEqual(false);
    expect(model.fileType).assertEqual('music');
    expect(model.files).assertDeepEquals(['uri://replacement/hidden', 'uri://replacement/final']);
    expect(model.files === replacement).assertEqual(true);
    expect(model.files === input).assertEqual(false);
    expect(input).assertDeepEquals(['uri://original/0', 'uri://detached/hidden']);
    const replayInput: string[] = ['uri://original/0'];
    const replay = new FileModel('.mp3', false, replayInput);
    expect(replay.name).assertEqual('.mp3');
    expect(replay.isFolder).assertEqual(false);
    expect(replay.fileType).assertEqual('music');
    expect(replay.files).assertDeepEquals(['uri://original/0']);
    expect(replay === model).assertEqual(false);
    expect(replay.files === replayInput).assertEqual(true);
    expect(replay.files === model.files).assertEqual(false);
    expect(replacement).assertDeepEquals(['uri://replacement/hidden', 'uri://replacement/final']);
  };

export default runExpansionCase;
