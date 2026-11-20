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

import { createGroup, GroupSpec, GROUP_MATRIX, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const SKEW_AXIS_OPTIONS: string[] = ['x only', 'x and y'];
const ORDER_OPTIONS: string[] = ['translate then scale', 'scale then translate'];

// 矩阵能力域：参数顺序与 cpp/capability/cap_matrix.cpp 中的取值下标严格一致。
export const MATRIX_GROUP: GroupSpec = createGroup(GROUP_MATRIX, 'matrix', $r('app.string.cap_matrix_group_title'),
  $r('app.string.cap_matrix_group_desc'), [
    scene(0, $r('app.string.cap_matrix_s00_title'), $r('app.string.cap_matrix_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS)
    ]),
    scene(1, $r('app.string.cap_matrix_s01_title'), $r('app.string.cap_matrix_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('dx', '%', 10, -30, 30, 1),
      rangeParam('dy', '%', 8, -30, 30, 1)
    ]),
    scene(2, $r('app.string.cap_matrix_s02_title'), $r('app.string.cap_matrix_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('scale', '', 1.5, 0.3, 2.5, 0.05),
      rangeParam('pivotX', '%', 50, 10, 90, 1),
      rangeParam('pivotY', '%', 50, 10, 90, 1)
    ]),
    scene(3, $r('app.string.cap_matrix_s03_title'), $r('app.string.cap_matrix_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('angle', '°', 30, -180, 180, 5)
    ]),
    scene(4, $r('app.string.cap_matrix_s04_title'), $r('app.string.cap_matrix_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('skewX', '°', 20, -45, 45, 1),
      selectParam('axis', 0, SKEW_AXIS_OPTIONS)
    ]),
    scene(5, $r('app.string.cap_matrix_s05_title'), $r('app.string.cap_matrix_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('angle', '°', 30, -180, 180, 5),
      rangeParam('dx', '%', 10, -30, 30, 1)
    ]),
    scene(6, $r('app.string.cap_matrix_s06_title'), $r('app.string.cap_matrix_s06_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      selectParam('order', 0, ORDER_OPTIONS),
      rangeParam('dx', '%', 12, -20, 20, 1),
      rangeParam('scale', '', 1.4, 0.5, 2, 0.05)
    ]),
    scene(7, $r('app.string.cap_matrix_s07_title'), $r('app.string.cap_matrix_s07_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('angle', '°', 25, -90, 90, 5)
    ]),
    scene(8, $r('app.string.cap_matrix_s08_title'), $r('app.string.cap_matrix_s08_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('angle', '°', 20, -180, 180, 5),
      rangeParam('scale', '', 1.2, 0.5, 2, 0.05)
    ]),
    scene(9, $r('app.string.cap_matrix_s09_title'), $r('app.string.cap_matrix_s09_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('pull', '%', 8, 0, 25, 1)
    ])
  ]);
