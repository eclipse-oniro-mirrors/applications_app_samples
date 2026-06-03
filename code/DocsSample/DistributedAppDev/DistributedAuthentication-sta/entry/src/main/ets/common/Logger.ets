'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file or copy of the License.
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';

export class Logger {
  private domain: number = 0xFF00;
  private prefix: string = '[Sample_DeviceManager]';

  constructor() {
  }

  debug(...args: string[]): void {
    hilog.debug(0xFF00, this.prefix, '%{public}s', args.join(' '));
  }

  info(...args: string[]): void {
    hilog.info(0xFF00, this.prefix, '%{public}s', args.join(' '));
  }

  warn(...args: string[]): void {
    hilog.warn(0xFF00, this.prefix, '%{public}s', args.join(' '));
  }

  error(...args: string[]): void {
    hilog.error(0xFF00, this.prefix, '%{public}s', args.join(' '));
  }
}

export default new Logger();