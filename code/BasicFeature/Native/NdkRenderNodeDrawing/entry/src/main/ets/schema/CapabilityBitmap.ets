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

import { createGroup, GroupSpec, GROUP_BITMAP, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 位图能力域：参数顺序与 cpp/capability/cap_bitmap.cpp 中的取值下标严格一致。
export const BITMAP_GROUP: GroupSpec = createGroup(GROUP_BITMAP, 'bitmap', $r('app.string.cap_bitmap_group_title'),
  $r('app.string.cap_bitmap_group_desc'), [
    scene(0, $r('app.string.cap_bitmap_s00_title'), $r('app.string.cap_bitmap_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('side', '%', 40, 10, 90, 5)
    ]),
    scene(1, $r('app.string.cap_bitmap_s01_title'), $r('app.string.cap_bitmap_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('side', '', 96, 16, 256, 8)
    ]),
    scene(2, $r('app.string.cap_bitmap_s02_title'), $r('app.string.cap_bitmap_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('scale', '%', 80, 10, 100, 5)
    ]),
    scene(3, $r('app.string.cap_bitmap_s03_title'), $r('app.string.cap_bitmap_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_bitmap_s04_title'), $r('app.string.cap_bitmap_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('cell', '', 4, 1, 8, 1)
    ]),
    scene(5, $r('app.string.cap_bitmap_s05_title'), $r('app.string.cap_bitmap_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('width', '', 64, 8, 256, 8),
      rangeParam('height', '', 32, 8, 256, 8)
    ]),
    scene(6, $r('app.string.cap_bitmap_s06_title'), $r('app.string.cap_bitmap_s06_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('alpha', '%', 50, 0, 100, 5)
    ]),
    scene(7, $r('app.string.cap_bitmap_s07_title'), $r('app.string.cap_bitmap_s07_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS)
    ]),
    scene(8, $r('app.string.cap_bitmap_s08_title'), $r('app.string.cap_bitmap_s08_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('width', '', 64, 8, 256, 8)
    ]),
    scene(9, $r('app.string.cap_bitmap_s09_title'), $r('app.string.cap_bitmap_s09_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('grid', '', 4, 1, 6, 1)
    ])
  ]);
