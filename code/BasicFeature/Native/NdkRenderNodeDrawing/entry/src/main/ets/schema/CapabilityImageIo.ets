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

import { createGroup, GroupSpec, GROUP_IMAGE_IO, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 图像与流能力域：参数顺序与 cpp/capability/cap_image_io.cpp 中的取值下标严格一致。
export const IMAGE_IO_GROUP: GroupSpec = createGroup(GROUP_IMAGE_IO, 'image_io',
  $r('app.string.cap_image_io_group_title'),
  $r('app.string.cap_image_io_group_desc'), [
    scene(0, $r('app.string.cap_image_io_s00_title'), $r('app.string.cap_image_io_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('side', '%', 50, 20, 90, 5)
    ]),
    scene(1, $r('app.string.cap_image_io_s01_title'), $r('app.string.cap_image_io_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS)
    ]),
    scene(2, $r('app.string.cap_image_io_s02_title'), $r('app.string.cap_image_io_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('src', '%', 50, 10, 90, 5)
    ]),
    scene(3, $r('app.string.cap_image_io_s03_title'), $r('app.string.cap_image_io_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_image_io_s04_title'), $r('app.string.cap_image_io_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('zoom', '%', 50, 10, 100, 5)
    ]),
    scene(5, $r('app.string.cap_image_io_s05_title'), $r('app.string.cap_image_io_s05_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('zoom', '%', 50, 10, 100, 5)
    ]),
    scene(6, $r('app.string.cap_image_io_s06_title'), $r('app.string.cap_image_io_s06_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('alpha', '%', 50, 0, 100, 5)
    ]),
    scene(7, $r('app.string.cap_image_io_s07_title'), $r('app.string.cap_image_io_s07_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('blocks', '', 6, 1, 12, 1)
    ]),
    scene(8, $r('app.string.cap_image_io_s08_title'), $r('app.string.cap_image_io_s08_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS)
    ]),
    scene(9, $r('app.string.cap_image_io_s09_title'), $r('app.string.cap_image_io_s09_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS)
    ])
  ]);
