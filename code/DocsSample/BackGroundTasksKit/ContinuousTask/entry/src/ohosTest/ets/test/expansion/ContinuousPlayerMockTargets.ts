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
import { fileIo } from '@kit.CoreFileKit';
import { avSession } from '@kit.AVSessionKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

// Export the real existing module objects; never spread/clone or replace SDK calls.
export const fileIoMockTarget: Object = fileIo;
export const sessionMockTarget: Object = avSession;
export const hilogMockTarget: Object = hilog;
