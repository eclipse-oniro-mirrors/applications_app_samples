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

import { createGroup, GroupSpec, rangeParam, scene, toggleParam } from '../core/SchemaTypes';
import { TOPIC_RECORD } from '../core/TopicTypes';

// 专题 26：录制与回放。参数顺序与 TopicEngine.record 的取值下标严格一致。
export const TOPIC_RECORD_GROUP: GroupSpec = createGroup(TOPIC_RECORD, 'topic-record',
  $r('app.string.topic_record_group_title'),
  $r('app.string.topic_record_group_desc'), [
    scene(0, $r('app.string.topic_record_s00_title'), $r('app.string.topic_record_s00_desc'), [
      rangeParam('steps', '', 8, 1, 32, 1)
    ]),
    scene(1, $r('app.string.topic_record_s01_title'), $r('app.string.topic_record_s01_desc'), [
      rangeParam('steps', '', 8, 1, 32, 1),
      rangeParam('interval', 'ms', 48, 16, 200, 8)
    ]),
    scene(2, $r('app.string.topic_record_s02_title'), $r('app.string.topic_record_s02_desc'), [
      rangeParam('steps', '', 6, 1, 32, 1),
      rangeParam('interval', 'ms', 80, 16, 200, 8),
      rangeParam('loops', '', 3, 1, 8, 1)
    ]),
    scene(3, $r('app.string.topic_record_s03_title'), $r('app.string.topic_record_s03_desc'), [
      toggleParam('clear', true)
    ])
  ]);
