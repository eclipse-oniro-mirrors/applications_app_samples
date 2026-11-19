/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { emitter } from '@kit.BasicServicesKit';

const FORMAT_SELECTED_EVENT_ID = 10;
const FILE_SELECTED_EVENT_ID = 11;

export const formatSelectedEvent: emitter.InnerEvent = {
  eventId: FORMAT_SELECTED_EVENT_ID,
  priority: emitter.EventPriority.HIGH
};

export const fileSelectedEvent: emitter.InnerEvent = {
  eventId: FILE_SELECTED_EVENT_ID,
  priority: emitter.EventPriority.HIGH
};
