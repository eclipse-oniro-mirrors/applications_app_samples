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

export class QosLevelOption {
  public level: number;
  public label: Resource;

  constructor(level: number, label: Resource) {
    this.level = level;
    this.label = label;
  }
}

export function buildQosLevelOptions(): QosLevelOption[] {
  return [
    new QosLevelOption(0, $r('app.string.qos_level_background')),
    new QosLevelOption(1, $r('app.string.qos_level_utility')),
    new QosLevelOption(2, $r('app.string.qos_level_default')),
    new QosLevelOption(3, $r('app.string.qos_level_user_initiated')),
    new QosLevelOption(4, $r('app.string.qos_level_deadline_request')),
    new QosLevelOption(5, $r('app.string.qos_level_user_interactive'))
  ];
}
