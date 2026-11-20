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
  createGroup, GroupSpec, GROUP_GEOMETRY, rangeParam, scene, selectParam, toggleParam
} from '../core/SchemaTypes';

const PATH_OP_OPTIONS: string[] = ['difference', 'intersect', 'union', 'xor', 'reverse'];
const REGION_OP_OPTIONS: string[] = ['union', 'intersect', 'difference'];

// 几何能力域：参数顺序与 cpp/capability/cap_geometry.cpp 中的取值下标严格一致。
export const GEOMETRY_GROUP: GroupSpec = createGroup(GROUP_GEOMETRY, 'geometry',
  $r('app.string.cap_geometry_group_title'),
  $r('app.string.cap_geometry_group_desc'), [
    scene(0, $r('app.string.cap_geometry_s00_title'), $r('app.string.cap_geometry_s00_desc'), [
      rangeParam('width', '%', 60, 10, 90, 5),
      rangeParam('height', '%', 50, 10, 90, 5)
    ]),
    scene(1, $r('app.string.cap_geometry_s01_title'), $r('app.string.cap_geometry_s01_desc'), [
      rangeParam('radius', '%', 25, 5, 50, 5),
      rangeParam('width', '%', 70, 10, 90, 5)
    ]),
    scene(2, $r('app.string.cap_geometry_s02_title'), $r('app.string.cap_geometry_s02_desc'), [
      rangeParam('outerRadius', '%', 30, 5, 50, 5),
      rangeParam('innerInset', '%', 30, 10, 60, 5)
    ]),
    scene(3, $r('app.string.cap_geometry_s03_title'), $r('app.string.cap_geometry_s03_desc'), [
      rangeParam('radiusX', '%', 40, 10, 50, 5),
      rangeParam('radiusY', '%', 25, 10, 50, 5)
    ]),
    scene(4, $r('app.string.cap_geometry_s04_title'), $r('app.string.cap_geometry_s04_desc'), [
      rangeParam('start', '°', 30, -180, 180, 15),
      rangeParam('sweep', '°', 240, 10, 360, 10)
    ]),
    scene(5, $r('app.string.cap_geometry_s05_title'), $r('app.string.cap_geometry_s05_desc'), [
      rangeParam('start', '°', 45, -180, 180, 15),
      rangeParam('sweep', '°', 200, 10, 360, 10),
      toggleParam('useCenter', true)
    ]),
    scene(6, $r('app.string.cap_geometry_s06_title'), $r('app.string.cap_geometry_s06_desc'), [
      rangeParam('thickness', 'vp', 8, 1, 24, 1),
      rangeParam('offset', '%', 20, 0, 40, 5)
    ]),
    scene(7, $r('app.string.cap_geometry_s07_title'), $r('app.string.cap_geometry_s07_desc'), [
      rangeParam('sides', '', 6, 3, 10, 1),
      toggleParam('closed', true)
    ]),
    scene(8, $r('app.string.cap_geometry_s08_title'), $r('app.string.cap_geometry_s08_desc'), [
      rangeParam('curvature', '%', 60, 0, 100, 5),
      rangeParam('segments', '', 4, 2, 8, 1)
    ]),
    scene(9, $r('app.string.cap_geometry_s09_title'), $r('app.string.cap_geometry_s09_desc'), [
      selectParam('mode', 2, PATH_OP_OPTIONS),
      rangeParam('offset', '%', 15, 0, 40, 5)
    ]),
    scene(10, $r('app.string.cap_geometry_s10_title'), $r('app.string.cap_geometry_s10_desc'), [
      selectParam('mode', 0, REGION_OP_OPTIONS),
      rangeParam('inset', '%', 20, 5, 45, 5)
    ])
  ]);
