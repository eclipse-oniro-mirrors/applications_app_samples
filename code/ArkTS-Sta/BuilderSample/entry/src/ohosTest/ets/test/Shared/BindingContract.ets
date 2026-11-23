'use static';

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

// Reproduces the read/write contract that MainPage hands to the @Builder:
// a read-only Binding for the placeholder and a MutableBinding for textVal.
export interface StringBinding {
  read(): string;
}

export interface MutableStringBinding extends StringBinding {
  write(value: string): void;
}

export class GetterBinding implements StringBinding {
  private getter: () => string;

  constructor(getter: () => string) {
    this.getter = getter;
  }

  read(): string {
    return this.getter();
  }
}

export class GetterSetterBinding implements MutableStringBinding {
  private getter: () => string;
  private setter: (value: string) => void;

  constructor(getter: () => string, setter: (value: string) => void) {
    this.getter = getter;
    this.setter = setter;
  }

  read(): string {
    return this.getter();
  }

  write(value: string): void {
    this.setter(value);
  }
}

export class CountingBinding implements MutableStringBinding {
  reads: number = 0;
  writes: number = 0;
  store: string = '';

  read(): string {
    this.reads++;
    return this.store;
  }

  write(value: string): void {
    this.writes++;
    this.store = value;
  }
}
