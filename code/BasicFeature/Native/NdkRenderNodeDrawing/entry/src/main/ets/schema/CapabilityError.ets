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

import { createGroup, GroupSpec, GROUP_ERROR, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 错误码能力域：参数顺序与 cpp/capability/cap_error.cpp 中的取值下标严格一致。
// 每个场景都会真实触发或复核一次错误码，再在主画布上画出状态点。
export const ERROR_GROUP: GroupSpec = createGroup(GROUP_ERROR, 'error', $r('app.string.cap_error_group_title'),
  $r('app.string.cap_error_group_desc'), [
    scene(0, $r('app.string.cap_error_s00_title'), $r('app.string.cap_error_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(1, $r('app.string.cap_error_s01_title'), $r('app.string.cap_error_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS)
    ]),
    scene(2, $r('app.string.cap_error_s02_title'), $r('app.string.cap_error_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS)
    ]),
    scene(3, $r('app.string.cap_error_s03_title'), $r('app.string.cap_error_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('angle', '°', 20, -90, 90, 5)
    ]),
    scene(4, $r('app.string.cap_error_s04_title'), $r('app.string.cap_error_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS)
    ]),
    scene(5, $r('app.string.cap_error_s05_title'), $r('app.string.cap_error_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(6, $r('app.string.cap_error_s06_title'), $r('app.string.cap_error_s06_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS)
    ]),
    scene(7, $r('app.string.cap_error_s07_title'), $r('app.string.cap_error_s07_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('ratio', '', 0.6, 0.1, 1, 0.05)
    ]),
    scene(8, $r('app.string.cap_error_s08_title'), $r('app.string.cap_error_s08_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('angle', '°', 25, -180, 180, 5)
    ]),
    scene(9, $r('app.string.cap_error_s09_title'), $r('app.string.cap_error_s09_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS)
    ])
  ]);
