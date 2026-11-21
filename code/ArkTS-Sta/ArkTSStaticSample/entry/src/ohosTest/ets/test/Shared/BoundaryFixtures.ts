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

// Dynamic property fixtures belong on the TypeScript side of this mixed project.
export function setWidthDescriptor(
  style: Object, value: string, enumerable: boolean, configurable: boolean
): void {
  Object.defineProperty(style, 'width', { value, writable: true, enumerable, configurable });
}

export function setWidthAccessor(
  style: Object, read: () => string, write: (value: string) => void
): void {
  Object.defineProperty(style, 'width', {
    get: read, set: write, configurable: true, enumerable: true
  });
}

export function removeWidth(style: Object): void {
  Reflect.deleteProperty(style, 'width');
}

export function freezeObject(value: Object): void {
  Object.freeze(value);
}

export function hasOwn(value: Object, key: string): boolean {
  return Object.prototype.hasOwnProperty.call(value, key);
}

export class SerializationProbe {
  calls = 0;
  events: string[] = [];
  failure: Error | undefined;
  result: Object = [];

  toJSON(): Object {
    this.calls++;
    this.events.push('serialize');
    if (this.failure) throw this.failure;
    return this.result;
  }
}

export function cyclicLayout(type: string): Object {
  const payload: Record<string, any> = { item: { title: { name: 'cycle' } }, style: { width: '100%' } };
  payload.self = payload;
  return [{ type, data: [payload] }];
}

export function bigintLayout(): Object {
  return [{ type: 'serialization.bigint', data: { sequence: BigInt(1) } }];
}

export class PropertyProbe {
  reads = 0;
  value: Object = { title: { name: 'initial' } };
  failure: Error | undefined;
  readonly data: Object;

  constructor(inherited: boolean = false) {
    const target = {};
    const owner = inherited ? Object.create(null) : target;
    const probe = this;
    Object.defineProperty(owner, 'item', {
      configurable: true,
      enumerable: false,
      get() {
        probe.reads++;
        if (probe.failure) throw probe.failure;
        return probe.value;
      }
    });
    this.data = inherited ? Object.create(owner) : target;
  }
}

export function replaceItem(value: Object, item: Object): void {
  Object.defineProperty(value, 'item', { value: item, configurable: true, writable: true });
}

export function deleteItem(value: Object): void {
  Reflect.deleteProperty(value, 'item');
}

export function setReadProperty(target: Object, key: string, read: () => Object): void {
  Object.defineProperty(target, key, { get: read, configurable: true, enumerable: true });
}

export function setHiddenProperty(target: Object, key: string, value: Object): void {
  Object.defineProperty(target, key, { value, configurable: true, enumerable: false });
}

export function inheritProperty(target: Object, key: string, value: Object): void {
  Object.setPrototypeOf(target, { [key]: value });
}

export function deleteProperty(target: Object, key: string): void {
  Reflect.deleteProperty(target, key);
}
