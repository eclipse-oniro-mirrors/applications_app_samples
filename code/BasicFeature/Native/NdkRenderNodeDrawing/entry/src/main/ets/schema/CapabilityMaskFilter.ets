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

import { createGroup, GroupSpec, GROUP_MASK_FILTER, rangeParam, scene, selectParam } from '../core/SchemaTypes';

const PALETTE_OPTIONS: string[] = ['blue', 'amber', 'green', 'red', 'violet', 'sky'];
const BLUR_TYPE_OPTIONS: string[] = ['normal', 'solid', 'outer', 'inner'];

// 蒙版滤波能力域：参数顺序与 cpp/capability/cap_mask_filter.cpp 中的取值下标严格一致。
export const MASK_FILTER_GROUP: GroupSpec = createGroup(GROUP_MASK_FILTER, 'mask_filter',
  $r('app.string.cap_mask_filter_group_title'),
  $r('app.string.cap_mask_filter_group_desc'), [
    scene(0, $r('app.string.cap_mask_filter_s00_title'), $r('app.string.cap_mask_filter_s00_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('sigma', '', 12, 0, 40, 1),
      rangeParam('alpha', '%', 85, 0, 100, 5)
    ]),
    scene(1, $r('app.string.cap_mask_filter_s01_title'), $r('app.string.cap_mask_filter_s01_desc'), [
      selectParam('palette', 2, PALETTE_OPTIONS),
      rangeParam('sigma', '', 16, 0, 40, 1),
      rangeParam('alpha', '%', 90, 0, 100, 5)
    ]),
    scene(2, $r('app.string.cap_mask_filter_s02_title'), $r('app.string.cap_mask_filter_s02_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('sigma', '', 20, 0, 40, 1),
      rangeParam('alpha', '%', 95, 0, 100, 5)
    ]),
    scene(3, $r('app.string.cap_mask_filter_s03_title'), $r('app.string.cap_mask_filter_s03_desc'), [
      selectParam('palette', 4, PALETTE_OPTIONS),
      rangeParam('sigma', '', 20, 0, 40, 1),
      rangeParam('alpha', '%', 95, 0, 100, 5)
    ]),
    scene(4, $r('app.string.cap_mask_filter_s04_title'), $r('app.string.cap_mask_filter_s04_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('sigmaA', '', 6, 0, 20, 1),
      rangeParam('sigmaB', '', 8, 0, 20, 1)
    ]),
    scene(5, $r('app.string.cap_mask_filter_s05_title'), $r('app.string.cap_mask_filter_s05_desc'), [
      selectParam('palette', 3, PALETTE_OPTIONS),
      rangeParam('sigma', '', 14, 0, 40, 1),
      rangeParam('width', 'vp', 8, 1, 40, 1),
      selectParam('blurType', 1, BLUR_TYPE_OPTIONS)
    ]),
    scene(6, $r('app.string.cap_mask_filter_s06_title'), $r('app.string.cap_mask_filter_s06_desc'), [
      selectParam('palette', 5, PALETTE_OPTIONS),
      rangeParam('sigma', '', 18, 0, 40, 1),
      rangeParam('alpha', '%', 90, 0, 100, 5)
    ]),
    scene(7, $r('app.string.cap_mask_filter_s07_title'), $r('app.string.cap_mask_filter_s07_desc'), [
      selectParam('palette', 1, PALETTE_OPTIONS),
      rangeParam('sigma', '', 10, 0, 40, 1),
      rangeParam('size', 'vp', 22, 8, 48, 1)
    ])
  ]);
