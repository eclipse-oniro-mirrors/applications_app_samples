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

import { createGroup, GroupSpec, rangeParam, scene, selectParam, toggleParam } from '../core/SchemaTypes';
import { TOPIC_HIT_TEST, TOPIC_LAYOUT_COLUMN } from '../core/TopicTypes';

const LAYOUT_OPTIONS: string[] = ['row', 'column'];

// 专题 24：命中测试。触摸坐标由 NodeController.onTouchEvent 上报，引擎按矩形包含判断落点。
export const TOPIC_HIT_TEST_GROUP: GroupSpec = createGroup(TOPIC_HIT_TEST, 'topic-hit-test',
  $r('app.string.topic_hit_test_group_title'),
  $r('app.string.topic_hit_test_group_desc'), [
    scene(0, $r('app.string.topic_hit_test_s00_title'), $r('app.string.topic_hit_test_s00_desc'), [
      rangeParam('count', '', 4, 1, 8, 1),
      rangeParam('gap', 'vp', 8, 0, 24, 1)
    ]),
    scene(1, $r('app.string.topic_hit_test_s01_title'), $r('app.string.topic_hit_test_s01_desc'), [
      rangeParam('pad', 'vp', 8, 0, 24, 2),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(2, $r('app.string.topic_hit_test_s02_title'), $r('app.string.topic_hit_test_s02_desc'), [
      rangeParam('count', '', 4, 1, 8, 1),
      selectParam('layout', TOPIC_LAYOUT_COLUMN, LAYOUT_OPTIONS)
    ]),
    scene(3, $r('app.string.topic_hit_test_s03_title'), $r('app.string.topic_hit_test_s03_desc'), [
      toggleParam('reset', false),
      rangeParam('count', '', 4, 1, 8, 1)
    ])
  ]);
