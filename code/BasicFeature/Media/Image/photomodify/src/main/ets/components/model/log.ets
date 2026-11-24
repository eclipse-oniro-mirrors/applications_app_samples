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

/**
 * @file src/main/ets/components/model/log.ets
 * 文件职责：log 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AppLog。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { logger } from '../util/Logger';

/**
 * AppLog：类定义，承载本文件对应的逻辑与数据。
 */
export class AppLog {
  // 字段 myName：声明并维护该成员的状态
  private myName: string;

  /** 构造 log 实例。 */
  constructor(tag: string) {
    // 更新 myName
    this.myName = tag;
  }

  // 字段 log：声明并维护该成员的状态
  public log = (msg: string): string => {
    // const 语句
    const logMessage = this.myName + ' ' + msg;
    logger.info(this.myName + ' ' + msg);
    return logMessage;
  }
  public check_result = (msg: string, res: object | number | string): string => {
    if (typeof res == 'object') {
      if (res != null) {
        return this.log(msg + ` success !`);
      } else {
        return this.log(msg + ` failed returning with a null object.`);
      }
    } else if (typeof res == 'number') {
      return this.log(msg + ` return: ` + res);
    } else if (typeof res == 'string') {
      return this.log(msg + ` success, result is ` + res);
    } else {
      return this.log(msg + ` unknown result type`);
    }
  }
}
