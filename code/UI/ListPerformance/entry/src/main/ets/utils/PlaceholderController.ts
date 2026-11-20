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

import Logger from '../util/Logger';
import { ListDataSource } from './ListDataSources';
import { ListDataUtils } from './ListDataUtils';
import { PlaceholderRegistry } from './PlaceholderRegistry';

/** Provides Placeholder Controller helpers for the sample. */
export class PlaceholderController {
  private registry: PlaceholderRegistry;
  private source: ListDataSource;

  constructor(total: number) {
    this.registry = new PlaceholderRegistry(total);
    this.source = new ListDataSource(total, this.registry);
  }

  loadNext(): string {
    const loaded = this.source.loadNext();
    const status = ListDataUtils.formatPlaceholder(loaded, this.registry.total());
    Logger.event('PlaceholderController', 'loadNext', status);
    return status;
  }

  reset(): string {
    this.source.reset();
    const status = ListDataUtils.formatPlaceholder(0, this.registry.total());
    Logger.event('PlaceholderController', 'reset', status);
    return status;
  }

  dataSource(): ListDataSource {
    return this.source;
  }

  registryRef(): PlaceholderRegistry {
    return this.registry;
  }
}
