/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import type { resourceManager } from '@kit.LocalizationKit';

export interface StringResourceReader {
  getStringSync(id: number): string;
  getStringSync(resource: Resource): string;
}

export interface InterfaceTrace {
  startTrace(name: string, id: number): void;
  finishTrace(name: string, id: number): void;
}

export class NativeStringResourceReader implements StringResourceReader {
  private reader: resourceManager.ResourceManager;

  constructor(reader: resourceManager.ResourceManager) {
    this.reader = reader;
  }

  getStringSync(id: number): string;
  getStringSync(resource: Resource): string;
  getStringSync(resource: number | Resource): string {
    if (typeof resource === 'number') {
      return this.reader.getStringSync(resource);
    }
    return this.reader.getStringSync(resource);
  }
}

class NativeInterfaceTrace implements InterfaceTrace {
  startTrace(name: string, id: number): void {
    hiTraceMeter.startTrace(name, id);
  }

  finishTrace(name: string, id: number): void {
    hiTraceMeter.finishTrace(name, id);
  }
}

export function readStringByResource(reader: StringResourceReader, resource: Resource,
  trace: InterfaceTrace = new NativeInterfaceTrace()): string {
  trace.startTrace('getStringSync', 1);
  let value: string;
  try {
    value = reader.getStringSync(resource);
  } finally {
    trace.finishTrace('getStringSync', 1);
  }
  return value;
}

export function readStringById(reader: StringResourceReader, resource: Resource,
  trace: InterfaceTrace = new NativeInterfaceTrace()): string {
  trace.startTrace('getStringSyncAfter', 2);
  let value: string;
  try {
    value = reader.getStringSync(resource.id);
  } finally {
    trace.finishTrace('getStringSyncAfter', 2);
  }
  return value;
}
