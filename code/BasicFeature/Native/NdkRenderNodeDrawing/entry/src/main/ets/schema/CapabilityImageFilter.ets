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

import { createGroup, GroupSpec, GROUP_IMAGE_FILTER, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const TILE_MODE_OPTIONS: string[] = ['clamp', 'repeat', 'mirror', 'decal'];
const COLOR_MODE_OPTIONS: string[] = ['luma', 'screen'];

// 图像滤波能力域：参数顺序与 cpp/capability/cap_image_filter.cpp 中的取值下标严格一致。
export const IMAGE_FILTER_GROUP: GroupSpec = createGroup(GROUP_IMAGE_FILTER, 'image_filter',
  $r('app.string.cap_image_filter_group_title'),
  $r('app.string.cap_image_filter_group_desc'), [
    scene(0, $r('app.string.cap_image_filter_s00_title'), $r('app.string.cap_image_filter_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('sigmaX', '', 12, 0, 40, 1),
      rangeParam('sigmaY', '', 12, 0, 40, 1),
      selectParam('tileMode', 0, TILE_MODE_OPTIONS)
    ]),
    scene(1, $r('app.string.cap_image_filter_s01_title'), $r('app.string.cap_image_filter_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('sigma', '', 16, 0, 40, 1),
      rangeParam('alpha', '%', 60, 0, 100, 5)
    ]),
    scene(2, $r('app.string.cap_image_filter_s02_title'), $r('app.string.cap_image_filter_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('dx', '%', 10, -30, 30, 1),
      rangeParam('dy', '%', 10, -30, 30, 1)
    ]),
    scene(3, $r('app.string.cap_image_filter_s03_title'), $r('app.string.cap_image_filter_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      selectParam('mode', 0, COLOR_MODE_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_image_filter_s04_title'), $r('app.string.cap_image_filter_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('angle', '°', 45, 0, 360, 5)
    ]),
    scene(5, $r('app.string.cap_image_filter_s05_title'), $r('app.string.cap_image_filter_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('divisions', '', 2, 1, 5, 1)
    ]),
    scene(6, $r('app.string.cap_image_filter_s06_title'), $r('app.string.cap_image_filter_s06_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('sigma', '', 14, 0, 40, 1),
      rangeParam('alpha', '%', 90, 0, 100, 5)
    ]),
    scene(7, $r('app.string.cap_image_filter_s07_title'), $r('app.string.cap_image_filter_s07_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('sigma', '', 14, 0, 40, 1),
      rangeParam('alpha', '%', 90, 0, 100, 5)
    ]),
    scene(8, $r('app.string.cap_image_filter_s08_title'), $r('app.string.cap_image_filter_s08_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('sigma', '', 14, 0, 40, 1),
      rangeParam('alpha', '%', 90, 0, 100, 5)
    ]),
    scene(9, $r('app.string.cap_image_filter_s09_title'), $r('app.string.cap_image_filter_s09_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('sigma', '', 18, 0, 40, 1),
      rangeParam('alpha', '%', 95, 0, 100, 5)
    ])
  ]);
