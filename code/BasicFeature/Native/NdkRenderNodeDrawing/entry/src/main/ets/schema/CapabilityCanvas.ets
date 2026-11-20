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

import { createGroup, GroupSpec, GROUP_CANVAS, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];

// 画布能力域：参数顺序与 cpp/capability/cap_canvas.cpp 中的取值下标严格一致。
export const CANVAS_GROUP: GroupSpec = createGroup(GROUP_CANVAS, 'canvas', $r('app.string.cap_canvas_group_title'),
  $r('app.string.cap_canvas_group_desc'), [
    scene(0, $r('app.string.cap_canvas_s00_title'), $r('app.string.cap_canvas_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('alpha', '%', 100, 0, 100, 5)
    ]),
    scene(1, $r('app.string.cap_canvas_s01_title'), $r('app.string.cap_canvas_s01_desc'), [
      rangeParam('spacing', 'vp', 24, 8, 64, 4),
      rangeParam('radius', 'vp', 3, 1, 10, 1)
    ]),
    scene(2, $r('app.string.cap_canvas_s02_title'), $r('app.string.cap_canvas_s02_desc'), [
      rangeParam('layers', '', 3, 1, 6, 1),
      rangeParam('angle', '°', 30, -90, 90, 5)
    ]),
    scene(3, $r('app.string.cap_canvas_s03_title'), $r('app.string.cap_canvas_s03_desc'), [
      rangeParam('inset', '%', 25, 5, 45, 5),
      rangeParam('angle', '°', 30, 0, 90, 5)
    ]),
    scene(4, $r('app.string.cap_canvas_s04_title'), $r('app.string.cap_canvas_s04_desc'), [
      rangeParam('radius', '%', 30, 5, 50, 5),
      rangeParam('inset', '%', 20, 5, 45, 5)
    ]),
    scene(5, $r('app.string.cap_canvas_s05_title'), $r('app.string.cap_canvas_s05_desc'), [
      rangeParam('sides', '', 6, 3, 9, 1),
      rangeParam('inset', '%', 20, 5, 45, 5)
    ]),
    scene(6, $r('app.string.cap_canvas_s06_title'), $r('app.string.cap_canvas_s06_desc'), [
      rangeParam('inset', '%', 20, 5, 45, 5),
      rangeParam('offset', '%', 15, 0, 40, 5)
    ]),
    scene(7, $r('app.string.cap_canvas_s07_title'), $r('app.string.cap_canvas_s07_desc'), [
      rangeParam('dx', '%', 20, -40, 40, 5),
      rangeParam('dy', '%', 15, -40, 40, 5)
    ]),
    scene(8, $r('app.string.cap_canvas_s08_title'), $r('app.string.cap_canvas_s08_desc'), [
      rangeParam('skewX', '°', 25, -60, 60, 5),
      rangeParam('skewY', '°', 0, -60, 60, 5)
    ]),
    scene(9, $r('app.string.cap_canvas_s09_title'), $r('app.string.cap_canvas_s09_desc'), [
      rangeParam('alpha', '%', 100, 0, 100, 10),
      rangeParam('radius', '%', 35, 10, 50, 5)
    ])
  ]);
