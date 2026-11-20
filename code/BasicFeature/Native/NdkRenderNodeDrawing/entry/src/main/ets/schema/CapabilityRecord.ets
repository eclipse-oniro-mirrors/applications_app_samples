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

import { createGroup, GroupSpec, GROUP_RECORD, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 录制命令能力域：参数顺序与 cpp/capability/cap_record.cpp 中的取值下标严格一致。
export const RECORD_GROUP: GroupSpec = createGroup(GROUP_RECORD, 'record', $r('app.string.cap_record_group_title'),
  $r('app.string.cap_record_group_desc'), [
    scene(0, $r('app.string.cap_record_s00_title'), $r('app.string.cap_record_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(1, $r('app.string.cap_record_s01_title'), $r('app.string.cap_record_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('angle', '°', 12, -45, 45, 1)
    ]),
    scene(2, $r('app.string.cap_record_s02_title'), $r('app.string.cap_record_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('offset', '%', 6, 0, 20, 1)
    ]),
    scene(3, $r('app.string.cap_record_s03_title'), $r('app.string.cap_record_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_record_s04_title'), $r('app.string.cap_record_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('scale', '', 2, 1.2, 3, 0.05)
    ]),
    scene(5, $r('app.string.cap_record_s05_title'), $r('app.string.cap_record_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('alpha', '', 0.5, 0.1, 1, 0.05)
    ]),
    scene(6, $r('app.string.cap_record_s06_title'), $r('app.string.cap_record_s06_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('offset', '%', 8, 0, 20, 1)
    ]),
    scene(7, $r('app.string.cap_record_s07_title'), $r('app.string.cap_record_s07_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('offset', '%', 4, 0, 12, 1)
    ])
  ]);
