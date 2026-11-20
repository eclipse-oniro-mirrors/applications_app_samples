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

import { createGroup, GroupSpec, GROUP_PIXELMAP, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const FILTER_OPTIONS: string[] = ['nearest', 'linear'];
const CONSTRAINT_OPTIONS: string[] = ['strict', 'fast'];

// PixelMap 能力域：参数顺序与 cpp/capability/cap_pixelmap.cpp 中的取值下标严格一致。
// 缺少图片入参时会自动降级为占位示意图，因此每个场景都能独立渲染。
export const PIXELMAP_GROUP: GroupSpec = createGroup(GROUP_PIXELMAP, 'pixelmap',
  $r('app.string.cap_pixel_map_group_title'),
  $r('app.string.cap_pixel_map_group_desc'), [
    scene(0, $r('app.string.cap_pixel_map_s00_title'), $r('app.string.cap_pixel_map_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('size', '%', 70, 10, 100, 5),
      selectParam('filter', 1, FILTER_OPTIONS)
    ]),
    scene(1, $r('app.string.cap_pixel_map_s01_title'), $r('app.string.cap_pixel_map_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('zoom', '%', 80, 0, 100, 5)
    ]),
    scene(2, $r('app.string.cap_pixel_map_s02_title'), $r('app.string.cap_pixel_map_s02_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('zoom', '%', 80, 0, 100, 5)
    ]),
    scene(3, $r('app.string.cap_pixel_map_s03_title'), $r('app.string.cap_pixel_map_s03_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('src', '%', 50, 10, 90, 5),
      selectParam('constraint', 0, CONSTRAINT_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_pixel_map_s04_title'), $r('app.string.cap_pixel_map_s04_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('centre', '%', 30, 5, 80, 5),
      selectParam('filter', 0, FILTER_OPTIONS)
    ]),
    scene(5, $r('app.string.cap_pixel_map_s05_title'), $r('app.string.cap_pixel_map_s05_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('amplitude', 'vp', 8, 0, 20, 1)
    ]),
    scene(6, $r('app.string.cap_pixel_map_s06_title'), $r('app.string.cap_pixel_map_s06_desc'), [
      rangeParam('angle', '°', 15, -180, 180, 5)
    ]),
    scene(7, $r('app.string.cap_pixel_map_s07_title'), $r('app.string.cap_pixel_map_s07_desc'), [
      rangeParam('count', '', 3, 1, 6, 1)
    ]),
    scene(8, $r('app.string.cap_pixel_map_s08_title'), $r('app.string.cap_pixel_map_s08_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('alpha', '%', 50, 0, 100, 5)
    ]),
    scene(9, $r('app.string.cap_pixel_map_s09_title'), $r('app.string.cap_pixel_map_s09_desc'), [
      rangeParam('scale', '%', 60, 10, 100, 5)
    ]),
    scene(10, $r('app.string.cap_pixel_map_s10_title'), $r('app.string.cap_pixel_map_s10_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('radius', 'vp', 12, 0, 40, 2)
    ]),
    scene(11, $r('app.string.cap_pixel_map_s11_title'), $r('app.string.cap_pixel_map_s11_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS)
    ])
  ]);
