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
 * @tc.number EXP_V2_FILE_100
 * @tc.name EXP_V2_FILE_100
 * @tc.desc upper-extension .mp3; folder=True; input alias, reverse mutation, detach and fresh replay
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: string[] = ['uri://original/0'];
    const model = new FileModel('photo.MP3', true, input);
    expect(model.name).assertEqual('photo.MP3');
    expect(model.isFolder).assertEqual(true);
    expect(model.fileType).assertEqual('folder');
    expect(model.files).assertDeepEquals(['uri://original/0']);
    expect(model.files === input).assertEqual(true);
    expect(input.length).assertEqual(1);
    input.push('uri://added/upper-extension');
    expect(model.name).assertEqual('photo.MP3');
    expect(model.isFolder).assertEqual(true);
    expect(model.fileType).assertEqual('folder');
    expect(model.files).assertDeepEquals(['uri://original/0', 'uri://added/upper-extension']);
    expect(model.files === input).assertEqual(true);
    expect(input).assertDeepEquals(['uri://original/0', 'uri://added/upper-extension']);
    const removed = model.files.pop();
    expect(removed).assertEqual('uri://added/upper-extension');
    expect(model.name).assertEqual('photo.MP3');
    expect(model.isFolder).assertEqual(true);
    expect(model.fileType).assertEqual('folder');
    expect(model.files).assertDeepEquals(['uri://original/0']);
    expect(input).assertDeepEquals(['uri://original/0']);
    const replacement: string[] = ['uri://replacement/upper-extension', 'uri://replacement/final'];
    model.files = replacement;
    input.push('uri://detached/upper-extension');
    expect(model.name).assertEqual('photo.MP3');
    expect(model.isFolder).assertEqual(true);
    expect(model.fileType).assertEqual('folder');
    expect(model.files).assertDeepEquals(['uri://replacement/upper-extension', 'uri://replacement/final']);
    expect(model.files === replacement).assertEqual(true);
    expect(model.files === input).assertEqual(false);
    expect(input).assertDeepEquals(['uri://original/0', 'uri://detached/upper-extension']);
    const replayInput: string[] = ['uri://original/0'];
    const replay = new FileModel('photo.MP3', true, replayInput);
    expect(replay.name).assertEqual('photo.MP3');
    expect(replay.isFolder).assertEqual(true);
    expect(replay.fileType).assertEqual('folder');
    expect(replay.files).assertDeepEquals(['uri://original/0']);
    expect(replay === model).assertEqual(false);
    expect(replay.files === replayInput).assertEqual(true);
    expect(replay.files === model.files).assertEqual(false);
    expect(replacement).assertDeepEquals(['uri://replacement/upper-extension', 'uri://replacement/final']);
  };

export default runExpansionCase;
