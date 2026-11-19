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
  createGroup,
  GroupSpec,
  GROUP_TYPOGRAPHY,
  rangeParam,
  scene,
  selectParam,
  toggleParam
} from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const ALIGN_OPTIONS: string[] = ['left', 'right', 'center', 'justify', 'start', 'end'];
const ELLIPSIS_OPTIONS: string[] = ['head', 'tail'];
const DECORATION_OPTIONS: string[] = ['underline', 'overline', 'underline+through'];
const DECORATION_STYLE_OPTIONS: string[] = ['solid', 'double', 'dotted', 'dashed', 'wavy'];
const BREAK_OPTIONS: string[] = ['greedy', 'high quality', 'balanced'];
const WEIGHT_OPTIONS: string[] = ['300', '400', '500', '700', '900'];

// 排版能力域：参数顺序与 cpp/capability/cap_typography.cpp 中的取值下标严格一致。
export const TYPOGRAPHY_GROUP: GroupSpec = createGroup(GROUP_TYPOGRAPHY, 'typography',
  $r('app.string.cap_typography_group_title'),
  $r('app.string.cap_typography_group_desc'), [
    scene(0, $r('app.string.cap_typography_s00_title'), $r('app.string.cap_typography_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('size', 'vp', 16, 10, 32, 1)
    ]),
    scene(1, $r('app.string.cap_typography_s01_title'), $r('app.string.cap_typography_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      selectParam('align', 2, ALIGN_OPTIONS)
    ]),
    scene(2, $r('app.string.cap_typography_s02_title'), $r('app.string.cap_typography_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('lines', '', 2, 1, 6, 1)
    ]),
    scene(3, $r('app.string.cap_typography_s03_title'), $r('app.string.cap_typography_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('lines', '', 2, 1, 4, 1),
      selectParam('modal', 1, ELLIPSIS_OPTIONS)
    ]),
    scene(4, $r('app.string.cap_typography_s04_title'), $r('app.string.cap_typography_s04_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('letter', '', 2, -4, 12, 0.5),
      rangeParam('word', '', 4, 0, 24, 0.5)
    ]),
    scene(5, $r('app.string.cap_typography_s05_title'), $r('app.string.cap_typography_s05_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      selectParam('decoration', 1, DECORATION_OPTIONS),
      selectParam('style', 0, DECORATION_STYLE_OPTIONS)
    ]),
    scene(6, $r('app.string.cap_typography_s06_title'), $r('app.string.cap_typography_s06_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('blur', 'vp', 6, 0, 24, 1),
      rangeParam('offset', 'vp', 6, 0, 20, 1)
    ]),
    scene(7, $r('app.string.cap_typography_s07_title'), $r('app.string.cap_typography_s07_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('arc', '%', 30, 15, 42, 1)
    ]),
    scene(8, $r('app.string.cap_typography_s08_title'), $r('app.string.cap_typography_s08_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('indent', '%', 8, 0, 20, 1)
    ]),
    scene(9, $r('app.string.cap_typography_s09_title'), $r('app.string.cap_typography_s09_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS)
    ]),
    scene(10, $r('app.string.cap_typography_s10_title'), $r('app.string.cap_typography_s10_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      selectParam('strategy', 1, BREAK_OPTIONS)
    ]),
    scene(11, $r('app.string.cap_typography_s11_title'), $r('app.string.cap_typography_s11_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      selectParam('weight', 2, WEIGHT_OPTIONS)
    ]),
    scene(12, $r('app.string.cap_typography_s12_title'), $r('app.string.cap_typography_s12_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      toggleParam('rtl', false)
    ]),
    scene(13, $r('app.string.cap_typography_s13_title'), $r('app.string.cap_typography_s13_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS)
    ])
  ]);
