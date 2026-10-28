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

/** Provides Detail Param helpers for the sample. */
export class DetailParam {
  id: number;
  title: string;
  description: string;

  constructor(id: number, title: string, description: string) {
    this.id = id;
    this.title = title;
    this.description = description;
  }
}

/** Provides Demo Entry helpers for the sample. */
export class DemoEntry {
  public id: string;
  public title: ResourceStr;
  public description: ResourceStr;
  public route: string;

  constructor(id: string, title: ResourceStr, description: ResourceStr, route: string) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.route = route;
  }
}
