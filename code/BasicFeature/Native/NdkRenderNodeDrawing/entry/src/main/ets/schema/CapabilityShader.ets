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
  createGroup, GroupSpec, GROUP_SHADER, rangeParam, scene, selectParam
} from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const SHADER_BLEND_OPTIONS: string[] = ['srcOver', 'screen', 'multiply', 'overlay', 'difference'];
const TILE_OPTIONS: string[] = ['clamp', 'repeat', 'mirror', 'decal'];

// 着色器能力域：参数顺序与 cpp/capability/cap_shader.cpp 中的取值下标严格一致。
export const SHADER_GROUP: GroupSpec = createGroup(GROUP_SHADER, 'shader', $r('app.string.cap_shader_group_title'),
  $r('app.string.cap_shader_group_desc'), [
    scene(0, $r('app.string.cap_shader_s00_title'), $r('app.string.cap_shader_s00_desc'), [
      rangeParam('angle', '°', 45, 0, 360, 15),
      rangeParam('alpha', '%', 100, 20, 100, 10)
    ]),
    scene(1, $r('app.string.cap_shader_s01_title'), $r('app.string.cap_shader_s01_desc'), [
      rangeParam('stops', '', 3, 2, 6, 1),
      rangeParam('angle', '°', 0, 0, 360, 15)
    ]),
    scene(2, $r('app.string.cap_shader_s02_title'), $r('app.string.cap_shader_s02_desc'), [
      rangeParam('radius', '%', 35, 10, 60, 5),
      rangeParam('centerX', '%', 50, 10, 90, 5)
    ]),
    scene(3, $r('app.string.cap_shader_s03_title'), $r('app.string.cap_shader_s03_desc'), [
      rangeParam('startAngle', '°', 0, 0, 360, 15),
      rangeParam('alpha', '%', 100, 20, 100, 10)
    ]),
    scene(4, $r('app.string.cap_shader_s04_title'), $r('app.string.cap_shader_s04_desc'), [
      rangeParam('innerRadius', '%', 10, 0, 50, 5),
      rangeParam('anchor', '%', 50, 10, 90, 5)
    ]),
    scene(5, $r('app.string.cap_shader_s05_title'), $r('app.string.cap_shader_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('alpha', '%', 100, 20, 100, 10)
    ]),
    scene(6, $r('app.string.cap_shader_s06_title'), $r('app.string.cap_shader_s06_desc'), [
      selectParam('mode', 0, SHADER_BLEND_OPTIONS),
      rangeParam('angle', '°', 45, 0, 360, 15)
    ]),
    scene(7, $r('app.string.cap_shader_s07_title'), $r('app.string.cap_shader_s07_desc'), [
      rangeParam('width', 'vp', 12, 2, 30, 2),
      rangeParam('angle', '°', 0, 0, 360, 15)
    ]),
    scene(8, $r('app.string.cap_shader_s08_title'), $r('app.string.cap_shader_s08_desc'), [
      rangeParam('scale', '%', 100, 20, 100, 10),
      rangeParam('angle', '°', 30, -90, 90, 15)
    ]),
    scene(9, $r('app.string.cap_shader_s09_title'), $r('app.string.cap_shader_s09_desc'), [
      selectParam('tile', 1, TILE_OPTIONS),
      rangeParam('density', '', 3, 1, 4, 1)
    ]),
    scene(10, $r('app.string.cap_shader_s10_title'), $r('app.string.cap_shader_s10_desc'), [
      rangeParam('startAlpha', '%', 100, 0, 100, 10),
      rangeParam('endAlpha', '%', 20, 0, 100, 10)
    ])
  ]);
