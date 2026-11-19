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

import {
  createGroup, GroupSpec, GROUP_COLOR, rangeParam, scene, selectParam
} from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 颜色能力域：参数顺序与 cpp/capability/cap_color.cpp 中的取值下标严格一致。
export const COLOR_GROUP: GroupSpec = createGroup(GROUP_COLOR, 'color', $r('app.string.cap_color_group_title'),
  $r('app.string.cap_color_group_desc'), [
    scene(0, $r('app.string.cap_color_s00_title'), $r('app.string.cap_color_s00_desc'), [
      rangeParam('count', '', 6, 3, 8, 1),
      rangeParam('alpha', '%', 100, 20, 100, 10)
    ]),
    scene(1, $r('app.string.cap_color_s01_title'), $r('app.string.cap_color_s01_desc'), [
      rangeParam('steps', '', 8, 4, 12, 1),
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(2, $r('app.string.cap_color_s02_title'), $r('app.string.cap_color_s02_desc'), [
      rangeParam('ratio', '%', 50, 0, 100, 5),
      selectParam('from', 0, PALETTE_OPTIONS),
      selectParam('to', 2, PALETTE_OPTIONS)
    ]),
    scene(3, $r('app.string.cap_color_s03_title'), $r('app.string.cap_color_s03_desc'), [
      rangeParam('alpha', '%', 80, 0, 100, 10),
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_color_s04_title'), $r('app.string.cap_color_s04_desc'), [
      rangeParam('alpha', '%', 80, 0, 100, 10),
      selectParam('palette', 2, PALETTE_OPTIONS)
    ]),
    scene(5, $r('app.string.cap_color_s05_title'), $r('app.string.cap_color_s05_desc'), [
      rangeParam('amount', '', 1.5, 0, 2, 0.1),
      selectParam('palette', 3, PALETTE_OPTIONS)
    ]),
    scene(6, $r('app.string.cap_color_s06_title'), $r('app.string.cap_color_s06_desc'), [
      rangeParam('amount', '%', 100, 0, 100, 10),
      selectParam('palette', 0, PALETTE_OPTIONS)
    ]),
    scene(7, $r('app.string.cap_color_s07_title'), $r('app.string.cap_color_s07_desc'), [
      rangeParam('strength', '%', 50, 0, 100, 10),
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(8, $r('app.string.cap_color_s08_title'), $r('app.string.cap_color_s08_desc'), [
      rangeParam('strength', '%', 50, 0, 100, 10),
      selectParam('palette', 4, PALETTE_OPTIONS)
    ])
  ]);
