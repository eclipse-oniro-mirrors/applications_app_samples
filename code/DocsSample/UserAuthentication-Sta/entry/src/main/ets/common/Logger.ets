'use static'
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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0x0000; // 此处使用自行申请的应用代码号
const PREFIX: string = '[Sample_UserAuthentication]'; // 应用log标签

export class Logger {
  private domain: int;
  private prefix: string;
  private format: string = '%{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = DOMAIN;
  }

  getDomain() {
    return this.domain;
  }

  getPrefix() {
    return this.prefix;
  }

  getFormat() {
    return this.format;
  }

  debug(format: string) {
    hilog.debug(this.domain, this.prefix, format);
  }

  info(format: string) {
    hilog.info(this.domain, this.prefix, format);
  }

  warn(format: string) {
    hilog.warn(this.domain, this.prefix, format);
  }

  error(format: string) {
    hilog.error(this.domain, this.prefix, format);
  }

  fatal(format: string) {
    hilog.fatal(this.domain, this.prefix, format);
  }
}

export default new Logger(PREFIX);
