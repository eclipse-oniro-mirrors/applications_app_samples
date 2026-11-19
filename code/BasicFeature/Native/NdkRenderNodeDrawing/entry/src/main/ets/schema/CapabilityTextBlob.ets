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

import { createGroup, GroupSpec, GROUP_TEXTBLOB, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 文字块能力域：参数顺序与 cpp/capability/cap_textblob.cpp 中的取值下标严格一致。
export const TEXTBLOB_GROUP: GroupSpec = createGroup(GROUP_TEXTBLOB, 'textblob',
  $r('app.string.cap_text_blob_group_title'),
  $r('app.string.cap_text_blob_group_desc'), [
    scene(0, $r('app.string.cap_text_blob_s00_title'), $r('app.string.cap_text_blob_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 16, 8, 40, 1)
    ]),
    scene(1, $r('app.string.cap_text_blob_s01_title'), $r('app.string.cap_text_blob_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('bytes', '', 100, 20, 100, 5)
    ]),
    scene(2, $r('app.string.cap_text_blob_s02_title'), $r('app.string.cap_text_blob_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('amplitude', 'vp', 12, 0, 30, 1)
    ]),
    scene(3, $r('app.string.cap_text_blob_s03_title'), $r('app.string.cap_text_blob_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('scale', '', 1, 0.5, 4, 0.1)
    ]),
    scene(4, $r('app.string.cap_text_blob_s04_title'), $r('app.string.cap_text_blob_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 16, 8, 40, 1)
    ]),
    scene(5, $r('app.string.cap_text_blob_s05_title'), $r('app.string.cap_text_blob_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(6, $r('app.string.cap_text_blob_s06_title'), $r('app.string.cap_text_blob_s06_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('radius', 'vp', 26, 12, 40, 1)
    ]),
    scene(7, $r('app.string.cap_text_blob_s07_title'), $r('app.string.cap_text_blob_s07_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('scale', '', 1.5, 0.5, 3, 0.1)
    ])
  ]);
