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

import { createGroup, GroupSpec, rangeParam, scene, selectParam } from '../core/SchemaTypes';
import { TOPIC_MULTI_DEVICE } from '../core/TopicTypes';

const UNIT_OPTIONS: string[] = ['vp', 'px'];

// 专题 27：多设备适配。参数顺序与 TopicEngine.multiDevice 的取值下标严格一致。
export const TOPIC_MULTI_DEVICE_GROUP: GroupSpec = createGroup(TOPIC_MULTI_DEVICE, 'topic-multi-device',
  $r('app.string.topic_multi_device_group_title'),
  $r('app.string.topic_multi_device_group_desc'), [
    scene(0, $r('app.string.topic_multi_device_s00_title'), $r('app.string.topic_multi_device_s00_desc'), [
      rangeParam('count', '', 5, 2, 8, 1),
      rangeParam('gap', 'vp', 6, 0, 24, 1)
    ]),
    scene(1, $r('app.string.topic_multi_device_s01_title'), $r('app.string.topic_multi_device_s01_desc'), [
      rangeParam('count', '', 4, 1, 8, 1),
      rangeParam('gap', 'vp', 12, 0, 24, 1)
    ]),
    scene(2, $r('app.string.topic_multi_device_s02_title'), $r('app.string.topic_multi_device_s02_desc'), [
      selectParam('unit', 0, UNIT_OPTIONS),
      rangeParam('count', '', 4, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_multi_device_s03_title'), $r('app.string.topic_multi_device_s03_desc'), [
      rangeParam('scale', '', 1.2, 0.6, 1.6, 0.05),
      rangeParam('pad', 'vp', 8, 0, 24, 2)
    ])
  ]);
