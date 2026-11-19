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
  createGroup, GroupSpec, GROUP_PAINT, rangeParam, scene, selectParam
} from '../core/SchemaTypes';

const CAP_OPTIONS: string[] = ['flat', 'square', 'round'];
const JOIN_OPTIONS: string[] = ['miter', 'round', 'bevel'];
const BLEND_OPTIONS: string[] = ['multiply', 'screen', 'overlay', 'difference'];

// 画笔能力域：参数顺序与 cpp/capability/cap_paint.cpp 中的取值下标严格一致。
export const PAINT_GROUP: GroupSpec = createGroup(GROUP_PAINT, 'paint', $r('app.string.cap_paint_group_title'),
  $r('app.string.cap_paint_group_desc'), [
    scene(0, $r('app.string.cap_paint_s00_title'), $r('app.string.cap_paint_s00_desc'), [
      selectParam('cap', 2, CAP_OPTIONS),
      rangeParam('width', 'vp', 16, 2, 30, 2)
    ]),
    scene(1, $r('app.string.cap_paint_s01_title'), $r('app.string.cap_paint_s01_desc'), [
      selectParam('join', 1, JOIN_OPTIONS),
      rangeParam('width', 'vp', 18, 2, 30, 2)
    ]),
    scene(2, $r('app.string.cap_paint_s02_title'), $r('app.string.cap_paint_s02_desc'), [
      rangeParam('miterLimit', '', 4, 1, 20, 1),
      rangeParam('width', 'vp', 16, 2, 30, 2)
    ]),
    scene(3, $r('app.string.cap_paint_s03_title'), $r('app.string.cap_paint_s03_desc'), [
      rangeParam('width', 'vp', 12, 1, 40, 1),
      rangeParam('alpha', '%', 100, 10, 100, 10)
    ]),
    scene(4, $r('app.string.cap_paint_s04_title'), $r('app.string.cap_paint_s04_desc'), [
      rangeParam('alpha', '%', 60, 0, 100, 5),
      rangeParam('layers', '', 3, 1, 5, 1)
    ]),
    scene(5, $r('app.string.cap_paint_s05_title'), $r('app.string.cap_paint_s05_desc'), [
      selectParam('mode', 0, BLEND_OPTIONS),
      rangeParam('alpha', '%', 100, 20, 100, 10)
    ]),
    scene(6, $r('app.string.cap_paint_s06_title'), $r('app.string.cap_paint_s06_desc'), [
      rangeParam('dash', 'vp', 16, 2, 30, 2),
      rangeParam('gap', 'vp', 8, 2, 30, 2)
    ]),
    scene(7, $r('app.string.cap_paint_s07_title'), $r('app.string.cap_paint_s07_desc'), [
      rangeParam('radius', 'vp', 16, 2, 40, 2),
      rangeParam('width', 'vp', 12, 2, 30, 2)
    ]),
    scene(8, $r('app.string.cap_paint_s08_title'), $r('app.string.cap_paint_s08_desc'), [
      rangeParam('segment', 'vp', 10, 2, 30, 2),
      rangeParam('deviation', 'vp', 6, 0, 20, 1)
    ]),
    scene(9, $r('app.string.cap_paint_s09_title'), $r('app.string.cap_paint_s09_desc'), [
      rangeParam('blur', 'vp', 16, 0, 40, 2),
      rangeParam('offset', 'vp', 10, 0, 30, 2)
    ])
  ]);
