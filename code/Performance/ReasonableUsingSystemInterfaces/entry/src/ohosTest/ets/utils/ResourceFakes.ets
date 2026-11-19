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

import type { InterfaceTrace, StringResourceReader } from '../../../main/ets/utils/TracedResources';

export class ResourceBoundary implements InterfaceTrace, StringResourceReader {
  events: string[] = [];
  requests: Array<number | Resource> = [];
  value: string = '';
  startError: string = '';
  readError: string = '';
  finishError: string = '';

  startTrace(name: string, id: number): void {
    this.events.push(`start:${name}:${id}`);
    if (this.startError !== '') {
      throw new Error(this.startError);
    }
  }

  finishTrace(name: string, id: number): void {
    this.events.push(`finish:${name}:${id}`);
    if (this.finishError !== '') {
      throw new Error(this.finishError);
    }
  }

  getStringSync(id: number): string;
  getStringSync(resource: Resource): string;
  getStringSync(resource: number | Resource): string {
    this.events.push('read');
    this.requests.push(resource);
    if (this.readError !== '') {
      throw new Error(this.readError);
    }
    return this.value;
  }
}
