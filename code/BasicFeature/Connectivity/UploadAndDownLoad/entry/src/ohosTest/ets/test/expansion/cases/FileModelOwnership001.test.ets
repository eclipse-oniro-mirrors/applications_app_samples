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

/**
 * @tc.number EXP_FILE_MODEL_OWNERSHIP_001
 * @tc.name EXP_FILE_MODEL_OWNERSHIP_001
 * @tc.desc FileModel数组所有权与公开枚举 — FILE_MODEL_OWNERSHIP_001. Calls the real production export.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const files: string[] = ['a'];
    const model = new FileModel('a.txt', false, files);
    files.push('b');
    expect(model.files === files).assertEqual(true);
    expect(model.files).assertDeepEquals(['a', 'b']);
    expect(files).assertDeepEquals(['a', 'b']);
  };

export default runExpansionCase;
