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

import { createGroup, GroupSpec, GROUP_FONT, rangeParam, scene, selectParam, toggleParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const HINTING_OPTIONS: string[] = ['none', 'slight', 'normal', 'full'];
const EDGING_OPTIONS: string[] = ['alias', 'anti alias', 'subpixel'];

// 字体能力域：参数顺序与 cpp/capability/cap_font.cpp 中的取值下标严格一致。
export const FONT_GROUP: GroupSpec = createGroup(GROUP_FONT, 'font', $r('app.string.cap_font_group_title'),
  $r('app.string.cap_font_group_desc'), [
    scene(0, $r('app.string.cap_font_s00_title'), $r('app.string.cap_font_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 18, 8, 60, 1)
    ]),
    scene(1, $r('app.string.cap_font_s01_title'), $r('app.string.cap_font_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('sizeA', 'vp', 14, 8, 40, 1),
      rangeParam('sizeB', 'vp', 10, 0, 30, 1)
    ]),
    scene(2, $r('app.string.cap_font_s02_title'), $r('app.string.cap_font_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 14, 8, 40, 1)
    ]),
    scene(3, $r('app.string.cap_font_s03_title'), $r('app.string.cap_font_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 18, 10, 48, 1)
    ]),
    scene(4, $r('app.string.cap_font_s04_title'), $r('app.string.cap_font_s04_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('skew', '', 0.25, -1, 1, 0.05)
    ]),
    scene(5, $r('app.string.cap_font_s05_title'), $r('app.string.cap_font_s05_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      toggleParam('bold', true)
    ]),
    scene(6, $r('app.string.cap_font_s06_title'), $r('app.string.cap_font_s06_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('scaleX', '', 1.5, 0.2, 4, 0.1)
    ]),
    scene(7, $r('app.string.cap_font_s07_title'), $r('app.string.cap_font_s07_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      selectParam('hinting', 2, HINTING_OPTIONS)
    ]),
    scene(8, $r('app.string.cap_font_s08_title'), $r('app.string.cap_font_s08_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      selectParam('edging', 1, EDGING_OPTIONS)
    ]),
    scene(9, $r('app.string.cap_font_s09_title'), $r('app.string.cap_font_s09_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 20, 8, 48, 1)
    ]),
    scene(10, $r('app.string.cap_font_s10_title'), $r('app.string.cap_font_s10_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS)
    ]),
    scene(11, $r('app.string.cap_font_s11_title'), $r('app.string.cap_font_s11_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS)
    ])
  ]);
