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
  createGroup, GroupSpec, GROUP_COLOR_FILTER, rangeParam, scene, selectParam
} from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const FILTER_BLEND_OPTIONS: string[] = ['multiply', 'screen', 'overlay', 'darken', 'difference'];
const FILTER_KIND_OPTIONS: string[] = ['luma', 'gray', 'invert', 'sepia'];

// 颜色滤波器能力域：参数顺序与 cpp/capability/cap_color_filter.cpp 中的取值下标严格一致。
export const COLOR_FILTER_GROUP: GroupSpec = createGroup(GROUP_COLOR_FILTER, 'colorFilter',
  $r('app.string.cap_color_filter_group_title'),
  $r('app.string.cap_color_filter_group_desc'), [
    scene(0, $r('app.string.cap_color_filter_s00_title'), $r('app.string.cap_color_filter_s00_desc'), [
      selectParam('mode', 0, FILTER_BLEND_OPTIONS),
      selectParam('palette', 2, PALETTE_OPTIONS)
    ]),
    scene(1, $r('app.string.cap_color_filter_s01_title'), $r('app.string.cap_color_filter_s01_desc'), [
      rangeParam('saturation', '%', 0, 0, 100, 10),
      rangeParam('alpha', '%', 100, 40, 100, 10)
    ]),
    scene(2, $r('app.string.cap_color_filter_s02_title'), $r('app.string.cap_color_filter_s02_desc'), [
      rangeParam('amount', '%', 70, 0, 100, 10),
      rangeParam('alpha', '%', 100, 40, 100, 10)
    ]),
    scene(3, $r('app.string.cap_color_filter_s03_title'), $r('app.string.cap_color_filter_s03_desc'), [
      rangeParam('amount', '%', 100, 0, 100, 10),
      rangeParam('alpha', '%', 100, 40, 100, 10)
    ]),
    scene(4, $r('app.string.cap_color_filter_s04_title'), $r('app.string.cap_color_filter_s04_desc'), [
      rangeParam('contrast', '', 1.5, 0, 2, 0.1),
      rangeParam('alpha', '%', 100, 40, 100, 10)
    ]),
    scene(5, $r('app.string.cap_color_filter_s05_title'), $r('app.string.cap_color_filter_s05_desc'), [
      rangeParam('alpha', '%', 100, 20, 100, 10),
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(6, $r('app.string.cap_color_filter_s06_title'), $r('app.string.cap_color_filter_s06_desc'), [
      selectParam('outer', 0, FILTER_KIND_OPTIONS),
      selectParam('inner', 1, FILTER_KIND_OPTIONS)
    ]),
    scene(7, $r('app.string.cap_color_filter_s07_title'), $r('app.string.cap_color_filter_s07_desc'), [
      selectParam('multiply', 1, PALETTE_OPTIONS),
      selectParam('add', 4, PALETTE_OPTIONS)
    ]),
    scene(8, $r('app.string.cap_color_filter_s08_title'), $r('app.string.cap_color_filter_s08_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('width', 'vp', 10, 2, 30, 2)
    ])
  ]);
